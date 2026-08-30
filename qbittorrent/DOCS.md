# Home Assistant Community App: qBittorrent

[qBittorrent][qbittorrent] is a BitTorrent client that does the job without
asking for anything in return. No advertising, no bundled extras and no
account: it is the open source client people move to when they want the
features of the big ones and none of the rest.

This app runs the headless build, so what you get is the web interface. It
handles the things a long running client needs: a queue with limits, categories
and tags that decide where files land, RSS feeds that download new episodes on
their own, scheduling so the upload does not fight the rest of the house for
bandwidth, and a full API for anything else.

## Installation

The installation of this app is pretty straightforward and not different in
comparison to installing any other Home Assistant app.

1. Click the Home Assistant My button below to open the app on your Home
   Assistant instance.

   [![Open this app in your Home Assistant instance.][addon-badge]][addon]

1. Click the "Install" button to install the app.
1. Start the "qBittorrent" app.
1. Check the logs of the "qBittorrent" app to see if everything went well.
1. Click the "OPEN WEB UI" button to open the qBittorrent web interface.

## Where downloads go

On the first start this app creates two folders and points qBittorrent at
them:

- `/media/qbittorrent/completed` for finished downloads.
- `/media/qbittorrent/incomplete` for everything still running.

Both are in the `media` folder, which means the files show up in Home
Assistant's media browser and are reachable from the other apps that map it,
such as the Sonarr, Radarr and Lidarr apps.

Downloading straight into the completed folder is the other common way to run
this, and switching the incomplete folder off in qBittorrent's own options is
all that takes. Keeping them apart means a half finished file never appears
next to the finished ones, at the cost of a move when a torrent completes.

These are starting values only. Where a torrent is saved is settled in
qBittorrent from here on, per torrent or per category, and this app does not
touch the setting again.

## Logging in

How you reach this app decides whether it asks for a password.

Opening it from the sidebar goes through Home Assistant's Ingress, which has
already established who you are, and qBittorrent is configured to let those
requests through without a second login. That is the path most people will
only ever use, and it needs nothing set up.

The published port is a different matter. Anything arriving there is asked for
a username and a password, because Home Assistant is not standing in front of
it. Until you set one, qBittorrent makes up a temporary password on every start
and writes it to this app's log:

```txt
The WebUI administrator username is: admin
The WebUI administrator password was not set. A temporary password is provided
for this session: ntxSucCbL
```

That password lasts until the app restarts, which makes it fine for getting in
once and useless for anything lasting. Set a real one from the sidebar, where
you are already logged in: **Tools** > **Options** > **Web UI**, then fill in
the username and password under "Authentication".

You need a password for the [Home Assistant integration](#using-it-with-home-assistant)
and for [direct access](#direct-access). If you use neither, you can leave it
alone and work from the sidebar.

## Incoming connections

BitTorrent works best when other clients can start a connection to you rather
than only the other way around. This app publishes port `6881`, TCP and UDP,
for exactly that.

Forward both on your router to the machine running Home Assistant. Without it
you can still download, because you can reach anybody who did forward a port,
but you are invisible to everyone else and both speeds and the ratio suffer for
it. UDP matters as much as TCP here: the distributed hash table and peer
exchange, which find peers when a tracker is unreachable, both run over it.

Keep the port on the outside the same as the one inside. qBittorrent tells
trackers and peers which port it is listening on, and it knows the container's
`6881` rather than whatever the router or the "Network" section was changed to,
so a mismatch advertises a port nobody can reach.

## Using it with Home Assistant

The [qBittorrent integration][integration] brings the download and upload
speeds, the torrent counts and the connection status into Home Assistant as
sensors.

1. Set a WebUI username and password first, as described in
   [Logging in](#logging-in). The integration cannot use the Ingress path and
   has to log in like any other client.
1. Go to **Settings** > **Devices & Services** > **Add Integration** and pick
   **qBittorrent**.
1. Fill in:

   - URL: `http://a0d7b954-qbittorrent:8080`
   - Username and password: _the ones you just set_

**Note**: _Use this app's hostname rather than your Home Assistant IP address.
Both sit on the same internal network, so the traffic never has to leave the
machine, and nothing has to be exposed under "Network" for this to work._

Turning on [`ssl`](#option-ssl) means this address becomes `https://`, against
a certificate that will not match this app's internal hostname, so "Verify SSL
certificate" has to come off for it.

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

Almost everything about qBittorrent is configured inside qBittorrent, under
**Tools** > **Options**, and is kept across restarts and updates. The options
below are the few that have to be settled before it starts.

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

This covers the app's own startup messages. qBittorrent does not take a log
level; its execution log is filtered in the web interface, under the "Log"
view, where each kind of message can be switched on and off.

### Option: `ssl`

Enables/Disables SSL (HTTPS) on the web interface. Set it `true` to enable it,
`false` otherwise.

**Note**: _The SSL settings only apply to [direct access](#direct-access) and
have no effect on the Ingress service._

Leave this off when something else in front of this app, such as the
[NGINX Proxy Manager app][nginx-proxy-manager], is already terminating TLS.

### Option: `certfile`

The certificate file to use for SSL.

**Note**: _The file MUST be stored in `/ssl/`, which is the default_

### Option: `keyfile`

The private key file to use for SSL.

**Note**: _The file MUST be stored in `/ssl/`, which is the default_

## Direct access

By default the web interface is only reachable through Home Assistant's
Ingress, in a panel on the sidebar, and nothing is exposed to your network.

Set a port for "Web interface & API" in the "Network" section of the app
configuration to expose it. You need this for anything that is not a browser
sitting in front of Home Assistant: a torrent client app on a phone, a reverse
proxy of your own, or a script talking to the API.

You do **not** need it for the [Home Assistant integration](#using-it-with-home-assistant),
which reaches this app over the internal network whether the port is published
or not.

That port has qBittorrent's own login in front of it, so
[set a password](#logging-in) before publishing it, and turn on
[`ssl`](#option-ssl) if you expose it to anything you do not trust.

## Search

qBittorrent can search torrent sites from the "Search" tab, through plugins it
downloads and runs itself. Python is part of this app for that reason, so the
tab works out of the box; the plugins themselves are installed from inside
qBittorrent and are not something this app ships or maintains.

## Backups

This app is backed up cold, which means Home Assistant stops it for the moment
it takes to copy the settings. qBittorrent writes its state continuously, and a
copy taken mid-write can come back as a torrent list that has lost track of
where its files are.

What lands in the backup is the configuration folder: the settings, the torrent
list, the categories and the resume data that lets a download carry on where it
left off. The downloads themselves are in the `media` folder, which is not part
of an app backup, so a restore brings back a client that knows about the
torrents and expects the files to still be where it left them.

## Known quirks

- The first start writes a temporary password to the log, and makes a new one
  on every restart until you set your own. See [Logging in](#logging-in).
- The sidebar panel never asks for a login. That is deliberate: Home Assistant
  has already established who you are before the request arrives. The published
  port is what the password guards.
- "Bypass authentication for clients on localhost", under **Tools** >
  **Options** > **Web UI**, is written by this app on every start, so turning
  it off inside qBittorrent lasts only until the next restart. It is what lets
  the sidebar panel open without a login, and switching it off leaves the panel
  asking for a password nobody has set.
- The web interface port and the incoming port are written by this app on every
  start as well, for the same reason: `8080` is what this app proxies the
  sidebar panel to, and `6881` is what the container publishes. Changing the
  web interface port inside qBittorrent breaks the panel straight away, and is
  undone at the next restart.
- Changing the host side of port `6881` in the "Network" section does not
  change the port qBittorrent tells peers about. See
  [Incoming connections](#incoming-connections).
- qBittorrent's own file logging is switched off, since every line of it is
  already in this app's log.
- Torrents added by the [Home Assistant integration][integration] are not a
  thing; it reads status and does not add downloads. Use the web interface, the
  API or an app like Sonarr or Radarr for that.

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
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_qbittorrent&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/app-qbittorrent/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/?u=frenck
[frenck]: https://github.com/frenck
[integration]: https://www.home-assistant.io/integrations/qbittorrent/
[issue]: https://github.com/hassio-addons/app-qbittorrent/issues
[nginx-proxy-manager]: https://github.com/hassio-addons/app-nginx-proxy-manager
[qbittorrent]: https://www.qbittorrent.org/
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/app-qbittorrent/releases
[semver]: https://semver.org/spec/v2.0.0.html
