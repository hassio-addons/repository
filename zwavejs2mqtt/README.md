# Home Assistant Community Add-on: Z-Wave JS to MQTT

[![Release][release-shield]][release] ![Project Stage][project-stage-shield] ![Project Maintenance][maintenance-shield]

[![Discord][discord-shield]][discord] [![Community Forum][forum-shield]][forum]

[![Sponsor Frenck via GitHub Sponsors][github-sponsors-shield]][github-sponsors]

[![Support Frenck on Patreon][patreon-shield]][patreon]

Fully configurable Z-Wave JS to MQTT gateway and control panel.

![Z-Wave JS to MQTT][logo]

## About

The Z-Wave JS to MQTT add-on allows you to decouple your Z-Wave network from
your Home Assistant instance by leveraging your MQTT broker. It ships with
a web-based control panel, allowing you to configure every aspect of your
Z-Wave network and how they are published in MQTT.

Some advantages and use-cases for this are:

- Compatible with the Home Assistant Z-Wave JS integration.
- Your Z-Wave network will keep running between Home Assistant restarts.
- You can directly use things like Node-RED with your Z-Wave network, while
  it is available for Home Assistant at the same time.
- Allow [ESPHome.io][esphome] based ESP devices to directly respond or work
  with your Z-Wave network.

[discord-shield]: https://img.shields.io/discord/478094546522079232.svg
[discord]: https://discord.me/hassioaddons
[esphome]: https://esphome.io/components/mqtt.html#on-message-trigger
[forum-shield]: https://img.shields.io/badge/community-forum-brightgreen.svg
[forum]: https://community.home-assistant.io/?u=frenck
[github-sponsors-shield]: https://frenck.dev/wp-content/uploads/2019/12/github_sponsor.png
[github-sponsors]: https://github.com/sponsors/frenck
[logo]: https://github.com/hassio-addons/addon-zwavejs2mqtt/raw/main/zwavejs2mqtt/logo.png
[maintenance-shield]: https://img.shields.io/maintenance/yes/2021.svg
[patreon-shield]: https://frenck.dev/wp-content/uploads/2019/12/patreon.png
[patreon]: https://www.patreon.com/frenck
[project-stage-shield]: https://img.shields.io/badge/project%20stage-experimental-yellow.svg
[release-shield]: https://img.shields.io/badge/version-v0.30.0-blue.svg
[release]: https://github.com/hassio-addons/addon-zwavejs2mqtt/tree/v0.30.0