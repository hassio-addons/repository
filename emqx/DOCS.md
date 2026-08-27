# Home Assistant Community App: EMQX

[EMQX][emqx] is an MQTT broker with a high-performance real-time message
processing engine, powering event streaming for IoT devices at massive scale.
As the most scalable MQTT broker, EMQX can help you connect any device, at any
scale (including your home).

The [EMQX MQTT broker][emqx] is an advanced alternative to the Mosquitto MQTT
broker/app that is generally used in Home Assistant. It has a UI
to configure, manage, and debug your MQTT broker, clients, and traffic.

While EMQX sells their product mainly as a cloud hosted product on their
website, this app runs EMQX in a fully local, self-hosted environment.

As of version 5.9.0, EMQX is no longer open source; it is licensed under the
[Business Source License 1.1][emqx-license]. The build shipped here carries the
EMQX Community License, which is free of charge, does not expire, and covers a
single node with up to 10 million concurrent sessions. Clustering is the part
that needs a commercial license, and this app has never clustered.

## Installation

The installation of this app is pretty straightforward and not different in
comparison to installing any other Home Assistant app.

1. Click the Home Assistant My button below to open the app on your Home
   Assistant instance.

   [![Open this app in your Home Assistant instance.][addon-badge]][addon]

1. Click the "Install" button to install the app.
1. Start the "EMQX" app.
1. Check the logs of the "EMQX" app to see if everything went well.
1. Open the Web UI.
1. Log in with the default credentials: username `admin` and password `public`.
1. Be sure to first set up authentication in for your MQTT client, but setting
   up an authentication method in the EMQX web UI under "Access Control" ->
   "Authentication".
1. Read the step above again and **make sure** you have set up authetication.

_Notes:_

- When configuring Home Assistant, Zigbee2MQTT or any other MQTT application
  or client on your Home Assistant machine to connect to eMQX, use
  `homeassistant` or `a0d7b954-emqx` as the broker/hostname to connect to.
  In some cases, just `localhost` will work as well.
- When connecting external devices to your EMQX app, use the IP address or
  hostname of your Home Assistant instance as the broker/hostname to connect to.

## Configuration

You most likely don't need these configuration options. Almost all
configuration can be done via the web UI that is available in this app.
Some more advanced/complex configuration options are not available in the
web UI, but can be configured using this option (for example, when
setting up clustering of multiple instances).

**Note**: _Remember to restart the app when the configuration is changed._

Example app configuration:

```yaml
env_vars:
  - name: EMQX_NODE__NAME
    value: "emqx@stable.example"
```

**Note**: _This is just an example, don't copy and paste it! Create your own!_

### Option: `env_vars`

This option allows you to tweak every aspect of EMQX by setting
configuration options using environment variables. See the example at the
start of this chapter to get an idea of how the configuration looks.

For more information about using these variables, see the official EMQX
documentation:

<https://docs.emqx.com/en/emqx/v6.2/configuration/configuration.html#environment-variables>

**Note**: _Only environment variables starting with `EMQX_` are accepted.\_

### The EMQX node name

EMQX stores its database in a directory named after its node name, and this app
used to derive that name from the Home Assistant hostname. Renaming your Home
Assistant instance therefore pointed EMQX at a fresh, empty database, leaving
the old one on disk but out of reach.

The node name is now decided once and kept in `/data/emqx/node.name`:

- A new installation uses `emqx@127.0.0.1`.
- An existing installation keeps the name its database already carries, so
  nothing moves when you update.

You do not need to configure anything. If you want a specific name anyway, set
`EMQX_NODE__NAME` through `env_vars` and it wins over both of the above.

If a hostname change already left you with more than one database directory
under `/data/emqx/data/mnesia`, this app cannot tell which one you meant to
keep. It logs the names it found and then picks one of two ways out. If one of
them matches your current hostname it uses that, and you get the data in that
directory. If none of them match it uses `emqx@127.0.0.1`, which is a directory
that does not exist yet, so EMQX starts empty and looks freshly installed with
your data untouched beside it. Either way, set `EMQX_NODE__NAME` to the
directory you want and restart, or use [EMQX backup and restore][backup-restore]
to merge them.

## Known issues and limitations

- This app cannot run simultaneously with the Mosquitto app.
- EMQX uses ports 1883, 8083, 8084, and 8883 by default. It is possible
  one of your existing apps conflicts with that. In such cases, either
  change the ports of the other app or change the listner ports of EMQX.
  To change the ports of EMQX, you will need to temporary stop the conflicting
  app, as you need to access the EMQX web UI to change the listner ports.
- The WebRTC integration by AlexxIT is known to cause a port conflict on
  port 8083. Temporary disabling the integration (similar as the point above
  for apps) can be used to allow accessing the EMQX web UI to adjust the
  listeners.

## Upgrading from EMQX 5

This app has moved from EMQX 5.8.9 to EMQX 6. EMQX 6 reads the existing data
directory in place, so dashboard users, authentication records, rules and
retained messages carry over on the first start.

One thing does not carry over. EMQX
[does not preserve durable session state][rolling-upgrades] across the version 5
to version 6 boundary: clients holding one reconnect into a clean session, and
the messages queued for them while they were away are gone. This only affects
you if you turned durable sessions on yourself through
`EMQX_DURABLE_SESSIONS__ENABLE`, since EMQX ships with them disabled. Ordinary
retained messages are unaffected.

A major version change is still a good moment for a backup. Downgrading back to
EMQX 5 is not something EMQX supports, so take one before updating if you want a
way back. The app data lives in `/data/emqx`, which the Home Assistant backup of
this app covers.

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

You could also [open an issue here][issue] on GitHub.

## Authors & contributors

The original setup of this repository is by [Franck Nijhof][frenck].

For a full list of all authors and contributors,
check [the contributors' page][contributors].

## License

MIT License

Copyright (c) 2023-2026 Franck Nijhof

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
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_emqx&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[backup-restore]: https://docs.emqx.com/en/emqx/latest/operations/backup-restore.html
[contributors]: https://github.com/hassio-addons/app-emqx/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[emqx-license]: https://github.com/emqx/emqx/blob/main/LICENSE
[emqx]: https://www.emqx.io/
[forum]: https://community.home-assistant.io/?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/app-emqx/issues
[reddit]: https://reddit.com/r/homeassistant
[rolling-upgrades]: https://docs.emqx.com/en/emqx/latest/deploy/rolling-upgrades.html
[releases]: https://github.com/hassio-addons/app-emqx/releases
[semver]: https://semver.org/spec/v2.0.0.html
