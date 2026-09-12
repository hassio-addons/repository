# Home Assistant Community App: Calibre-Web

[Calibre-Web][calibre-web] is a web interface for a Calibre book library. Point
it at the folder your books live in and it turns that into a site you can read
from: cover art, search, authors and series, shelves for each person in the
house, and a reader in the browser for EPUB, PDF, comics and audiobooks.

It is not Calibre itself and does not try to be. Calibre stays the program you
manage a collection with; Calibre-Web is how everybody gets to that collection,
from a phone, a tablet or an e-reader, without a desktop application in the way.

This app brings calibre's conversion tools along with it, so a book can be
turned into whatever the device in your hand reads, mailed to a Kindle, or
handed to a Kobo as a kepub.

## Installation

The installation of this app is pretty straightforward and not different in
comparison to installing any other Home Assistant app.

1. Click the Home Assistant My button below to open the app on your Home
   Assistant instance.

   [![Open this app in your Home Assistant instance.][addon-badge]][addon]

1. Click the "Install" button to install the app.
1. Start the "Calibre-Web" app.
1. Check the logs of the "Calibre-Web" app to see if everything went well.
1. Click the "OPEN WEB UI" button to open the Calibre-Web interface.

The first start takes a little longer than the ones after it. An empty library
is created, and calibre is asked which version it is so Calibre-Web knows the
conversion tools are there.

## Logging in for the first time

Calibre-Web creates one administrator account when it starts for the first
time. Log in with it and change the password straight away:

- Username: `admin`
- Password: `admin123`

Those are the same on every Calibre-Web installation in the world, so treat the
first login as the first thing to fix rather than something to come back to
later. Everybody else in the house gets an account of their own, made from
**Admin** > **Add New User**, each with their own shelves, reading progress and
permissions.

## Your library

A Calibre library is a folder with a `metadata.db` file in it, which is what
Calibre-Web reads. This app looks in `/media/books` on its first start, and
creates an empty library there when it finds none, so there is somewhere to put
books from the moment the panel opens.

Already have a library? Put it in `/media/books` before you start this app for
the first time and it is picked up as it stands, books and all. Anywhere else
under `/media` or `/share` works too; point this app at it afterwards from
**Admin** > **Edit Calibre Database Configuration** > **Location of Calibre
Database**. It has to be the folder containing `metadata.db`, and it has to be a
real Calibre library rather than a folder of loose files.

## Adding books

Uploading is switched on in this app, which it is not in a stock Calibre-Web.
The "+" button in the top bar takes a book from your computer and files it in
the library, reading the title, author and cover out of the file as it goes.

Dropping files into the library folder by hand does **not** work, and that is
Calibre's design rather than a limitation of this app. Calibre-Web reads
`metadata.db`, and a file that nothing has told the database about is not in the
library. Add books through the upload button, or add them in Calibre on your
computer and let it write to the same folder.

## Converting books, and sending them to an e-reader

Every book page has a "Convert book" button. It is the real `ebook-convert`
from calibre doing the work, so anything calibre can do here it can do: EPUB,
MOBI, AZW3, PDF, DOCX, FB2, TXT and the rest, in either direction.

Two things send a book to a device rather than to your browser:

- **Kindle and anything else with an email address.** Fill in the mail server
  under **Admin** > **Edit Email Server Settings**, put the device's address in
  the user's profile, and the "Send to eReader" button mails the book,
  converting it first if the format does not match.
- **Kobo.** Calibre-Web can pretend to be the Kobo store, which puts your own
  library on the device and keeps reading progress in step with it. This app
  ships kepubify, so books are handed over in the kepub format the device wants
  and reading statistics work. Turn it on under **Admin** > **Edit Basic
  Configuration** > **Feature Configuration**, then use the sync token in each
  user's profile.

Kobo sync needs the device to reach this app directly, which Ingress cannot do.
See [Direct access](#direct-access).

## Reading apps and OPDS

Calibre-Web publishes an OPDS catalogue at `/opds`, which is how reading apps
like Moon+ Reader, KyBook, Marvin or Foliate browse and download from a library.
Point the app at this add-on's address with the OPDS path on the end, and log in
with the same account you use in the browser. This also needs
[direct access](#direct-access).

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

Almost everything about Calibre-Web is configured from inside Calibre-Web, by
the administrator account. The options below are the ones that have to be
settled before it starts.

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

Calibre-Web has fewer levels of its own, so `trace` and `debug` both put it in
`debug`, `info` and `notice` in `info`, and `fatal` in `critical`. This is
applied on every start, which is why the log level on Calibre-Web's own
configuration page follows this option rather than the other way around.

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

By default this app is only reachable through Home Assistant's Ingress, in a
panel on the sidebar, and nothing is exposed to your network.

Set a port for "Web interface, OPDS & Kobo sync" in the "Network" section of the
app configuration to expose it. You need this for anything that is not a browser
sitting in front of Home Assistant:

- A Kobo syncing with this app.
- A reading app pulling the [OPDS catalogue](#reading-apps-and-opds).
- A reverse proxy of your own, or reaching the library from outside the house.

Calibre-Web has its own accounts and its own login screen, so that port is
guarded the same way the Ingress panel is. Turn on [`ssl`](#option-ssl) if you
expose it to anything you do not trust, and give some thought to what "outside
the house" means before you forward a port to it.

## About Ingress and Calibre-Web

Calibre-Web supports being served from below the root of a domain, which is
exactly what Ingress does, so nothing here is patched or worked around. Home
Assistant hands out a different path for each session, and that path is passed
on with every request; Calibre-Web builds its links around whatever it is given.

The result is that the panel works the way the rest of the app does, including
the in-browser reader. The things that do not work through it are the ones that
are not browsers: a Kobo, a reading app and an OPDS client all need
[direct access](#direct-access), because the address Ingress gives out belongs
to a session that expires.

## Backups

This app is backed up cold, which means Home Assistant stops it for the moment
it takes to copy its databases. A SQLite database copied while it is being
written to can come back subtly broken, and a library is the sort of thing you
only notice is damaged when you go looking for something in it.

Worth knowing what is in that backup and what is not:

- **In it**: this app's own database, which is the accounts, the shelves, the
  reading progress and every setting on the configuration pages.
- **Not in it**: the books. Those live in `/media`, which belongs to Home
  Assistant rather than to this app. A full Home Assistant backup does include
  `/media`, so take one of those if you want the library covered too.

Thumbnails are left out of the backup. They are rebuilt from the books
themselves when they are next needed.

## Known quirks

- The first login uses a username and password that are the same everywhere.
  Change them before you do anything else.
- Books copied into the library folder by hand do not show up. Calibre-Web
  reads Calibre's database, not the folder. Use the upload button, or Calibre
  itself.
- The "Server Port" field on the configuration page does nothing here.
  Calibre-Web listens on a socket in this app rather than on a port, and NGINX
  is what serves both Ingress and the published port.
- Calibre-Web's own update section is not there. This app is updated by
  updating the app, which is the only way that leaves a working installation
  behind.
- Turning a book into a PDF works, but it is rarely what you want for an
  e-reader. A PDF has fixed pages, so the device cannot reflow the text to its
  own screen.
- Metadata search covers Google Books, Amazon, ComicVine, Douban and others.
  Google Scholar is missing, deliberately: it arrives with a browser automation
  stack in tow for a source almost nobody looks books up in.
- Conversion is real work for a small machine. On a Raspberry Pi a large book
  takes a while, and the task list is where you watch it happen rather than the
  page you started it from.

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
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_calibre-web&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[calibre-web]: https://github.com/janeczku/calibre-web
[contributors]: https://github.com/hassio-addons/app-calibre-web/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/app-calibre-web/issues
[nginx-proxy-manager]: https://github.com/hassio-addons/app-nginx-proxy-manager
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/app-calibre-web/releases
[semver]: https://semver.org/spec/v2.0.0.html
