[Full Changelog][changelog]

Again a packed release! 🎉 

`code-server` has been upgraded to the latest greatest, shipping vscode 1.33.1 as well.
Service workers are added and a bunch of more optimizations, which should drastically reduce the initial loading times of the web interface.

@timmo001 added an option to disable sending anonymous telemetry data to code-server and @hjanum added a small change that makes AppDaemon's `dash` files being picked up as YAML as well.
@riemers came by and added support for RedHat's YAML extension, which validates you YAML files while typing them. 💯 

The default user settings are tweaked for more logical and better user experience for working on Home Assistant's configuration files and support for Home Assistant's special YAML tags has been added. If you haven't modified the default vscode configuration, the add-on will automatically upgrade these settings for you.

Finally, all command history from the built-in terminal will now persist across add-on restarts and system reboots. Which helps to find that command you used before...

Enjoy the release!

### Changed

- :arrow_up: Update code server to 1.868-vsc1.33.1 (#27) (@timmo001)
- :hammer: Adds disable telemetry flag (#27) (@timmo001)
- :hammer: Adds disable telemetry as an option (#27) (@timmo001 
- :sparkles: Adds vscode YAML extension (#26) (@riemers)
- :sparkles: Adds *.dash extension for YAML (#24) (@hjanum)
- :sparkles: Adds user configuration upgrade method
- :books: Updates README about section to match latest changes
- :sparkles: Persist user's ZSH history across restarts
- :hammer: Tweaked default user settings for a better starting experience
- :shirt: Fixes JSON lint issue

[changelog]: https://github.com/hassio-addons/addon-vscode/compare/v0.3.0...v0.4.0

Questions? Join our Discord server! https://discord.me/hassioaddons
Enjoying my add-ons? Consider supporting my work: https://patreon.com/frenck