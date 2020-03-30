# Home Assistant Community Add-on: Pi-hole

[![Release][release-shield]][release] ![Project Stage][project-stage-shield] ![Project Maintenance][maintenance-shield]

[![Discord][discord-shield]][discord] [![Community Forum][forum-shield]][forum]

[![Sponsor Frenck via GitHub Sponsors][github-sponsors-shield]][github-sponsors]

[![Support Frenck on Patreon][patreon-shield]][patreon]

Network-wide ad blocking

## Deprecation warning

**This add-on is in a deprecated state!**

The Pi-hole add-on is now deprecated and will no longer be supported, maintained
and will not receive future updates or fixes.

Pi-hole used to be a great solution to filter network traffic, but it has been
a challenge to keep/get it in a working state as an add-on.

Meanwhile, the AdGuard team published an alternative:
[AdGuard Home](https://github.com/hassio-addons/addon-adguard-home).

AdGuard Home as surpassed Pi-hole in terms of capabilities, features,
and stability, and Home Assistant provides a good integration with AdGuard.
Above all, the AdGuard Home team has been supportive in developing the add-on.

For those reasons, it is no longer viable to keep maintaining the Pi-hole
add-on, which has been problematic at best.

We strongly recommend migrating to the AdGuard Home add-on, which is available
in the add-on store.

## About

[Pi-hole][pi-hole] is an advertising-aware DNS- and web server, meant to be run
on a dedicated Raspberry Pi connected to your home network. Pi-hole lets you
block advertisements for every device that connects to your network without the
need for any client-side software.

This add-on is a port of Pi-hole to be able to run on Home Assistant and
is based on Alpine Linux and is using Docker.

[Click here for the full documentation][docs]

[discord-shield]: https://img.shields.io/discord/478094546522079232.svg
[discord]: https://discord.me/hassioaddons
[docs]: https://github.com/hassio-addons/addon-pi-hole/blob/v4.1.2/README.md
[forum-shield]: https://img.shields.io/badge/community-forum-brightgreen.svg
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-pi-hole/33817?u=frenck
[github-sponsors-shield]: https://frenck.dev/wp-content/uploads/2019/12/github_sponsor.png
[github-sponsors]: https://github.com/sponsors/frenck
[maintenance-shield]: https://img.shields.io/maintenance/yes/2020.svg
[patreon-shield]: https://frenck.dev/wp-content/uploads/2019/12/patreon.png
[patreon]: https://www.patreon.com/frenck
[pi-hole]: https://pi-hole.net/
[project-stage-shield]: https://img.shields.io/badge/project%20stage-%20!%20DEPRECATED%20%20%20!-ff0000.svg
[release-shield]: https://img.shields.io/badge/version-v4.1.2-blue.svg
[release]: https://github.com/hassio-addons/addon-pi-hole/tree/v4.1.2