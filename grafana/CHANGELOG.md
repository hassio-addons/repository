[Full Changelog][changelog]

Thanks to the great work of @sinclairpaul, this release re-instates direct access to the add-on, while maintaining and improving Hass.io Ingress as well! 🎉 If you want to enable direct access, you can assign a port for it in the add-on network options.

Ingress got a nice improvement as well! It can now actually be a logged-in user, instead of an anonymous user with limited access.

By default, Ingress uses the user `admin`, if you have a different username you use already, and like to use it with Ingress, set it using the `grafana_ingress_user` option. See the add-on documentation for more information on this.

### 🔨  Changes

- :arrow_up: Upgrades Grafana to 6.5.2
- :fireworks: Updates maintenance/license year to 2020
- :pencil2: Fixes some spelling and grammar
- :pencil2: Funding adjustments
- :arrow_up: Upgrades add-on base image to v4.0.3
- :pencil2: Fixes some spelling and grammar
- 🚑Allow direct access to addon (#62)
- :books: Adds ingress user option to config example

[changelog]: https://github.com/hassio-addons/addon-grafana/compare/v3.0.2...v4.0.0

Questions? Join our Discord server! https://discord.me/hassioaddons
Enjoying my add-ons? Consider supporting my work:
https://github.com/sponsors/frenck or https://patreon.com/frenck