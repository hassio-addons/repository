[Full Changelog][changelog]

### ⚠️ This is a major release with breaking changes

This is a major release of the Traccar add-on, that contains breaking changes, to make future use (and development) easier.

#### Protocols disabled by default

All protocols and ports, besides the web API, are now disabled by default! You need to manually enable each protocol you need to use in the `/config/traccar.xml` file yourself. Please refer to the Traccar documentation on how to do that.

The reason to switch off all protocols is to free up memory and keep Traccar from claiming hundreds of ports. This excessive port claiming caused troubles for a lot of users and confused the lesser technical known users even more.

#### Now uses the official MariaDB add-on

The add-on now interconnects with the official Home Assistant MariaDB add-on automatically. Make sure you have it installed and running (version 2.0 or higher). Zero, 0, configuration needed.

If you have a custom MySQL connection configured in your configuration, that will have a higher priority, and thus will be used.

### Changed

- :books: Update add-on documentation to use new YAML configuration format
- :hammer: Re-branding
- :hammer: Update add-on config with new password & list features
- :hammer: Updates for upstream Supervisor changes
- :arrow_up: Upgrades add-on base image to v7.0.2
- :arrow_up: Upgrades openjdk8-jre to 8.242.08-r0
- :arrow_up: Upgrades Traccar to v4.8
- :sparkles: Automatically use and discovery MySQL service
- :fire: Disable all ports by default, add example to custom config
- :hammer: Update community forum links
- :books: Update add-on installation instructions

[changelog]: https://github.com/hassio-addons/addon-traccar/compare/v0.6.1...v0.7.0

Questions? Join our Discord server! https://discord.me/hassioaddons
Enjoying my add-ons? Consider supporting my work:
https://github.com/sponsors/frenck or https://patreon.com/frenck