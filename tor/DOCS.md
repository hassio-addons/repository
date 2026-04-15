# Home Assistant Community App: Tor

This Tor app allows you to access your Home Assistant instance as an Onion site,
through [Tor's Hidden Service][tor-hidden-service] feature. With this feature
enabled, you do not need to open your firewall ports or set up HTTPS to enable
secure remote access.

This is useful if you want to have:

- Access your Home Assistant instance remotely without opening a firewall port
  or setting up a VPN.
- Don’t want to or know how to get an SSL/TLS certificate and HTTPS
  configuration setup.
- Want to block attackers from even being able to access/scan your port and
  server at all.
- Want to block anyone from knowing your home IP address and seeing your
  traffic to your Home Assistant.

The app also offers the possibility to open a SOCKS proxy into the
Tor network. Allowing you to access Tor from any of your (SOCKS supporting)
applications through your Home Assistant installation.

## Installation

The installation of this app is pretty straightforward and not different in
comparison to installing any other Home Assistant app.

1. Click the Home Assistant My button below to open the app on your Home
   Assistant instance.

   [![Open this app in your Home Assistant instance.][app-badge]][app]

1. Click the "Install" button to install the app.
1. Start the "Tor" app
1. Check the logs of the "Tor" app to see if everything went well. The log
   will also display your Tor .onion address.

## Configuration

**Note**: _Remember to restart the app when the configuration is changed._

Example app configuration:

```yaml
log_level: info
socks: true
http_tunnel: false
hidden_services: true
stealth: true
client_names:
  - haremote1
  - haremote2
ports:
  - 8123
bridges: []
```

**Note**: _This is just an example, don't copy and paste it! Create your own!_

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

These log levels also affect the log levels of the Tor program.

### Option: `socks`

Setting this option to `true` opens port `9050` to listen for connections from
SOCKS-speaking applications. Enabling this feature allows you to use other
applications on your network to use the Tor network.

**Note**: _The SOCKS protocol is unencrypted and (as we use it) unauthenticated,
so exposing it in this way could leak your information to anybody watching your
network, and allow anybody to use your computer as an open proxy._

### Option: `http_tunnel`

Setting this option to `true` opens port `9080` to listen for connections from
HTTP-speaking applications. Enabling this feature allows you to use other
applications on your network to access the Tor network via the HTTP proxy.

### Option: `hidden_services`

The `hidden_services` option allows you to enable
[Tor's Hidden Service][tor-hidden-service] feature in this app. You can offer
a web server, SSH server, etc., without revealing your IP address to its users.
In fact, because you do not use any public address, you can run a hidden
service from behind your firewall.

### Option: `stealth`

The “stealth” entry above ensures traffic to and from your Home Assistant
instance over Tor is hidden even from other nodes on the Tor network.

Using a traditional Hidden Service, a hidden server publishes in the Tor network
how to begin communication with it (not its real location). Tor uses a complex
middle nodes link setup for bidirectional route anonymization; the server and
client know nothing about the endpoint's location. A client asks the network how
to reach a Hidden Service with this info.

This option puts the Tor Hidden Service in the authorized client mode. The
hidden server publishes encrypted instructions on how to begin the
communication, a client with the right key can decipher this info.
If you are an authorized client, you can only locate the Hidden Service path
and then try to establish a connection if you have this key.

Enabling `stealth` can prevent a DDOS because if the client does not have the
key, it can not find the path to the server. It does, however, require
configuration of the client as well.

### Option: `client_names`

This option is required as soon as you enable the `stealth` option.

Only clients that are listed here are authorized to access the hidden service.
Valid client names are 1 to 16 characters long and only use characters in
`A-Za-z0-9+-_` (no spaces). If this option is set, the hidden service is not
accessible for clients without authorization anymore.

Clients need to place the generated `.auth_private` file in their Tor
`ClientOnionAuthDir` directory. See the [Tor client access setup](#tor-client-access-setup)
section below for details.

### Option: `ports`

Configures hosts and ports to publish via a Tor Hidden Service.
You can list multiple hosts and ports to publish.

For example:

```yaml
ports:
  - "homeassistant:8123:80"
  - 22
```

The accepted syntax of this configuration is:

- hostname:local_port:published_port `"homeassistant:8123:8080"`
- local_ip:local_port:published_port `"192.168.1.60:8123:8080"`
- hostname:local_port `"homeassistant:8123"`
- local_port:published_port `"8123:8080"`
- local_port `"8123"`

If you do not define a published port, the local port will be used.
If you do not define a hostname or IP address `homeassistant` will be used.

### Option: `bridges`

> Ensure the option value is clear to avoid unintended use of transport plugins and bridges.

Bridges are Tor relays that help you circumvent censorship.
Access to bridges is provided by supported transport plugins:

#### OBFS

Because bridge addresses are not public, you will need to request them yourself. You have a few options:

- Visit [Tor][tor-bridges-obfs4] project and follow the instructions, or
- Email `bridges@torproject.org` from a Gmail, or Riseup email address
- Send a message to @GetBridgesBot on Telegram. Tap on 'Start' or write /start or /bridges in the chat.

For example:

```yaml
bridges:
  - >-
    obfs4 123.45.67.89:443 EFC6A00EE6272355C023862378AC77F935F091E4
    cert=KkdWiWlfetJG9SFrzX8g1teBbgxtsc0zPiN5VLxqNNH+iudVW48CoH/XVXPQntbivXIqZA
    iat-mode=0
```

#### Webtunnel

Visit [Tor][tor-bridges-webtunnel] project and follow the instructions

For example:

```yaml
bridges:
  - >-
    webtunnel 192.0.2.3:1
    DEADBEEFDEADBEEFDEADBEEFDEADBEEFDEADBEEF
    url=https://akbwadp9lc5fyyz0cj4d76z643pxgbfh6oyc-167-71-71-157.sslip.io/5m9yq0j4ghkz0fz7qmuw58cvbjon0ebnrsp0
    ver=0.0.1
```

#### Snowflake

For more information on what Snowflake is, see [what is Snowflake?][what-is-snowflake]. Example:

```yaml
bridges:
  - >-
    snowflake 192.0.2.3:80 2B280B23E1107BB62ABFC40DDCC8824814F80A72
    fingerprint=2B280B23E1107BB62ABFC40DDCC8824814F80A72
    url=https://snowflake-broker.torproject.net/
    ampcache=https://cdn.ampproject.org/
    front=www.google.com
    ice=stun:stun.l.google.com:19302,stun:stun.antisip.com:3478,stun:stun.bluesip.net:3478,stun:stun.dus.net:3478,stun:stun.epygi.com:3478,stun:stun.sonetel.com:3478,stun:stun.uls.co.za:3478,stun:stun.voipgate.com:3478,stun:stun.voys.nl:3478
    utls-imitate=hellorandomizedalpn
```

## Tor client access setup

Using this app, you can access your Home Assistant instance over Tor from
your laptop or mobile device, using Tor Browser and other software.

However, with the `stealth` option enabled, the client needs extra
configuration to be able to connect.

The app generates a key pair for each configured client. The private key file
is stored at `/ssl/tor/hidden_service/clients/<clientname>.auth_private` and
contains a line in this format:

```
<address-without-.onion>:descriptor:x25519:<private-key>
```

Copy this file to a directory on your client device and configure Tor to use
it by adding the following to your `torrc`:

```
ClientOnionAuthDir /path/to/authorized_clients
```

Restart Tor or Tor Browser after adding the file, then browse to the `.onion`
address to connect to your Home Assistant instance.

For [Tor Browser][tor-browser] on Windows, Mac or Linux, place the
`.auth_private` file in the `authorized_clients` folder inside the Tor Browser
data directory. Newer versions of Tor Browser also offer a GUI for managing
client authorization under the connection settings.

For Android, use [Tor Browser for Android][tor-browser-android], which has
built-in support for `.onion` sites. You can also use [Orbot][orbot] in VPN
mode together with another browser to route your traffic through Tor.

For iOS, [Onion Browser][onion-browser] supports accessing `.onion` sites.

You can also use Firefox to access `.onion` domains by routing it through the
SOCKS proxy this app provides (requires `socks: true`, port `9050`). Configure
a SOCKS5 proxy in Firefox pointing to your Home Assistant host on port `9050`.
In `about:config`, also set `network.proxy.socks_remote_dns` to `true` so that
`.onion` hostnames are resolved through Tor rather than your local DNS.

## Resetting your onion address

Each time the app starts for the first time, Tor generates a key pair for
your hidden service. The onion address is derived from that key pair and
remains the same across restarts for as long as the keys exist.

If you want to obtain a fresh onion address (for example, because the
current address is no longer reachable), you need to delete the hidden
service keys. These are stored on the the `/ssl/tor/` directory.

To reset:

1. Stop the Tor app.
2. Delete the contents of the `/ssl/tor/hidden_service/` directory.
3. Start the Tor app again. New keys and a new onion address will be
   generated automatically.

**Note**: _If stealth mode is enabled, the old `.auth_private` client key
files will also be gone. You will need to redistribute the newly generated
keys to all authorized clients._

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

Copyright (c) 2017-2026 Franck Nijhof

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

[app-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[app]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_tor&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/app-tor/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-tor/33822?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/app-tor/issues
[onion-browser]: https://onionbrowser.com
[orbot]: https://guardianproject.info/apps/orbot
[reddit]: https://reddit.com/r/homeassistant
[tor-browser]: https://www.torproject.org/download/
[tor-browser-android]: https://www.torproject.org/download/#android
[releases]: https://github.com/hassio-addons/app-tor/releases
[semver]: http://semver.org/spec/v2.0.0.htm
[tor-hidden-service]: https://www.torproject.org/docs/hidden-services.html.en
[tor-bridges-obfs4]: https://bridges.torproject.org/bridges/?transport=obfs4
[tor-bridges-webtunnel]: https://bridges.torproject.org/bridges/?transport=webtunnel
[what-is-snowflake]: https://support.torproject.org/censorship/what-is-snowflake/
