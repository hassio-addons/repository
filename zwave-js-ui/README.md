# Home Assistant Community Add-on: Z-Wave JS UI

[![Release][release-shield]][release] ![Project Stage][project-stage-shield] ![Project Maintenance][maintenance-shield]

[![Discord][discord-shield]][discord] [![Community Forum][forum-shield]][forum]

[![Sponsor Frenck via GitHub Sponsors][github-sponsors-shield]][github-sponsors]

[![Support Frenck on Patreon][patreon-shield]][patreon]

Fully configurable Z-Wave JS control panel and MQTT gateway.

![Z-Wave JS UI][logo]

## About

The Z-Wave JS UI add-on provides an additional control panel, allowing you
to configure every aspect of your Z-Wave network. It provides a decoupled
gateway which can communicate using Z-Wave JS WebSockets (used by the
Home Assistant Z-Wave JS integration) and MQTT (even simultaneously).

Some advantages and use-cases:

- Compatible with the Home Assistant Z-Wave JS integration.
- Your Z-Wave network will keep running between Home Assistant restarts.
- You can directly use things like Node-RED with your Z-Wave network, while
  it is available for Home Assistant at the same time.
- Allow [ESPHome.io][esphome] based ESP devices to directly respond or work
  with your Z-Wave network.
- Pre-configures itself with the Mosquitto add-on when found.

This add-on uses the [Z-Wave JS UI][zwave-js-ui] software.

[discord-shield]: https://img.shields.io/discord/478094546522079232.svg
[discord]: https://discord.me/hassioaddons
[esphome]: https://esphome.io/components/mqtt.html#on-message-trigger
[forum-shield]: https://img.shields.io/badge/community-forum-brightgreen.svg
[forum]: https://community.home-assistant.io/?u=frenck
[github-sponsors-shield]: https://frenck.dev/wp-content/uploads/2019/12/github_sponsor.png
[github-sponsors]: https://github.com/sponsors/frenck
[logo]: https://github.com/hassio-addons/addon-zwave-js-ui/raw/main/zwave-js-ui/logo.png
[maintenance-shield]: https://img.shields.io/maintenance/yes/2024.svg
[patreon-shield]: https://frenck.dev/wp-content/uploads/2019/12/patreon.png
[patreon]: https://www.patreon.com/frenck
[project-stage-shield]: https://img.shields.io/badge/project%20stage-production%20ready-brightgreen.svg
[release-shield]: https://img.shields.io/badge/version-v3.6.0-blue.svg
[release]: https://github.com/hassio-addons/addon-zwave-js-ui/tree/v3.6.0
[zwave-js-ui]: https://github.com/zwave-js/zwave-js-ui