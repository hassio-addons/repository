# Home Assistant Community App: MQTT IO

Exposes general purpose inputs and outputs (GPIO), hardware sensors and serial
devices to an MQTT server. Ideal for single-board computers such as
the Raspberry Pi.

## Installation

The installation of this app is pretty straightforward and not different in
comparison to installing any other Home Assistant app.

1. Click the Home Assistant My button below to open the app on your Home
   Assistant instance.

   [![Open this app in your Home Assistant instance.][addon-badge]][addon]

1. Click the "Install" button to install the app.
1. Set the location of the MQTT IO configuration file in the app options.
   By default, this will be `/config/mqtt-io/config.yml`.
1. Start the "MQTT IO" app. If the configuration file does not exist yet, a
   default one is created for you.
1. Add the modules and devices you want to expose to that file, and restart
   the app. For information about the format and configuration options,
   please consult the MQTT IO documentation:
   <https://mqtt-io.app/#/config/scenarios>
1. Check the logs of the "MQTT IO" app to see if everything went well.

## Configuration

**Note**: _Remember to restart the app when the configuration is changed._

Example app configuration:

```yaml
configuration_file: /config/mqtt-io/config.yml
log_level: info
```

**Note**: _This is just an example, don't copy and past it! Create your own!_

### Option: `configuration_file`

The `configuration_file` option allows you to configure the configuration
file MQTT IO will use to run. The default is `/config/mqtt-io/config.yml`,
but you change it to something else if you want.

`/config` here is this app's own configuration folder, not the Home Assistant
configuration folder. If you ran an older version of this app, your existing
configuration file is moved there for you the first time this version starts,
and the log says where it ended up. The Home Assistant configuration folder is
still available, as `/homeassistant`, should you want to keep the file there
instead.

For more information about the MQTT IO configuration file format, see:

<https://mqtt-io.app/#/config/scenarios> and <https://mqtt-io.app/#/config/ha_discovery>

If this file does not exist when the app starts, a default one is created
for you. It enables Home Assistant discovery but does not expose anything
yet, so you still need to add the modules and devices you want to use.

If that file does not set `mqtt: host:`, the app uses the MQTT server
provided by an MQTT broker app, like the Mosquitto broker, so you do not need
to repeat its address or credentials here. Set `mqtt: host:` yourself to use
any other MQTT server.

### Supported modules

The dependencies for the MQTT IO modules that work on the architectures this
app is built for are installed already, so they can be used straight from the
configuration file without anything extra.

Two of the modules MQTT IO offers cannot be used here. `adxl345` fails to
install on any current Python, and `as3935` needs a package that is not
published at all. A handful of GPIO modules for other boards, `beaglebone`,
`orangepi`, `sunxi` and `dockerpi`, are also left out, as they target hardware
this app is not built for.

### Option: `log_level`

The `log_level` option controls the level of log output by the app and can
be changed to be more or less verbose, which might be useful when you are
dealing with an unknown issue. Possible values are:

- `trace`: Show every detail, like all called internal functions.
- `debug`: Shows detailed debug information.
- `info`: Normal (usually) interesting events.
- `warning`: Exceptional occurrences that are not errors.
- `error`: Runtime errors that do not require immediate action.
- `fatal`: Something went terribly wrong. App becomes unusable.

Please note that each level automatically includes log messages from a
more severe level, e.g., `debug` also shows `info` messages. By default,
the `log_level` is set to `info`, which is the recommended setting unless
you are troubleshooting.

## Changelog & Releases

This repository keeps a change log using [GitHub's releases][releases]
functionality.

Releases are based on [Semantic Versioning][semver], and use the format
of `MAJOR.MINOR.PATCH`. In a nutshell, the version will be incremented
based on the following:

- `MAJOR`: Incompatible or major changes.
- `MINOR`: Backwards-compatible new features and enhancements.
- `PATCH`: Backwards-compatible bugfixes and package updates.

## Support

Got questions?

You have several options to get them answered:

- The [Home Assistant Community Apps Discord chat server][discord] for app
  support and feature requests.
- The [Home Assistant Discord chat server][discord-ha] for general Home
  Assistant discussions and questions.
- The Home Assistant [Community Forum][forum].
- Join the [Reddit subreddit][reddit] in [/r/homeassistant][reddit]

You could also [open an issue here][issue] GitHub.

## Authors & contributors

The original setup of this repository is by [Franck Nijhof][frenck].

For a full list of all authors and contributors,
check [the contributor's page][contributors].

## License

MIT License

Copyright (c) 2023-2026 Franck Nijhof

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_mqtt_io&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/app-mqtt-io/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/app-mqtt-io/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/app-mqtt-io/releases
[semver]: https://semver.org/spec/v2.0.0.html
