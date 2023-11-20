## What’s changed

⚠️ With this release, the `appdaemon` data folder will migrate/move out of the Home Assistant configuration folder into a dedicated folder for this add-on. You can access add-on configuration folders using SSH, Samba, VSCode, and similar add-ons by accessing the `addon_configs` folder/share.

If you have this in your `appdaemon.yaml` file:

```yaml
secrets: /config/secrets.yaml
```

You will need to adjust this to:

```yaml
secrets: /homeassistant/secrets.yaml
```

## 🐛 Bug fixes

- Fixed another incorrect check @frenck ([#290](https://github.com/hassio-addons/addon-appdaemon/pull/290))
