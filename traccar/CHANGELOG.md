[Full Changelog][changelog]

✨ This release adds support for Hass.io Ingress 🎉 
✨ This release adds support for storing your data in the MariaDB add-on 🎉 

Besides this: major upgrades about every single thing inside this add-on ⬆️ 

### 🚨Breaking change

The addition of Ingress makes this add-on not accessible directly. If you have added Traccar via an iframe panel, this release will break that. However, you can simply toggle the "Show in side bar" switch now 🎉 

You can enable direct access again by going into the add-on configuration. A section is visible: "Network". Enter port `8072` (or anything else if you want) in the `disabled` field. Hit the "SAVE" followed by the "RESTART" button to make your iframe and others work as before.

### Changed

- :pencil2: Maintaince -> Maintenance
- :arrow_up: Upgrades add-on base image to v4.0.1
- :sparkles: Adds FUNDING.yml
- :arrow_up: Upgrades nginx to 1.16.0-r2
- :arrow_up: Upgrades nss to 3.44-r0
- :arrow_up: Upgrades openjdk8-jre to 8.212.04-r0
- :arrow_up: Upgrades Traccar to v4.5
- :sparkles: Adds Ingress support
- :hammer: Extends NGinx wait timeout for Traccar startup
- :books: Documents the use of MySQL/MariaDB with this add-on
- :art: Adds Ingress side bar icon
- :fire: Removes obsolete iframe panel documentation

[changelog]: https://github.com/hassio-addons/addon-traccar/compare/v0.4.0...v0.5.0

Questions? Join our Discord server! https://discord.me/hassioaddons
Enjoying my add-ons? Consider supporting my work: https://patreon.com/frenck