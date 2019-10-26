[Full Changelog][changelog]

### 🎉 **1.0.0** 🎉 

Visual Studio Code for Home Assistant as a Hass.io add-on reached 1.0!

This version has a bunch of upgrades, mainly the code-server team has been working hard on making some major changes. The add-on now runs the second generation code-server, which is based on VSCode 1.39. Latest greatest!

Furthermore, Kees updated the VSCode extension for Home Assistant, `yamllint` had an upgrade, the latest Material design icons extension was added and...

✨ The add-on now has the Indent Rainbow extension installed by default 🎉 

This extension allows you to easily see how much your YAML is indented compared to the rest of the configuration. Thanks for suggesting this!

### 🔨 Changes

- :arrow_up: Updates yamllint to v1.18.0 (#53)
- :arrow_up: Upgrades code-server to 2.1650-vsc1.39.2
- :arrow_up: Upgrades keesschollaart.vscode-home-assistant to 1.3.0
- :arrow_up: Upgrades lukas-tr.materialdesignicons-intellisense to 1.5.5
- :sparkles: Adds Indent Rainbow extension by default
- :ambulance: Match VSCode default config with latest code-server
- :hammer: Modify code-server service with updated CLI arguments
- :tada: Mark add-on as stable

[changelog]: https://github.com/hassio-addons/addon-vscode/compare/v0.7.0...v1.0.0

Questions? Join our Discord server! https://discord.me/hassioaddons
Enjoying my add-ons? Consider supporting my work: https://patreon.com/frenck