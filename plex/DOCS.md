# Home Assistant Community Add-on: Plex Media Server

The plex add-on brings your favorite media together in one place, making it
beautiful and easy to enjoy. The Plex Media Server provided by this addon,
organizes your personal video, music, and photo collections
and streams them to all of your devices.

## Installation

The installation of this add-on is pretty straightforward and not different in
comparison to installing any other Home Assistant add-on.

1. Search for the “Plex Media Server” add-on in the Hass.io 166 add-on store
   and install it.
1. Surf to <https://www.plex.tv/claim> and get your claim token.
1. Update the add-on config with the claim code you've got in the previous step.
1. Save the add-on configuration.
1. Start the "Plex Media Server" add-on.
1. Check the logs of the "Plex Media Server" to see if everything went well.
1. Login to the Plex admin interface and complete the setup process.

**NOTE**: When adding media locations, please use `/share` as the base
directory.

## Configuration

**Note**: _Remember to restart the add-on when the configuration is changed._

Example add-on configuration:

```yaml
log_level: info
claim_code: claim-cAMrqFrenckFU4x445Tn
webtools: true
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
- `error`:  Runtime errors that do not require immediate action.
- `fatal`: Something went terribly wrong. Add-on becomes unusable.

Please note that each level automatically includes log messages from a
more severe level, e.g., `debug` also shows `info` messages. By default,
the `log_level` is set to `info`, which is the recommended setting unless
you are troubleshooting.

### Option: `claim_code`

To allow your server to sign-in to your Plex account, it needs a so-called
"Claim Code". Sign-ing into Plex allows Plex to locate and connect to
your server and unlocks all kinds of features as well.

In order to get your code surf to <https://www.plex.tv/claim>.

This code is only used once by the add-on. As soon as the
server is successfully authenticated with Plex, the code may be removed.

### Option: `webtools`

[WebTools][webtools] is a plug-in that contains a collection of tools
for the Plex Media Server.

Some of the tools:

- Manage Subs (Subtitles)
- Logs (PMS)
- UAS (Unsupported App Store)
- FindMedia
- PlayLists
- TechInfo

The plugin also allows you to add and install custom plugins.

Set this variable to `true` to enable it.

## Solving connection issues with Plex

Plex is pretty straightforward and pretty easy to set up. Most of the
settings are detected automatically. Nevertheless, it fails to recognize
its IP on your home network. This may cause connection issues with some
Plex apps, e.g., the Samsung Tizen Plex app.

This is not Plex its fault but is because of the Docker ecosystem, in
which this add-on runs. Luckily, there is an option in Plex to help
with that, but it is a little hidden.

- Login to the Plex web interface.
- Goto setting.
- Click the server tab.
- On the left side, choose "Network".
- Be sure you are looking at the advanced view.
  There is a button "Show Advanced" in the top right.
- Add your custom URLs to "Custom server access URLs" field.

The custom URLs are additional URLs Plex clients will use to try to connect
to Plex. You can list multiple if you'd like, separated by a comma.

Example:

```txt
http://hassio.local:32400,http://192.168.1.88:32400,http://mydomain.duckdns.org:32400
```

## Port 1900 add-on conflicts

Plex Media server uses port `1900` for access to the Plex DLNA Server. This port
is also used by multiple other add-ons, like the AirSonos and UniFi add-ons.

In case they conflict, the Plex Media Server add-on will fail to start.
The following error message is shown in the Hass.io system log:

```txt
[hassio.docker] Can't start addon_40817795_plex: 500 Server Error:
Internal Server Error ("driver failed programming external connectivity
on endpoint addon_40817795_plex):
Error starting userland proxy: listen udp 0.0.0.0:1900:
bind: address already in use
```

You have two choices:

- Disable or remove the conflicting add-on
- Change the port number 1900 to something else.

The last option will cause you to lose the DLNA capabilities of the
Plex Media Server.

## Known issues and limitations

- This add-on does support ARM-based devices, nevertheless, they must
  at least be an ARMv7 device. (Raspberry Pi 1 and Zero is not supported).
- This add-on will be able to run on a Raspberry Pi. While it still can be
  useful, don't expect too much. In general, the Pi lacks the processing power
  and is probably not able to stream your media; therefore it is not
  recommended using this add-on on such a device.
- This add-on cannot add/mount any additional USB or other devices for you.
  This is a Hass.io limitation. In case you'd like to use extra devices,
  you'll have to modify the host system yourself and is not supported by the
  Hass.io or Community add-ons team.
- A Plex Pass gives you exclusive access to new features, which are
  available through a Beta version channel of the media server. At this
  time, running this "Beta" version, is not supported by this add-on.

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

[contributors]: https://github.com/hassio-addons/addon-plex/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-plex-media-server/54383?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-plex/issues
[keepchangelog]: http://keepachangelog.com/en/1.0.0/
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-plex/releases
[semver]: http://semver.org/spec/v2.0.0.htm
[webtools]: https://github.com/ukdtom/WebTools.bundle/wiki
