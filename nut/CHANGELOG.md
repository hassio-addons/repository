NUT is now being built rather than relying on the Alpine package.  This should resolve the issues with the current release and 32 bit compatibility (particularly on ARM).

Although USB connected devices have been confirmed to be working, please ensure to snapshot prior to the upgrade, and report any issues found.

- 🔨Add libusb-compat=0.1.5-r4
- 📚Disable DL3003 in linter
- 🚑Implement local nut build (#48)

Questions? Join our Discord server! https://discord.me/hassioaddons

[Full Changelog][changelog]

[changelog]: https://github.com/hassio-addons/addon-nut/compare/v0.2.1...v0.3.0