[Full Changelog][changelog]

Bug fix release. Thank you for all the feedback! The add-on has had some upgrades to be more robust.

Important, in case you are experiencing problems with the Home Assistant component/integration/sensor: Update your HA configuration to the following (example):

```yaml
sensor:
  - platform: pi_hole
    host: localhost:4865
    monitored_conditions:
      - ads_blocked_today
      - dns_queries_today
      - unique_clients
```

### Fixed

- Fixes user/group of pihole-FTL on migration
- Ensures existing log files are overwritten 
- Adds interface on /admin as well
- Updates pihole component example
- Updates panel_iframe example

### Changed

- Changes the default back to /admin
- Changes the PHP FPM port

[changelog]: https://github.com/hassio-addons/addon-pi-hole/compare/v2.0.1...v2.0.2