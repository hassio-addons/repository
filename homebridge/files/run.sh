#!/usr/bin/env bash
# ==============================================================================
# Hass.io Add-on for Home Assistant: Homebridge
# ==============================================================================

set -o errexit  # Exit script when a command exits with non-zero status
set -o nounset  # Exit script on use of an undefined variable
set -o pipefail # Return exit status of the last command in the pipe that failed

# ==============================================================================
# GLOBALS
# ==============================================================================

# Exit codes
readonly EX_OK=0                # Successful termination
readonly EX_DBUS_ID_FAILED=3    # Failed to generated a unique D-Bus ID
readonly EX_PLUGIN_FAILED=4     # Homebridge plugin installation failed
readonly EX_DBUS_DAEMON=5       # Failed to start D-Bus daemon
readonly EX_PID_AVAHI=6         # Failed to remove Avahi daemon PID file
readonly EX_PID_DBUS=7          # Failed to remove D-Bus daemon PID file
readonly EX_PATCH_ERROR=8       # Failed to apply patch
readonly EX_HOMEBRIDGE_DIR=9    # Failed to create Homebridge config directory
readonly EX_HOMEBRIDGE_FILE=10  # Failed to create Homebridge config file
readonly EX_HOMEBRIDGE_USER=11  # Failed to set Homebridge user config
readonly EX_HOMEBRIDGE_PIN=12   # Failed to set Homebridge user pin

# Configuration paths
readonly CONFIG_PATH=/data/options.json
readonly HOMEBRIDGE_CONFIG_FILE=/config/homebridge/config.json
readonly HOMEBRIDGE_TEMPLATE_CONFIG_FILE=/root/homebridge-config.json

# PID Files
readonly PID_FILE_DBUS=/var/run/dbus.pid
readonly PID_FILE_AVAHI=/var/run/avahi-daemon/pid

# D-Bus System bus socket file location
readonly DBUS_SYSTEM_SOCKET=/var/run/dbus/system_bus_socket

# Debug mode?
readonly DEBUG=$(jq --raw-output ".debug" $CONFIG_PATH)

# ==============================================================================
# UTILITY
# ==============================================================================

# ------------------------------------------------------------------------------
# Displays a status message
# Globals:
#   None
# Arguments:
#   $* Status message to display
# Returns:
#   None
# ------------------------------------------------------------------------------
display_status_message() {
  local status=$*

  echo "[ADD-ON] $status"
}

# ------------------------------------------------------------------------------
# Displays a debug message
# Globals:
#   None
# Arguments:
#   $* Status message to display
# Returns:
#   None
# ------------------------------------------------------------------------------
display_debug_message() {
  local status=$*

  if [[ "$DEBUG" == "true" ]];
  then
    display_status_message "[DEBUG] $status"
  fi
}

# ------------------------------------------------------------------------------
# Displays a error message and is able to terminate te script execution
# Globals:
#   None
# Arguments:
#   $1 Error message
#   $2 Exitcode, script will continue execution when omitted
# Returns:
#   None
# ------------------------------------------------------------------------------
display_error_message() {
  local status=$1
  local exitcode=${2:-0}

  echo "[ADD-ON][ERROR] An error occured!" >&2
  echo >&2
  echo "!!! ERROR: $status" >&2
  echo >&2

  if [[ $exitcode -ne 0 ]];
  then
    exit "$exitcode"
  fi
}

# ------------------------------------------------------------------------------
# Gets a configuration parameter form the configuration file
# Globals:
#   CONFIG_PATH
# Arguments:
#   $1 Key of the configuration parameter to get
#   $2 'true' If the configuration value is an array, false otherwise
# Returns:
#   The configuration value
# ------------------------------------------------------------------------------
get_config() {
  local key=$1
  local is_array=$2

  if $is_array;
  then
    command jq --raw-output ".$key[]" $CONFIG_PATH
  else
    command jq --raw-output ".$key" $CONFIG_PATH
  fi
}

# ------------------------------------------------------------------------------
# Finds the MAC address of the main interface
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   MAC address of the main interface (upper-cased)
# ------------------------------------------------------------------------------
get_mac_addr() {
  local interface
  local mac

  interface=$(ip route show default | awk '/default/ {print $5}')
  mac=$(cat "/sys/class/net/$interface/address")

  echo "${mac^^}"
}

# ------------------------------------------------------------------------------
# Generates a random pin number for HomeKit (###-##-### format)
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   The generated random pin number
# ------------------------------------------------------------------------------
generate_homekit_pin() {
  local pin

  pin=$(< /dev/urandom tr -dc 0-9 | head -c3)
  pin+="-"
  pin+=-$(< /dev/urandom tr -dc 0-9 | head -c2)
  pin+="-"
  pin+=$(< /dev/urandom tr -dc 0-9 | head -c3)

  echo "$pin"
}

# ==============================================================================
# SCRIPT LOGIC
# ==============================================================================

# ------------------------------------------------------------------------------
# Applies temporary but necessary patch to HAP NodeJS
# Globals:
#   EX_PATCH_ERROR
# Arguments:
#   None
# Returns:
#   None
# ------------------------------------------------------------------------------
apply_hap_nodejs_ipv6_hotfix() {
  local eventedhttp_file='/usr/local/share/.config/yarn/global/node_modules/hap-nodejs/lib/util/eventedhttp.js'

  display_status_message 'Applying HAP NodeJS IPV6 HOTFIX'
  command patch $eventedhttp_file <<PATCH
--- eventedhttp.js
+++ eventedhttp.js
@@ -57,7 +57,7 @@
 inherits(EventedHTTPServer, EventEmitter);

 EventedHTTPServer.prototype.listen = function(targetPort) {
-  this._tcpServer.listen(targetPort);
+  this._tcpServer.listen(targetPort, '0.0.0.0');

   this._tcpServer.on('listening', function() {
     var port = this._tcpServer.address().port;
PATCH

  # shellcheck disable=SC2181
  if [[ "$?" -ne 0 ]];
  then
      display_error_message 'Patching HAP NodeJS failed' "$EX_PATCH_ERROR"
  fi
}

# ------------------------------------------------------------------------------
# Ensures D-Bus UUID exists and has the uuid in it
# Globals:
#   EX_DBUS_ID_FAILED
# Arguments:
#   None
# Returns:
#   None
# ------------------------------------------------------------------------------
ensure_dbus_id() {
  display_status_message 'Ensuring D-Bus unique ID exists'

  command dbus-uuidgen --ensure || display_error_message \
    'Failed to generated unique D-Bus ID' "$EX_DBUS_ID_FAILED"

  # Somehow we need this sleep. Atm it is unclear why...
  sleep 2
}

# ------------------------------------------------------------------------------
# Install list of user requested Homebridge Plugins
# Globals:
#   EX_PLUGIN_FAILED
# Arguments:
#   None
# Returns:
#   None
# ------------------------------------------------------------------------------
install_plugins() {
  local plugins

  plugins=$(get_config "plugins" true)
  for plugin in $plugins;
  do
    display_status_message "Installing Homebridge plugin $plugin"

    command yarn global add "$plugin" || display_error_message \
      "Failed installing Homebridge plugin $plugin" $EX_PLUGIN_FAILED
  done
}

# ------------------------------------------------------------------------------
# Removes old PID files that may be left behind from last run
# Globals:
#   EX_PID_AVAHI
#   EX_PID_DBUS
#   PID_FILE_AVAHI
#   PID_FILE_DBUS
# Arguments:
#   None
# Returns:
#   None
# ------------------------------------------------------------------------------
remove_old_pid_files() {
  display_status_message 'Ensuring old PID files are absent'

  if [[ -e "$PID_FILE_AVAHI" ]];
  then
    display_status_message 'Removing old Avahi daemon PID file'
    command rm -f "$PID_FILE_AVAHI" || display_error_message \
      'Failed to removed Avahi daemon PID file' "$EX_PID_AVAHI"
  fi

  if [[ -e "$PID_FILE_DBUS" ]];
  then
    display_status_message 'Removing old D-Bus daemon PID file'
  	command rm -f "$PID_FILE_DBUS" || display_error_message \
      'Failed to remove D-Bus daemon PID file' "$EX_PID_DBUS"
  fi
}

# ------------------------------------------------------------------------------
# Start the Avahi daemon in the background
# Globals:
#   DEBUG
# Arguments:
#   None
# Returns:
#   None
# ------------------------------------------------------------------------------
start_avahi_daemon() {
  display_status_message 'Starting Avahi daemon'

  if [[ "$DEBUG" == "true" ]];
  then
    command avahi-daemon --debug &
  else
    command avahi-daemon &
  fi

  # Waiting 5 seconds to allow Avahi to register itself
  sleep 5
}

# ------------------------------------------------------------------------------
# Applies temporary but necessary patch to HAP NodeJS
# Globals:
#   EX_DBUS_DAEMON
#   DBUS_SYSTEM_SOCKET
# Arguments:
#   None
# Returns:
#   None
# ------------------------------------------------------------------------------
start_dbus_daemon() {
  display_status_message 'Starting D-Bus daemon'

  command dbus-daemon --system || display_error_message \
    'Failed to start D-Bus daemon' $EX_DBUS_DAEMON

  display_debug_message 'Waiting until system bus socket is ready'

  until [[ -e "$DBUS_SYSTEM_SOCKET" ]];
  do
    display_debug_message 'Still waiting...'
    sleep 1
  done
}

# ------------------------------------------------------------------------------
# Starts Homebridge
# Globals:
#   HOMEBRIDGE_CONFIG_FILE
# Arguments:
#   None
# Returns:
#   None
# ------------------------------------------------------------------------------
start_homebridge() {
  display_status_message 'Starting Homebridge'

  if [[ "$DEBUG" == "true" ]];
  then
    command homebridge -D -U "$(dirname "$HOMEBRIDGE_CONFIG_FILE")"
  else
    command homebridge -U "$(dirname "$HOMEBRIDGE_CONFIG_FILE")"
  fi
}

# ------------------------------------------------------------------------------
# Generates an initial Homebridge configuration file
# Globals:
#   HOMEBRIDGE_CONFIG_FILE
#   EX_HOMEBRIDGE_DIR
#   EX_HOMEBRIDGE_FILE
#   EX_HOMEBRIDGE_USER
#   EX_HOMEBRIDGE_PIN
# Arguments:
#   None
# Returns:
#   None
# ------------------------------------------------------------------------------
generate_homebridge_config() {
    local homebridge_config_dir

    display_status_message 'Generating Homebridge configuration files'

    homebridge_config_dir=$(dirname "$HOMEBRIDGE_CONFIG_FILE")
    if [[ ! -d "$homebridge_config_dir" ]];
    then
      display_debug_message 'Creating Homebridge configuration directory'
      command mkdir -p "$homebridge_config_dir" || display_error_message \
        'Failed to create Homebrige configuration directory' \
        "$EX_HOMEBRIDGE_DIR"
    fi

    display_debug_message 'Copying Homebrige configuration template'
    command cp "$HOMEBRIDGE_TEMPLATE_CONFIG_FILE" "$HOMEBRIDGE_CONFIG_FILE" ||
      display_error_message 'Failed creating Homebridge configuration file' \
        "$EX_HOMEBRIDGE_FILE"

    display_debug_message 'Setting Homebridge username based on MAC address'
    command sed -i "s/%%USERNAME%%/$(get_mac_addr)/g" \
      "$HOMEBRIDGE_CONFIG_FILE" || display_error_message \
        'Failed setting Homebridge username' "$EX_HOMEBRIDGE_USER"

    display_debug_message 'Setting Homebridge HomeKit pin'
    command sed -i "s/%%PIN%%/$(generate_homekit_pin)/g" \
      "$HOMEBRIDGE_CONFIG_FILE" || display_error_message \
        'Failed setting Homebridge pin' "$EX_HOMEBRIDGE_PIN"
}

# ------------------------------------------------------------------------------
# Cleanup function after execution is of the script is stopped. (trap)
# Globals:
#   PID_FILE_AVAHI
#   PID_FILE_DBUS
# Arguments:
#   None
# Returns:
#   None
# ------------------------------------------------------------------------------
cleanup() {
  command rm -f "$PID_FILE_AVAHI"
  command rm -f "$PID_FILE_DBUS"
}

# ==============================================================================
# RUN LOGIC
# ------------------------------------------------------------------------------
# Globals:
#   EX_OK
#   HOMEBRIDGE_CONFIG_FILE
# Arguments:
#   None
# Returns:
#   None
# ------------------------------------------------------------------------------
main() {
  trap cleanup ERR
  trap cleanup EXIT

  install_plugins

  remove_old_pid_files
  ensure_dbus_id
  start_dbus_daemon

  start_avahi_daemon

  if [[ ! -f "$HOMEBRIDGE_CONFIG_FILE" ]]; then
    generate_homebridge_config
  fi

  apply_hap_nodejs_ipv6_hotfix

  start_homebridge

  exit "$EX_OK"
}
main
