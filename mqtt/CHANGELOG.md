This version contains an important security fix, and it is **strongly recommended** for **ALL** installations to be upgraded to this version **immediately**.

### Bypass of Authentication

The authentication against Home Assistant can be bypassed by an anonymous and unauthorized user. The issue has been mitigated in the latest release.

To be clear on the subject: This is an add-on issue and not an issue with the Home Assistant authentication itself.

Exact details of the vulnerability are not disclosed in order to give our users the time to upgrade.

Thanks to Lars Larsson (@larsla) for responsibly reporting this vulnerability.

Versions Affected
Affects add-on versions v0.2.0 and newer.
Older releases are not affected.

### Changes

- 🚑 🔒 Fixes authentication bypass vulnerability
- 🚑 Set correct acl for readonly
- ⬆️Upgrade Nginx to 1.14.2
- ⬆️Upgrade Nginx-mod-http-lua to 1.14.2

[Full changelog](https://github.com/hassio-addons/addon-mqtt/compare/v0.2.2...v0.3.0)