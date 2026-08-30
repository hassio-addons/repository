# Home Assistant Community App: Jellyfin

[Jellyfin][jellyfin] is a media server. Point it at the folders holding your
films, series and music, and it works out what everything is, collects the
artwork and descriptions, and hands it all to whatever you want to watch on:
a browser, a phone, a tablet, a games console or a TV.

Nothing about it phones home. There is no account to make, no subscription and
no paid tier holding features back; the server on your own machine is the whole
product. This app runs that server next to Home Assistant, with its library
sitting in the same `media` folder the rest of your apps use.

## Installation

The installation of this app is pretty straightforward and not different in
comparison to installing any other Home Assistant app.

1. Click the Home Assistant My button below to open the app on your Home
   Assistant instance.

   [![Open this app in your Home Assistant instance.][addon-badge]][addon]

1. Click the "Install" button to install the app.
1. Start the "Jellyfin" app.
1. Check the logs of the "Jellyfin" app to see if everything went well.
1. Click the "OPEN WEB UI" button to open the Jellyfin web interface.

The first time it opens, Jellyfin asks a handful of questions: the language,
an account for yourself, and where your media is. That last one is the part
worth thinking about, and is covered below.

## Where your media goes

Jellyfin sees two folders from Home Assistant:

- `/media`, the same folder the media browser and apps like Sonarr, Radarr and
  qBittorrent use.
- `/share`, for anything you keep outside of it.

When the wizard asks you to add a library, pick the type first, then "Add" a
folder and browse to it: `/media/movies`, `/media/tv`, `/media/music`, or
whatever you have called yours. A library can hold several folders, so a series
collection spread over two disks can still be one library.

Anything already in `/media` is in reach the moment the app starts. Nothing has
to be copied or moved, and nothing changes on disk unless you ask Jellyfin to
write there.

**Note**: _Jellyfin is given write access to both folders. It only uses it if
you turn on something that writes, such as storing artwork and `.nfo` files
next to the media, or deleting an item from the interface._

## Logging in

Jellyfin has accounts of its own, one per person watching, each with their own
libraries, playback history and parental limits. That is why the sidebar panel
asks you to log in even though Home Assistant knows who you are: it has no way
to tell Jellyfin which of its users you are.

The login is remembered by the browser, so it is a once-per-browser affair
rather than something you meet daily.

## The Jellyfin apps

Browsers are the least of what Jellyfin can be watched on. There are apps for
Android, iOS, Android TV, Fire TV, Roku, Kodi and the web, and none of them can
reach this app through the sidebar; Ingress is for browsers that are already
logged in to Home Assistant.

That is what port `8096` is for, published by default. Point an app at the
address of your Home Assistant machine:

```txt
http://192.168.1.10:8096
```

Use the address of your Home Assistant instance, not the one above.

### Letting the apps find the server themselves

Most Jellyfin apps offer to search the network rather than have an address
typed in. That search is a broadcast on port `7359`, which this app does not
publish by default. Two things are needed for it to work:

1. Publish port `7359` (UDP) in the "Network" section of this app.
1. Tell Jellyfin the address it should hand back, under **Dashboard** >
   **Networking** > "Published server URIs":

   ```txt
   all=http://192.168.1.10:8096
   ```

Without the second step, an app that finds the server is sent to the address
this app has inside Home Assistant's own network, which no device on your
network can reach. Typing the address into the app once is a perfectly good
alternative, and one less thing exposed.

## Hardware acceleration

A film that a device cannot play directly is transcoded, and doing that in
software eats a processor for one viewer, let alone two. Jellyfin can hand that
work to the graphics chip instead, and this app ships the same patched FFmpeg
and drivers the Jellyfin project builds for exactly that.

It needs a graphics chip Home Assistant can see, which in practice means an
Intel or AMD one in an x86 machine, exposed as `/dev/dri`. This app is given
access to it automatically; there is nothing to configure on the Home Assistant
side.

To turn it on: **Dashboard** > **Playback** > "Hardware acceleration". Pick
"Video Acceleration API (VAAPI)" for AMD and older Intel chips, or "Intel
QuickSync (QSV)" for Intel, leave the device at `/dev/dri/renderD128`, and tick
the formats your hardware handles. Jellyfin's own [hardware acceleration
documentation][hwa] goes through what each chip can do.

**Note**: _NVIDIA cards are not supported here. They need drivers on the host,
which Home Assistant OS does not carry._

### HDR content

Playing an HDR film on a screen that cannot show it needs tone mapping, or the
picture comes out washed out and grey. On Intel, tick "Enable VPP tone mapping",
which the driver does on its own.

The other tone mapping option, the one built on OpenCL, needs a GPGPU runtime
that is not part of this app, and leaving it on without one only makes
playback fall back to software.

## Using it with Home Assistant

Home Assistant has a [Jellyfin integration][integration]. It adds every device
playing from your server as a media player, and puts the whole library in the
media browser, so a film can be started on the TV from a dashboard or an
automation.

1. Go to **Settings** > **Devices & Services** > **Add Integration** and pick
   **Jellyfin**.
1. Fill in the URL: `http://a0d7b954-jellyfin:8096`
1. Log in with a Jellyfin account. Make a separate one for it, under
   **Dashboard** > **Users**, rather than handing over your own.

**Note**: _Use this app's hostname rather than your Home Assistant IP address.
Both sit on the same internal network, so the traffic never has to leave the
machine, and nothing has to be published under "Network" for this to work._

Turning on [`ssl`](#option-ssl) does not change this address. Port `8096` stays
plain HTTP for exactly this kind of traffic, which never leaves the machine.

## Configuration

**Note**: _Remember to restart the app when the configuration is changed._

Example app configuration:

```yaml
log_level: info
ssl: true
certfile: fullchain.pem
keyfile: privkey.pem
```

**Note**: _This is just an example, don't copy and paste it! Create your own!_

Almost everything about Jellyfin is configured inside Jellyfin, in the
dashboard, and is kept across restarts and updates. The options below are the
few that have to be settled before it starts.

### Option: `log_level`

The `log_level` option controls the level of log output by the app and can be
changed to be more or less verbose, which might be useful when you are dealing
with an unknown issue. Possible values are:

- `trace`: Show every detail, like all called internal functions.
- `debug`: Shows detailed debug information.
- `info`: Normal (usually) interesting events.
- `notice`: Normal but significant events.
- `warning`: Exceptional occurrences that are not errors.
- `error`: Runtime errors that do not require immediate action.
- `fatal`: Something went terribly wrong. App becomes unusable.

Please note that each level automatically includes log messages from a more
severe level, e.g., `debug` also shows `info` messages. By default, the
`log_level` is set to `info`, which is the recommended setting unless you are
troubleshooting.

Jellyfin is set to the level that matches, so turning this up is how you get
more out of it as well. The same lines are written to `/config/log` inside this
app's configuration folder, which is where Jellyfin's own log downloads come
from.

### Option: `ssl`

Enables/Disables SSL (HTTPS) on the web interface. Set it `true` to enable it,
`false` otherwise.

**Note**: _This only applies to port `8920`. Port `8096` stays plain HTTP, and
the Ingress service is unaffected._

Jellyfin's own model is followed here: HTTP on `8096` and HTTPS on `8920`,
both at the same time. Publish only the one you want reachable.

Leave this off when something else in front of this app, such as the
[NGINX Proxy Manager app][nginx-proxy-manager], is already terminating TLS.

### Option: `certfile`

The certificate file to use for SSL.

**Note**: _The file MUST be stored in `/ssl/`, which is the default_

### Option: `keyfile`

The private key file to use for SSL.

**Note**: _The file MUST be stored in `/ssl/`, which is the default_

## Backups

This app is backed up cold, which means Home Assistant stops it for as long as
it takes to copy. Jellyfin writes to its database continuously, and a copy
taken halfway through a write comes back as a library that has lost track of
itself.

What lands in the backup is this app's configuration folder: the database with
your libraries, users, watch history and playlists, the settings, and the
artwork Jellyfin has collected. That artwork is the bulk of it, and it grows
with the library, so do not be surprised by the size of the backup of a large
one.

The cache is left out, which includes the scratch space transcoding uses, and
so is the log. Your media is not part of an app backup at all: it lives in
`/media` and `/share`, which Home Assistant backs up separately, if at all.

## Known quirks

- The sidebar panel asks for a Jellyfin login. Home Assistant knows who you
  are, Jellyfin does not, and it has its own users. See
  [Logging in](#logging-in).
- The server port under **Dashboard** > **Networking** is written by this app
  on every start, and so is the HTTPS switch next to it. NGINX is what listens
  on the ports this app publishes, and it hands the requests to Jellyfin on a
  port of its own; changing either of those inside Jellyfin only breaks the way
  in, and is undone at the next restart. Use [`ssl`](#option-ssl) for HTTPS.
- Jellyfin's logging configuration is written on every start as well, from
  [`log_level`](#option-log_level). Editing `logging.json` by hand does not
  survive a restart.
- An app that finds this server by searching the network is handed an address
  it cannot reach, until "Published server URIs" is filled in. See
  [Letting the apps find the server themselves](#letting-the-apps-find-the-server-themselves).
- DLNA needs a plugin as of Jellyfin 10.10, and a port this app does not
  publish. The Jellyfin apps and Chromecast cover the same ground.
- Tone mapping through OpenCL is not available; the Intel driver based one is.
  See [HDR content](#hdr-content).
- Restarting Jellyfin from its own dashboard restarts the server inside this
  app, without the app itself stopping. Home Assistant keeps showing it as
  running throughout, which is correct.

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

Copyright (c) 2026 Franck Nijhof

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
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_jellyfin&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/app-jellyfin/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/?u=frenck
[frenck]: https://github.com/frenck
[hwa]: https://jellyfin.org/docs/general/administration/hardware-acceleration/
[integration]: https://www.home-assistant.io/integrations/jellyfin/
[issue]: https://github.com/hassio-addons/app-jellyfin/issues
[jellyfin]: https://jellyfin.org
[nginx-proxy-manager]: https://github.com/hassio-addons/app-nginx-proxy-manager
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/app-jellyfin/releases
[semver]: https://semver.org/spec/v2.0.0.html
