# Home Assistant Community App: Actual Budget

[Actual][actual] is a budgeting app that keeps your money where you can see it.
It uses envelope budgeting: every month you give each currency unit you have a
job, and the numbers add up because you only ever assign money you actually
have.

The budget lives in your browser and syncs through this app, which is the only
place a copy of it is kept. Nothing is sent anywhere else, there is no account
to sign up for, and nobody is selling what you spend your money on.

## Installation

The installation of this app is pretty straightforward and not different in
comparison to installing any other Home Assistant app.

1. Click the Home Assistant My button below to open the app on your Home
   Assistant instance.

   [![Open this app in your Home Assistant instance.][addon-badge]][addon]

1. Click the "Install" button to install the app.
1. Start the "Actual Budget" app.
1. Check the logs of the "Actual Budget" app to see if everything went well.
1. Click the "OPEN WEB UI" button to open the Actual web interface.

## Setting a password

The first page Actual shows asks for a password for the server. It guards every
budget this app holds, so pick a real one and keep it somewhere you can find it
again. There is no account and no email to recover it from.

That password is asked for in the sidebar as well. Home Assistant knows who you
are before the request arrives, but Actual has no way of being told, so it asks
once and then remembers.

Then either start a fresh budget or bring one in from elsewhere. Actual imports
from YNAB4, nYNAB, EveryDollar and a plain CSV, all from the same "Import my
budget" button on the welcome page.

## About the sidebar and SharedArrayBuffer

This is the one thing worth reading before you start.

Actual keeps your budget in a SQLite database compiled to WebAssembly and runs
it inside your browser, and it reads that database through a browser feature
called `SharedArrayBuffer`. Browsers only hand one out to a page that is
"cross-origin isolated", which a page can only be if every page it is nested
inside asks to be as well.

The sidebar panel is a frame inside Home Assistant's own page, and Home
Assistant does not ask for it. So under Ingress the `SharedArrayBuffer` is
never available, and no header this app sends can change that.

Actual has a fallback for exactly this case, which it describes as unsupported.
Reaching it normally means clicking through a page of explanation, and since
that page is the only thing the sidebar would otherwise show, this app answers
that question for you when it is serving through Ingress. What the fallback
changes:

- Your budget is held in memory and written back to browser storage a moment
  after each change, rather than as part of it. A tab closed in that moment can
  lose the last edit.
- Only one tab at a time. Open the budget in a second tab and the second one
  takes over; the first stops saving and says so.

Actual shows a "Warning" in its top bar while this is in effect, which is its
own notice about the above and not something going wrong.

What takes the sting out of it is that this app is a sync server, not just a
place to open the browser. Every change is also sent here and kept in this
app's own storage, so the copy in your browser is a working copy of something
that also lives on disk and gets backed up.

If you would rather run the supported path, publish the port and turn on SSL,
and use that address instead. Over HTTPS at the root of a host, Actual gets its
`SharedArrayBuffer` and behaves exactly as upstream intends. See
[Direct access](#direct-access).

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

Everything about Actual itself is configured inside Actual, under "Settings",
and is kept across restarts and updates. The options below are the few that
have to be settled before it starts.

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
configuration to expose it. You need this for:

- Running Actual on its
  [supported storage path](#about-the-sidebar-and-sharedarraybuffer), which
  needs HTTPS at the root of a host. Turn on [`ssl`](#option-ssl) as well.
- The Actual mobile experience, which is the web interface installed as an app
  from a browser and needs an address that does not change.
- Bank syncing through GoCardless, SimpleFIN, Pluggy.ai or Enable Banking, and
  single sign-on through OpenID Connect. All of these send the browser back to
  an address they were told about beforehand, which an Ingress address cannot
  be.
- A reverse proxy of your own, or anything talking to the API.

Actual's own password guards that port, so set a real one before publishing it,
and turn on [`ssl`](#option-ssl) if you expose it to anything you do not trust.

Serve it from the root of a host. Actual builds its client for the root, and a
reverse proxy that puts it under a path, `example.com/actual` say, is
[not something it supports][subpath]. Give it a name of its own,
`budget.example.com`, instead. The Ingress panel is under a path, which is why
this app carries a patch to make that work, and that patch is written for the
one path Home Assistant hands it.

## Two ways in, two sets of data

The sidebar and the published port are different addresses, and a browser keeps
what a page stores per address. Actual holds the working copy of your budget in
browser storage, so opening it through the sidebar and then through the
published port means two working copies.

They do not drift, because both sync to this app, which holds the one copy that
matters. What you will notice is that the second way in asks for the password
again and then downloads the budget before it can show it to you.

## Backups

This app is backed up cold, which means Home Assistant stops it for the moment
it takes to copy its storage. Actual writes to a database continuously, and a
copy taken mid-write can come back as a server that has lost track of what it
was holding.

What lands in the backup is everything on the server side: the password, the
list of budget files, and the budgets themselves as they were last synced up.

The working copy in your browser is not part of it and does not need to be. On
a restore, sign in and Actual downloads the budget again.

Anything you have changed in a browser and not yet synced is not in the backup
either. Actual syncs by itself as you work, so this is a window of seconds, but
it is worth knowing that the backup is of the server rather than of the tab you
are looking at.

## Resetting the password

While you are signed in, the password is changed from inside Actual, under
"Settings".

If it is lost, Actual carries a script that asks for a new one, and reaching it
needs a shell on the machine running Home Assistant. The
[Advanced SSH & Web Terminal app][ssh] with protection mode turned off will do,
as will a terminal on a Supervised install:

```bash
SERVER=/opt/actual/node_modules/@actual-app/sync-server
docker exec -it -e ACTUAL_DATA_DIR=/data/actual \
    "$(docker ps -qf name=actual-budget)" \
    node "${SERVER}/build/bin/actual-server.js" --reset-password
```

Your budgets are untouched by this. It is the password on the way in that
changes.

## Known quirks

- The sidebar panel asks for an Actual password even though Home Assistant
  already knows who you are. Actual has no way of being told, so the two logins
  stay separate.
- Actual shows a `SharedArrayBuffer` warning in the sidebar, and the budget can
  only be open in one tab at a time there. See [about the sidebar][sab] above
  for what that is and what to do about it.
- The web interface cannot be installed as an app from the sidebar. Its service
  worker is switched off here: one registered against an Ingress path would
  hold the app in a cache that survives an app update, and installing it from
  the sidebar would produce a shortcut to an address that belongs to a Home
  Assistant session. Installing it from the
  [published port](#direct-access) is unaffected.
- Bank syncing and OpenID need an address the bank or the provider can send a
  browser back to, which an Ingress address is not. See
  [Direct access](#direct-access).
- Actual checks for new releases and will tell you one is out. Updates arrive
  through this app rather than from inside Actual.

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

[actual]: https://actualbudget.org/
[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_actual-budget&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/app-actual-budget/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/app-actual-budget/issues
[nginx-proxy-manager]: https://github.com/hassio-addons/app-nginx-proxy-manager
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/app-actual-budget/releases
[sab]: #about-the-sidebar-and-sharedarraybuffer
[semver]: https://semver.org/spec/v2.0.0.html
[ssh]: https://github.com/hassio-addons/addon-ssh
[subpath]: https://github.com/actualbudget/actual/issues/4245
