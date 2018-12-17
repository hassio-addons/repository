This version contains an important security fix, and it is **strongly recommend** for ALL installations to be upgraded to this version **immediately**.

### Bypass of Authentication

The authentication against Home Assistant can be bypassed by an anonymous and unauthorized user. The issue has been mitigated in the latest release.

To be clear on the subject: This is an add-on issue and not an issue with the Home Assistant authentication itself.

Exact details of the vulnerability are not disclosed in order to give our users the time to upgrade.

Thanks to Lars Larsson (@larsla) for responsibly reporting this vulnerability.

### Versions Affected

Affects all releases that support authentication against Home Assistant, add-on versions v0.7.0 and higher. Older releases are not affected.

[Full Changelog][changelog]

### Changed

- Upgrades nginx to 1.14.2-r0
- Upgrades YAMLlint to 1.13.0
- Fixes authentication bypass vulnerability

[changelog]: https://github.com/hassio-addons/addon-ide/compare/v0.7.1...v0.7.2