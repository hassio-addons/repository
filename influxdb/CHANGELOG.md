This version contains an important security fix, and it is **strongly recommend** for ALL installations to be upgraded to this version **immediately**.

### Bypass of Authentication

The authentication against Home Assistant can be bypassed by an anonymous and unauthorized user. The issue has been mitigated in the latest release.

To be clear on the subject: This is an add-on issue and not an issue with the Home Assistant authentication itself.

Exact details of the vulnerability are not disclosed in order to give our users the time to upgrade.

Thanks to Lars Larsson (@larsla) for responsibly reporting this vulnerability.

### Versions Affected

Affects only the latest release that added support for authentication against Home Assistant, add-on versions v1.2.0. Older releases are not affected.

[Full Changelog][changelog]

### Changed

- Upgrades InfluxDB to 1.7.2
- Upgrades Chronograf to 1.7.5
- Upgrades Kapacitor to 1.5.2
- Fixes authentication bypass vulnerability

[changelog]: https://github.com/hassio-addons/addon-influxdb/compare/v1.2.0...v1.2.1