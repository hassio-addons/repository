# Home Assistant Community App: FreshRSS

FreshRSS is a self-hosted RSS and Atom feed aggregator. It collects the feeds
you subscribe to, keeps track of what you have read, and lets you search,
label and filter your way through them from a browser or from a mobile app.

## Installation

The installation of this app is pretty straightforward and not different in
comparison to installing any other Home Assistant app.

1. Click the Home Assistant My button below to open the app on your Home
   Assistant instance.

   [![Open this app in your Home Assistant instance.][addon-badge]][addon]

1. Click the "Install" button to install the app.
1. Start the "FreshRSS" app.
1. Check the logs of the "FreshRSS" app to see if everything went well.
1. Click "Open Web UI" to open FreshRSS.
1. Enjoy the app!

The first start takes a little longer than usual, because the database is
created from scratch at that point and a handful of example feeds are added.

You are signed in automatically as your own Home Assistant user, so there is
nothing to log in with. See the `ingress_auto_login` option below if you would
rather share one account, or have FreshRSS ask for a login.

## How signing in works

Home Assistant has already established who you are by the time you open the
app from its sidebar, and it tells the app who that is. Every Home Assistant
user therefore gets a FreshRSS account of their own, created the first time
they open the app, with their own feeds, labels, settings and database. Nobody
sees anybody else's reading.

**The first person to open the app administers FreshRSS.** Home Assistant tells
an app who is asking, but not whether that person administers Home Assistant
itself, so the app cannot work out who ought to hold that role. The first
arrival is the one it can name, and everybody after them is an ordinary user.
Open the app yourself before handing the link around, and you keep the
administration pages. An administrator can promote others afterwards, under
"Settings" -> "Manage users".

Accounts are named after your Home Assistant username. Home Assistant places
almost no restrictions on those, while FreshRSS only accepts letters, digits
and `_ . @ -`, so a name it will not take falls back to your Home Assistant
user id. The account works exactly the same, it is just named less prettily.

Only Ingress signs you in, and the name is handed to FreshRSS by the app's own
web server in a way no browser can reach. Home Assistant discards any copy of
those headers that arrives with a request, and anything a browser does send
lands under a different name that is thrown away before FreshRSS sees it. So
the published port, if you publish it, cannot be used to walk in as somebody
else.

If you would rather everybody shared one account, set `ingress_auto_login` to
`false` and give the `username` account a `password`. FreshRSS then asks for
that password, over Ingress and over the published port alike.

## Configuration

**Note**: _Remember to restart the app when the configuration is changed._

Example app configuration:

```yaml
username: admin
ingress_auto_login: true
refresh_interval: 30
ssl: false
certfile: fullchain.pem
keyfile: privkey.pem
log_level: info
```

**Note**: _This is just an example, don't copy and paste it! Create your own!_

### Option: `username`

The name of the shared FreshRSS account, used only when `ingress_auto_login`
is turned off. It defaults to `admin`.

With auto login on you can ignore this. Accounts are named after Home
Assistant users instead, and this one is only kept so that FreshRSS has an
owner for the installation to point at. Nobody signs in to it, and it is
created without the starter feeds a real account gets.

### Option: `password`

The password of that shared account, used only when `ingress_auto_login` is
turned off.

Changing this option changes the password on the next start of the app. The
app only does that when the option itself changed, so a password you changed
from within FreshRSS is not overwritten on every restart.

Leave the option out to keep whatever password is currently set.

### Option: `ingress_auto_login`

Whether opening the app from the Home Assistant sidebar signs you in as your
own Home Assistant user. It defaults to `true`.

Left on, every Home Assistant user gets a FreshRSS account of their own, and
the first one to open the app administers FreshRSS. See "How signing in works"
above.

Set it to `false` to have FreshRSS ask for a username and password instead,
which is what you want if everybody should share one reading list, or if you
want to reach the web interface over the published port.

With auto login on, the published port still serves the Google Reader and
Fever APIs that mobile apps use. Those have a password of their own and are
unaffected by this option. What it does not serve is the web interface: while
Home Assistant signs you in, FreshRSS has no login of its own to show there.

### Option: `refresh_interval`

How often the feeds of every account are refreshed, in minutes. It defaults
to `30`.

Set it to `0` to turn automatic refreshing off, for example when you would
rather refresh from within FreshRSS, or drive it from a Home Assistant
automation over the API.

A refresh never runs twice at the same time. The interval is the pause
between the end of one run and the start of the next, so a round of feeds
that takes longer than the interval simply delays the next one.

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

## Using FreshRSS from a mobile app

FreshRSS speaks the Google Reader and Fever protocols, which is what mobile
readers like Reeder, FeedMe, Fluent Reader and NetNewsWire talk to it with.

Those apps cannot use the Ingress URL, since it is tied to your Home Assistant
session. To reach the API, publish the app's port `80` in the app's network
configuration, and give your reader:

- Google Reader:
  `http://<your-home-assistant-ip>:<the port you published>/api/greader.php`
- Fever:
  `http://<your-home-assistant-ip>:<the port you published>/api/fever.php`

The API is enabled, but has no password until you set one. Open FreshRSS,
go to "Settings" -> "Profile", and fill out the "API password" field. That
password is separate from the one you log in with, and is the one your reader
needs.

FreshRSS has a page of its own at `/api/` that lists both addresses and can
test them for you. Reached over Ingress it shows the Ingress address, which
your reader cannot use, so open it over the published port to see the address
worth handing out.

Publishing the port makes FreshRSS reachable to everything on your network.
Consider enabling the `ssl` option if you do, and keep in mind that the API
password is what protects your feeds there.

## Extensions

Extensions installed from within FreshRSS are kept in the app's data
directory, next to your feeds, so they survive an update of this app.

FreshRSS' built-in self-update is turned off, since this app is what updates
FreshRSS. Update the app to get a newer FreshRSS.

## Known issues and limitations

- Removing a Home Assistant user does not remove their FreshRSS account. Do
  that from within FreshRSS, under "Settings" -> "Manage users".
- Renaming a Home Assistant user gives that person a new, empty FreshRSS
  account. The old one keeps their feeds and can be reached again by changing
  the name back, or its feeds can be moved across with an OPML export.
- With `ingress_auto_login` turned on, the published port serves the API but
  not the web interface. FreshRSS has a single way of authenticating for the
  whole installation, and while Home Assistant signs you in, there is no login
  form to fall back on. Turn the option off to use both.
- FreshRSS stores its data in a SQLite database. That is a supported backend
  upstream, but a large number of feeds with a long history kept will be
  slower than the MySQL or PostgreSQL backends this app does not offer.
- WebSub (PubSubHubbub), which lets a publisher push new articles to you
  instead of being polled, is not available. It needs FreshRSS to be reachable
  from the internet at a fixed address, which an Ingress URL is not.

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
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_freshrss&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/app-freshrss/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/c/community-add-ons/57
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/app-freshrss/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/app-freshrss/releases
[semver]: https://semver.org/spec/v2.0.0.html
