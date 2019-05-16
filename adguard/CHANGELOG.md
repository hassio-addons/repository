[Full Changelog][changelog]

✨ This release adds support for adding friendly client names in the add-on configuration.
These client names will show up in the interface of AdGuard Home, instead of the IP address, which makes your clients way more identifiable.

🚑 Fixes crash on 64 bits ARM devices (aarch64)

👨‍🎨 The sidebar icon was improved by @bonanitech, to make it look more like Adguard Home.

### 🔨 Changes

- 🎨 Change panel_icon (#13)
- :arrow_up: Upgrades lua-resty-http to 0.13-r0
- :arrow_up: Upgrades nginx to 1.14.2-r1
- :arrow_up: Upgrades nginx-mod-http-lua to 1.14.2-r1
- :ambulance: Turns of Lua Resty core in Nginx
- :sparkles: Adds support for adding client friendly names

[changelog]: https://github.com/hassio-addons/addon-adguard-home/compare/v1.0.1...v1.1.0

Questions? Join our Discord server! https://discord.me/hassioaddons
Enjoying my add-ons? Consider supporting my work: https://patreon.com/frenck