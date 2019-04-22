[Full Changelog][changelog]

This release is a maintenance release, upgrading all parts of the add-on to the latest and greatest.
It is now running on Node 10.x, Alpine 3.9 and also optimized for ARMv7 based machines 🏎 

:tada: The add-on version is now v1.0.0. After all this time, we think it is time to call it stable.

### 🔨 Changes

- :hammer: Makes log_level optional
- :fire: Removes custom log format override
- :arrow_up: Upgrades base image to v3.1.0
- :sparkles: Adds ARMv7 support
- :sparkles: Adds port descriptions
- :arrow_up: Upgrades g++ to 8.3.0-r0
- :arrow_up: Upgrades libxml2 to 2.9.9-r1
- :arrow_up: Upgrades openssl to 1.1.1b-r1
- :arrow_up: Upgrades yarn to 1.12.3-r0
- :arrow_up: Upgrades bind-tools to 9.12.3_p4-r0
- :arrow_up: Upgrades git to 2.20.1-r0
- :arrow_up: Upgrades mariadb-client to 10.3.13-r0
- :arrow_up: Upgrades mosquitto-clients to 1.5.6-r0
- :arrow_up: Upgrades ncurses to 6.1_p20190105-r0
- :arrow_up: Upgrades nmap to 7.70-r3
- :arrow_up: Upgrades nodejs to 10.14.2-r0
- :arrow_up: Upgrades openssh-client to 7.9_p1-r4
- :arrow_up: Upgrades openssl to 1.1.1b-r1
- :arrow_up: Upgrades pip to 18.1-r0
- :arrow_up: Upgrades python to 2.7.15-r3
- :arrow_up: Upgrades sqlite to 3.26.0-r3
- :arrow_up: Upgrades sshfs to 3.5.1-r0
- :arrow_up: Upgrades sudo to 1.8.25_p1-r2
- :arrow_up: Upgrades tmux to 2.8-r0
- :arrow_up: Upgrades wget to 1.20.3-r0
- :arrow_up: Upgrades zip to 3.0-r7
- :arrow_up: Upgrades zsh-autosuggestions to 0.5.0-r0
- :arrow_up: Upgrades zsh to 5.6.2-r0
- :arrow_up: Upgrades hassio-cli to v2.2.0
- :ambulance: Patches C9 to be compatible with Node 10.x
- :fire: Removes broken run definitions from workspace
- :fire: Removes tmux plugin from ZSH
- :hammer: Rewrite add-on onto Bashio
- :hammer: Changes add-on URL
- :fire: Removes default config options
- :shirt: Fixes Markdownlint warnings
- :tada: Moves project out of experimental stage

[changelog]: https://github.com/hassio-addons/addon-ide/compare/v0.8.0...v1.0.0

Questions? Join our Discord server! https://discord.me/hassioaddons
Enjoying my add-ons? Consider supporting my work: https://patreon.com/frenck