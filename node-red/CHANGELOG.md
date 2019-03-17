[Full Changelog][changelog]

Major upgrade!
Most noticeable: ARMv7 support, modbus support, NodeJS v10 as the base and a lot more! 

### Changed

- Adds node-red-contrib-modbus (#162)
- Updates dark theme to v0.2.9 (#165) (@bonanitech)
- Updates node-red to v0.20.2 (#166)
- Updates node-red-contrib-modbus to v4.1.3 (#167)
- Upgrades add-on base image to 3.0.0
- Upgrades g++ to 8.2.0-r2
- Upgrades gcc to 8.2.0-r2
- Upgrades linux-headers to 4.18.13-r1
- Upgrades Python PIP to 18.1-r0
- Upgrades Python to 2.7.15-r3
- Upgrades git to 2.20.1-r0
- Upgrades NodeJS to 10.14.2-r0
- Upgrades openssh-client to 7.9_p1-r4
- Adds modclean for reducing resulting image
- Removes support for legacy tags
- Adds support for ARMv7
- Makes log_level optional
- Rewrite add-on onto Bashio
- Pins down modclean version in Dockerfile
- Use unsafe-perm for npm to fix aarch64 issues
- Updates node-red-contrib-cast to v0.2.6 (#169)
- Updates badges, addon is no longer experimental, but stable. 🎉 

[changelog]: https://github.com/hassio-addons/addon-node-red/compare/v1.4.0...v2.0.0

Questions? Join our Discord server! https://discord.me/hassioaddons
Enjoying my add-ons? Consider supporting my work: https://patreon.com/frenck
