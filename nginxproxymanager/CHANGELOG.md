[Full Changelog][changelog]

This is a big major release!

This release upgrades the Nginx Proxy Manager to the latest and greatest, furthermore, it now leverages the official MariaDB add-on to store its data in.

### ⚠️ Breaking change

This add-on now depends on and requires the official Home Assistant MariaDB add-on in order to run.

All data of the NGINX Proxy Manager is now stored in that add-on. This removes the need for the add-on to run and maintain its own database server. This reduces memory & CPU usages and makes it easier to maintain the add-on overall.

If you are upgrading, please make sure you have installed the MariaDB add-on (version 2.0 or higher). The NGINX Proxy Manager add-on will automatically migrate your existing data.

### 🔨  Changes

- :hammer: Re-branding
- :books: Update add-on documentation to use new YAML configuration format
- :ambulance: Fix Patreon link
- :hammer: Update add-on config with new password & list features
- :hammer: Updates for upstream Supervisor changes
- :arrow_up: Upgrades nodejs to 12.15.0-r1
- :arrow_up: Upgrades nginx to 1.16.1-r6
- :arrow_up: Upgrades mariadb to 10.4.12-r0
- :arrow_up: Upgrades nginx-proxy-manager to v2.1.1
- :rocket: Remove unneeded eslint from build
- :arrow_up: Upgrades add-on base image to v7.0.2
- :hammer: Adds migration to official MariaDB add-on (#77)
- :books: Update add-on instructions

[changelog]: https://github.com/hassio-addons/addon-nginx-proxy-manager/compare/v0.4.0...v0.5.0

Questions? Join our Discord server! https://discord.me/hassioaddons
Enjoying my add-ons? Consider supporting my work:
https://github.com/sponsors/frenck or https://patreon.com/frenck