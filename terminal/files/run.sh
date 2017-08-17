#!/usr/bin/env bash
# ==============================================================================
# Hass.io Add-on for Home Assistant: Terminal
# ==============================================================================

set -o errexit  # Exit script when a command exits with non-zero status
set -o nounset  # Exit script on use of an undefined variable
set -o pipefail # Return exit status of the last command in the pipe that failed

# ==============================================================================
# GLOBALS
# ==============================================================================

# Exit codes
readonly EX_OK=0                  # Successful termination
readonly EX_NO_USERNAME=3         # No username specified in configuration
readonly EX_NO_PASSWORD=4         # No login data in user configuration
readonly EX_NO_CERTFILE=5         # SSL enabled, but no certfile configured
readonly EX_NO_KEYFILE=6          # SSL enabled, but no keyfile configured
readonly EX_CERTFILE_NOT_FOUND=7  # Specified certfile was not found
readonly EX_KEYFILE_NOT_FOUND=8   # Specified keyfile was not found
readonly EX_COMMON_LINK=10        # Failed to link common directory
readonly EX_APK_UPDATE=11         # Alpine update failed
readonly EX_PACKAGE_FAILED=12     # Alpine package installation failed
readonly EX_INIT_COMMAND=13       # Failed executing custom init command

# Configuration paths
readonly CONFIG_PATH=/data/options.json

# Shell history files
readonly ZSH_HISTORY_FILE=/root/.zsh_history
readonly ZSH_HISTORY_PERSISTANT_FILE=/data/.zsh_history

# SSL certificates base path
readonly SSL_CERT_PATH=/ssl

# Debug mode?
readonly DEBUG=$(jq --raw-output ".debug" $CONFIG_PATH)

# Arguments to pass into ttyd
readonly TTYD_DEFAULTS='--reconnect 30 --port 7681'
readonly TTYD_COMMAND='tmux new -A -s ttyd zsh'
export TTYD_SSL=''
export TTYD_CREDENTIALS=''

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

# ==============================================================================
# SCRIPT LOGIC
# ==============================================================================

# ------------------------------------------------------------------------------
# Ensures user configuration contains required parameters
# Globals:
#   EX_CERTFILE_NOT_FOUND
#   EX_KEYFILE_NOT_FOUND
#   EX_NO_CERTFILE
#   EX_NO_KEYFILE
#   EX_NO_PASSWORD
#   EX_NO_USERNAME
# Arguments:
#   None
# Returns:
#   None
# ------------------------------------------------------------------------------
ensure_config_requirements() {
  local password
  local username
  local ssl
  local certfile
  local keyfile

  display_status_message 'Ensuring configuration requirements are met'

  username=$(get_config 'username' false)
  password=$(get_config 'password' false)
  if [[ ! -z "$username" ]] && [[ -z "$password" ]];
  then
    display_error_message \
      'You have set an username, but no password!' "$EX_NO_PASSWORD"
  fi

  if [[ -z "$username" ]] && [[ ! -z "$password" ]];
  then
    display_error_message \
      'You have set a password, but not username!' "$EX_NO_USERNAME"
  fi

  ssl=$(get_config 'ssl' false)
  if [[ "$ssl" == "true" ]];
  then
    certfile=$(get_config 'certfile' false)
    if [[ -z "$certfile" ]];
    then
      display_error_message 'SSL is enabled, but no certfile was specified' \
        "$EX_NO_CERTFILE"
    fi

    if [[ ! -f "$SSL_CERT_PATH/$certfile" ]];
    then
      display_error_message 'The configured certfile is not found' \
        "$EX_CERTFILE_NOT_FOUND"
    fi

    keyfile=$(get_config 'keyfile' false)
    if [[ -z "$keyfile" ]];
    then
      display_error_message 'SSL is enabled, but no keyfile was specified' \
        "$EX_NO_KEYFILE"
    fi

    if [[ ! -f "$SSL_CERT_PATH/$keyfile" ]];
    then
      display_error_message 'The configured keyfile is not found' \
        "$EX_KEYFILE_NOT_FOUND"
    fi
  fi
}

# ------------------------------------------------------------------------------
# Sets up basic HTTP authentication
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   None
# ------------------------------------------------------------------------------
setup_credentials() {
  local password
  local username

  password=$(get_config 'password' false)
  username=$(get_config 'username' false)

  if [[ ! -z "$username" ]] && [[ ! -z "$password" ]];
  then
    display_status_message 'Setting up and enabling authentication'
    export TTYD_CREDENTIALS="--credential $username:$password"
  fi
}

# ------------------------------------------------------------------------------
# Sets up SSL connections
# Globals:
#   SSL_CERT_PATH
# Arguments:
#   None
# Returns:
#   None
# ------------------------------------------------------------------------------
setup_ssl() {
  local ssl
  local certfile
  local keyfile
  local options

  ssl=$(get_config 'ssl' false)
  if [[ "$ssl" == "true" ]];
  then
    display_status_message 'Setting up and enabling SSL'
    certfile=$(get_config 'certfile' false)
    keyfile=$(get_config 'keyfile' false)
    options='--ssl '
    options+=" --ssl-cert $SSL_CERT_PATH/$certfile"
    options+=" --ssl-key $SSL_CERT_PATH/$keyfile"
    export TTYD_SSL="$options"
  fi
}

# ------------------------------------------------------------------------------
# Link a set of common used directories in the home folder
# Globals:
#   EX_COMMON_LINK
#   HOME
# Arguments:
#   None
# Returns:
#   None
# ------------------------------------------------------------------------------
link_common_directories() {
  local directories

  display_status_message 'Linking common directories into the home folder'

  directories="addons backup config share ssl"
  for dir in $directories;
  do
    display_debug_message "Linking common directory $dir"
    command ln -s "/$dir" "$HOME/$dir" || display_error_message \
      "Failed linking common directory: $dir" "$EX_COMMON_LINK"
  done;
}

# ------------------------------------------------------------------------------
# Persist all shell history in the permanent data storage directory
# Globals:
#   ZSH_HISTORY_FILE
#   ZSH_HISTORY_PERSISTANT_FILE
# Arguments:
#   None
# Returns:
#   None
# ------------------------------------------------------------------------------
persist_shell_history() {
  display_status_message 'Configuring shell to persist history'

  command touch "$ZSH_HISTORY_PERSISTANT_FILE"
  command chmod 600 "$ZSH_HISTORY_PERSISTANT_FILE"
  command ln -s -f "$ZSH_HISTORY_PERSISTANT_FILE" "$ZSH_HISTORY_FILE"
}

# ------------------------------------------------------------------------------
# Install list of user requested Alpine packages
# Globals:
#   EX_APK_UPDATE
#   EX_PACKAGE_FAILED
# Arguments:
#   None
# Returns:
#   None
# ------------------------------------------------------------------------------
install_packages() {
  local packages

  packages=$(get_config 'packages' true)

  if [[ ! -z "$packages" ]];
  then
    display_status_message 'Installing user requested Alpine packages'

    display_status_message 'Updating Alpine packages repository indexes' 
    command apk update || display_error_message \
      'Failed updating Alpine packages repository indexes' "$EX_APK_UPDATE"

    for package in $packages;
    do
      display_status_message "Installing Alpine package: $package"

      command apk add "$package" || display_error_message \
        "Failed installing package $package" $EX_PACKAGE_FAILED
    done
  fi

}

# ------------------------------------------------------------------------------
# Runs configured custom commands on startup of the add-on
# Globals:
#   EX_INIT_COMMAND
# Arguments:
#   None
# Returns:
#   None
# ------------------------------------------------------------------------------
run_init_commands() {
  local commands

  commands=$(get_config 'init_commands' true)
  if [[ ! -z "$commands" ]];
  then
    display_status_message 'Running custom init commands'

    while read -r cmd;
    do
        display_debug_message "Running command: $cmd"
        eval "$cmd" || display_error_message \
          "Failed executing init command: $cmd" "$EX_INIT_COMMAND"
    done <<< "$commands"
  else
    display_debug_message 'No custom init commands configured'
  fi
}

# ------------------------------------------------------------------------------
# Starts the SSH daemon
# Globals:
#   DEBUG
#   TTYD_COMMAND
#   TTYD_CREDENTIALS
#   TTYD_DEFAULTS
#   TTYD_SSL
# Arguments:
#   None
# Returns:
#   None
# ------------------------------------------------------------------------------
start_terminal_server() {
  display_status_message 'Starting terminal server'

  if [[ "$DEBUG" == "true" ]];
  then
    command ttyd -d 7 $TTYD_DEFAULTS $TTYD_CREDENTIALS $TTYD_SSL $TTYD_COMMAND
  else
    command ttyd -d 1 $TTYD_DEFAULTS $TTYD_CREDENTIALS $TTYD_SSL $TTYD_COMMAND
  fi
}

# ------------------------------------------------------------------------------
# Cleanup function after execution is of the script is stopped. (trap)
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   None
# ------------------------------------------------------------------------------
cleanup() {
  true
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

  ensure_config_requirements

  link_common_directories
  persist_shell_history

  install_packages
  run_init_commands

  setup_credentials
  setup_ssl

  start_terminal_server
  exit "$EX_OK"
}
main
