[Full Changelog][changelog]

Major upgrade!
Upgrades all parts onto our new base images (based on Alpine 3.9.2), adds ARMv7 support 🎉 

### Changed

- Removal of legacy tags from build
- Upgrades add-on base image to 3.0.0
- Upgrades Docker to 18.09.1-r0
- Upgrades libffi to 3.2.1-r6
- Upgrades Python to 3.6.8-r1
- Upgrades bluez to 5.50-r0
- Upgrades device-mapper-libs to 2.02.182-r0
- Upgrades git to 2.20.1-r0
- Upgrades nmap to 7.70-r3
- Upgrades OpenSSH to 7.9_p1-r4
- Upgrades libxml2-utils to 2.9.9-r1
- Upgrades mariadb-client to 10.3.13-r0
- Upgrades mosh to 1.3.2-r7
- Upgrades mosquitto-clients to 1.5.6-r0
- Upgrades nano-syntax to 3.2-r0
- Upgrades nano to 3.2-r0
- Upgrades openssl to 1.1.1b-r1
- Upgrades ncurses to 6.1_p20190105-r0
- Upgrades sqlite to 3.26.0-r3
- Upgrades sudo to 1.8.25_p1-r2
- Upgrades tmux to 2.8-r0
- Upgrades vim to 8.1.0630-r0
- Upgrades zip to 3.0-r7
- Upgrades zsh to 5.6.2-r0
- Upgrades zsh-autosuggestions to 0.5.0-r0
- Replaces ttyd custom build with package
- Adds support for ARMv7
- Makes log_level optional
- Removes custom log format override
- Merge fix-attr scripts
- Rewrite add-on onto Bashio
- Fixes typo in GitLab CI file

[changelog]: https://github.com/hassio-addons/addon-ssh/compare/v3.7.3...v4.0.0

Questions? Join our Discord server! https://discord.me/hassioaddons
Enjoying my add-ons? Consider supporting my work: https://patreon.com/frenck