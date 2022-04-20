## What’s changed

This release has some breaking changes and some nice updates!

First of all, a lot of updates preparing for the upcoming Home Assistant 2022.5!

The add-on now has ESPHome with its latest VSCode extension embed. This means you now have live ESPHome code completion AND validation, straight from the add-on without configuration.

Thre are also some breaking changes:

- The, previously deprecated, `hassio` command (which was an backwards compatible alias for `ha`) has been removed. Use the `ha` command instead.
- The `hass-cli` command has been removed (not to be confused with the `ha` command, which is still there.

This release also contains quite an important bugfix 🐛  in the Home Assistant VSCode extensions that caused people not to have auto-completion (as the extension failed to connect).

## 🚨 Breaking changes

- 🔥 Remove Home Assistant CLI @frenck (#432)
- 🔥 Remove hassio command compatibility layer @frenck (#435)

## ✨ New features

- Embed ESPHome @frenck (#433)

## 🧰 Maintenance

- 🧹 Clean up some build cache @frenck (#431)
- 🧹 Remove workarounds no longer needed @frenck (#434)

## ⬆️ Dependency updates

- ⬆️ Upgrades locales to 2.31-13+deb11u3 @frenck (#422)
- ⬆️ Upgrades libarchive-tools to 3.4.3-2+deb11u1 @frenck (#423)
- ⬆️ Upgrades openssl to 1.1.1n-0+deb11u1 @frenck (#424)
- ⬆️ Upgrades mariadb-client to 1:10.5.15-0+deb11u1 @frenck (#425)
- ⬆️ Upgrades uuid-runtime to 2.36.1-8+deb11u1 @frenck (#426)
- ⬆️ Upgrades esbenp.prettier-vscode to 9.5.0 @frenck (#420)
- ⬆️ Upgrades add-on base image to 5.3.1 @frenck (#427)
- ⬆️ Upgrades ESPHome.esphome-vscode to 2.0.0 @frenck (#428)
- ⬆️ Upgrades oderwat.indent-rainbow to 8.3.1 @frenck (#429)
- ⬆️ Upgrades code-server to 4.3.0 @frenck (#430)
- ⬆️ Upgrades keesschollaart.vscode-home-assistant to 1.28.0 @frenck (#436)
- ⬆️ Upgrades ESPHome to 2022.4.0 @frenck (#437)
