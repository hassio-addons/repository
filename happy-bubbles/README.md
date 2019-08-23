# Community Hass.io Add-ons: Happy Bubbles

[![Release][release-shield]][release] ![Project Stage][project-stage-shield] ![Project Maintenance][maintenance-shield]

[![Discord][discord-shield]][discord] [![Community Forum][forum-shield]][forum]

[![Buy me a coffee][buymeacoffee-shield]][buymeacoffee]

[![Support my work on Patreon][patreon-shield]][patreon]

Presence detection server for Happy Bubbles Bluetooth beacon-based
presence detection system.

## About

This add-on is a server that subscribes to MQTT topics that the "Happy Bubbles"
Bluetooth Beacon Presence Detectors publish to. It checks to see which of the
detectors found the strongest signal for a particular beacon, and then lets
you access that info either over an API, or a web interface.

It is designed to be used as a home-automation presence detection system.
If you install the detectors through-out a home and family members carry
beacons around the house, you can program your home automation hubs to
take certain actions depending on who entered or left certain rooms.

This add-on also publishes changes in location to a particular topic.
So you can program your hub to listen for these and make the desired changes
as they happen, to not have to keep polling it.

[Click here for the full documentation][docs]

[buymeacoffee-shield]: https://www.buymeacoffee.com/assets/img/guidelines/download-assets-sm-2.svg
[buymeacoffee]: https://www.buymeacoffee.com/frenck
[discord-shield]: https://img.shields.io/discord/478094546522079232.svg
[discord]: https://discord.me/hassioaddons
[docs]: https://github.com/hassio-addons/addon-happy-bubbles/blob/v3.0.3/README.md
[forum-shield]: https://img.shields.io/badge/community-forum-brightgreen.svg
[forum]: https://community.home-assistant.io/t/community-hass-io-add-on-happy-bubbles/53511?u=frenck
[maintenance-shield]: https://img.shields.io/maintenance/yes/2019.svg
[patreon-shield]: https://www.frenck.nl/images/patreon.png
[patreon]: https://www.patreon.com/frenck
[project-stage-shield]: https://img.shields.io/badge/project%20stage-production%20ready-brightgreen.svg
[release-shield]: https://img.shields.io/badge/version-v3.0.3-blue.svg
[release]: https://github.com/hassio-addons/addon-happy-bubbles/tree/v3.0.3