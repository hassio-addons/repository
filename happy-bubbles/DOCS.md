# Home Assistant Community Add-on: Happy Bubbles

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

## Installation

The installation of this add-on is pretty straightforward and not different in
comparison to installing any other Home Assistant add-on.

1. Search for the “Happy Bubbles” add-on in the Hass.io 166 add-on store
   and install it.
1. Start the "Happy Bubbles" add-on
1. Check the logs of the "Happy Bubbles" add-on to see if everything went well.

## Configuration

**Note**: _Remember to restart the add-on when the configuration is changed._

Example add-on configuration:

```yaml
log_level: info
ssl: false
certfile: fullchain.pem
keyfile: privkey.pem
mqtt_host: homeassistant
mqtt_port: 1883
mqtt_client_id: happy_bubbles
mqtt_username: happybubbles
mqtt_password: dontworrybehappy

```

**Note**: _This is just an example, don't copy and past it! Create your own!_

### Option: `log_level`

The `log_level` option controls the level of log output by the addon and can
be changed to be more or less verbose, which might be useful when you are
dealing with an unknown issue. Possible values are:

- `trace`: Show every detail, like all called internal functions.
- `debug`: Shows detailed debug information.
- `info`: Normal (usually) interesting events.
- `warning`: Exceptional occurrences that are not errors.
- `error`:  Runtime errors that do not require immediate action.
- `fatal`: Something went terribly wrong. Add-on becomes unusable.

Please note that each level automatically includes log messages from a
more severe level, e.g., `debug` also shows `info` messages. By default,
the `log_level` is set to `info`, which is the recommended setting unless
you are troubleshooting.

### Option: `ssl`

Enables/Disables SSL (HTTPS) on the web interface.
Set it `true` to enable it, `false` otherwise.

**Note**: _The SSL settings only apply to direct access and has no effect
on the Ingress service._

### Option: `certfile`

The certificate file to use for SSL.

**Note**: _The file MUST be stored in `/ssl/`, which is the default_

### Option: `keyfile`

The private key file to use for SSL.

**Note**: _The file MUST be stored in `/ssl/`, which is the default_

### Option: `mqtt_host`

The hostname or IP of the MQTT server to connect to.

**Note**: _If you are using the core MQTT add-on, `homeassistant` should work
out of the box._

### Option: `mqtt_port`

The port to connect to on the MQTT server, which normally is `1883`.

### Option: `mqtt_client_id`

The MQTT client ID of the Happy Bubbles presence server.

**Note**: _This option support secrets, e.g., `!secret client_id`._

### Option: `mqtt_username`

The username to use when connecting to the MQTT server.

**Note**: _This option support secrets, e.g., `!secret mqtt_username`._

### Option: `mqtt_password`

The password to use when connecting to the MQTT server.

**Note**: _This option support secrets, e.g., `!secret mqtt_password`._

## Embedding into Home Assistant

It is possible to embed the Happy Bubbles interface directly into
Home Assistant, allowing you to access it through the Home Assistant frontend.

Home Assistant provides the `panel_iframe` integration, for these purposes.

Example configuration:

```yaml
panel_iframe:
  happybubbles:
    title: Happy Bubbles
    icon: mdi:bluetooth
    url: http://addres.to.your.hass.io:5555
```

## Changelog & Releases

This repository keeps a change log using [GitHub's releases][releases]
functionality. The format of the log is based on
[Keep a Changelog][keepchangelog].

Releases are based on [Semantic Versioning][semver], and use the format
of ``MAJOR.MINOR.PATCH``. In a nutshell, the version will be incremented
based on the following:

- ``MAJOR``: Incompatible or major changes.
- ``MINOR``: Backwards-compatible new features and enhancements.
- ``PATCH``: Backwards-compatible bugfixes and package updates.

## Support

Got questions?

You have several options to get them answered:

- The [Home Assistant Community Add-ons Discord chat server][discord] for add-on
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

Copyright (c) 2018-2020 Franck Nijhof

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

[contributors]: https://github.com/hassio-addons/addon-happy-bubbles/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-happy-bubbles/53511?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-happy-bubbles/issues
[keepchangelog]: http://keepachangelog.com/en/1.0.0/
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-happy-bubbles/releases
[semver]: http://semver.org/spec/v2.0.0.htm
