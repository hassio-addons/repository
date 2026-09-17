# Home Assistant Community App: InfluxDB v1

[![Release][release-shield]][release] ![Project Stage][project-stage-shield] ![Project Maintenance][maintenance-shield]

[![Sponsor Frenck via GitHub Sponsors][github-sponsors-shield]][github-sponsors]

[![Support Frenck on Patreon][patreon-shield]][patreon]

InfluxDB 1.x time series database with Chronograf and Kapacitor.

## About

InfluxDB is an open source time series database optimized for high-write-volume.
It's useful for recording metrics, sensor data, events,
and performing analytics. It exposes an HTTP API for client interaction and is
often used in combination with Grafana to visualize the data.

This app provides the InfluxDB **1.x** series (InfluxQL, the 1.x HTTP API and
the classic database, user and retention policy model). It is not InfluxDB 2
or InfluxDB 3; those have a different API, data model and configuration. If
you are integrating with Home Assistant, use the `influxdb` integration with
`api_version: 1`, which is the default.

This app comes with Chronograf and Kapacitor pre-installed, which gives you
a nice InfluxDB admin interface for managing your users, databases and data
retention settings, and lets you peek inside the database using the Data
Explorer.

![Chronograf in the Home Assistant Frontend][screenshot]

[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-influxdb/54491?u=frenck
[github-sponsors-shield]: https://frenck.dev/wp-content/uploads/2019/12/github_sponsor.png
[github-sponsors]: https://github.com/sponsors/frenck
[maintenance-shield]: https://img.shields.io/maintenance/yes/2026.svg
[patreon-shield]: https://frenck.dev/wp-content/uploads/2019/12/patreon.png
[patreon]: https://www.patreon.com/frenck
[project-stage-shield]: https://img.shields.io/badge/project%20stage-production%20ready-brightgreen.svg
[release-shield]: https://img.shields.io/badge/version-v6.0.0-blue.svg
[release]: https://github.com/hassio-addons/app-influxdb/tree/v6.0.0
[screenshot]: https://github.com/hassio-addons/app-influxdb/raw/main/images/screenshot.png