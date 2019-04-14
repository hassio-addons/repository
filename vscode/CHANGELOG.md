[Full Changelog][changelog]

This release adds Hass.io Ingress support to the add-on :tada:

Also on this release, a major upgrade on the code-server and vscode running inside this add-on.
Memory usage and general performance have been improved significantly!

Furthermore, `ack` has been added for easy and quick command line search through your configuration files,
e.g., `ack light.livingroom`.

### Changed

- :fire: Removes password option from documentation
- :fire: Removes now obsolete i_like_to_be_pwned option
- :arrow_up: Upgrades hassio-cli to v2.2.0
- :books:Updates installation steps in README (#14) (@riemers)
- :sparkles: Adds ack
- :books: Update README.md (#19) (@riemers)
- :arrow_up: Upgrades base image to v3.1.0
- :arrow_up: Upgrades wget to 1.19.4-1ubuntu2.2
- :arrow_up: Upgrades code-server to 1.792-vsc1.33.1
- :hammer: Improves S6 finish scripts
- :sparkles: Adds Hassio Ingress support + General refactor
- :books: Fixes some typos in the documentation (#20) (@tjorim)
- :shirt: Fixes Markdownlint warnings

[changelog]: https://github.com/hassio-addons/addon-vscode/compare/v0.2.0...v0.3.0

Questions? Join our Discord server! https://discord.me/hassioaddons
Enjoying my add-ons? Consider supporting my work: https://patreon.com/frenck