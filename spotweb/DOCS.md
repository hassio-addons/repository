# Home Assistant Community App: Spotweb

Spotweb is a decentralized usenet community based on the Spotnet protocol.
It indexes the "spots" that other users post to usenet, and gives you a web
interface to search and browse them, watch or blacklist posters, and hand the
NZB files it finds to your download client.

## Installation

The installation of this app is pretty straightforward and not different in
comparison to installing any other Home Assistant app.

1. Click the Home Assistant My button below to open the app on your Home
   Assistant instance.

   [![Open this app in your Home Assistant instance.][addon-badge]][addon]

1. Click the "Install" button to install the app.
1. Start the "Spotweb" app.
1. Check the logs of the "Spotweb" app to see if everything went well.
1. Click "Open Web UI" to open Spotweb.
1. Log in with username `admin` and password `admin`, unless you set the
   `admin_password` option before the first start.
1. Open Spotweb's own settings and enter the details of your usenet provider.
1. Enjoy the app!

The first start takes a little longer than usual, because the database is
created from scratch at that point.

## Setting up your usenet provider

Spotweb needs a usenet (NNTP) provider of its own to retrieve spots with. It
is not configured through this app, but from within Spotweb itself, because
Spotweb stores those settings in its own database:

1. Log in to Spotweb as `admin`.
1. Open the settings from the menu.
1. Fill out the "Usenet server" section with the details of your provider.
1. Save the settings.

New spots are retrieved automatically from that point on, every
`retrieve_interval` minutes. The very first retrieval takes a long time and
is quite heavy on your system, since it works through the full history your
provider still holds.

## Configuration

**Note**: _Remember to restart the app when the configuration is changed._

Example app configuration:

```yaml
admin_password: mysupersecretpassword
retrieve_interval: 15
ssl: false
certfile: fullchain.pem
keyfile: privkey.pem
log_level: info
```

**Note**: _This is just an example, don't copy and paste it! Create your own!_

### Option: `admin_password`

The password of Spotweb's built-in `admin` account.

Spotweb creates that account with the password `admin`, which is why this
option exists. Set it before the first start and the account is created with
your password straight away.

Changing this option later changes the password of the account on the next
start of the app. The app only does that when the option itself changed, so a
password you changed from within Spotweb is not overwritten on every restart.

Leave the option out to keep whatever password is currently set.

### Option: `retrieve_interval`

How often new spots are retrieved from your usenet provider, in minutes. It
defaults to `15`.

Set it to `0` to disable automatic retrieval altogether, for example when you
would rather trigger retrieval from Spotweb itself.

Retrieval never runs twice at the same time: the interval is the pause
between the end of one run and the start of the next, so a run that takes
longer than the interval simply delays the next one.

### Option: `ssl`

Enables/Disables SSL (HTTPS) on the direct web interface. Set it to `true` to
enable it, `false` otherwise.

This option has no effect on Ingress. Home Assistant handles the encryption of
Ingress connections.

### Option: `certfile`

The certificate file to use for SSL.

**Note**: _The file MUST be stored in `/ssl/`, which is the default_

### Option: `keyfile`

The private key file to use for SSL.

**Note**: _The file MUST be stored in `/ssl/`, which is the default_

### Option: `log_level`

The `log_level` option controls the level of log output by the app and can
be changed to be more or less verbose, which might be useful when you are
dealing with an unknown issue. Possible values are:

- `trace`: Show every detail, like all called internal functions.
- `debug`: Shows detailed debug information.
- `info`: Normal (usually) interesting events.
- `warning`: Exceptional occurrences that are not errors.
- `error`: Runtime errors that do not require immediate action.
- `fatal`: Something went terribly wrong. App becomes unusable.

Please note that each level automatically includes log messages from a
more severe level, e.g., `debug` also shows `info` messages. By default,
the `log_level` is set to `info`, which is the recommended setting unless
you are troubleshooting.

## Using the Newznab API

Spotweb offers a Newznab compatible API, which is what makes it usable as an
indexer for Sonarr, Radarr and Prowlarr.

Those applications cannot use the Ingress URL, since it is tied to your Home
Assistant session. To use the API, publish the app's port `80` in the app's
network configuration, and point them at:

```txt
http://<your-home-assistant-ip>:<the port you published>/api
```

The API key of a user is shown on that user's profile page in Spotweb.

Publishing the port makes Spotweb reachable to everything on your network,
with only Spotweb's own login in front of it. Give the `admin` account a
proper password before you do, and consider enabling the `ssl` option.

## Known issues and limitations

- Spotweb stores its data in a SQLite database in the app's data directory.
  Upstream considers SQLite its least tested backend, and a full spot index
  grows to millions of rows, so retrieval and searching get slower as the
  index grows.
- Spotweb has not tagged a release since 1.5.8 in December 2024, and its
  master branch has not moved since February 2025. This app therefore tracks
  Spotweb's `develop` branch, which is where its development happens, pinned
  to a specific commit per app release.
- Spotweb's installation wizard is not available. This app configures Spotweb
  itself, and the wizard refuses to run against a configured installation
  anyway.
- Links that Spotweb hands to an external download client contain the URL you
  are browsing with. Over Ingress that is a URL that only works inside your
  Home Assistant session, so use the direct port when you rely on pushing NZB
  files to a download client from Spotweb.

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
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_spotweb&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/app-spotweb/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/c/community-add-ons/57
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/app-spotweb/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/app-spotweb/releases
[semver]: https://semver.org/spec/v2.0.0.html
