[Full Changelog][changelog]

This is a general maintenance release, which incorporates the re-branding of Home Assistant as well.

Newly added to this release is the seamless connection with the MariaDB & Mosquitto add-ons. The command-line tools for these, are automatically configured to connect to the add-ons.

The `hassio` command-line tool has been replaced/renamed to `ha`. Don't worry, the old commands still work, giving you some time to get used to this all.

### 🔨 Changes

- :fireworks: Updates maintenance/license year to 2020
- :pencil2: Fixes some spelling and grammar
- :arrow_up: Upgrades add-on base image to v7.0.0
- :books: Update add-on documentation to use new YAML configuration format
- :hammer: Update add-on config with new password & list features
- :arrow_up: Upgrades Home Assistant CLI to 4.0.1
- :hammer: Re-branding
- :arrow_up: Upgrades ttyd to v1.6.0
- :arrow_up: Upgrades libwebsockets to 3.2.2
- :arrow_up: Upgrades python3 to 3.8.1-r0
- :arrow_up: Upgrades libxml2-utils to 2.9.10-r2
- :arrow_up: Upgrades mariadb-client to 10.4.12-r0
- :arrow_up: Upgrades sudo to 1.8.31-r0
- :sparkles: Add hook up with the MQTT &  MySQL services
- :ambulance: Fix incorrect version tag on ttyd
- :ambulance: Correct MySQL cnf path

[changelog]: https://github.com/hassio-addons/addon-ssh/compare/v7.0.1...v7.1.0

Questions? Join our Discord server! https://discord.me/hassioaddons
Enjoying my add-ons? Consider supporting my work: https://patreon.com/frenck