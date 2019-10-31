[Full Changelog][changelog]

### ⚠️ This is a major release! Be sure to take a snapshot before upgrading! ⚠️ 

Introducing full-blown Hass.io Ingress support for Grafana 🎉 

This means that add-on now works when using [Nabu Casa's Remote UI](https://www.nabucasa.com/config/remote/) to access your Home Assistant instance. 😎

Ingress also takes care of authentication (so no need to login anymore) and allows you to add Grafana into your Home Assistant sidebar with a single click. 🤘

### :warning: Please note:
- Create a snapshot/backup before upgrading!
- If you have configured a `panel_iframe` for Grafana in your Home Assistant configuration, please remove it and use the "Show in sidebar" toggle in the add-on options.
- Direct access to the add-on has been removed in favor of Ingress support.

### 🔨  Changes

- :arrow_up: Upgrades Grafana to v6.4.2
- :books: Component > Integration (#50)
- :sparkles: Adds Ingress support
- :shirt: Fixes Markdownlint warnings

[changelog]: https://github.com/hassio-addons/addon-grafana/compare/v2.3.0...v3.0.0

Questions? Join our Discord server! https://discord.me/hassioaddons
Enjoying my add-ons? Consider supporting my work: https://patreon.com/frenck