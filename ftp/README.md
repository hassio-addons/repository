# Community Hass.io Add-ons: FTP

[![Release][release-shield]][release] ![Project Stage][project-stage-shield] ![Project Maintenance][maintenance-shield]

[![Discord][discord-shield]][discord] [![Community Forum][forum-shield]][forum]

[![Buy me a coffee][buymeacoffee-shield]][buymeacoffee]

[![Support my work on Patreon][patreon-shield]][patreon]

A secure and fast FTP server for Hass.io

## About

The FTP protocol might be come in handy sometimes. While old,
it still has its use. For example, most IP Cameras still support the upload
of images or videos via FTP.

This add-on provides an FTP Server for Hass.io in a reasonably secure manner.
While FTP is not entirely secure by its (unencrypted) nature, this add-on
supports FTP over SSL (FTPS) and jails (chroot) the virtual users in their
home directories.

Of course, if you'd really want to, you could also use this add-on to again
access to your Home Assistant configuration via FTP.

[Click here for the full documentation][docs]

[buymeacoffee-shield]: https://www.buymeacoffee.com/assets/img/guidelines/download-assets-sm-2.svg
[buymeacoffee]: https://www.buymeacoffee.com/frenck
[discord-shield]: https://img.shields.io/discord/478094546522079232.svg
[discord]: https://discord.me/hassioaddons
[docs]: https://github.com/hassio-addons/addon-ftp/blob/v3.1.0/README.md
[forum-shield]: https://img.shields.io/badge/community-forum-brightgreen.svg
[forum]: https://community.home-assistant.io/t/community-hass-io-add-on-ftp/36799?u=frenck
[maintenance-shield]: https://img.shields.io/maintenance/yes/2019.svg
[patreon-shield]: https://www.frenck.nl/images/patreon.png
[patreon]: https://www.patreon.com/frenck
[project-stage-shield]: https://img.shields.io/badge/project%20stage-production%20ready-brightgreen.svg
[release-shield]: https://img.shields.io/badge/version-v3.1.0-blue.svg
[release]: https://github.com/hassio-addons/addon-ftp/tree/v3.1.0