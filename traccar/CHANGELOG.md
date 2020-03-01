[Full Changelog][changelog]

Bugfix release, that fixes a bug when using a custom database server (override), allows the lock release to fail on startup and improves the documentation on how to enable protocols.

Furthermore, the OsmAnd protocol is now enabled by default, since that is needed for the official Traccar apps to function.

### Changed

- :sparkles: Open up osmand protocol by default
- :ambulance: Allow lock releasing to fail
- :ambulance: Skip MySQL container init when the database is overridden by the user
- :books: Update add-on documentation on enabling protocols

[changelog]: https://github.com/hassio-addons/addon-traccar/compare/v0.7.1...v0.7.2

Questions? Join our Discord server! https://discord.me/hassioaddons
Enjoying my add-ons? Consider supporting my work:
https://github.com/sponsors/frenck or https://patreon.com/frenck