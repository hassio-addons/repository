[Full Changelog][changelog]

This release updates a couple of parts of the add-on, including nodejs and the Home Assistant WebSocket node.

The add-on now ships with `node-red-node-serialport` straight of the box. I've seen many people struggle to get it installed, so from now on, it is just part of the add-on. :tada:

Furthermore, I've seen people having connection issues, mostly caused by having a conflicting Home Assistant node installed. This release takes care of those conflicting nodes for you. 🚑 

### Changed

- Upgrades node-red-contrib-home-assistant-websocket to 0.3.1
- Upgrades RPi.GPIO to 0.6.3
- Fixes PT_GNU_STACK header in nodejs patch after installing RPi.GPIO
- Upgrades nodejs to 8.14.0-r0
- Update google-tts-api to 0.0.4 (#81) (@heytcass)
- Adds node-red-node-serialport to the default node set
- Auto removal of conflicting node packages on startup

[changelog]: https://github.com/hassio-addons/addon-node-red/compare/v1.1.0...v1.2.0