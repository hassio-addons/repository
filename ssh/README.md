# Community Hass.io Add-ons: SSH & Web Terminal

[![Release][release-shield]][release] ![Project Stage][project-stage-shield] ![Project Maintenance][maintenance-shield]

[![Discord][discord-shield]][discord] [![Community Forum][forum-shield]][forum]

[![Buy me a coffee][buymeacoffee-shield]][buymeacoffee]

[![Support my work on Patreon][patreon-shield]][patreon]

This add-on allows you to log in to your Hass.io Home Assistant instance using
SSH or by using the Web Terminal.

## About

This add-on allows you to log in to your Hass.io Home Assistant instance using
SSH or a Web Terminal, giving you to access your Hass.io folders and
also includes a command-line tool to do things like restart, update,
and check your instance.

This is an enhanced version of the provided
[SSH add-on by Home Assistant][hass-ssh] and focusses on security,
usability, flexibility and also provides access using a web interface.

[Click here for the full documentation][docs]

![Web Terminal in the Home Assistant Frontend][screenshot]

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
  - Limits login attempts to hold of brute-force attacks better.
  - Many more security tweaks, *this addon passes all [ssh-audit] checks
    without warnings!*
    ![Result of SSH-Audit][ssh-audit-image]
- Passwords are checked with HaveIBeenPwned using K-anonymity.
- Comes with an SSH compatibility mode option to allow older clients to connect.
- Support for Mosh allowing roaming and supports intermittent connectivity.
- SFTP support is disabled by default but is user configurable.
- Compatible if Hass.io was installed via the generic Linux installer.
- Username is configurable, so `root` is no longer mandatory.
- Persists custom SSH client settings & keys between add-on restarts
- Log levels for allowing you to triage issues easier.
- Hardware access to your audio, uart/serial devices and GPIO pins.
- Runs with more privileges, allowing you to debug and test more situations.
- Has access to the dbus of the host system.
- Has the option to access the Docker instance running Hass.io host system.
- Runs on host level network, allowing you to open ports or run little daemons.
- Have custom Alpine packages installed on start. This allows you to install
  your favorite tools, which will be available every single time you log in.
- Execute custom commands on add-on start so that you can customize the
  shell to your likings.
- [ZSH][zsh] as its default shell. Easier to use for the beginner, more advanced
  for the more experienced user. It even comes preloaded with
  ["Oh My ZSH"][ohmyzsh], with some plugins enabled as well.
- Contains a sensible set of tools right out of the box: curl, Wget, RSync, GIT,
  Nmap, Mosquitto client, MariaDB/MySQL client, Awake (“wake on LAN”), Nano,
  Vim, tmux, and a bunch commonly used networking tools.

[Click here for the full documentation][docs]

[buymeacoffee-shield]: https://www.buymeacoffee.com/assets/img/guidelines/download-assets-sm-2.svg
[buymeacoffee]: https://www.buymeacoffee.com/frenck
[discord-shield]: https://img.shields.io/discord/478094546522079232.svg
[discord]: https://discord.me/hassioaddons
[docs]: https://github.com/hassio-addons/addon-ssh/blob/v6.4.0/README.md
[forum-shield]: https://img.shields.io/badge/community-forum-brightgreen.svg
[forum]: https://community.home-assistant.io/t/community-hass-io-add-on-ssh-web-terminal/33820?u=frenck
[hass-ssh]: https://home-assistant.io/addons/ssh/
[maintenance-shield]: https://img.shields.io/maintenance/yes/2019.svg
[ohmyzsh]: http://ohmyz.sh/
[openssh]: https://www.openssh.com/
[patreon-shield]: https://www.frenck.nl/images/patreon.png
[patreon]: https://www.patreon.com/frenck
[project-stage-shield]: https://img.shields.io/badge/project%20stage-production%20ready-brightgreen.svg
[release-shield]: https://img.shields.io/badge/version-v6.4.0-blue.svg
[release]: https://github.com/hassio-addons/addon-ssh/tree/v6.4.0
[screenshot]: https://github.com/hassio-addons/addon-ssh/raw/master/images/screenshot.png
[ssh-audit-image]: https://github.com/hassio-addons/addon-ssh/raw/master/images/ssh-audit.png
[ssh-audit]: https://github.com/arthepsy/ssh-audit
[zsh]: https://en.wikipedia.org/wiki/Z_shell