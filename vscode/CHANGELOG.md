[Full Changelog][changelog]

This release bring changes to VSCode settings. The settings will only update if you have not changed them. If you did change settings in VSCode, you can reset them by executing the `reset-settings` command from the VSCode terminal.

### 🔨 Changes

- ⬆ Updates yamllint to v1.23.0 (#97)
- ⬆ Updates homeassistant_cli to v0.9.1 (#99)
- ⬆ Upgrades git to 1:2.17.1-1ubuntu0.7
- 🔨 Switch add-on from Ubuntu to Debian
- 🔨 Implement OCI image specification on labels
- ⬆ Upgrades keesschollaart.vscode-home-assistant to 1.6.5
- ⬆ Upgrades lukas-tr.materialdesignicons-intellisense to 2.0.2
- ⬆ Upgrades redhat.vscode-yaml to 0.8.0
- ⬆ Upgrades usernamehw.errorlens to 3.1.1
- 🚑 Ensure locales are generated
- 🚑 Remove disable-ssh flag from code-server run
- 🚑 Fix download location of code-server
- 🚑 Fix code-server executable path, changed in v3.3.0
- 🚑 Remove disable-updates flag, not longer used in v3.3.0
- 🚑 Update architecture name for amd64, changed in v3.3.0
- 🚑 Fix locales handling
- 👕 Slow down fetching extensions from Marketplace a bit, to prevent rate limiting
- 🚑 Fix auto indent for YAML
- ⬆ Upgrades code-server to 3.4.0
- ✏ Split add-on documentation
- 🚑 Increase sleep between extension download
- 🚑 Fix auto indent for HA files

[changelog]: https://github.com/hassio-addons/addon-vscode/compare/v2.2.0...v2.3.0

Questions? Join our Discord server! https://discord.me/hassioaddons
Enjoying my add-ons? Consider supporting my work:
https://github.com/sponsors/frenck or https://patreon.com/frenck