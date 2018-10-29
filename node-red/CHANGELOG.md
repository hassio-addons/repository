## **:warning: Contains breaking changes! So please read this carefully!**

This is a **BIG** release, and that why I marked this release v1.0.0!

The Home Assistant connector node has been replaced by `node-red-contrib-home-assistant-websocket` and uses WebSockets to connect to Home Assistant, which is actually the preferred method to use when talking to Home Assistant. It improves reaction speed and is build on top of the official Home Assistant WebSocket libraries.

The add-on now handles Home Assistant restarts automatically. You no longer need custom flows or restart magic to fix Node-RED after Home Assistant restarts :tada:.

Furthermore, authentication has been replaced. Node-RED now authenticates users against Home Assistant :lock:. This allows you to log into your Node-RED using your Home Assistant credentials.

Some other noteworthy changes:

- `http_node` no longer requires a username/password and can be left empty if you'd like.
- `http_static` no longer requires a username/password and can be left empty if you'd like.
- The Google TTS API _should_ be fixed (love to hear feedback on this!).
- The add-on has now "Manager" access to the Hass.io API, which allows you to restart Home Assistant and Hass.io add-ons in your flows.
- The documentation has been updated with an [FAQ](https://github.com/hassio-addons/addon-node-red#faq) to help with common problems.

## :arrow_up: Upgrade instructions

- Remove the `users` list from the add-on configuration. You don't need it anymore since the add-on now authenticates against Home Assistant.
- There are some breaking changes with two of the nodes. The `Poll State` and `Current State` both have a little different formatted output. Check your nodes and make sure they are outputting what you expect.
- If you have been using the `@Spartan-II-117` fork, this upgrade should be a drop in replacement. It is strongly suggested to not use this fork with this add-on anymore.

[Full Changelog][changelog]

### Changed

- Fix typo in README (#40) (@zpartal)
- Upgrades node-red-contrib-influxdb to version 0.2.2 (#41)
- Upgrades gcc to 6.4.0-r9
- Upgrades nodejs to 8.12.0-r0
- Switches add-on to node-red-contrib-home-assistant-websocket
- Forcing broken world to enable latest NodeJS
- Removes node-red-contrib-change-detect (#48) (@bonanitech)
- Adds HA Authentication to Node-RED (#52)
- Renames authentication config option (#53)
- Updates node-red-contrib-moment to version 3.0.1 (#63)
- Upgrades git to 2.18.1-r0
- Updates node-red-contrib-actionflows to version 2.0.1 (#65)
- Upgrades google-tts-api to 0.0.3 (#61) (@heytcass)
- Fixes incorrect JSON formatting in package.json
- Removes unneeded warning about no users
- Removes Auto API token script, not needed anymore
- Removes requirement for setting http node/static credential
- Adds possibility to disable HA Authentication
- Updates the README to reflect the latest changes
- Up the security level of the Hassio API to manager 

[changelog]: https://github.com/hassio-addons/addon-node-red/compare/v0.7.0...v1.0.0