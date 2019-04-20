[Full Changelog][changelog]

✨ This release adds support for Hass.io Ingress 🎉 

**Breaking change**

The addition of Ingress makes this add-on not accessible directly. If you have added the Log Viewer via an iframe panel, this release will break that.

However, you can enable this again by going into the add-on configuration. A new section show is visible: "Network". Enter port `4277` (or anything else if you want) in the `disabled` field. Hit the "SAVE" followed by the "RESTART" button to make your iframe work as before.

An option to add an Ingress capable add-on to the sidebar menu automatically is expected to land in Home Assistant 0.92.

### Changed

- :books: Updates documentation
- :arrow_up: Upgrades base image to v3.1.0
- :sparkles: Adds Hassio Ingress support

[changelog]: https://github.com/hassio-addons/addon-log-viewer/compare/v0.4.1...v0.5.0
