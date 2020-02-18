[Full Changelog][changelog]

Relatively small update today, but with a major impact!

As it turned out, the nice little icons shown in the file tree (by the `vscode-icons` extension), is quite hard on memory and CPU usage and even has issues reported on memory leaks. These little icons cause major CPU spikes and make the add-on consume almost double the amount of memory. That is not nice, so for now, the icons are removed.

You can still install the `vscode-icons` extension yourself if you like 👍 

Furthermore, some other tweaks have been made, to improve performance and experience. For new installations (or if you reset your configuration), more folders and files are hidden by default and excluded from the search index of the add-on.

Finally, auto-completion for the Home Assistant CLI was missing in the previous release, which is now added back in. So if you type `ha` in the terminal and hit the TAB key twice, it will show you a selection of possibilities, including descriptions.

### 🔨 Changes

- ✏️ Correct typo in README (#80)
- :fire: Remove telemetry setting, disable by default
- :sparkles: Adds Home Assistant CLI auto completion
- :fire: Remove vscode icons extension, for memory & cpu issues
- :hammer: Tune configuration for lower memory & CPU
- :hammer: Reset icon set to vscode default

[changelog]: https://github.com/hassio-addons/addon-vscode/compare/v2.0.0...v2.1.0

Questions? Join our Discord server! https://discord.me/hassioaddons
Enjoying my add-ons? Consider supporting my work:
https://github.com/sponsors/frenck or https://patreon.com/frenck