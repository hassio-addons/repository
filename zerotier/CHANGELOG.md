[Full Changelog][changelog]

⚠️ **Breaking change** ⚠️ 

The add-on now supports connecting to multiple ZeroTier networks at once 🎉 .
However, this changes its configuration to support that. The `network_id` configuration option, has been replaced by the `networks` configuration option, which accepts a list of network ID's.

### Changed

- :books: Update example config (#6)
- :arrow_up: Upgrades base image to v3.1.0
- :sparkles: Adds support for Hass.io network configuration
- :arrow_up: Upgrades libgcc to 8.3.0-r0
- :arrow_up: Upgrades libstdc++ to 8.3.0-r0
- :sparkles: Adds support for multiple networks
- :books: Updates README to match latest changes
- :ambulance: Fixes secret support for network IDs
- :ambulance: Don't show resolved secrets in add-on log

[changelog]: https://github.com/hassio-addons/addon-zerotier/compare/v0.1.0...v0.2.0

Questions? Join our Discord server! https://discord.me/hassioaddons
Enjoying my add-ons? Consider supporting my work: https://patreon.com/frenck