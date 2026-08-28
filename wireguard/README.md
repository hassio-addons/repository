# Home Assistant Community App: WireGuard

[![Release][release-shield]][release] ![Project Stage][project-stage-shield] ![Project Maintenance][maintenance-shield]

[![Sponsor Frenck via GitHub Sponsors][github-sponsors-shield]][github-sponsors]

[![Support Frenck on Patreon][patreon-shield]][patreon]

WireGuard: fast, modern, secure VPN tunnel.

## About

[WireGuard®][wireguard] is an extremely simple yet fast and modern VPN that
utilizes state-of-the-art cryptography. It aims to be faster, simpler, leaner,
and more useful than IPsec, while avoiding the massive headache.

It intends to be considerably more performant than OpenVPN. WireGuard is
designed as a general-purpose VPN for running on embedded interfaces and
supercomputers alike, fit for many different circumstances.

Initially released for the Linux kernel, it is now cross-platform (Windows,
macOS, BSD, iOS, Android) and widely deployable,
including via an Hass.io app!

WireGuard is currently under heavy development, but already it might be
regarded as the most secure, easiest to use, and the simplest VPN solution
in the industry.

## This app is a WireGuard server, not a client

This app runs a WireGuard **server** on your Home Assistant instance. Your
phone, laptop, and other devices are the peers: they connect **to** Home
Assistant. The app generates their client configurations and QR codes for you,
which is what the `peers` option is for.

The other direction is not supported. There is no option to have Home Assistant
join an existing WireGuard network as a client, for example one hosted on a VPS,
running on your router, or run by a commercial VPN provider. If that is what you
are looking for, this is not the app you need.

[github-sponsors-shield]: https://frenck.dev/wp-content/uploads/2019/12/github_sponsor.png
[github-sponsors]: https://github.com/sponsors/frenck
[maintenance-shield]: https://img.shields.io/maintenance/yes/2026.svg
[patreon-shield]: https://frenck.dev/wp-content/uploads/2019/12/patreon.png
[patreon]: https://www.patreon.com/frenck
[project-stage-shield]: https://img.shields.io/badge/project%20stage-experimental-yellow.svg
[release-shield]: https://img.shields.io/badge/version-v0.14.0-blue.svg
[release]: https://github.com/hassio-addons/app-wireguard/tree/v0.14.0
[wireguard]: https://www.wireguard.com