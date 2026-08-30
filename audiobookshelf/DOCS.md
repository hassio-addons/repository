# Home Assistant Community App: Audiobookshelf

[Audiobookshelf][audiobookshelf] is a server for the audiobooks and podcasts
you already own. It reads the files you point it at, works out what they are,
fetches covers and descriptions, and hands them to a player that remembers
where everybody left off.

Progress follows the listener rather than the device, so an audiobook started
on a phone in the car carries on from the same second in a browser at home.
Podcasts are subscribed to and downloaded by the server itself, on a schedule,
which is what makes them yours rather than something a feed can take away.
Everyone in the house gets their own account, their own position in every book,
and only the libraries you give them.

## Installation

The installation of this app is pretty straightforward and not different in
comparison to installing any other Home Assistant app.

1. Click the Home Assistant My button below to open the app on your Home
   Assistant instance.

   [![Open this app in your Home Assistant instance.][addon-badge]][addon]

1. Click the "Install" button to install the app.
1. Start the "Audiobookshelf" app.
1. Check the logs of the "Audiobookshelf" app to see if everything went well.
1. Click the "OPEN WEB UI" button to open the Audiobookshelf web interface.

## Creating your account

Audiobookshelf keeps its own users, and the first thing it asks for is the
account that owns the server. Fill in a username and a password on the page
that greets you and you are in.

That login is asked for in the sidebar as well. Home Assistant knows who you
are before the request arrives, but Audiobookshelf has no way to be told, so it
asks once and then remembers. Everybody else in the house gets an account of
their own from **Settings** > **Users**, which is also where you decide which
libraries each of them can see.

## Where your books live

Audiobookshelf does not move or copy your files. You point it at folders and it
reads what is in them, so the layout on disk stays yours.

Two folders are available to point it at:

- `/media`, which is Home Assistant's own media folder. Anything here also
  shows up in the media browser and is reachable from the other apps that map
  it.
- `/share`, which is shared between apps and is the usual home for a collection
  that other apps write to.

Create a library from **Settings** > **Libraries** > **Add Library** and give
it one of those paths, for example `/media/audiobooks` or `/share/podcasts`.
Audiobookshelf works out authors, series and narrators from the folder names,
so its [directory structure guide][structure] is worth a look before you move a
large collection in.

Everything Audiobookshelf derives from your files, the cached covers, the
author images and the transcoded audio it streams from, is kept in this app's
own storage rather than next to your books.

## The mobile apps

The [Audiobookshelf apps][apps] for Android and iOS need an address they can
reach and log into on their own. The sidebar cannot give them one: it exists
only inside a Home Assistant session and its address changes.

Publish a port for "Web interface & API" in the "Network" section of the app
configuration and give the apps that address, along with the username and
password of the account they should use. See [Direct access](#direct-access)
for what that means for anything reachable from outside your network.

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

Everything about Audiobookshelf itself is configured inside Audiobookshelf,
under **Settings**, and is kept across restarts and updates. The options below
are the few that have to be settled before it starts.

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

This covers the app's own startup messages. Audiobookshelf keeps a log level of
its own, under **Settings** > **Logs**, which is what to turn up when a scan or
a download is misbehaving.

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
sitting in front of Home Assistant:

- The [Audiobookshelf mobile apps](#the-mobile-apps).
- [RSS feeds and share links](#rss-feeds-and-share-links).
- Single sign-on through OpenID Connect, which needs a callback address that
  does not change.
- A reverse proxy of your own, or anything talking to the API.

Audiobookshelf's own login guards that port, so give the accounts real
passwords before publishing it, and turn on [`ssl`](#option-ssl) if you expose
it to anything you do not trust.

## RSS feeds and share links

Audiobookshelf can hand out a podcast feed for a book and a link that lets
somebody listen to one without an account. Both are addresses that something
outside Home Assistant has to fetch, which the sidebar cannot provide: an
Ingress address belongs to the session that opened it and stops working when
that session does.

Open the sidebar panel and the address shown for a feed or a share is the
Ingress one, which is why it looks unusable in a podcast app. Reach this app
over its [published port](#direct-access) instead and the address it shows is
the one to hand out.

## Backups

This app is backed up cold, which means Home Assistant stops it for the moment
it takes to copy its storage. Audiobookshelf writes to a database continuously,
and a copy taken mid-write can come back as a library that has lost track of
what it had scanned.

What lands in the backup is the database and the artwork: the accounts, the
libraries, the listening progress of everybody in the house, and the covers and
metadata Audiobookshelf collected. The cached transcodes, the logs and the
stream folder are left out, since they are all rebuilt on demand.

Your audiobooks and podcasts are not part of it. They live in the `media` and
`share` folders, which app backups do not cover, so a restore brings back a
server that knows about your collection and expects the files to still be where
it left them.

## Known quirks

- The sidebar panel asks for an Audiobookshelf login even though Home Assistant
  already knows who you are. Audiobookshelf has no way of being told, so the
  two logins stay separate.
- Addresses meant for something outside Home Assistant, RSS feeds and share
  links among them, cannot be produced from the sidebar. See
  [RSS feeds and share links](#rss-feeds-and-share-links).
- The web interface cannot be installed as a progressive web app from the
  sidebar. Its service worker is switched off in this app, since one registered
  against an Ingress address is orphaned as soon as that address changes.
  Installing it from the [published port](#direct-access) is unaffected.
- Casting to a Chromecast needs an address the Chromecast itself can fetch,
  which an Ingress address is not.
- Audiobookshelf checks for new releases and will tell you one is out. Updates
  arrive through this app rather than from inside Audiobookshelf.

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
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_audiobookshelf&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[apps]: https://www.audiobookshelf.org/docs/#mobile-apps
[audiobookshelf]: https://www.audiobookshelf.org/
[contributors]: https://github.com/hassio-addons/app-audiobookshelf/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/app-audiobookshelf/issues
[nginx-proxy-manager]: https://github.com/hassio-addons/app-nginx-proxy-manager
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/app-audiobookshelf/releases
[semver]: https://semver.org/spec/v2.0.0.html
[structure]: https://www.audiobookshelf.org/guides/book_folder_structure/
