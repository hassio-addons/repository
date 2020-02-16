[Full Changelog][changelog]

Major release time! 🎉 

This is an exciting release, as this release adds support for `aarch64` based systems.
E.g., running the 64 bits Home Assistant Operating System on a Raspberry Pi 4 or Hardkernel ODROID-N2! 😲

⚠️ Please be aware, this add-on can be pretty heavy. On low memory devices (e.g., Raspberry Pi 4 with 1Gb of memory), I would still not recommend using this add-on.

Another visible thing is the rebranding of Home Assistant, which has been reflected on the add-on. The `hassio` command-line tool has been replaced by the newer and updated `ha` version. (Don't worry, I've added a backward-compatible layer with a warning if you still use the old command).

All extensions provided by the add-on, are now marked as "builtin". This means they no longer show up in the extensions list. Other than that, it doesn't change a thing. It makes future updates to the add-on easier.

Also added in this release: Hooking up with the official Mosquitto and MariaDB add-ons (if installed).

If you use the MQTT tools (`mosquitto_pub` or `mosquitto_sub`) from the terminal inside VSCode, they will automatically connect, authenticate and work with the Mosquitto core add-on. Allowing for easy debugging 👍 

For the `mysql` command-line tool, the same has been done. If you have installed the MariaDB add-on, running `mysql` from the command-line, drops you straight in!

### 🔨 Changes

- :arrow_up: Upgrades add-on base image to v5.0.0
- :books: Update add-on documentation to use new YAML configuration format
- :hammer: Re-branding
- :hammer: Update add-on config with new password & list features
- :hammer: Updates for upstream Supervisor changes
- :books: Update add-on documentation to use new YAML configuration format
- :fire: Remove direct access support
- :arrow_up: Updates the Home Assistant CLI to v4.0.1
- :pencil2: Fixes some typos
- :fire: Remove unused dependencies
- :ambulance: Fix broken semver link
- :hammer: Install extensions from Marketplace, removes a stage layer
- :sparkles: Adds aarch64 support
- :rocket: Add aarch64 CI/build
- :hammer: Mark delivered extensions as builtin
- :hammer: Improve download if extensions during build
- :shirt: Fixes linter warnings
- :sparkles: Add hassio fallback command for backward compatibility
- :sparkles: Add hook up with the MQTT service
- :sparkles: Add hook up with the MySQL service
- :shirt: Remove log spam about extensions during add-on start
- :ambulance: Fix old extension cleanup
- :pencil2: Corrects forum URL links

[changelog]: https://github.com/hassio-addons/addon-vscode/compare/v1.2.3...v2.0.0

Questions? Join our Discord server! https://discord.me/hassioaddons
Enjoying my add-ons? Consider supporting my work:
https://github.com/sponsors/frenck or https://patreon.com/frenck