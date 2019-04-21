[Full Changelog][changelog]

This release adds support for ARMv7 and fixes an issue with Phlex not being able to load.

### Changed

- :arrow_up: Upgrades base image to v3.1.0
- :arrow_up: Upgrades PHP to 7.2.17-r0
- :hammer: Refactor of init scripts
- :fire: Removes IPv6 switch
- :hammer: Makes NGinx wait for PHP-FPM before starting
- :fire: Removes IPv6 switch from add-on config
- :sparkles: Adds ARMv7 support
- :ambulance: Workaround Docker issue by reinstating legacy tags
- :sparkles: Adds port descriptions
- :fire: Removes default config options
- :fire: Removes custom log format override
- :hammer: Makes log_level optional
- :ambulance: Fixes incorrect wait_for command
- :hammer: Improves startup messages
- :arrow_down: Downgrades Phlex to 579fb03

[changelog]: https://github.com/hassio-addons/addon-phlex/compare/v1.0.0...v1.1.0

Questions? Join our Discord server! https://discord.me/hassioaddons