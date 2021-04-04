# Home Assistant Community Add-on: Android Debug Bridge

The Android Debug Bridge (ADB) is a client-server program used in Android
application development. This add-on provides the server program and can be
used to get full local control over your Android (TV) devices.

## Deprecation warning

**This add-on is in a deprecated state!**

This add-on was created at the time, that the best solution for communicating
with an Android device from Home Assistant, was using an Android Debug Bridge.

However, the time has changed. Right now, the Home Assistant project recommends
using built-in Python implementation, which renders this add-on obsolete.

Additionally, this add-on will become problematic to maintain in the future,
as the packages used are stalled.

Therefore, this add-on is now deprecated.

## Installation

The installation of this add-on is pretty straightforward and not different in
comparison to installing any other Home Assistant add-on.

1. Search for the "ADB - Android Debug Bridge" add-on
   in the Supervisor add-on store and install it.
1. Ensure that your Android device has [developer mode and network debugging](#enabling-developer-mode-on-your-device)
   enabled.
1. Add the IP addresses of your device(s) to the add-on configuration.
1. Start the "ADB - Android Debug Bridge" add-on.
1. Check the logs of the add-on to see if everything went well.
1. Ready to go!

## Configuration

**Note**: _Remember to restart the add-on when the configuration is changed._

Example add-on configuration, with all available options:

```yaml
log_level: info
devices:
  - 192.168.1.123
  - 192.168.1.100
reconnect_timeout: 90
keys_path: "/config/.androidkeys"
```

**Note**: _This is just an example, don't copy and paste it! Create your own!_

### Option: `devices`

Allows you to provide a list of IP addresses (or hostnames) of devices to
which the ADB server program connects.

### Option: `reconnect_timeout`

The add-on will try to (re)connect to the listed devices after this timeout
has passed. In case one of your devices goes offline and comes back online again
the add-on will connect to it within this time setting.

The default is 90 seconds.

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

### Option: `keys_path`

Allows you to provide a custom path to where the private/public key pair is
stored. This option is not listed by default and completely optional.
If you omit this option, the add-on will generate
and store a key pair for you internally.

If the provided directory is empty, the add-on will create
a new (fresh) key pair in the specified location.
You can also provide your own key pair, which **must** be named
`adbkey` and `adbkey.pub` (and stored in the specified location).

The `keys_path` path must be in either `/ssl`, `/config` or `/share`, subfolders
are allowed (e.g., `/config/adb/mykeys`).

## Enabling developer mode on your device

Your device must be running in developer & network debugging mode,
to allow this add-on to connect.

To do this, follow these steps on your Android TV device:

1. Press Home and go into Settings.
1. Select and press "About" from the Settings menu.
1. Scroll down to the "Build" information.
1. Select and click on "Build" several times (6-10 times).
1. A dialog appears, saying: "You are now a developer".
1. Press Home and go into Settings again.
1. Select and press "System Preferences" from the Settings menu.
1. Select and press "Developer options".
1. Scroll down to "Debugging".
1. Turn on "Network debugging".
1. Done!

Not all devices have the same procedure, so for your device, it might
differ a bit. A quick search on Google would probably lead you towards
a specific solution for your device.

## Integrating into Home Assistant

This ADB add-on can be used with all Android-based devices, using the
[`androidtv`][androidtv] integration.

This is an example using an NVidia Shield with the ADB add-on:

```yaml
# Example configuration.yaml entry
# Based on adding my NVidia Shield, which has IP 192.168.1.34.
media_player:
  - platform: androidtv
    host: 192.168.1.34
    name: "NVidia Shield"
    adb_server_ip: 127.0.0.1
    adb_server_port: 5037
```

## Useful tips and tricks

- There is a Chrome Extention/App called "ADB Chrome", which can connect
  to this add-on and actually sideload apps as well!
- Using the `androidtv` integration, you can send intents via
  the `androidtv.adb_command` service.
- For more information, see the [Android TV documentation][androidtv-docs].
- For examples, see [@McFrojd's Gist][mcfrojd] with useful intents and
  lovelace example for a Nvidia Shield Remote.

## Known issues and limitations

- This add-on does support ARM-based devices, nevertheless, they must
  at least be an ARMv7 device. (Raspberry Pi 1 and Zero is not supported).

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

Copyright (c) 2019-2021 Franck Nijhof

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

[androidtv-docs]: https://www.home-assistant.io/integrations/androidtv#androidtvadb_command
[androidtv]: https://www.home-assistant.io/integrations/androidtv/
[contributors]: https://github.com/hassio-addons/addon-adb/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-ons-adb-android-debug-bridge/96375?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-adb/issues
[mcfrojd]: https://gist.github.com/mcfrojd/9e6875e1db5c089b1e3ddeb7dba0f304
[reddit]: https://reddit.com/r/homeassistant
[semver]: http://semver.org/spec/v2.0.0.htm
[releases]: https://github.com/hassio-addons/addon-adb/releases
