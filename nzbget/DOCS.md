# Home Assistant Community App: NZBGet

[NZBGet][nzbget] is a Usenet downloader built around doing the work with as
little as it can. It was written in C++ for hardware that had nothing to spare,
and on anything larger that turns into downloads which fill the line while the
rest of the machine carries on as if nothing were happening.

Handing it an nzb file is the whole job: it fetches the articles, checks them
against the par2 files that came with them and repairs whatever arrived
damaged, unpacks the archives, and passes the result to whatever you want run
afterwards. Categories decide where things end up, RSS feeds pull in new items
on their own, and there is a JSON-RPC API for everything else.

## Installation

The installation of this app is pretty straightforward and not different in
comparison to installing any other Home Assistant app.

1. Click the Home Assistant My button below to open the app on your Home
   Assistant instance.

   [![Open this app in your Home Assistant instance.][addon-badge]][addon]

1. Click the "Install" button to install the app.
1. Start the "NZBGet" app.
1. Check the logs of the "NZBGet" app to see if everything went well.
1. Click the "OPEN WEB UI" button to open the NZBGet web interface.

## Adding a news server

NZBGet does nothing until it knows where to download from, and it says so in
the log on every start until it does:

```txt
[ERROR] No servers are configured
```

A Usenet provider is a separate subscription, and not something this app can
supply. Once you have one, open the panel from the sidebar and go to
**Settings** > **NEWS-SERVERS**. Fill in the host, port, username, password and
connection count your provider gave you, turn on encryption if they offer it,
which they almost certainly do, and press "Test connection" before saving.

Providers hand out a "block account" alongside the main one often enough that
it is worth knowing NZBGet takes several servers, each with its own level. A
server on level 1 is only used to fill in what the level 0 servers could not
deliver, which is what a block account is for.

## Where downloads go

On the first start this app creates two folders and points NZBGet at them:

- `/media/nzbget/completed` for finished downloads.
- `/media/nzbget/intermediate` for everything still running.

Both are in the `media` folder, which means the files show up in Home
Assistant's media browser and are reachable from the other apps that map it,
such as the Sonarr, Radarr and Lidarr apps.

Downloading straight into the completed folder is the other common way to run
this, and clearing the intermediate folder in NZBGet's own settings is all that
takes. Keeping them apart means a half finished download never appears next to
the finished ones, and it lets the unpack read from one folder and write to
another, at the cost of a move when a download completes.

These are starting values only. Where things are saved is settled inside
NZBGet from here on, per category if you want, and this app does not touch the
setting again.

## Logging in

How you reach this app decides whether it asks for a password.

Opening it from the sidebar goes through Home Assistant's Ingress, which has
already established who you are, and NZBGet is configured to let those requests
through without a second login. That is the path most people will only ever
use, and it needs nothing set up.

The published port is a different matter. Anything arriving there is asked for
a username and a password, because Home Assistant is not standing in front of
it. NZBGet ships with the same password for everybody, so this app replaces it
on the first start with one of its own and writes it to the log:

```txt
A password has been generated for the web interface:

  Username: nzbget
  Password: hUn3EGwbtYPxq0KZUCiQSHrM
```

This one is not a temporary password: it is written into NZBGet's configuration
and stays until you change it. You can look it up and change it at any time
from the sidebar panel, where you are already logged in: **Settings** >
**SECURITY**, under `ControlUsername` and `ControlPassword`.

You need it for the [Home Assistant integration](#using-it-with-home-assistant)
and for [direct access](#direct-access). If you use neither, you can leave it
alone and work from the sidebar.

## Using it with Home Assistant

The [NZBGet integration][integration] brings the download rate, the size of the
queue and the amount downloaded into Home Assistant as sensors, and adds
services to pause and resume the queue and to set a speed limit.

1. Look up the username and password first, as described in
   [Logging in](#logging-in). The integration cannot use the Ingress path and
   has to log in like any other client.
1. Go to **Settings** > **Devices & Services** > **Add Integration** and pick
   **NZBGet**.
1. Fill in:

   - Host: `a0d7b954-nzbget`
   - Port: `6789`
   - Username and password: _the ones from the log_
   - SSL: _off_

**Note**: _Use this app's hostname rather than your Home Assistant IP address.
Both sit on the same internal network, so the traffic never has to leave the
machine, and nothing has to be exposed under "Network" for this to work._

## Configuration

**Note**: _Remember to restart the app when the configuration is changed._

Example app configuration:

```yaml
log_level: info
```

**Note**: _This is just an example, don't copy and paste it! Create your own!_

Almost everything about NZBGet is configured inside NZBGet, under
**Settings**, and is kept across restarts and updates. The one option below is
what has to be settled before it starts.

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

NZBGet's own messages follow this as well. It does not take a single threshold
of its own; it decides per severity where a message goes, so this option is
spread over those five settings. `info` leaves it where a stock NZBGet has it,
`debug` adds the per download detail lines, and `warning` and above quiet it
down. What passes is what fills the "Messages" view in the web interface, so
turning this down empties that view as well.

## Direct access

By default the web interface is only reachable through Home Assistant's
Ingress, in a panel on the sidebar, and nothing is exposed to your network.

Set a port for "Web interface & API" in the "Network" section of the app
configuration to expose it. You need this for anything that is not a browser
sitting in front of Home Assistant: a Usenet app on a phone, a reverse proxy of
your own, or a script talking to the API.

You do **not** need it for the [Home Assistant integration](#using-it-with-home-assistant),
which reaches this app over the internal network whether the port is published
or not.

That port has NZBGet's own login in front of it, so know
[what the password is](#logging-in) before publishing it. There is no HTTPS
option here: NZBGet does not serve TLS on the same port as plain HTTP but on a
second one, which this app does not publish, so `SecureControl` is held off. If
you need TLS in front of this app, put something that terminates it there, such
as the [NGINX Proxy Manager app][nginx-proxy-manager].

## Extension scripts

NZBGet can run scripts of its own at various points, most usefully after a
download finishes, and this app keeps them in `scripts` inside its
configuration folder. Anything you drop there shows up under **Settings** >
**EXTENSION SCRIPTS** once you press "Reload" in the web interface.

Python 3, `unrar` and 7-Zip are all in this app, so the common scripts and the
unpacking they build on work without anything else being installed. The scripts
themselves are yours to add and to maintain; this app does not ship any.

## Backups

This app is backed up cold, which means Home Assistant stops it for the moment
it takes to copy the settings. NZBGet writes its queue and history as it goes,
and a copy taken mid-write can come back as a queue that has lost track of what
it was doing.

What lands in the backup is the configuration folder: the settings, the queue,
the history, the RSS feed state and the statistics. The downloads themselves
are in the `media` folder, which is not part of an app backup, so a restore
brings back a downloader that knows about its queue and expects the files to
still be where it left them.

## Known quirks

- The log says "No servers are configured" until you add one, and nothing will
  download before that. See [Adding a news server](#adding-a-news-server).
- The sidebar panel never asks for a login. That is deliberate: Home Assistant
  has already established who you are before the request arrives. The published
  port is what the password guards.
- Some of what the settings screen shows is written by this app on every start,
  so changing those values there lasts only until the next restart. It covers
  where NZBGet keeps its own files, the control port and the address allowed in
  without a login, whether HTTPS is served, and where log messages go. Each of
  those has to keep matching the container around it: `6789` is what the
  sidebar panel is proxied to and what the port in the "Network" section
  publishes, loopback without a login is what lets that panel open, and the
  paths are what keeps NZBGet's state inside the backup and its program files
  out of it.
- Everything else in the settings screen is yours, including where downloads go
  and the unpack commands, which are left editable because extra switches are
  the reason NZBGet takes commands there rather than paths.
- NZBGet's own log file is switched off, since every line of it is already in
  this app's log, and a second copy would sit in the configuration folder and
  go into every backup with it.
- NZBGet checks for its own updates by default. That is switched off here;
  updates arrive as updates to this app.

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
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_nzbget&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/app-nzbget/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/?u=frenck
[frenck]: https://github.com/frenck
[integration]: https://www.home-assistant.io/integrations/nzbget/
[issue]: https://github.com/hassio-addons/app-nzbget/issues
[nginx-proxy-manager]: https://github.com/hassio-addons/app-nginx-proxy-manager
[nzbget]: https://nzbget.com/
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/app-nzbget/releases
[semver]: https://semver.org/spec/v2.0.0.html
