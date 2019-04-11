[Full Changelog][changelog]

This release moves the add-on to stable / production ready 🎉 
It also adds Hass.io Ingress support 🎉 

As for a major change: Port settings are moved out of the add-on configuration.
After the upgrade, you may need to check this (if you had changed the default before).

### Changed

- :arrow_up: Upgrades AdGuard Home to v0.94 (#7)
- :arrow_up: Upgrades base image to v3.1.0
- :sparkles: Puts AdGuard into debug mode when add-on is
- :hammer: Use Bashio wait_for before starting NGinx
- :hammer: Improves S6 finish scripts
- :sparkles: Adds Hassio Ingress support
- :pencil2: Fixes grammar in README
- :shirt: Removes a extra space from NGinx configuration
- :hammer: Removes number prefix from container init scripts
- :tada: Moves add-on stage to production ready

[changelog]: https://github.com/hassio-addons/addon-adguard-home/compare/v0.3.0...v1.0.0

Questions? Join our Discord server! https://discord.me/hassioaddons
Enjoying my add-ons? Consider supporting my work: https://patreon.com/frenck