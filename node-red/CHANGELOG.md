## What’s changed

⚠️ With this release, the `nodered` data folder will migrate/move out of the Home Assistant configuration folder into a dedicated folder for this add-on. You can access add-on configuration folders using SSH, Samba, VSCode, and similar add-ons by accessing the `addon_configs` folder/share.

## 🚨 Breaking changes

- Migrate Node-RED config out of Home Assistant config folder @frenck ([#1729](https://github.com/hassio-addons/addon-node-red/pull/1729))
- Make credentials secret optional @frenck ([#1730](https://github.com/hassio-addons/addon-node-red/pull/1730))

## ⬆️ Dependency updates

- ⬆️ Update ghcr.io/hassio-addons/base Docker tag to v14.3.2 @renovate ([#1732](https://github.com/hassio-addons/addon-node-red/pull/1732))
- ⬆️ Update node-red-contrib-home-assistant-websocket to v0.59.0 @renovate ([#1731](https://github.com/hassio-addons/addon-node-red/pull/1731))
