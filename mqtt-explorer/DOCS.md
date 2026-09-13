# Home Assistant Community App: MQTT Explorer

[MQTT Explorer][mqtt-explorer] shows what is going on inside an MQTT broker.
Every topic it sees is laid out in a tree, with the last message on it, how
often it changes and what it looked like before. Values can be plotted as they
come in, messages can be published back, and the whole tree stays searchable
while it fills up.

It is a desktop application first, and this app runs its web edition: the
same interface, served from Home Assistant and opened from the sidebar.

## Installation

The installation of this app is pretty straightforward and not different in
comparison to installing any other Home Assistant app.

1. Click the Home Assistant My button below to open the app on your Home
   Assistant instance.

   [![Open this app in your Home Assistant instance.][addon-badge]][addon]

1. Click the "Install" button to install the app.
1. Start the "MQTT Explorer" app.
1. Check the logs of the "MQTT Explorer" app to see if everything went well.
1. Click the "OPEN WEB UI" button to open MQTT Explorer.

## Connecting to a broker

MQTT Explorer opens on its connection dialog: a list of brokers it knows about
on the left, the settings of the selected one on the right, and a "Connect"
button. Once connected, the tree fills up with everything the broker has.

### The broker Home Assistant uses

If a broker app that registers itself with Home Assistant is installed, such
as the [Mosquitto broker][mosquitto], its address and credentials are handed
to apps that ask for them. This app asks, and puts that broker at the top of
the list as "Home Assistant", ready to connect to.

The credentials are the ones the broker hands out for apps, not your own Home
Assistant login, and they are looked up again every time this app starts. If
the broker rotates them, or you swap one broker app for another, the entry
follows along without you doing anything.

That refresh only touches the fields that come from Home Assistant: the host,
the port, the username, the password and whether TLS is used. Anything else
you change on that entry from inside MQTT Explorer, its name, the topics it
subscribes to, or the client ID, stays as you left it. Deleting the entry does
not stick; it is put back on the next start.

If there is no such broker, the list starts out empty and the log says so.

### Other brokers

Any other broker is added with the "+" in the connection dialog, exactly as in
the desktop application. That includes brokers over TLS with self-signed or
client certificates, which are uploaded from the "Advanced" settings of the
connection and kept by this app.

## Configuration

**Note**: _Remember to restart the app when the configuration is changed._

Example app configuration:

```yaml
log_level: info
```

**Note**: _This is just an example, don't copy and paste it! Create your own!_

Everything about MQTT Explorer itself is configured inside MQTT Explorer, and
is kept across restarts and updates.

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

## Access and security

MQTT Explorer is only reachable through Home Assistant's Ingress, in a panel
on the sidebar, and nothing is exposed to your network. There is no port to
publish.

That is deliberate. Home Assistant has already established who is at the other
end before a request reaches this app, so MQTT Explorer's own login is
switched off rather than asked for a second time. What is kept in this app,
the credentials of every broker it knows, is what that login would otherwise
guard, and Home Assistant's is the stronger one.

Ingress is only available to administrators of your Home Assistant instance,
so that is who this comes down to: every administrator can open the panel, and
everyone who can open the panel can read and publish to every broker in the
list, with the credentials stored for it.

## Where things are kept

Everything MQTT Explorer keeps lives in this app's storage: the connections
and their credentials, the settings made in its interface, and the
certificates and files uploaded through it. It is part of a backup of this app
and comes back with a restore.

The broker credentials in there are in plain text, as they are in the desktop
application's own settings file. A backup of this app contains them.

## Known quirks

- MQTT Explorer publishes releases of its desktop application only. Its web
  edition lives on the development branch, so this app follows that branch by
  commit and is built from source. It is the same code the upstream Docker
  image ships, but it can change in ways a release note would have warned
  about, which is one reason updates to this app are not made automatically.
- MQTT Explorer checks GitHub for new releases and would tell you one is out.
  Updates arrive through this app rather than from inside MQTT Explorer.
- Every browser tab that has MQTT Explorer open holds its own connection to
  the broker, and drops it when the tab is closed. A connection made in one
  tab is not visible in another.

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
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_mqtt-explorer&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/app-mqtt-explorer/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/app-mqtt-explorer/issues
[mosquitto]: https://github.com/home-assistant/addons/tree/master/mosquitto
[mqtt-explorer]: https://mqtt-explorer.com/
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/app-mqtt-explorer/releases
[semver]: https://semver.org/spec/v2.0.0.html
