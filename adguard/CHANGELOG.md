[Full Changelog][changelog]

⚠️ **If you see `This add-on is not available on your system.`; please continue reading...**

This release downgrades AdGuard Home to v0.99.0. Add-on version v2.2.1 with AdGuard Home v0.99.1 suffered from some major crashed of the AdGuard Home server.

There are some caveats with this release:

- The add-on **requires** Home Assistant **>= 0.101.0b0** (0.101.0 beta or newer). **You won't be able to update or install this version if you don't meet this requirement.**
  In that case, you will get a `This add-on is not available on your system.` message.
- Home Assistant >= 0.100.0b0 requires at least AdGuard Home v0.99.0 (this release) for the integration to work.
- AdGuard displays a version check error, this bug is expected to be fixed in AdGuard 0.99.1, however, it does not influence the working of AdGuard Home.

### 🔨 Changes

- :arrow_down: Downgrades AdGuard Home to v0.99.0

[changelog]: https://github.com/hassio-addons/addon-adguard-home/compare/v2.2.1...v2.2.2

Questions? Join our Discord server! https://discord.me/hassioaddons
Enjoying my add-ons? Consider supporting my work: https://patreon.com/frenck