This version upgrades InfluxDB & Chronograf to the latest and greatest.
Best of this release is the speed upgrade in starting.

Not only will the add-on wait longer before concluding to fail startup (when awaiting InfluxDB to start with tons of data), it also optimizes the way the add-ons start, which should cut down general startup time (about 50%).

[Full Changelog][changelog]

### Changed

- Fixes spelling error in Dockerfile
- Removes BountySource links
- Removes Anchore.io links
- Updates maintenance year to 2019
- Refactor of GitLab CI
- Upgrades add-on base image to 2.2.1
- Configure Renovate (#15)
- Replaces add-on link with GitHub link
- Upgrades gpg to 2.2.4-1ubuntu1.2
- Upgrades Chronograf to 1.7.7
- Upgrades InfluxDB to 1.7.3
- Ups timeout of waiting for Influx to 30 minutes
- Improves startup time by storing internal authentication

[changelog]: https://github.com/hassio-addons/addon-influxdb/compare/v1.2.1...v1.3.0

Questions? Join our Discord server! https://discord.me/hassioaddons
Enjoying my add-ons? Consider supporting my work: https://patreon.com/frenck