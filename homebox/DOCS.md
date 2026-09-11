# Home Assistant Community App: Homebox

[Homebox][homebox] is an inventory system for the things in your house. It
keeps a record of what you own, where you put it, what it cost and what it is
worth now, and it is built for a household rather than for a warehouse.

Items live in locations, locations nest inside each other, and anything can be
labelled. A thing gets a photo, the receipt, the manual, the serial number, a
warranty date and whatever custom fields you want on it. From there it is
searchable, which is the whole point: the answer to "which box in the loft has
the camping stove in it" is a search away rather than an afternoon.

It also keeps maintenance logs against an item, so the boiler service and the
lawnmower blade change have somewhere to live, and it can print sheets of
labels with QR codes to stick on the boxes themselves.

## Installation

The installation of this app is pretty straightforward and not different in
comparison to installing any other Home Assistant app.

1. Click the Home Assistant My button below to open the app on your Home
   Assistant instance.

   [![Open this app in your Home Assistant instance.][addon-badge]][addon]

1. Click the "Install" button to install the app.
1. Start the "Homebox" app.
1. Check the logs of the "Homebox" app to see if everything went well.
1. Click the "OPEN WEB UI" button to open the Homebox web interface.

Installing takes a while. The frontend is built from source as part of the
image, and the first start creates the database before Homebox begins
listening.

## Logging in for the first time

Homebox ships with no accounts at all. The first screen offers to register one,
and the account you make there is the administrator of your inventory.

Once you have it, turn [`allow_registration`](#option-allow_registration) off.
It is on by default only so that the first account can be made; leaving it on
means anybody who can reach this app can make themselves one. Everybody else in
the house is invited from inside Homebox instead.

## Filling it up

Start with locations, since everything else hangs off them. They nest, so
"House" > "Loft" > "Box 4" works the way you would expect, and an item can be
moved between them later.

Items can be added one at a time, imported from a CSV file, or created by
scanning a barcode, which looks the product up and fills in what it can. The
importer is the one to reach for if you already keep a spreadsheet of this
stuff.

Labels are worth setting up early. Homebox generates sheets of QR code labels
from the tools page; stick one on a box, scan it later, and you land on that
box's contents. See [Known quirks](#known-quirks) for which address ends up in
those codes.

## Configuration

**Note**: _Remember to restart the app when the configuration is changed._

Example app configuration:

```yaml
log_level: info
allow_registration: false
auto_increment_asset_id: true
max_upload_size: 25
ssl: true
certfile: fullchain.pem
keyfile: privkey.pem
```

**Note**: _This is just an example, don't copy and paste it! Create your own!_

Most of what Homebox does is configured from inside Homebox itself. The options
below are the ones that have to be settled before it starts.

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

Homebox has fewer levels of its own, so `notice` is folded into `info`.

### Option: `base_url`

The address this app is reached at from the outside, for example
`https://homebox.example.com`.

Homebox has no way of working this out on its own, and uses it for the links in
the mail it sends. Leave it empty when you only use this app from your own
network and do not send mail from it.

### Option: `allow_registration`

Lets anybody who can reach this app create an account, and is `true` by
default.

It has to be on to make the first account, since Homebox creates none of its
own. Turn it off once you have one. Homebox is not built to be a public
website, and an open registration form on a port you have forwarded is an open
door.

### Option: `auto_increment_asset_id`

Gives every new item the next number in sequence, and is `true` by default.

Those numbers are what the printed labels carry, so leave this on unless you
already have a numbering scheme of your own that you would rather keep.

### Option: `max_upload_size`

The largest single file that can be attached to an item, in megabytes, and is
`10` by default.

Photographs straight off a modern phone are regularly larger than that, so
raise it if attaching one fails.

### Option: `smtp_host`

The mail server used to send password resets and invitations, for example
`smtp.example.com`.

Leave it empty to switch email off entirely. Homebox works fine without it; you
just hand out passwords yourself, and a forgotten one is reset from the command
line rather than by mail.

### Option: `smtp_port`

The port of the mail server, usually `587`.

### Option: `smtp_from`

The address the mail from this app is sent from.

### Option: `smtp_user`

The username for the mail server, usually the same as the sender address.

### Option: `smtp_password`

The password that goes with the SMTP username.

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

Set a port for "Web interface & API" in the "Network" section of the app
configuration to expose it. You need this for anything that is not a browser
sitting in front of Home Assistant: a phone scanning the QR code on a label, a
reverse proxy of your own, or a script talking to the API.

Homebox has its own accounts and its own login screen, so that port is guarded
the same way the Ingress panel is. Turn on [`ssl`](#option-ssl) if you expose it
to anything you do not trust.

## About Ingress and Homebox

Homebox expects to own the whole domain it is served from. Ingress gives it a
path inside Home Assistant's instead, so out of the box the panel would load
and then ask Home Assistant for Homebox's files rather than asking Homebox.

This app makes it work anyway. The frontend is built from source here, so two
small patches go on along the way: one adds a plugin that points Homebox's API
at the path Ingress handed out, and one fixes the addresses the browser
resolves by itself, where no plugin can reach. NGINX writes that path into the
page per request, and Nuxt reads it back at runtime.

The practical consequences are in [Known quirks](#known-quirks): a couple of
things that build a link out of the browser's address bar assume Homebox owns
the whole domain, and those are worth reaching through
[direct access](#direct-access) instead.

## Backups

This app is backed up cold, which means Home Assistant stops it for the moment
it takes to copy the database. A SQLite database copied while it is being
written to can come back subtly broken, and an inventory is the sort of thing
you only discover is damaged when you go looking for something in it.

Everything Homebox owns is in that backup: the database, and every photo,
receipt and manual attached to an item. Homebox can also export a collection of
its own, from inside the app, which is the format to use for moving to a
different Homebox installation rather than restoring this app where it stands.

## Known quirks

- The QR codes on printed labels carry the address the browser was at when you
  printed them. From the Ingress panel that is a Home Assistant address, which
  needs an active Home Assistant session in whatever scans it, and a phone
  camera pointed at a box in the loft usually has none. Print labels through
  [direct access](#direct-access) when you want them to work from anything.
- Homebox cannot be installed as a progressive web app, and this build ships no
  service worker. A service worker registered under an Ingress path caches an
  app that is not where it thinks it is, which goes wrong in ways that are hard
  to clear. Reach it through [direct access](#direct-access) to install it on a
  phone.
- Thumbnails are made for photos in the formats phones actually produce, HEIC
  among them, but the original file is what gets stored and handed back on
  download.
- Installing takes a while, and updates do too. Both the frontend and the
  backend are built from source as part of the image.

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
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_homebox&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/app-homebox/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/?u=frenck
[frenck]: https://github.com/frenck
[homebox]: https://homebox.software/
[issue]: https://github.com/hassio-addons/app-homebox/issues
[nginx-proxy-manager]: https://github.com/hassio-addons/app-nginx-proxy-manager
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/app-homebox/releases
[semver]: https://semver.org/spec/v2.0.0.html
