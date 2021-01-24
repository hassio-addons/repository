# Home Assistant Community Add-on: motionEye

motionEye is a popular frontend to the camera software called motion. This
add-on provides both, allowing you to add your camera's to your Hass.io setup.

motionEye is Open Source CCTV and NVR, that is elegant and really easy to use.
It can be used as a Baby Monitor, Construction Site Montage Viewer,
Store Camera DVR, Garden Security, and much more.

Some cool features of motionEye:

- Support for a ridiculous amount of cameras, including IP cams.
- Add multiple cameras by hooking up multiple motionEye instances together.
  For example, by using MotionEyeOS on a Pi Zero + Pi camera in your network.
- Supports uploading recording into Google Drive and Dropbox.
- motion detection, including email notification and scheduling.
- Can record continuously, motion, or timelapse, with retention settings.
- Supports "[action buttons][motioneye-wiki-action-buttons]" within the configuration.

## Installation

The installation of this add-on is pretty straightforward and not different in
comparison to installing any other Home Assistant add-on.

1. Search for the "motionEye" add-on in the Supervisor add-on store and
   install it.
1. Start the "motionEye" add-on
1. Check the logs of the "motionEye" add-on to see if everything went well.
1. Click the "OPEN WEB UI" button to open the web interface
1. Login with username "admin", without a password.
1. Edit your admin account with a secure password!

## Configuration

**Note**: _Remember to restart the add-on when the configuration is changed._

Example add-on configuration:

```yaml
log_level: info
ssl: true
certfile: mycertfile.pem
keyfile: mykeyfile.pem
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

### Option: `motion_webcontrol`

Enables the motion webcontrol endpoint running on port `7999`.

:warning: MotionEye HTTP webcontrol **DOES NOT** support authentication
and **DOES NOT** support SSL! Enable this **ONLY** when you know what
you are doing! **NEVER, EVER** expose this port to the outside world!

### Option: `ssl`

Enables/Disables SSL (HTTPS) on the web interface of motionEye. Set it `true`
to enable it, `false` otherwise.

### Option: `certfile`

The certificate file to use for SSL.

**Note**: _The file MUST be stored in `/ssl/`, which is the default_

### Option: `keyfile`

The private key file to use for SSL.

**Note**: _The file MUST be stored in `/ssl/`, which is the default_

### Option: `action_buttons`

If configured, a script will be created to implement an [action button][motioneye-wiki-action-buttons].

Example action buttons configuration:

```yaml
action_buttons:
  - type: light_on
    camera: 1
    command: "curl -s 192.168.1.1/index.html?light=ON > /dev/null"
  - type: light_off
    camera: 1
    command: "curl -s 192.168.1.1/index.html?light=OFF > /dev/null"
```

#### Sub-option: `action_buttons.type`

Type of action button. Acceptable types are:

- `lock` and `unlock`.
- `light_on` and `light_off`.
- `alarm_on` and `alarm_off`.
- `up`, `right`, `down`, and `left`.
- `zoom_in` and `zoom_out`.
- `preset1` to `preset9`.

#### Sub-option: `action_buttons.camera`

The camera identification number. Corresponds to the camera number as set up
within the motionEye UI.

#### Sub-option: `action_buttons.command`

The bash shell command to be executed when the button is pressed.

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

Copyright (c) 2018-2021 Franck Nijhof

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

[contributors]: https://github.com/hassio-addons/addon-motioneye/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[dockerhub]: https://hub.docker.com/r/hassioaddons/motioneye
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-motioneye/71826?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-motioneye/issues
[motioneye-wiki-action-buttons]: https://github.com/ccrisan/motioneye/wiki/Action-Buttons
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-motioneye/releases
[semver]: http://semver.org/spec/v2.0.0.htm
