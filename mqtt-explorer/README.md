# Home Assistant Community App: MQTT Explorer

[![Release][release-shield]][release] ![Project Stage][project-stage-shield] ![Project Maintenance][maintenance-shield]

[![Sponsor Frenck via GitHub Sponsors][github-sponsors-shield]][github-sponsors]

[![Support Frenck on Patreon][patreon-shield]][patreon]

Explore the topics and messages on your MQTT broker.

## About

[MQTT Explorer][mqtt-explorer] shows what is going on inside an MQTT broker.
Every topic it sees is laid out in a tree, with the last message on it, how
often it changes and what it looked like before. Values can be plotted as they
come in, messages can be published back, and the whole tree stays searchable
while it fills up. It is the tool to open when a device is not showing up, a
topic name is not what the documentation says it is, or you just want to see
what all of that traffic actually is.

It is a desktop application first, and this app runs its web edition: the
same interface, served from Home Assistant and opened from the sidebar. The
MQTT broker Home Assistant uses is already in its list of connections when it
opens, address and credentials included, so it is one click from the tree.
[github-sponsors-shield]: https://frenck.dev/wp-content/uploads/2019/12/github_sponsor.png
[github-sponsors]: https://github.com/sponsors/frenck
[maintenance-shield]: https://img.shields.io/maintenance/yes/2026.svg
[mqtt-explorer]: https://mqtt-explorer.com/
[patreon-shield]: https://frenck.dev/wp-content/uploads/2019/12/patreon.png
[patreon]: https://www.patreon.com/frenck
[project-stage-shield]: https://img.shields.io/badge/project%20stage-experimental-yellow.svg
[release-shield]: https://img.shields.io/badge/version-v0.1.0-blue.svg
[release]: https://github.com/hassio-addons/app-mqtt-explorer/tree/v0.1.0