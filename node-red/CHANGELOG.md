[Full Changelog][changelog]

🎉  A packed Node-RED, with a bunch of package & system updates, including the Home Assistant Websocket node.

✨Node-RED Dashboard (UI) is now shipped by this add-on by default and has been patched to work better with Ingress.

🚑 The issue with ARM 64-bits is resolved. Which mean that the `aarch64` architecture now also works.

🚑 The issue with accessing HTTP nodes has been addressed. HTTP endpoints are now freely available when using the `/endpoint/` URL prefix. Please take that into account when using this.

🔧 Direct access is now enabled by default. This is needed for HTTP nodes and Node-RED Dashboard as well.

### 🔨  Changes

- :arrow_up: Upgrades python to 2.7.16-r1
- :arrow_up: Upgrades lua-resty-http to 0.13-r0
- :arrow_up: Upgrades nginx to 1.14.2-r1
- :arrow_up: Upgrades nginx-mod-http-lua to 1.14.2-r1
- :arrow_up: Updates node-red-contrib-home-assistant-websocket to v0.11.0 (#219)
- :ambulance: Turns of Lua Resty core in Nginx
- :arrow_up: Updates node-red-node-serialport to v0.8.3 (#220)
- :wrench: Adds configuration to allow http_node access (#214)
- :sparkles: Adds Node-RED Dashboard
- 🚑 Allow for bigger file uploads during import
- ⚠️Adds warning to logout when using the Dark theme
- 📚Adds known issues and limitation section to documentation
- 🚨Patches Denial of Service vulnerability in Axios package (#221)
- 📌 Pin snyk to 1.165.1 (#222)

[changelog]: https://github.com/hassio-addons/addon-node-red/compare/v3.0.3...v3.1.0

Questions? Join our Discord server! https://discord.me/hassioaddons
Enjoying my add-ons? Consider supporting my work: https://patreon.com/frenck