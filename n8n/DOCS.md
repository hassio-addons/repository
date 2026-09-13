# Home Assistant Community App: n8n

[n8n][n8n] is a workflow automation platform for technical people: a visual
editor in which you wire together hundreds of services, from HTTP requests,
webhooks and schedules to databases, chat platforms and AI models, with a bit
of JavaScript in between wherever you need it.

This app runs n8n inside Home Assistant, in a panel on the sidebar, with a
credential for this Home Assistant installation already in place, and ones
for your MQTT broker and MariaDB as well when those are to be found.

## Installation

The installation of this app is pretty straightforward and not different in
comparison to installing any other Home Assistant app.

1. Click the Home Assistant My button below to open the app on your Home
   Assistant instance.

   [![Open this app in your Home Assistant instance.][addon-badge]][addon]

1. Click the "Install" button to install the app.
1. Start the "n8n" app.
1. Check the logs of the "n8n" app to see if everything went well.
1. Click the "OPEN WEB UI" button to open n8n.
1. n8n asks you to make an owner account the first time. This account is
   n8n's own, separate from your Home Assistant login.

The first start takes a minute or two: n8n prepares its database and compiles
its editor for the Ingress path. Later starts are quicker.

## Home Assistant and MQTT out of the box

Open the credentials page in n8n and there is a **Home Assistant** credential
waiting. Pick it in a Home Assistant node and it reaches this Home Assistant
installation, with no long-lived access token to make or paste: the app itself
is what Home Assistant trusts, and the credential rides on that.

When an MQTT broker on this system announces itself, as the
[Mosquitto broker app][mosquitto] does, there is an **MQTT (Home Assistant)**
credential next to it, filled in with the broker's address and the login the
Supervisor made for this app. The MQTT node and the MQTT trigger take it as
they are. The [MariaDB app][mariadb] gets the same treatment: a
**MariaDB (Home Assistant)** credential for the MySQL node, opened on the
`mysql` schema, so a query names the one it wants, as in
`SELECT * FROM homeassistant.states`.

All of them are kept up to date: change the broker's login and the credential
follows on the next start. That also means they are not yours to edit; a
change you make to any of them is put back. Turn
[`home_assistant_credential`](#option-home_assistant_credential),
[`mqtt_credential`](#option-mqtt_credential) or
[`mariadb_credential`](#option-mariadb_credential) off if you would rather
manage them yourself. The credentials that are already there stay, and are
yours from then on.

## Starting a workflow from Home Assistant

The Home Assistant node is for n8n to act on Home Assistant. The other way
round, a Home Assistant automation starting a workflow, goes over a webhook,
and for that Home Assistant needs no published port: it shares the internal
network with this app and reaches it there by hostname, over plain HTTP,
whatever the [`ssl`](#option-ssl) option says.

Give the workflow a Webhook trigger, and call it from a
[`rest_command`][rest-command] in your Home Assistant configuration:

```yaml
rest_command:
  n8n_doorbell:
    url: "http://a0d7b954-n8n:5678/webhook/doorbell"
    method: POST
    content_type: application/json
    payload: '{"camera": "{{ camera }}"}'
```

The hostname is the app's slug prefixed with the repository id, which is what
the start-up log shows as well.

## Configuration

**Note**: _Remember to restart the app when the configuration is changed._

Example app configuration:

```yaml
log_level: info
home_assistant_credential: true
mqtt_credential: true
mariadb_credential: true
webhook_url: https://n8n.example.com/
ssl: true
certfile: fullchain.pem
keyfile: privkey.pem
env_vars:
  - name: EXECUTIONS_DATA_MAX_AGE
    value: "72"
```

**Note**: _This is just an example, don't copy and paste it! Create your own!_

Most of what n8n does is configured from inside n8n itself. The options below
are the ones that have to be settled before it starts.

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

n8n has fewer levels of its own, so `trace` is folded into `debug`, `notice`
into `info`, and `fatal` into `error`.

### Option: `home_assistant_credential`

Keeps the ready-made **Home Assistant** credential in n8n, and is `true` by
default. See [Home Assistant and MQTT out of the box](#home-assistant-and-mqtt-out-of-the-box).

### Option: `mqtt_credential`

Keeps the ready-made **MQTT (Home Assistant)** credential in n8n, for the
broker announced on this system, and is `true` by default. Without such a
broker there is nothing to make, and this option does nothing.

### Option: `mariadb_credential`

Keeps the ready-made **MariaDB (Home Assistant)** credential in n8n, for the
[MariaDB app][mariadb], and is `true` by default. Without that app there is
nothing to make, and this option does nothing.

### Option: `webhook_url`

The address n8n hands out for webhooks, forms and OAuth callbacks, for example
`https://n8n.example.com/`.

Set it when something of your own sits in front of the
[published port](#direct-access): a reverse proxy such as the
[NGINX Proxy Manager app][nginx-proxy-manager], or a tunnel. Left empty, n8n
uses the published port on this Home Assistant host, at an address such as
`http://homeassistant.local:5678/`.

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

### Option: `max_old_space_size`

Sets the maximum size (in MB) of the Node.js heap. Raise it when n8n runs out
of memory on large workflows or executions; leave it out to let Node.js decide.

### Option: `env_vars`

n8n takes a great many settings from [environment variables][n8n-env], far
more than this app has options for. This option sets any of them, as a list
of `name` and `value` pairs:

```yaml
env_vars:
  - name: N8N_METRICS
    value: "true"
  - name: EXECUTIONS_DATA_MAX_AGE
    value: "72"
```

The variables this app sets to make n8n work inside Home Assistant, such as
the port it listens on, the path it is served from, and where it keeps its
data, win over anything set here.

## Direct access

By default this app is only reachable through Home Assistant's Ingress, in a
panel on the sidebar, and nothing is exposed to your network.

Ingress is fine for building and running workflows, but a webhook is meant to
be called by something else: a service on the internet, a script, another
app. Those cannot get through Ingress, which only admits a browser signed in
to Home Assistant. Set a port for "Web interface and webhooks" in the
"Network" section of the app configuration to publish n8n on your network,
and the webhook, form and OAuth callback addresses n8n hands out point there
from then on.

n8n's own login screen guards the editor on that port; webhooks and forms are
open, as they are meant to be. Turn on [`ssl`](#option-ssl) if you expose it to
anything you do not trust, and put a reverse proxy in front of it rather than
forwarding it from the internet directly.

The editor on the published port lives at the same path it has on Ingress,
and the port's root sends a browser there.

## Files

Workflows can read and write files with the "Read/Write Files from Disk"
node. To keep them out of the app's own data, they are limited to these
directories:

- `/config`: this app's own configuration directory, found under
  `/addon_configs` on the Home Assistant host.
- `/share`: the directory apps share files through.
- `/media`: the media directory.

## Backups

This app is backed up cold, which means Home Assistant stops it for the moment
it takes to copy its database. A database copied while it is being written to
can come back subtly broken.

That backup holds everything n8n owns: the workflows, the credentials, the
executions, and the key the credentials are encrypted with. Community nodes
are listed in it but their files are not; n8n installs them again on the
first start after a restore.

## Known quirks

- Home Assistant's own login does not sign you in to n8n. n8n has accounts of
  its own, and the owner account you make on the first start is the way in.
- A webhook address n8n shows while no port is published carries the Ingress
  path, which only a browser signed in to Home Assistant can use. Home
  Assistant itself uses the [internal address](#starting-a-workflow-from-home-assistant)
  instead; publish the port, or set [`webhook_url`](#option-webhook_url), to
  hand out addresses that work from elsewhere.
- The Home Assistant credential reaches Home Assistant through the Supervisor
  and does what the app is allowed to do. It cannot open the Home Assistant
  login of a particular user.
- The Code node runs JavaScript. Its Python flavour needs a separate Python
  runner that n8n does not ship on npm, so it is not available here, and n8n
  says as much in the log on every start.
- n8n's own "check for updates" and its usage reporting are turned off.
  Updates to this app arrive through the Home Assistant app store.

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
- The [n8n documentation][n8n-docs] and [n8n community][n8n-community]

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
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_n8n&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/app-n8n/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/app-n8n/issues
[mariadb]: https://github.com/home-assistant/addons/tree/master/mariadb
[mosquitto]: https://github.com/home-assistant/addons/tree/master/mosquitto
[n8n-community]: https://community.n8n.io
[n8n-docs]: https://docs.n8n.io
[n8n-env]: https://docs.n8n.io/hosting/configuration/environment-variables/
[n8n]: https://n8n.io
[nginx-proxy-manager]: https://github.com/hassio-addons/app-nginx-proxy-manager
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/app-n8n/releases
[rest-command]: https://www.home-assistant.io/integrations/rest_command/
[semver]: https://semver.org/spec/v2.0.0.html
