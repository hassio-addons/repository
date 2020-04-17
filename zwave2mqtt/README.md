# Home Assistant Community Add-on: Z-Wave to MQTT

[![Release][release-shield]][release] ![Project Stage][project-stage-shield] ![Project Maintenance][maintenance-shield]

[![Discord][discord-shield]][discord] [![Community Forum][forum-shield]][forum]

[![Sponsor Frenck via GitHub Sponsors][github-sponsors-shield]][github-sponsors]

[![Support Frenck on Patreon][patreon-shield]][patreon]

Fully configurable Z-Wave to MQTT gateway and control panel.

![Z-Wave to MQTT][logo]

## About

The Z-Wave to MQTT add-on allows you to decouple your Z-Wave network from
your Home Assistant instance by leveraging your MQTT broker. It ships with
a web-based control panel, allowing you to configure every aspect of your
Z-Wave network and how they are published in MQTT.

Some advantages and use-cases for this are:

- Your Z-Wave network will keep running between Home Assistant restarts.
- You can directly use things like Node-RED with your Z-Wave network, while
  it is available for Home Assistant at the same time.
- Allow [ESPHome.io][esphome] based ESP devices to directly respond or work
  with your Z-Wave network.

[Click here for the full documentation][docs]

[discord-shield]: https://img.shields.io/discord/478094546522079232.svg
[discord]: https://discord.me/hassioaddons
[docs]: https://github.com/hassio-addons/addon-zwave2mqtt/blob/v0.6.0/README.md
[esphome]: https://esphome.io/components/mqtt.html#on-message-trigger
[forum-shield]: https://img.shields.io/badge/community-forum-brightgreen.svg
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-z-wave-to-mqtt/115899?u=frenck
[github-sponsors-shield]: https://frenck.dev/wp-content/uploads/2019/12/github_sponsor.png
[github-sponsors]: https://github.com/sponsors/frenck
[logo]: https://github.com/hassio-addons/addon-zwave2mqtt/raw/master/zwave2mqtt/logo.png
[maintenance-shield]: https://img.shields.io/maintenance/yes/2020.svg
[patreon-shield]: https://frenck.dev/wp-content/uploads/2019/12/patreon.png
[patreon]: https://www.patreon.com/frenck
[project-stage-shield]: https://img.shields.io/badge/project%20stage-experimental-yellow.svg
[release-shield]: https://img.shields.io/badge/version-v0.6.0-blue.svg
[release]: https://github.com/hassio-addons/addon-zwave2mqtt/tree/v0.6.0