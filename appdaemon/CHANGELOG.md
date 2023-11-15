## What’s changed

⚠️ With this release, the `appdaemon` data folder will migrate/move out of the Home Assistant configuration folder into a dedicated folder for this add-on. You can access add-on configuration folders using SSH, Samba, VSCode, and similar add-ons by accessing the `addon_configs` folder/share.

## 🚨 Breaking changes

- Migrate AppDaemon config out of Home Assistant config folder @frenck ([#285](https://github.com/hassio-addons/addon-appdaemon/pull/285))

## ⬆️ Dependency updates

- ⬆️ Update ghcr.io/hassio-addons/base Docker tag to v14.3.2 @renovate ([#286](https://github.com/hassio-addons/addon-appdaemon/pull/286))
