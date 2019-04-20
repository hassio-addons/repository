[Full Changelog][changelog]

✨ This release adds support for Hass.io Ingress 🎉 

Besides Ingress, this release adds major upgrades to motionEye & motion itself ⬆️ 

### ⚠️ Create snapshot before upgrade!

If you upgrade from a previous version of the add-on, all your current configuration files need to be converted and migrated. The add-on will do this for you, nevertheless, it is **strongly** advised to create an Hass.io snapshot before upgrading.

### 🚨Breaking change

The addition of Ingress makes this add-on not accessible directly. If you have added motionEye via an iframe panel, this release will break that.

However, you can enable this again by going into the add-on configuration. A new section show is visible: "Network". Enter port `8765` (or anything else if you want) in the `disabled` field. Hit the "SAVE" followed by the "RESTART" button to make your iframe work as before.

An option to add an Ingress capable add-on to the sidebar menu automatically is expected to land in Home Assistant 0.92.

### 🔨 Changes

- :pencil2: Typo (#22) (@timmo001)
- :arrow_up: Updates MarkupSafe to v1.1.1 (#23)
- :arrow_up: Updates tornado to v6.0.2 (#28)
- :arrow_up: Updates pillow to v6 (#29)
- :arrow_up: Upgrades add-on base image to 3.1.0
- :fire: Removes custom log format override
- :hammer: Makes log_level optional
- :arrow_up: Upgrades curl to 7.64.0-r1
- :arrow_up: Upgrades gcc to 8.3.0-r0
- :arrow_up: Upgrades musl-dev to 1.1.20-r4
- :arrow_up: Upgrades pip to 18.1-r0
- :arrow_up: Upgrades python to 2.7.15-r3
- :arrow_up: Upgrades mosquitto-clients to 1.5.6-r0
- :arrow_up: Upgrades py-setuptools to 40.6.3-r0
- :arrow_up: Upgrades motion to 4.2.2-r0
- :hammer: Rewrite add-on onto Bashio
- :fire: Removes default config options
- :sparkles: Adds Hassio Ingress support
- :sparkles: Adds ARMv7 support
- :ambulance: Workaround Docker issue by reinstating legacy tags
- :arrow_up: Upgrades motioneye to 0.40rc5
- :arrow_down: Downgrades tornado to 5.1.1
- :hammer: Merged init scripts
- :arrow_up: Updates jinja2 to v2.10.1 (#30)
- :books: Updates documentation to match recent changes

[changelog]: https://github.com/hassio-addons/addon-motioneye/compare/v0.3.0...v0.4.0

Questions? Join our Discord server! https://discord.me/hassioaddons
Enjoying my add-ons? Consider supporting my work: https://patreon.com/frenck