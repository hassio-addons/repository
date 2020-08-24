# Home Assistant Community Add-on: SSH & Web Terminal

This add-on allows you to log in to your Home Assistant instance using
SSH or a Web Terminal, giving you to access your folders and
also includes a command-line tool to do things like restart, update,
and check your instance.

This is an enhanced version of the provided
[SSH add-on by Home Assistant][hass-ssh] and focusses on security,
usability, flexibility and also provides access using a web interface.

## WARNING

The SSH & Web Terminal add-on is a really powerful and gives you virtually
access to all tools and almost all hardware of your system.

While this add-on is created and maintained with care and with security in mind,
in the wrong or inexperienced hands, it could damage your system.

## Features

This add-on, of course, provides an SSH server, based on [OpenSSH][openssh] and
a web-based Terminal (which can be included in your Home Assistant frontend) as
well. Additionally, it comes out of the box with the following:

- Access your command line right from the Home Assistant frontend!
- A secure default configuration of SSH:
  - Only allows login by the configured user, even if more users are created.
  - Only uses known secure ciphers and algorithms.
  - Limits login attempts to hold off brute-force attacks better.
  - Many more security tweaks, *this addon passes all [ssh-audit] checks
    without warnings!*
- Passwords are checked with HaveIBeenPwned using K-anonymity.
- Comes with an SSH compatibility mode option to allow older clients to connect.
- Support for Mosh allowing roaming and supports intermittent connectivity.
- SFTP support is disabled by default but is user configurable.
- Compatible if Home Assistant was installed via the generic Linux installer.
- Username is configurable, so `root` is no longer mandatory.
- Persists custom SSH client settings & keys between add-on restarts
- Hardware access to your audio, uart/serial devices and GPIO pins.
- Runs with more privileges, allowing you to debug and test more situations.
- Has access to the dbus of the host system.
- Has the option to access the Docker instance running on the host system.
- Runs on host level network, allowing you to open ports or run little daemons.
- Have custom Alpine packages installed on start. This allows you to install
  your favorite tools, which will be available every single time you log in.
- Execute custom commands on add-on start so that you can customize the
  shell to your likings.
- [ZSH][zsh] as its default shell. Easier to use for the beginner, more advanced
  for the more experienced user. It even comes preloaded with
  ["Oh My ZSH"][ohmyzsh], with some plugins enabled as well.
- Bash: If ZSH is not your cup of tea, Bash can be enabled again, which
  includes Bash completion for both the Core CLI and the Home Assistant CLI.
- Contains a sensible set of tools right out of the box: curl, Wget, RSync, GIT,
  Nmap, Mosquitto client, MariaDB/MySQL client, Awake (“wake on LAN”), Nano,
  Vim, tmux, and a bunch commonly used networking tools.
- Has the Home Assistant CLI (`hass-cli`) command line tool pre-installed and
  pre-configured.
- Support executing commands inside using a Home Assistant service call, e.g.,
  for use with automations.

## Installation

The installation of this add-on is pretty straightforward and not different in
comparison to installing any other Home Assistant add-on.

1. Search for the "SSH & Web Terminal" add-on in the Supervisor add-on store
   and install it.
1. Configure the `username` and `password`/`authorized_keys` options.
1. Start the "SSH & Web Terminal" add-on.
1. Check the logs of the "SSH & Web Terminal" add-on to see if everything
    went well.

## Configuration

**Note**: _Remember to restart the add-on when the configuration is changed._

SSH add-on configuration:

```yaml
log_level: info
ssh:
  username: homeassistant
  password: ''
  authorized_keys:
    - ssh-rsa AASDJKJKJFWJFAFLCNALCMLAK234234.....
  sftp: false
  compatibility_mode: false
  allow_agent_forwarding: false
  allow_remote_port_forwarding: false
  allow_tcp_forwarding: false
zsh: true
share_sessions: true
packages:
  - build-base
init_commands:
  - ls -la
```

**Note**: _This is just an example, don't copy and paste it! Create your own!_

### Option: `log_level`

The `log_level` option controls the level of log output by the addon and can
be changed to be more or less verbose, which might be useful when you are
dealing with an unknown issue. Possible values are:

- `trace`: Show every detail, like all called internal functions.
- `debug`: Shows detailed debug information.
- `info`: Normal (usually) interesting events.
- `warning`: Exceptional occurrences that are not errors.
- `error`:  Runtime errors that do not require immediate action.
- `fatal`: Something went terribly wrong. Add-on becomes unusable.

Please note that each level automatically includes log messages from a
more severe level, e.g., `debug` also shows `info` messages. By default,
the `log_level` is set to `info`, which is the recommended setting unless
you are troubleshooting.

Using `trace` or `debug` log levels puts the SSH and Terminal daemons into
debug mode. While SSH is running in debug mode, it will be only able to
accept one single connection at the time.

### Option group `ssh`

---

The following options are for the option group: `ssh`. These settings
only apply to the SSH daemon.

#### Option `ssh`: `username`

This option allows you to change to username the use when you log in via SSH.
It is only utilized for the authentication; you will be the `root` user after
you have authenticated. Using `root` as the username is possible, but not
recommended.

**Note**: _Due to limitations, you will need to set this option to `root` in
order to be able to enable the SFTP capabilities._

#### Option `ssh`: `password`

Sets the password to log in with. Leaving it empty would disable the possibility
to authenticate with a password. We would highly recommend not to use this
option from a security point of view.

**Note**: _The password will be checked against HaveIBeenPwned. If it is
listed, the add-on will not start._

#### Option `ssh` `authorized_keys`

Add one or more public keys to your SSH server to use with authentication.
This is the recommended over setting a password.

Please take a look at the awesome [documentation created by GitHub][github-ssh]
about using public/private key pairs and how to create them.

**Note**: _Please ensure the keys are specified as a list by pasting within the
`[]` comma delimited._

#### Option `ssh`: `sftp`

When set to `true` the addon will enable SFTP support on the SSH daemon.
Please only enable it when you plan on using it.

**Note**: _Due to limitations, you will need to set the username to `root` in
order to be able to enable the SFTP capabilities._

#### Option `ssh`: `compatibility_mode`

This SSH add-on focusses on security and has therefore only enabled known
secure encryption methods. However, some older clients do not support these.
Setting this option to `true` will enable the original default set of methods,
allowing those clients to connect.

**Note**: _Enabling this option, lowers the security of your SSH server!_

#### Option `ssh`: `allow_agent_forwarding`

Specifies whether ssh-agent forwarding is permitted or not.

**Note**: _Enabling this option, lowers the security of your SSH server!
Nevertheless, this warning is debatable._

#### Option `ssh`: `allow_remote_port_forwarding`

Specifies whether remote hosts are allowed to connect to ports forwarded
for the client.

**Note**: _Enabling this affects all remote forwardings, so think carefully
before doing this._

#### Option `ssh`: `allow_tcp_forwarding`

Specifies whether TCP forwarding is permitted or not.

**Note**: _Enabling this option, lowers the security of your SSH server!
Nevertheless, this warning is debatable._

### Shared settings

---

The following options are shared between both the SSH and the Web Terminal.

#### Option: `zsh`

The add-on has ZSH pre-installed and configured as the default shell.
However, ZSH might not be your preferred choice. By setting this option to
`false`, you will disable ZSH and the add-on will fallback to Bash instead.

#### Option: `share_sessions`

By default, the terminal session between the web client and SSH is shared.
This allows you to pick up where you left your terminal from either of those.

This option allows you to disable this behavior by setting it to `false`, which
effectively sets SSH to behave as it used to be.

#### Option: `packages`

Allows you to specify additional [Alpine packages][alpine-packages] to be
installed in your shell environment (e.g., Python, Joe, Irssi).

**Note**: _Adding many packages will result in a longer start-up
time for the add-on._

#### Option: `init_commands`

Customize your shell environment even more with the `init_commands` option.
Add one or more shell commands to the list, and they will be executed every
single time this add-on starts.

#### Option: `i_like_to_be_pwned`

Adding this option to the add-on configuration allows to you bypass the
HaveIBeenPwned password requirement by setting it to `true`.

**Note**: _We STRONGLY suggest picking a stronger/safer password instead of
using this option! USE AT YOUR OWN RISK!_

## Executing commands in this add-on using a Home Assistant service call

This add-on uses the `hassio.addon_stdin` service to expose a shell interface
to Home Assistant. This allows you to execute commands and scripts within
the SSH & Web Terminal add-on, straight from Home Assistant.

This is particularly helpful when you want to execute custom scripts or
commands from automations.

Example automation running `my_command`:

```yaml
automation:
- alias: 'Example my script'
  trigger:
    platform: state
    entity_id: binary_sensor.motion_sensor
    to: 'ON'
  action:
    service: hassio.addon_stdin
    data:
      addon: a0d7b954_ssh
      input: "/config/scripts/my_command"
```

## Known issues and limitations

- The add-on fails to start when a password that is listed by HaveIBeenPwned
  is used. This is actually not a limitation, but a security feature.
- When SFTP is enabled, the username MUST be set to `root`.
- If you want to use rsync for file transfer, the username MUST be set to
  `root`.

## Changelog & Releases

This repository keeps a change log using [GitHub's releases][releases]
functionality. The format of the log is based on
[Keep a Changelog][keepchangelog].

Releases are based on [Semantic Versioning][semver], and use the format
of ``MAJOR.MINOR.PATCH``. In a nutshell, the version will be incremented
based on the following:

- ``MAJOR``: Incompatible or major changes.
- ``MINOR``: Backwards-compatible new features and enhancements.
- ``PATCH``: Backwards-compatible bugfixes and package updates.

## Support

Got questions?

You have several options to get them answered:

- The [Home Assistant Community Add-ons Discord chat server][discord] for add-on
  support and feature requests.
- The [Home Assistant Discord chat server][discord-ha] for general Home
  Assistant discussions and questions.
- The Home Assistant [Community Forum][forum].
- Join the [Reddit subreddit][reddit] in [/r/homeassistant][reddit]

You could also [open an issue here][issue] GitHub.

## Authors & contributors

The original setup of this repository is by [Franck Nijhof][frenck].

For a full list of all authors and contributors,
check [the contributor's page][contributors].

## License

MIT License

Copyright (c) 2017-2020 Franck Nijhof

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

[alpine-packages]: https://pkgs.alpinelinux.org/packages
[contributors]: https://github.com/hassio-addons/addon-ssh/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/community-hass-io-add-on-ssh-web-terminal/33820?u=frenck
[frenck]: https://github.com/frenck
[github-ssh]: https://help.github.com/articles/connecting-to-github-with-ssh/
[hass-ssh]: https://github.com/home-assistant/hassio-addons/tree/master/ssh
[issue]: https://github.com/hassio-addons/addon-ssh/issues
[keepchangelog]: http://keepachangelog.com/en/1.0.0/
[ohmyzsh]: http://ohmyz.sh/
[openssh]: https://www.openssh.com/
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-ssh/releases
[semver]: http://semver.org/spec/v2.0.0.htm
[ssh-audit]: https://github.com/arthepsy/ssh-audit
[zsh]: https://en.wikipedia.org/wiki/Z_shell
