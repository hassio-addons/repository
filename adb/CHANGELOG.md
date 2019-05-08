[Full Changelog][changelog]

This release fixes an issue with the Android Debug Bridge crashing on start (mainly ARMv7/Raspberry Pi).
It does this by downgrading the `adb` package since there is no workaround available.
No functionality is lost by this downgrade from the perspective of this add-on.

### :hammer: Changes

- 🚑 ⬇️ Downgrades adb to 7.0.0+r33-2 (#12)

[changelog]: https://github.com/hassio-addons/addon-adb/compare/v0.4.0...v0.4.1

Questions? Join our Discord server! https://discord.me/hassioaddons
Enjoying my add-ons? Consider supporting my work: https://patreon.com/frenck