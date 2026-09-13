# Home Assistant Community App: File Explorer

A file manager for your Home Assistant installation, in a panel on the
sidebar. It shows the directories Home Assistant keeps its files in, and lets
you browse them, upload to them, move things about, unpack an archive, edit a
YAML file in place, preview a photo or a PDF, and search across the lot.

Underneath it is [FileBrowser Quantum][filebrowser], a modern web file manager
with an editor, previews, a search index and WebDAV built in. This app sets it
up with these Home Assistant directories as its sources:

- `config`: the Home Assistant configuration.
- `local_apps`: locally built apps.
- `app_configs`: the configuration directories of all installed apps.
- `backup`: your backups.
- `media`: the media directory.
- `share`: the directory apps share files through.
- `ssl`: your certificates and private keys.

## Installation

The installation of this app is pretty straightforward and not different in
comparison to installing any other Home Assistant app.

1. Click the Home Assistant My button below to open the app on your Home
   Assistant instance.

   [![Open this app in your Home Assistant instance.][addon-badge]][addon]

1. Click the "Install" button to install the app.
1. Start the "File Explorer" app.
1. Check the logs of the "File Explorer" app to see if everything went well.
1. Click the "OPEN WEB UI" button to open the File Explorer web interface.

The first start scans every directory above to build a search index, in the
background while you can already browse. With a large media library that takes
a while, and search and folder sizes fill in as it goes; later starts pick the
index back up where it was.

## How signing in works

Open the app from the sidebar and you are in. Home Assistant has already
established who you are, and this app tells File Browser to take its word for
it, so every Home Assistant user gets a File Browser account of their own,
named after their Home Assistant user. The account is made the first time you
open the app, with the run of every directory above; an administrator can trim
what an account may do from File Browser's settings pages afterwards.

**Everybody Home Assistant lets in is trusted with the files.** Home Assistant
tells an app who is asking, but not whether that person administers Home
Assistant. Anybody who can open this app from the sidebar can read and change
everything in the directories above, your configuration and your certificates
among them. Keep that in mind when you hand out Home Assistant accounts.

Only Ingress signs you in this way. The [published port](#direct-access) has
File Browser's own login screen instead, which accepts the `admin` account and
the password from the [`password`](#option-password) option. Without that
option, the account is given a fresh random password on every start that
nobody is told, and the login screen is a wall: exactly what you want when
Home Assistant does the signing in and the port stays closed.

If you would rather have File Browser ask for a login everywhere, turn
[`ingress_auto_login`](#option-ingress_auto_login) off and set the
[`password`](#option-password) option. Everybody then shares the `admin`
account, over Ingress and over the published port alike, and further accounts
are made from File Browser's settings pages.

## Configuration

**Note**: _Remember to restart the app when the configuration is changed._

Example app configuration:

```yaml
log_level: info
password: correct-horse-battery-staple
ingress_auto_login: true
ssl: true
certfile: fullchain.pem
keyfile: privkey.pem
```

**Note**: _This is just an example, don't copy and paste it! Create your own!_

Most of what File Browser does is configured from inside File Browser itself,
under the settings pages. The options below are the ones that have to be
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

File Browser has fewer levels of its own, so `trace` is folded into `debug`
and `notice` into `info`. At `debug` and above it also logs every request it
serves, and it is more forthcoming than you may want: the `admin` password is
written to the log when the account is first made.

### Option: `password`

The password of the `admin` account, which is the account behind File
Browser's own login screen. File Browser wants at least 5 characters.

File Browser applies it every time it starts, so this option is what the
password is: a change made to the `admin` account from within File Browser
does not survive a restart. It is also the way back in when the password is
lost.

Leave it empty when Home Assistant signs you in over Ingress and you do not
use the [published port](#direct-access). The `admin` account then has a
random password nobody knows, and nothing can log in to it.

### Option: `ingress_auto_login`

Lets Home Assistant sign you in when you open this app from the sidebar, and
is `true` by default. See [How signing in works](#how-signing-in-works).

With it off, File Browser asks for a login everywhere, and the
[`password`](#option-password) option is required, since without it there
would be nothing to log in with.

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

Set a port for "Web interface, API & WebDAV" in the "Network" section of the
app configuration to expose it. You need this for anything that is not a
browser sitting in front of Home Assistant: a computer mounting a directory as
a network drive over WebDAV, a script talking to the API, a share link handed
to somebody without a Home Assistant account, or a reverse proxy of your own.

File Browser's own login screen guards that port, and it accepts the `admin`
account with the [`password`](#option-password) option. The API and WebDAV
take a token instead, which any account can make for itself. Turn on
[`ssl`](#option-ssl) if you expose it to anything you do not trust, and think
twice before forwarding it from the internet: it is a door to your
configuration, your certificates and everything else above.

WebDAV is served below `/dav` on that port, one directory per source, so the
configuration is mounted from an address such as
`http://homeassistant.local:80/dav/config`. It does not take the account
password: the password field carries an API token instead, and the username
does not matter. Make one under "API Tokens" on your profile page in File
Browser, which works just as well from the panel, and keep to the plain token;
the customized kind is longer than some WebDAV clients can handle.

## About Ingress and File Browser

File Browser expects to own the whole domain it is served from. Ingress gives
it a path inside Home Assistant's instead, so out of the box the panel would
load and then ask Home Assistant for File Browser's files rather than asking
File Browser.

This app makes it work anyway. The page File Browser serves names where its
assets live and where its API is in two places, and NGINX rewrites those two
per request to the path Ingress handed out. Everything else File Browser does,
its router, its API calls and the event stream that keeps a listing current,
is resolved against that path, so the megabytes of application behind the
page are never touched.

One small script of this app's own goes into the page as well. File Browser
opens some folders in a new browser tab, from search results and from its
tools, and that tab would land on a bare Ingress address with no Home
Assistant around it to keep the session alive. Those become a navigation of
the panel instead. The same script is what makes downloads save rather than
display in the Home Assistant companion app. Neither is on the
[published port](#direct-access), where File Browser is served as it is.

The practical consequence is in [Known quirks](#known-quirks): a link that File
Browser builds out of the browser's address bar carries a Home Assistant
address when it was made from the panel.

## Backups

This app is backed up cold, which means Home Assistant stops it for the moment
it takes to copy its database. A database copied while it is being written to
can come back subtly broken.

That backup holds what File Browser owns: the accounts, their settings and any
share links. The thumbnails and the search index are left out, since they are
rebuilt from the files themselves. The files you manage with this app are not
in it either; they belong to Home Assistant and to the other apps, and are
backed up with those.

## Known quirks

- Share links carry the address the browser was at when you made them. From
  the panel that is a Home Assistant address, which needs an active Home
  Assistant session in whoever opens it. Make share links through
  [direct access](#direct-access) when they are meant for somebody else.
- A Home Assistant user named `admin` gets a File Browser account named after
  their user id instead, a string of hexadecimal. The name `admin` is taken by
  the account behind the password login, and File Browser refuses to sign
  somebody in to an account that was made for a different login method. The
  same happens to a user Home Assistant has no username for.
- In the Home Assistant companion app, a download started by anything other
  than a link, such as the download button on the sidebar of a share, and any
  link inside a document File Browser renders in a frame of its own, such as
  a PDF, still opens in an external browser and answers 401 there. The app
  hands every new window to that browser, which carries no Ingress session.
- Searching does not look inside `deps` and `__pycache__` in the configuration
  directory. Both hold thousands of files Python put there, which would drown
  out everything else. They are still there to browse.
- File Browser cannot be installed as a progressive web app from the panel. An
  app installed from an Ingress path pins an address that belongs to a Home
  Assistant session, which expires. Reach it through
  [direct access](#direct-access) to install it on a phone.
- Thumbnails are made for images and PDFs, but not for video. That would
  take ffmpeg, which this image does not carry.
- File Browser's own "check for updates" is turned off. Updates to this app
  arrive through the Home Assistant app store.

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
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_file-explorer&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/app-file-explorer/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[filebrowser]: https://filebrowserquantum.com/
[forum]: https://community.home-assistant.io/t/?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/app-file-explorer/issues
[nginx-proxy-manager]: https://github.com/hassio-addons/app-nginx-proxy-manager
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/app-file-explorer/releases
[semver]: https://semver.org/spec/v2.0.0.html
