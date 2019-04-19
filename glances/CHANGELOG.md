[Full Changelog][changelog]

✨ This release adds support for Hass.io Ingress 🎉 

**Breaking change**

The addition of Ingress makes this add-on not accessible directly. If you have added Glances via an iframe panel, this release will break that.

However, you can enable this again by going into the add-on configuration. A new section show is visible: "Network". Enter port `61208` (or anything else if you want) in the `disabled` field. Hit the "SAVE" followed by the "RESTART" button to make your iframe work as before.

An option to add an Ingress capable add-on to the sidebar menu automatically is expected to land in Home Assistant 0.92.

Besides this all, this release mainly contains maintenance upgrades, changes, and improvements.

### Changed

- :arrow_up: Upgrades base image to Python 1.1.0
- :arrow_up: Upgrades gcc to 8.3.0-r0
- :hammer: Removes unused files from image
- :hammer: Refactor of init scripts
- :sparkles: Adds Hassio Ingress support
- :ambulance: Fixes incorrect base image in GitLab CI

[changelog]: https://github.com/hassio-addons/addon-glances/compare/v0.3.0...v0.4.0

Questions? Join our Discord server! https://discord.me/hassioaddons
Enjoying my add-ons? Consider supporting my work: https://patreon.com/frenck