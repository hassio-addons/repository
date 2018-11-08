[Full Changelog][changelog]

This release upgrades a lot (including InfluxDB), fixes a couple of issues with timing between starting all the services and adds authentication against Home Assistant!

From this point on, you can log in, into the web interface, using your Home Assistant frontend username and password.

### Changed

- Upgrades InfluxDB to v1.7.0
- Upgrades Chronograf to v1.7.1
- Give InfluxDB more time to start, before init script
- Makes Chronograf wait until InfluxDB is started
- Makes Kapacitor wait until InfluxDB is started
- Removes ipv6 configuration option
- Upgrades nginx to 1.14.0-0ubuntu1.2
- Adds support for the authentication against Home Assistant
- Limit supported machines (#12) (@HoppingMonk)
- Updates documentation for HA Auth

[changelog]: https://github.com/hassio-addons/addon-influxdb/compare/v1.1.1...v1.2.0