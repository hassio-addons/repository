# Home Assistant Community App: Tor

[![Release][release-shield]][release] ![Project Stage][project-stage-shield] ![Project Maintenance][maintenance-shield]

[![Discord][discord-shield]][discord] [![Community Forum][forum-shield]][forum]

[![Sponsor Frenck via GitHub Sponsors][github-sponsors-shield]][github-sponsors]

[![Support Frenck on Patreon][patreon-shield]][patreon]

Protect your privacy and access Home Assistant via Tor.

## About

This Tor app allows you to access your Home Assistant instance as an Onion site,
through [Tor's Hidden Service][tor-hidden-service] feature. With this feature
enabled, you do not need to open your firewall ports or set up HTTPS to enable
secure remote access.

This is useful if you want to have:

- Access your Home Assistant instance remotely without opening a firewall port
  or setting up a VPN.
- Don't want to or know how to get an SSL/TLS certificate and HTTPS
  configuration setup.
- Want to block attackers from even being able to access/scan your port and
  server at all.
- Want to block anyone from knowing your home IP address and seeing your
  traffic to your Home Assistant.

The app also offers the possibility to open a SOCKS proxy into the
Tor network. Allowing you to access Tor from any of your (SOCKS supporting)
applications through your Home Assistant installation.

[discord-shield]: https://img.shields.io/discord/478094546522079232.svg
[discord]: https://discord.me/hassioaddons
[forum-shield]: https://img.shields.io/badge/community-forum-brightgreen.svg
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-tor/33822?u=frenck
[github-sponsors-shield]: https://frenck.dev/wp-content/uploads/2019/12/github_sponsor.png
[github-sponsors]: https://github.com/sponsors/frenck
[maintenance-shield]: https://img.shields.io/maintenance/yes/2026.svg
[patreon-shield]: https://frenck.dev/wp-content/uploads/2019/12/patreon.png
[patreon]: https://www.patreon.com/frenck
[project-stage-shield]: https://img.shields.io/badge/project%20stage-production%20ready-brightgreen.svg
[release-shield]: https://img.shields.io/badge/version-v8.0.0-blue.svg
[release]: https://github.com/hassio-addons/app-tor/tree/v8.0.0
[tor-hidden-service]: https://www.torproject.org/docs/hidden-services.html.en