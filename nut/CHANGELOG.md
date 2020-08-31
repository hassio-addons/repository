Release to fix issues with SNMP devices.

NUT is now being built rather than relying on the Alpine package.  This should resolve the issues with the current release and 32 bit compatibility (particularly on ARM).

Although USB connected devices have been confirmed to be working, please ensure to snapshot prior to the upgrade, and report any issues found.

- 🔨Add openssl=1.1.1g-r0
- 🔨Add net-snmp-libs=5.8-r3
- 🔨Add neon=0.31.1-r0
- 🔨Keep libtool installed

Questions? Join our Discord server! https://discord.me/hassioaddons

[Full Changelog][changelog]

[changelog]: https://github.com/hassio-addons/addon-nut/compare/v0.3.0...v0.3.1