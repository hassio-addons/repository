[Full Changelog][changelog]

Due to an issue with the upstream ZWave2Mqtt project, it might that the ZWave configurations database isn't loaded.

If that happens, make sure you set the device database config path in:
**Settings** -> **Zwave** -> **Config Path**: `/etc/openzwave`.

### 🔨 Changes

- :hammer: Update community forum links
- :arrow_up: Upgrades base image to v7.1.0
- :arrow_up: Upgrades Zwave2Mqtt to v3.0.2 (#39)
- :ambulance: Use correct webUI protocol depending on config (#43)
- :ambulance: Symlink addition database location
- :hammer: Disable Docker init
- :arrow_up: Upgrades open-zwave database to e3bae88
- :ambulance: Correct database paths
- :ambulance: Change database path again, update documentation with known issue
- :arrow_up: Upgrades git to 2.24.2-r0

[changelog]: https://github.com/hassio-addons/addon-zwave2mqtt/compare/v0.5.0...v0.6.0

Questions? Join our Discord server! https://discord.me/hassioaddons
Enjoying my add-ons? Consider supporting my work: https://patreon.com/frenck