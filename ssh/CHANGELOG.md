[Full Changelog][changelog]

This release brings some new features, as well as general maintenance.

Commandline completion is added for the `docker` command, which is really helpful. Furthermore, automated integration with the Mosquitto and MariaDB add-ons has been improved.

Lastly, support for the upcoming Home Assistant Audio layer has been added. While this layer isn't released yet, this add-on is now fully prepared. 

Tools like the `pulsemixer` and `aplay` have been added to give you the possibility to play audio and manage the volume levels of your audio device(s). So, as soon as the new Audio layer is available, you can start using it.

### 🔨 Changes

- :shirt: Remove unnecessary execute permissions (#122)
- :arrow_up: Upgrades add-on base image to v7.0.2
- :sparkles: Include docker completions (#121)
- :arrow_up: Upgrades ncurses to 6.1_p20200118-r2
- :arrow_up: Upgrades tmux to 3.0a-r1
- :sparkles: Adds support for new audio layer
- :sparkles: Adds alsa audio utilities
- :sparkles: Adds pulsemixer audio controls on the CLI
- :hammer: Improve MySQL & MQTT services handling

[changelog]: https://github.com/hassio-addons/addon-ssh/compare/v7.1.0...v7.2.0

Questions? Join our Discord server! https://discord.me/hassioaddons
Enjoying my add-ons? Consider supporting my work: https://patreon.com/frenck