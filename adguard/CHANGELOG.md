[Full Changelog][changelog]

This release upgrades in the environment AdGuard is running in.
However, it should not be a breaking upgrade.

Furthermore, it contains a fix for the auto-discovery feature for the AdGuard integration in Home Assistant (0.95+).

See the AdGuard Home release notes for an overview:
<https://github.com/AdguardTeam/AdGuardHome/releases/tag/v0.96>

### 🔨 Changes

- 🚑Automatically restart AdGuard in case of crash
- 🚑 Extend wait timeout to 900 seconds
- :arrow_up: Upgrades nginx to 1.16.0-r2
- :arrow_up: Upgrades add-on base image to v4.0.1
- :ambulance: Fixes Home Assistant integration discovery
- :hammer: Re-instates dynamic Ingress port
- :fire: Removes now deprecated ssl directive
- :sparkles: Adds FUNDING.yml
- :pencil2: Maintaince -> Maintenance

[changelog]: https://github.com/hassio-addons/addon-adguard-home/compare/v1.2.0...v2.0.0

Questions? Join our Discord server! https://discord.me/hassioaddons
Enjoying my add-ons? Consider supporting my work: https://patreon.com/frenck