[Full Changelog][changelog]

### Fixed

- Fixes Hadolint warning

### Changed

- Upgrades home-assistant node to Spartan-II-117 fork
- Upgrades node-red-contrib-time-range-switch to 0.6.0 (#13)
- Disables the projects feature by default on new installs
- Upgrades base image to v2.0.1
- Upgrades nodejs to 8.11.3-r1
- Upgrades git to 2.18.0-r0
- GitLab CI now using the latest Hadolint

### Removed

- Removes node-red-contrib-join in favor of the built-in one (#12)

[changelog]: https://github.com/hassio-addons/addon-node-red/compare/v0.2.1...v0.3.0