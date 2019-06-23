[Full Changelog][changelog]

✨ This release adds support for Hass.io Ingress 🎉 

Besides Ingress, this release adds major upgrades about every single thing inside this add-on ⬆️ 

### 🚨Breaking change

The addition of Ingress makes this add-on not accessible directly. If you have added Grocy via an iframe panel, this release will break that. However, you can simply toggle the "Show in sidebar" switch now 🎉 

You can enable direct access again by going into the add-on configuration. A section is visible: "Network". Enter port `9192` (or anything else if you want) in the `disabled` field. Hit the "SAVE" followed by the "RESTART" button to make your iframe and others work as before.

### 🔨 Changes

- :arrow_up: Upgrades Grocy to v2.4.2
- :sparkles: Adds en_GB as selectable language
- :pencil2: Maintaince -> Maintenance
- :arrow_up: Upgrades add-on base image to v4.0.1
- :arrow_up: Upgrades nginx to 1.16.0-r2
- :arrow_up: Upgrades php to 7.3.6-r0
- :arrow_up: Upgrades git to 2.22.0-r0
- :arrow_up: Upgrades yarn to 1.16.0-r0
- :arrow_up: Upgrades composer to 1.8.6-r0
- :sparkles: Adds FUNDING.yml
- :sparkles: Adds Ingress support
- :fire: Removes now deprecated ssl directive
- :books: Adds extra language option to docs  (#26) (@tjorim)
- :hammer: Disable direct access by default
- :ambulance: Adds missing port declaration

[changelog]: https://github.com/hassio-addons/addon-grocy/compare/v0.2.0...v0.3.0

Questions? Join our Discord server! https://discord.me/hassioaddons
Enjoying my add-ons? Consider supporting my work: https://patreon.com/frenck