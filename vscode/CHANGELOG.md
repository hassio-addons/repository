[Full Changelog][changelog]

⬆️ This release brings major updates to the [Home Assistant Config Helper](https://github.com/keesschollaart81/vscode-home-assistant) extension for Visual Studio code.
@keesschollaart81 did an amazing job on extending it and now provides:

- Auto-completion & validation on your Home Assistant configuration in general.
- Auto-completion & validation for Lovelace.
- Can now handle `!include`'s and supports `Go to Definition`.

🚑 Furthermore, changes were applied to reduce the number of refreshes of the file/folder tree. This was especially annoying when trying to create or rename files/folders using the explorer.

### ⚠️ Configuration change

This add-on comes with a VSCode configuration out of the box, which is being updated by the add-on. This auto-update mechanism stops working when you personalize/change VSCode's configuration.

In order for the new Home Assistant Config Helper extension to work, a configuration change was made. If you did not personalize your vscode configuration, the thing will just work. If you did customize it and want to reset your configuration to the new defaults:

1. Open the Visual Studio Code editor.
1. Click on `Terminal` in the top menu bar and click on `New Terminal`.
1. Execute the following command in the terminal window: `reset-settings`.
1. Done!

### 🔨 Changes

- :arrow_up: Upgrades add-on base image to 3.1.1
- :arrow_up: Upgrades code-server to 1.939-vsc1.33.1
- :hammer: Pins versions of VSCode extensions
- :hammer: Extends file watcher exclude list
- :hammer: Associates yaml file to Home Assistant by default
- :sparkles: Adds vscode settings reset command
- :arrow_up: Upgrades vscode-home-assistant to 0.5.7

[changelog]: https://github.com/hassio-addons/addon-vscode/compare/v0.4.2...v0.5.0

Questions? Join our Discord server! https://discord.me/hassioaddons
Enjoying my add-ons? Consider supporting my work: https://patreon.com/frenck