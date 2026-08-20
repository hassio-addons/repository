# Home Assistant Community App: AirSonos

[![Release][release-shield]][release] ![Project Stage][project-stage-shield] ![Project Maintenance][maintenance-shield]

[![Sponsor Frenck via GitHub Sponsors][github-sponsors-shield]][github-sponsors]

[![Support Frenck on Patreon][patreon-shield]][patreon]

AirPlay capabilities for your Sonos (and UPnP) players.

## About

Apple devices use AirPlay to send audio to other devices, but this is not
compatible with Sonos players. This app tries to solve this
compatibility gap.

It detects Sonos players in your network and creates virtual AirPlay
devices for each of them. It acts as a bridge between the AirPlay client
and the real Sonos device.

Since Sonos uses UPnP, the app might also work for other UPnP players
(e.g., newer Samsung televisions).

The AirCast app is based on the excellent [AirConnect][airconnect] project.

[airconnect]: https://github.com/philippe44/AirConnect
[github-sponsors-shield]: https://frenck.dev/wp-content/uploads/2019/12/github_sponsor.png
[github-sponsors]: https://github.com/sponsors/frenck
[maintenance-shield]: https://img.shields.io/maintenance/yes/2026.svg
[patreon-shield]: https://frenck.dev/wp-content/uploads/2019/12/patreon.png
[patreon]: https://www.patreon.com/frenck
[project-stage-shield]: https://img.shields.io/badge/project%20stage-production%20ready-brightgreen.svg
[release-shield]: https://img.shields.io/badge/version-v5.2.0-blue.svg
[release]: https://github.com/hassio-addons/app-airsonos/tree/v5.2.0