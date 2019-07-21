[Full Changelog][changelog]

This is a general maintenance release.

🚑 This release also takes care of mitigating the recently discovered `lodash` vulnerability that is considered high severity. Not all Node-RED nodes have patched and updated to handle this vulnerability, so the add-on does this for you on a higher level. We keep this in place till we are sure all is OK.

More information is provided by Snyk (whom we use to protect and actively scan our add-ons):

<https://snyk.io/vuln/SNYK-JS-LODASH-450202>

### 🔨  Changes

- :arrow_up: Upgrades add-on base image to v4.0.2
- :ambulance: Mitigate lodash vulnerabilities (#263)
- :arrow_up: Pin snyk to 1.195.1 (#270)

[changelog]: https://github.com/hassio-addons/addon-node-red/compare/v4.0.2...v4.0.3

Questions? Join our Discord server! https://discord.me/hassioaddons
Enjoying my add-ons? Consider supporting my work: https://patreon.com/frenck