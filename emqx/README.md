# Home Assistant Community App: EMQX

[![Release][release-shield]][release] ![Project Stage][project-stage-shield] ![Project Maintenance][maintenance-shield]

[![Sponsor Frenck via GitHub Sponsors][github-sponsors-shield]][github-sponsors]

[![Support Frenck on Patreon][patreon-shield]][patreon]

The most scalable MQTT broker for IoT, IIoT, and connected vehicles.

## About

[EMQX][emqx] is an MQTT broker with a high-performance real-time message
processing engine, powering event streaming for IoT devices at massive scale.
As the most scalable MQTT broker, EMQX can help you connect any device, at any
scale (including your home).

The [EMQX MQTT broker][emqx] is an advanced alternative to the Mosquitto MQTT
broker/app that is generally used in Home Assistant. It has a UI
to configure, manage, and debug your MQTT broker, clients, and traffic.

While EMQX sells their product mainly as a cloud hosted product on their
website, this app runs EMQX in a fully local, self-hosted environment.

As of version 5.9.0, EMQX is no longer open source; it is licensed under the
[Business Source License 1.1][emqx-license]. The build shipped here carries the
EMQX Community License, which is free of charge, does not expire, and covers a
single node with up to 10 million concurrent sessions. Clustering is the part
that needs a commercial license, and this app has never clustered.

![EMQX in the Home Assistant Frontend][screenshot]

[emqx-license]: https://github.com/emqx/emqx/blob/main/LICENSE
[emqx]: https://www.emqx.io/
[github-sponsors-shield]: https://frenck.dev/wp-content/uploads/2019/12/github_sponsor.png
[github-sponsors]: https://github.com/sponsors/frenck
[maintenance-shield]: https://img.shields.io/maintenance/yes/2026.svg
[patreon-shield]: https://frenck.dev/wp-content/uploads/2019/12/patreon.png
[patreon]: https://www.patreon.com/frenck
[project-stage-shield]: https://img.shields.io/badge/project%20stage-experimental-yellow.svg
[release-shield]: https://img.shields.io/badge/version-v0.9.0-blue.svg
[release]: https://github.com/hassio-addons/app-emqx/tree/v0.9.0
[screenshot]: https://github.com/hassio-addons/app-emqx/raw/main/images/screenshot.png