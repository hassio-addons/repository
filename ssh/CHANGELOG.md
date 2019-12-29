[Full Changelog][changelog]

Time for a major release! 🎉 

This release upgrades a lot of the internals of the add-on, to the latest & greatest. But wait, there is more!

### Bash support is here!

It has been requested quite a few times since the add-on existed. So if ZSH isn't your cup of tea, disable it in the add-on options by setting `zsh` to `false`.

As an added bonus, Bash completion support is also installed and configured for use with the `hassio` and `hass-cli` commands.

### Faster, but Ingress only Web Terminal

The Web Terminal is now only accessible via Ingress, direct access has been removed. This removes a lot of moving parts from the add-on. Combined with the latest version of `ttyd` (which powers the Web Terminal), it has become lightning fast and responsive.

The Terminal now leverages your browsers WebGL capabilities, making it fly! 🚀 

### Hass.io CLI completion with ZSH

The add-on ships with the latest Hass.io CLI, which now supports ZSH's auto-completion, which you can activate by hitting <tab> twice after you type part of the `hassio` command.

![2019-12-29 14 17 36](https://user-images.githubusercontent.com/195327/71557417-254b7180-2a46-11ea-95f0-8998f7808674.gif)

### Other noteworthy changes

- Session sharing between SSH & the Web Terminal is now turned off by default. A lot of new users run into issues understanding how `tmux` works, hence, I've opted to disable session sharing by default.
- Uses base images, based on the latest Alpine Linux 3.11.
- All configuration options regarding the Web Terminal have been removed since with Ingress, they are no longer needed.

## 🔨 All Changes

Fetching origin
- :arrow_up: Updates yamllint to v1.20.0 (#106)
- :ambulance: Spelling and grammar fixes (#107)
- :pencil2: Funding adjustments
- :arrow_up: Upgrades add-on base image to v6.0.1
- :arrow_up: Upgrades bsd-compat-headers to 0.7.2-r0
- :arrow_up: Upgrades cmake to 3.15.5-r0
- :arrow_up: Upgrades docker to 19.03.5-r0
- :arrow_up: Upgrades openssl to 1.1.1d-r3
- :arrow_up: Upgrades python3 to 3.8.0-r0
- :arrow_up: Upgrades zlib-dev to 1.2.11-r3
- :arrow_up: Upgrades device-mapper-libs to 2.02.186-r0
- :arrow_up: Upgrades zsh-autosuggestions to 0.6.3-r0
- :arrow_up: Upgrades nmap to 7.80-r1
- :arrow_up: Upgrades vim to 8.2.0-r0
- :arrow_up: Upgrades tmux to 3.0a-r0
- :arrow_up: Upgrades nano to 4.6-r0
- :arrow_up: Upgrades sudo to 1.8.29-r0
- :arrow_up: Upgrades sqlite to 3.30.1-r1
- :arrow_up: Upgrades rsync to 3.1.3-r2
- :arrow_up: Upgrades networkmanager to 1.20.8-r0
- :arrow_up: Upgrades ack to 3.2.0-r0
- :arrow_up: Upgrades awake to 1.0-r4
- :arrow_up: Upgrades bind-tools to 9.14.8-r5
- :arrow_up: Upgrades bluez to 5.52-r0
- :arrow_up: Upgrades mosquitto-clients to 1.6.8-r0
- :arrow_up: Upgrades git to 2.24.1-r0
- :arrow_up: Upgrades libltdl to 2.4.6-r7
- :arrow_up: Upgrades libxml2-utils to 2.9.10-r1
- :arrow_up: Upgrades mariadb-client to 10.4.10-r0
- :arrow_up: Upgrades mosh to 1.3.2-r13
- :arrow_up: Upgrades ncurses to 6.1_p20191130-r0
- :arrow_up: Upgrades lua-resty-http to 0.15-r0
- :arrow_up: Upgrades nginx to 1.16.1-r4
- :sparkles: Adds htop
- :arrow_up: Upgrades Hassio CLI to 3.1.2
- :fire: Removes direct access to Web Terminal (Ingress only)
- :hammer: Disable shared sessions by default
- :hammer: Update Hass.io wheels for Alpine 3.11
- :arrow_up: Upgrades libwebsockets to 3.2.1, added libuv support
- :arrow_up: Upgrades ttyd to aed3faa3, WebGL & LibUV support
- :sparkles: Adds support for using Bash instead of ZSH
- :fire: Remove unused leave_front_door_open config
- :shirt: Prettier JSON config file
- :sparkles: Adds support for Bash completion
- :ambulance: Work around a bug in latest sudo
- :ambulance: Fix issue with tmux config with latest tmux
- :sparkles: Adds Hass.io CLI auto complete support on ZSH
- :fire: Remove add-on config for web ui link
- :books: Update add-on documentation to match latest changes

[changelog]: https://github.com/hassio-addons/addon-ssh/compare/v6.4.3...v7.0.0

Questions? Join our Discord server! https://discord.me/hassioaddons
Enjoying my add-ons? Consider supporting my work: https://patreon.com/frenck