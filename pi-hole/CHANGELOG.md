[Full Changelog][changelog]

### Added

- Pi-Hole FTL v4.0 patches
- Adds default block list
- Adds Pihole FTL config
- Adds default DNSMasq configuration
- Adds Pihole vX -> v4 migration script
- Adds admin port support to NGinx

### Fixed

- Fixes reloading of DNS on white/blacklist changes (#33)
- Patches pihole-FTL.conf to not break the admin interface

### Changed

- Upgrades base image to v2.1.2
- Sets default Shell
- Enforces authentication and HaveIBeenPwned checks
- Updates README and links
- Upgrades OpenSSL to 1.0.2o-r2
- Upgrades PHP to 7.2.8-r1
- Enables SSL by default
- Upgrades ncurses to 6.1_p20180818-r0
- Replaces dnsmasq with pihole-FTL
- DNS container init move and migration
- Changes order of container init
- Updated forum link
- Updates README to match recent changes

### Removed

- Removes DNSMasq
- Removes Pihole Block page, moving to NULL based blocking

[changelog]: https://github.com/hassio-addons/addon-pi-hole/compare/v1.3.0...v2.0.0