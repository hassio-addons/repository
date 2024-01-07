# Home Assistant Community Add-on: AirSonos

Apple devices use AirPlay to send audio to other devices, but this is not
compatible with Sonos players. This add-on tries to solve this
compatibility gap.

It detects Sonos players in your network and creates virtual AirPlay
devices for each of them. It acts as a bridge between the AirPlay client
and the real Sonos device.

Since Sonos uses UPnP, the add-on might also work for other UPnP players
(e.g., newer Samsung televisions).

The AirCast add-on is based on the excellent [AirConnect][airconnect] project.

## Installation

The installation of this add-on is pretty straightforward and not different in
comparison to installing any other Home Assistant add-on.

1. Click the Home Assistant My button below to open the add-on on your Home
   Assistant instance.

   [![Open this add-on in your Home Assistant instance.][addon-badge]][addon]

1. Click the "Install" button to install the add-on.
1. Start the "AirSonos" add-on
1. Check the logs of the "AirSonos" add-on to see if everything went well.

After ~30 seconds you should see some log messages appear in the add-on log.
Using your iOS/Mac/iTunes/Airfoil/other clients, you should now see new AirPlay
devices and can try to play audio to them.

## Configuration

**Note**: _Remember to restart the add-on when the configuration is changed._

Example add-on configuration:

```yaml
log_level: info
address: 192.168.1.234
port: 49152
latency_rtp: 1000
latency_http: 2000
drift: true
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
- `error`: Runtime errors that do not require immediate action.
- `fatal`: Something went terribly wrong. Add-on becomes unusable.

Please note that each level automatically includes log messages from a
more severe level, e.g., `debug` also shows `info` messages. By default,
the `log_level` is set to `info`, which is the recommended setting unless
you are troubleshooting.

These log level also affects the log levels of AirSonos server.

### Option: `address`

This option allows you to specify the IP address the AirSonos server needs to
bind to. It will automatically detect the interface to use when this option is
left empty. Nevertheless, it might get detected wrong (e.g., in case you have
multiple network interfaces).

### Option: `port`

The port the AirSonos server will expose itself on. The default `49152` should
be fine in most cases. Only change this if you really have to.

### Option: `latency_rtp`

Allows you to tweak the buffering, which is needed when the audio is stuttering
(e.g., low-quality network). This option specifies the number of ms the addon
has to buffer the RTP audio (AirPlay). Setting this value below 500ms is not
recommended!

### Option: `latency_http`

Allows you to tweak the buffering, which is needed when the audio is stuttering
(e.g., low-quality network). This option specifies the number of ms the addon
has to buffer the HTTP audio.

### Option: `drift`

Set to `true` to let timing reference drift (no click).

## Sonos hints and limitations

When a Sonos group is created, only the master of that group will appear as
an AirPlay player and others will be removed if they were already detected.
If the group is later split, then individual players will re-appear.
Each detection cycle takes ~30 seconds.

Volume is set for the whole group, but the same level applies to all members.
If you need to change individual volumes, you need to use a Sonos native
controller. **Note**: these will be overridden if the group volume is later
changed again from an AirPlay device.

## Latency options explained

These bridges receive real-time "synchronous" audio from the AirPlay controller
in the format of RTP frames and forward it to the Sonos player in an HTTP
"asynchronous" continuous audio binary format. In other words,
the AirPlay clients "push" the audio using RTP and the Sonos players
"pull" the audio using an HTTP GET request.

A player using HTTP to get its audio expects to receive an initial large
portion of audio as the response to its GET and this creates a large enough
buffer to handle most further network congestion/delays. The rest of the audio
transmission is regulated by the player using TCP flow control. However, when
the source is an AirPlay RTP device, there is no such significant portion of
audio available in advance to be sent to the Player, as the audio comes to the
bridge in real time. Every 8ms, an RTP frame is received and is immediately
forwarded as the continuation of the HTTP body. If the Sonos player
starts to play immediately the first received audio sample, expecting an initial
burst to follow, then any network congestion delaying RTP audio will starve
the player and create shuttering.

The `latency_http` option allows a certain amount of silence frames to be sent
to the Sonos player, in a burst at the beginning. Then, while this
"artificial" silence is being played, it is possible for the bridge to build
a buffer of RTP frames that will then hide network delays that might happen
in further RTP frames transmission. This delays the start of the playback
by `latency_http` ms.

However, RTP frames are transmitted using UDP, which means there is no guarantee
of delivery, so frames might be lost from time to time
(often happens on WiFi networks). To allow detection of lost frames, they are
numbered sequentially (1,2 ... n) so every time two received frames are not
consecutive, the missing ones can be asked again by the AirPlay receiver.

Typically, the bridge forwards immediately every RTP frame using HTTP and again,
in HTTP, the notion of frame numbers does not exist, it is just the continuous
binary audio. So it is not possible to send audio non-sequentially when using
HTTP.

For example, if received RTP frames are numbered 1,2,3,6, this bridge will
forward (once decoded and transformed into raw audio) 1,2,3 immediately using
HTTP but when it receives 6, it will re-ask for 4 and 5 to be resent and
hold 6 while waiting (if 6 was transmitted immediately, the Sonos
will play 1,2,3,6 ... not nice).

The `latency_rtp` option sets for how long frame 6 shall be held before adding
two silence frames for 4 and 5 and send sending 4,5,6. Obviously, if this delay
is larger than the buffer in the Sonos player, playback will stop by
lack of audio. Note that `latency_rtp` does not delay playback start.

> **Note**: `latency_rtp` and `latency_http` could have been merged into a
> single `latency` parameter which would have set the max RTP frames holding time
> as well as the duration of the initial additional silence (delay),
> however, all Sonos devices do properly their own buffering of HTTP audio
> (i.e., they wait until they have received a certain amount of audio before
> starting to play), then adding silence would have introduced an extra
> unnecessary delay in playback.

## Tweaking AirSonos

AirSonos creates a configuration file called `airsonos.xml` in the add-on
configuration directory. This file allows you to tweak each device
separately. Every time it finds a new device, it will be added to that file.

> **NOTE**: It is HIGHLY recommended to stop the addon before making changes
> to the configuration file manually.

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

Copyright (c) 2017-2024 Franck Nijhof

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
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_airsonos&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[airconnect]: https://github.com/philippe44/AirConnect
[commits]: https://github.com/hassio-addons/addon-airsonos/commits/main
[contributors]: https://github.com/hassio-addons/addon-airsonos/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-airsonos/36796?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-airsonos/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-airsonos/releases
[semver]: http://semver.org/spec/v2.0.0.htm
