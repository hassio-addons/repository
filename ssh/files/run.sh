#!/usr/bin/env bash
# ==============================================================================
# Hass.io Add-on for Home Assistant: SSH
# ==============================================================================

set -o errexit  # Exit script when a command exits with non-zero status
set -o nounset  # Exit script on use of an undefined variable
set -o pipefail # Return exit status of the last command in the pipe that failed

# ==============================================================================
# GLOBALS
# ==============================================================================

# Exit codes
readonly EX_OK=0                # Successful termination
readonly EX_NO_USERNAME=3       # No username specified in configuration
readonly EX_NO_LOGIN=4          # No login data in user configuration
readonly EX_SFTP_USERNAME=5     # SFTP is only possible when username is root
readonly EX_RSA_HOST_KEY=6      # Failed to generate SSH RSA host key
readonly EX_ED25519_HOST_KEY=7  # Failed to generate SSH ED25519 host key
readonly EX_USER_ADD=8          # Failed to create user account
readonly EX_USER_PROFILE=9      # Failed to create user profile
readonly EX_COMMON_LINK=10      # Failed to link common directory
readonly EX_APK_UPDATE=11       # Alpine update failed
readonly EX_PACKAGE_FAILED=12   # Alpine package installation failed
readonly EX_INIT_COMMAND=13     # Failed executing custom init command

# Configuration paths
readonly CONFIG_PATH=/data/options.json
readonly SSH_CONFIG_PATH=/etc/ssh/sshd_config

# SSH authorized_keys files
readonly SSH_AUTHORIZED_KEYS_PATH=/etc/ssh/authorized_keys

# SSH host keys
readonly SSH_HOST_RSA_KEY=/data/ssh_host_rsa_key
readonly SSH_HOST_ED25519_KEY=/data/ssh_host_ed25519_key

# Shell history files
readonly ZSH_HISTORY_FILE=/root/.zsh_history
readonly ZSH_HISTORY_PERSISTANT_FILE=/data/.zsh_history

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

# ==============================================================================
# SCRIPT LOGIC
# ==============================================================================

# ------------------------------------------------------------------------------
# Ensures user configuration contains required parameters
# Globals:
#   EX_NO_LOGIN
# Arguments:
#   None
# Returns:
#   None
# ------------------------------------------------------------------------------
ensure_config_requirements() {
  local authorized_keys
  local password
  local username
  local sftp

  display_status_message 'Ensuring configuration requirements are met'

  username=$(get_config 'username' false)
  if [[ -z "$username" ]];
  then
    display_error_message \
      'Setting a username in the mandatory!' "$EX_NO_USERNAME"
  fi

  authorized_keys=$(get_config 'authorized_keys' true)
  password=$(get_config 'password' false)
  if [[ -z "$authorized_keys" ]] && [[ -z "$password" ]];
  then
    display_error_message \
      'Configuring a password or authorized keys is mandatory!' \
        "$EX_NO_LOGIN"
  fi

  sftp=$(get_config 'sftp' false)
  if [[ "$sftp" == "true" ]] && [[ "$username" != "root" ]];
  then
    display_error_message \
      'You can only enable SFTP when the username is set to "root"' \
        "$EX_SFTP_USERNAME"
  fi
}

# ------------------------------------------------------------------------------
# Ensures all SSH host keys exists, if not, it will create them
# Globals:
#   $EX_ED25519_HOST_KEY
#   $EX_RSA_HOST_KEY
#   $SSH_HOST_ED25519_KEY
#   $SSH_HOST_RSA_KEY
# Arguments:
#   None
# Returns:
#   None
# ------------------------------------------------------------------------------
ensure_host_keys_exist() {
  display_debug_message 'Ensuring SSH host keys exists'

  if [[ ! -f "$SSH_HOST_RSA_KEY" ]];
  then
      display_status_message 'Generating RSA host key'
      command ssh-keygen -t rsa -f "$SSH_HOST_RSA_KEY" -N "" || \
        display_error_message 'Failed to generate RSA host key' \
          "$EX_RSA_HOST_KEY"
  fi

 if [[ ! -f "$SSH_HOST_ED25519_KEY" ]];
  then
      display_status_message 'Generating ED25519 host key'
      command ssh-keygen -t ed25519 -f "$SSH_HOST_ED25519_KEY" -N "" || \
        display_error_message 'Failed to generate ED25519 host key' \
          "$EX_ED25519_HOST_KEY"
  fi
}

# ------------------------------------------------------------------------------
# Creates a user account that is used to log in
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   None
# ------------------------------------------------------------------------------
setup_user() {
    local username

    username=$(get_config 'username' false)
    username=${username,,}

    if [[ "$username" != "root" ]];
    then
      display_status_message "Creating user to use for login"
      (command adduser -D "$username" -s "/bin/sh" && \
        command adduser "$username" wheel) || \
          display_error_message 'Failed creating an user account for login' \
            "$EX_USER_ADD"

      echo 'exec sudo su -l' > "/home/$username/.profile" || \
        display_error_message 'Failed configuring user profile' \
          "$EX_USER_PROFILE"

      command sed -i "s/AllowUsers\ .*/AllowUsers\ $username/" \
        "$SSH_CONFIG_PATH"
    else
      display_status_message 'WARNING! username = root, this is a bad idea!'
      command sed -i "s/PermitRootLogin\ .*/PermitRootLogin\ yes/" \
        "$SSH_CONFIG_PATH"
    fi
  }

# ------------------------------------------------------------------------------
# Sets up the authorized keys
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   None
# ------------------------------------------------------------------------------
setup_authorized_keys() {
  local authorized_keys

  authorized_keys=$(get_config 'authorized_keys' true)

  if [[ ! -z "$authorized_keys" ]];
  then
      display_status_message 'Setting up authorized_keys'

      display_debug_message 'Adding authorized keys to file'
      while read -r key;
      do
          display_debug_message "Adding public key: $key"
          echo "$key" >> "$SSH_AUTHORIZED_KEYS_PATH"
      done <<< "$authorized_keys"
  else
    display_status_message 'Login using public/private keypair is disabled.'
  fi
}

# ------------------------------------------------------------------------------
# Sets up password authentication
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   None
# ------------------------------------------------------------------------------
setup_password_authentication() {
  local password
  local username

  password=$(get_config 'password' false)
  username=$(get_config 'username' false)
  if [[ ! -z "$password" ]]; then
      display_status_message 'Setting up and enabling password login'

      echo "$username:$password" | chpasswd 2&> /dev/null
      command sed -i "s/PasswordAuthentication.*/PasswordAuthentication\ yes/" \
        "$SSH_CONFIG_PATH"
  else
      echo "$username:$username" | chpasswd 2&> /dev/null
      display_status_message 'Login using a password is disabled'
  fi
}

# ------------------------------------------------------------------------------
# Configures the SSHd port
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   None
# ------------------------------------------------------------------------------
configure_port() {
  local port

  port=$(get_config 'port' false)
  if [[ ! -z "$port" ]];
  then
    display_status_message "Setting SSH port to: $port"
    command sed -i "s/Port\ .*/Port\ $port/" "$SSH_CONFIG_PATH"
  else
    display_status_message 'Setting SSH port to: 22'
    command sed -i "s/Port\ .*/Port\ 22/" "$SSH_CONFIG_PATH"
  fi
}

# ------------------------------------------------------------------------------
# Configures SFTP access
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   None
# ------------------------------------------------------------------------------
configure_sftp() {
  local sftp

  sftp=$(get_config 'sftp' false)
  if [[ "$sftp" == "true" ]];
  then
    display_status_message "SFTP access is enabled"
  else
    display_status_message "SFTP access is disabled"
    command sed -i '/Subsystem sftp/s/^/#/g' "$SSH_CONFIG_PATH"
  fi
}

# ------------------------------------------------------------------------------
# Link a set of common used directories in the home folder
# Globals:
#   None
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
#   None
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
#   None
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
#   $DEBUG
# Arguments:
#   None
# Returns:
#   None
# ------------------------------------------------------------------------------
start_ssh_server() {
  display_status_message 'Starting SSH daemon'

  if [[ "$DEBUG" == "true" ]];
  then
    command /usr/sbin/sshd -D -d -e < /dev/null
  else
    command /usr/sbin/sshd -D -e < /dev/null
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
  ensure_host_keys_exist

  setup_user
  setup_authorized_keys
  setup_password_authentication

  configure_port
  configure_sftp

  link_common_directories
  persist_shell_history

  install_packages
  run_init_commands

  start_ssh_server
  exit "$EX_OK"
}
main
