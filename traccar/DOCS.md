# Home Assistant Community Add-on: Traccar

[Traccar][traccar] is a modern GPS Tracking Platform, which is now available
as an Hass.io add-on and allows you to run your GPS Tracking software
without any cloud.

Traccar supports more protocols and device models than any other GPS tracking
system on the market, straight from your Hass.io instance. You can select GPS
trackers from a variety of vendors from low-cost Chinese models to high-end
quality brands.

Traccar also has native mobile apps available for Android and iOS platforms
so that you can track those as well. AND! With the Home Assistant `traccar`
integration (introduced in 0.83) the data in Traccar will be sent back into
your Home Assistant instance as well.

## Installation

The installation of this add-on is pretty straightforward and not different in
comparison to installing any other Home Assistant add-on.

1. Ensure you have the [official "MariaDB" add-on][mariadb] installed and
   running!
1. Click the Home Assistant My button below to open the add-on on your Home
   Assistant instance.

   [![Open this add-on in your Home Assistant instance.][addon-badge]][addon]

1. Click the "Install" button to install the add-on.
1. Start the "Traccar" add-on
1. Check the logs of the "Traccar" add-on to see if everything went well.
1. Click the "OPEN WEB UI" button.

## Configuration

**Note**: _Remember to restart the add-on when the configuration is changed._

Example add-on configuration:

```yaml
log_level: info
ssl: true
certfile: fullchain.pem
keyfile: privkey.pem
```

**Note**: _This is just an example, don't copy and paste it! Create your own!_

### Option: `log_level`

The `log_level` option controls the level of log output by the addon and can
be changed to be more or less verbose, which might be useful when you are
dealing with an unknown issue. Possible values are:

- `trace`: Show every detail, like all called internal functions.
- `debug`: Shows detailed debug information.
- `info`: Normal (usually) interesting events.
- `warning`: Exceptional occurrences that are not errors.
- `error`: Runtime errors that do not require immediate action.
- `fatal`: Something went terribly wrong. Add-on becomes unusable.

Please note that each level automatically includes log messages from a
more severe level, e.g., `debug` also shows `info` messages. By default,
the `log_level` is set to `info`, which is the recommended setting unless
you are troubleshooting.

### Option: `ssl`

Enables/Disables SSL (HTTPS) on the web interface.
Set it `true` to enable it, `false` otherwise.

### Option: `certfile`

The certificate file to use for SSL.

**Note**: _The file MUST be stored in `/ssl/`, which is the default_

### Option: `keyfile`

The private key file to use for SSL.

**Note**: _The file MUST be stored in `/ssl/`, which is the default_

## Integrating into Home Assistant

The `traccar` integration of Home Assistant makes it possible to transfer all
assets tracked by Traccar to appear in Home Assistant as a tracked device.

Add the following snippet to your Home Assistant `configuration.yaml` file.

```yaml
device_tracker:
  - platform: traccar
    host: localhost
    port: 18682
    username: TRACCAR_EMAIL_ADDRESS
    password: TRACCAR_PASSWORD
```

Restart Home Assistant.

## Enabling more protocols

By default, this add-on has disabled most of the GPS protocols. This has
been done to reduce the number of open ports the add-on would create.

By default, only the OsmAnd protocol (used by the Traccar Apps) and the API
are enabled. If you want more protocols, you can do so, by adding entries
to your `traccar.xml` file in the add-on configuration folder.

A list if all entries can be found here:

<https://github.com/hassio-addons/addon-traccar/blob/main/traccar/rootfs/etc/traccar/traccar.xml#L22>

To find out which protocol your device uses, please refer to the Traccar
website: <https://www.traccar.org/devices/>

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

Copyright (c) 2018-2023 Franck Nijhof

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
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_traccar&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/addon-traccar/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-traccar/81407?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-traccar/issues
[mariadb]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=core_mariadb
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-traccar/releases
[semver]: https://semver.org/spec/v2.0.0.html
[traccar]: https://www.traccar.org
