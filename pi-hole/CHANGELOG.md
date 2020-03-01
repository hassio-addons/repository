[Full Changelog][changelog]

This is a general maintenance release, containing a lot of internal upgrades and fixes.

### :hammer: Changes

- 🚑 Fixes issues with HTTP header checking (#89)
- :fire: Remove virtual host configuration (#90)
- 🚑Fix admin/queries.php for ingress users (#97)
- 🚑Fix admin/queries.php for direct users (#98)
- 💄Fix error log path to /dev/stderr (#91)
- :books: Update documentation on how to integrate with Home Assis… (#102)
- ⬆️ Upgrades Pi-hole web interface to v4.3.2 (#107)
- :fire: Removed coffee patch
- :hammer: Updated fix killall brain damage patch
- :books: Update add-on installation instructions
- :shirt: Fixes Markdownlint warnings
- :fireworks: Updates maintenance/license year to 2020
- :pencil2: Funding adjustments
- :pencil2: Fixes some spelling and grammar
- :arrow_up: Upgrades gcc to 9.2.0-r3
- :arrow_up: Upgrades musl-dev to 1.1.24-r0
- :arrow_up: Upgrades nettle-dev to 3.5.1-r0
- :arrow_up: Upgrades sqlite to 3.30.1-r1
- :arrow_up: Upgrades psmisc to 23.3-r0
- :arrow_up: Upgrades openssl to 1.1.1d-r3
- :arrow_up: Upgrades bind-tools to 9.14.8-r5
- :arrow_up: Upgrades logrotate to 3.15.1-r0
- :arrow_up: Upgrades perl to 5.30.1-r0
- :arrow_up: Upgrades git to 2.24.1-r0
- :arrow_up: Upgrades lua-resty-http to 0.15-r0
- :arrow_up: Upgrades ncurses to 6.1_p20191130-r0
- :arrow_up: Upgrades procps to 3.3.16-r0
- :ambulance: Hot patch FTL for nettle 3.5 compatibility
- :books: Update Home Assistant integration instruction
- :arrow_up: Upgrades nginx to 1.16.1-r6
- :books: Update add-on documentation to use new YAML configuration format
- :hammer: Re-branding
- :hammer: Update add-on config with new password & list features
- :hammer: Updates for upstream Supervisor changes
- :ambulance: Fix broken Home Assistant DNS servers in list
- 🔨Admin scripts rewrite (#123)
- :arrow_up: Upgrades add-on base image to v7.0.2
- 🔨Add access control to api.conf (#114)
- :arrow_up: Upgrades libxml2 to 2.9.10-r2
- :arrow_up: Upgrades ncurses to 6.1_p20200118-r2
- :arrow_up: Upgrades php7 to 7.3.15-r0
- :arrow_up: Upgrades sudo to 1.8.31-r0
- :arrow_up: Upgrades Pi-hole core to v4.4

[changelog]: https://github.com/hassio-addons/addon-pi-hole/compare/v4.0.0...v4.1.0

Questions? Join our Discord server! https://discord.me/hassioaddons
Enjoying my add-ons? Consider supporting my work:
https://github.com/sponsors/frenck or https://patreon.com/frenck