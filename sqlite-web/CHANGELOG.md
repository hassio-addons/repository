## What’s changed

⚠️ The add-on now uses `/homeassistant` instead of `/config` to access the Home Assistant configuration. If you have configured a custom database to pick up, this might affect your add-on settings. Typical use is not affected.

## 🚨 Breaking changes

- Drop support for armhf & i386 @frenck ([#282](https://github.com/hassio-addons/addon-sqlite-web/pull/282))
- Migrate add-on to new Home Assistant configuration mapping @frenck ([#284](https://github.com/hassio-addons/addon-sqlite-web/pull/284))

## ⬆️ Dependency updates

- ⬆️ Update alpine_3_18/nginx to v1.24.0-r7 @renovate ([#279](https://github.com/hassio-addons/addon-sqlite-web/pull/279))
- ⬆️ Update ghcr.io/hassio-addons/base Docker tag to v14.3.1 @renovate ([#283](https://github.com/hassio-addons/addon-sqlite-web/pull/283))
- ⬆️ Update ghcr.io/hassio-addons/base Docker tag to v14.3.2 @renovate ([#285](https://github.com/hassio-addons/addon-sqlite-web/pull/285))
