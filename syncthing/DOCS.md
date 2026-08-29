# Home Assistant Community App: Syncthing

[Syncthing][syncthing] is a continuous file synchronization program. It
synchronizes files between two or more computers and replaces proprietary sync
and cloud services with something open, trustworthy and decentralized.

Your data is your data alone and you deserve to choose where it is stored, if
it is shared with some third party and how it's transmitted over the internet.

Check the list of [Syncthing's goals][syncthing-goals] for more details.

## Installation

The installation of this app is pretty straightforward and not different in
comparison to installing any other Home Assistant app.

1. Click the Home Assistant My button below to open the app on your Home
   Assistant instance.

   [![Open this app in your Home Assistant instance.][addon-badge]][addon]

1. Click the "Install" button to install the app.
1. Start the "Syncthing" app.
1. Check the logs of the "Syncthing" app to see if everything went well.
1. Click the "OPEN WEB UI" button to open the Syncthing interface.
1. Add the folders you want to synchronize and the devices to share them with.

## What gets synchronized?

Syncthing itself decides nothing for you. This app makes a set of Home
Assistant directories available inside the container, and you pick which of
those (or which subdirectories of those) to actually share, from Syncthing's
own "Add Folder" dialog.

| Path             | What it is                                     |
| ---------------- | ---------------------------------------------- |
| `/homeassistant` | Your Home Assistant configuration directory    |
| `/addon_configs` | The configuration directories of all your apps |
| `/addons`        | Your locally installed apps                    |
| `/config`        | This app's own configuration directory         |
| `/share`         | The Home Assistant `share` directory           |
| `/media`         | The Home Assistant `media` directory           |
| `/backup`        | Your Home Assistant backups                    |
| `/ssl`           | Your certificates, read only                   |

`/ssl` is mounted read only, so your certificates can be sent to other
devices but never overwritten by them. Everything else is read-write.

**Warning**: _Always pick a folder path that starts with one of the directories
above. Syncthing resolves a path without a leading `/` against the container
itself, so a folder added as `Documents` becomes `/Documents`, which is not
stored anywhere on your machine and is destroyed the next time the app updates.
To save you from that, new folders start at `/share` instead of an empty path._

Syncthing's own configuration and its file index live in `/data`, which is
private to this app. Do not add `/data` as a folder to synchronize.

**Note**: _Synchronizing `/backup` is a great way to get your Home Assistant
backups off your device automatically. Do keep in mind that Syncthing
replicates deletions as well; use file versioning on that folder if you want
deleted backups to be retained elsewhere._

**Warning**: _`/homeassistant` contains secrets, tokens and your database.
Think carefully about which devices you share it with, and consider excluding
`home-assistant_v2.db*` using a `.stignore` file, since a live database is
rewritten constantly and does not synchronize well._

## Networking

This app runs on the host network, so that Syncthing's local discovery works
the same way it would on any other machine on your network.

Syncthing uses the following ports, which are configured from within Syncthing
itself (_Actions → Settings → Connections_) rather than from Home Assistant:

- `22000/tcp` and `22000/udp`: the sync protocol, TCP and QUIC. Forward this
  port on your router if you want to synchronize with devices outside your
  network without relying on Syncthing's relays.
- `21027/udp`: local discovery. This is how Syncthing finds other devices on
  your own network.

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

Syncthing has fewer levels of its own, so `trace` and `debug` both put
Syncthing in `DEBUG`, `info` and `notice` in `INFO`, `warning` in `WARN`, and
`error` and `fatal` in `ERROR`.

### Option: `ssl`

Enables/Disables SSL (HTTPS) on the web interface. Set it `true` to enable it,
`false` otherwise.

**Note**: _The SSL settings only apply to direct access and have no effect on
the Ingress service._

### Option: `certfile`

The certificate file to use for SSL.

**Note**: _The file MUST be stored in `/ssl/`, which is the default_

### Option: `keyfile`

The private key file to use for SSL.

**Note**: _The file MUST be stored in `/ssl/`, which is the default_

## Direct access to the web interface

By default the Syncthing interface is only reachable through Home Assistant's
Ingress, which means Home Assistant takes care of authenticating you.

You can expose the interface directly by setting a port for the "Web interface"
in the "Network" section of the app configuration. You will want this if you
plan to use the [Syncthing integration][syncthing-integration], which talks to
Syncthing's API and cannot go through Ingress.

**Warning**: _Behind this proxy Syncthing always sees requests as coming from
localhost, which means its built-in protection against unauthenticated remote
access does not kick in. Before you expose the port, open the web interface and
set a username and password under Actions → Settings → GUI. The app logs a
warning on startup if you have not._

## Home Assistant integration

Home Assistant ships a [Syncthing integration][syncthing-integration] that
exposes the state of your folders as sensors. To use it, expose the web
interface port as described above, and point the integration at
`http://<your-home-assistant-ip>:<port>` with the API key found under
Actions → Settings → GUI.

## Known quirks

- Syncthing logs a warning that it "should not run as a privileged or system
  user". Home Assistant apps run as root; this is expected and harmless here.
- The GUI listen address shown under Actions → Settings → GUI is ignored. The
  app always binds Syncthing's interface to a fixed internal port and proxies
  it, so that you cannot accidentally lock yourself out of Ingress.
- Syncthing's file index is excluded from Home Assistant backups, because it
  can grow to many gigabytes and is rebuilt automatically. After restoring a
  backup, expect Syncthing to rescan your folders once.

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

Copyright (c) 2019-2026 Franck Nijhof

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
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_syncthing&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/app-syncthing/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/app-syncthing/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/app-syncthing/releases
[semver]: https://semver.org/spec/v2.0.0.html
[syncthing-goals]: https://github.com/syncthing/syncthing/blob/main/GOALS.md#the-syncthing-goals
[syncthing-integration]: https://www.home-assistant.io/integrations/syncthing/
[syncthing]: https://syncthing.net/
