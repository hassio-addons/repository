# Home Assistant Community Add-on: Grafana

The analytics platform for all your metrics.

Grafana allows you to query, visualize, alert on and understand your metrics
no matter where they are stored. Create, explore, and share dashboards. Learn
about your Home Automation system using sexy and compelling graphs, and other
data visualizations.

Combine this add-on with the InfluxDB add-on to get insanely powerful
insights to your home.

## Installation

The installation of this add-on is pretty straightforward and not different in
comparison to installing any other Home Assistant add-on.

1. Click the Home Assistant My button below to open the add-on on your Home
   Assistant instance.

   [![Open this add-on in your Home Assistant instance.][addon-badge]][addon]

1. Click the "Install" button to install the add-on.
1. Start the "Grafana" add-on.
1. Check the logs of the "Grafana" to see if everything went well.
1. Open the Web UI.

**Note**: As the addon now supports both Ingress and direct access, the default
`admin` user has a password of `hassio`. **Due to the implementation the
password cannot be changed, however you can delete and create a new user, if so
please ensure to update the `grafana_ingress_user` option.**

## Configuration

**Note**: _Remember to restart the add-on when the configuration is changed._

Example add-on configuration:

```yaml
log_level: info
grafana_ingress_user: frenck
plugins:
  - ayoungprogrammer-finance-datasource
  - grafana-clock-panel
env_vars:
  - name: GF_DEFAULT_INSTANCE_NAME
    value: Hassio
```

**Note**: _This is just an example, don't copy and paste it! Create your own!_

### Option: `log_level`

The `log_level` option controls the level of log output by the addon and can
be changed to be more or less verbose, which might be useful when you are
dealing with an unknown issue. Possible values are:

- `trace`: Show every detail, like all called internal functions.
- `debug`: Shows detailed debug information.
- `info`: Normal (usually) interesting events.
- `warning`: Exceptional occurrences that are not errors.
- `error`: Runtime errors that do not require immediate action.
- `fatal`: Something went terribly wrong. Add-on becomes unusable.

Please note that each level automatically includes log messages from a
more severe level, e.g., `debug` also shows `info` messages. By default,
the `log_level` is set to `info`, which is the recommended setting unless
you are troubleshooting.

### Option: `grafana_ingress_user`

When using Ingress grafana will automatically log in by default with a username
of `admin`. If a different user is required this option can be set.

### Option: `plugins`

Allows you to specify additional Grafana plugins to be installed to your
Grafana setup. For a list of available plugins, see:

<https://grafana.com/plugins>

**Note**: _Adding plugins will result in a longer start-up for the add-on._

### Option: `custom_plugins`

Allows you to specify additional Grafana custom plugins to be installed to your
Grafana setup from an URL.
You must specify the property `url` to the plugin configuration.

If you want to install unsigned plugins, you must also set the `unsigned` property to `true`:

```yaml
custom_plugins:
  - name: my-plugin-name
    url: https://github.com/my-repo/my-plugin-name/releases/download/0.1.0/my-plugin-name-0.1.0.zip
    unsigned: true
```

### Option: `env_vars`

This option allows you to tweak every aspect of Grafana by setting
configuration options using environment variables. See the example at the
start of this chapter to get an idea of how the configuration looks.

For more information about using these variables, see the official Grafana
documentation:

<http://docs.grafana.org/installation/configuration/#using-environment-variables>

**Note**: _Only environment variables starting with `GF_` are accepted.\_

## Using it with the InfluxDB Community add-on

Grafana does not come out of the box pre-configured, but letting it interact
with the community [InfluxDB add-on][influxdb-addon] is pretty easy. Please,
follow the instructions from the on how to [create a database][create-db]
for Home Assistant.

1. Create a new user for Grafana on InfluxDB
   (InfluxDB Admin -> Users and "+ Create User")
1. Login into Grafana
1. Create a new datasource:

- Name: Anything you want, e.g., Home Assistant
- Type: InfluxDB
- HTTP > URL: `http://a0d7b954-influxdb:8086`
- HTTP > Access: Server (Default)
- Auth: (leave them all disabled)
- InfluxDB Details > Database: _Your Home Assistant InfluxDB database_,
  e.g., `homeassistant`
- InfluxDB Details > User: _Grafana InfluxDB username defined in step 1_
- InfluxDB Details > Password: _Grafana InfluxDB user password defined_
  _in step 1_

1. Hit Save & Test

## Anonymous Access

Anonymous access on a local network is possible by exposing the port in the
add-on configuration, along with setting the following environment variables:

```yaml
env_vars:
  - name: GF_AUTH_ANONYMOUS_ENABLED
    value: "true"
  - name: GF_AUTH_ANONYMOUS_ORG_NAME
    value: "Main Org."
  - name: GF_AUTH_ANONYMOUS_ORG_ROLE
    value: "Viewer"
```

It is not possible to enable anonymous or non-administrator access with Home
Assistant Cloud. This includes embedding Grafana resources with an iframe or
rendered image inside of a dashboard. For more details see
[Anonymous login not working, Grafana add-on 3.0.0 #55](https://github.com/hassio-addons/addon-grafana/issues/55).

## Known issues and limitations

- This add-on does support ARM-based devices, nevertheless, they must
  at least be an ARMv7 device. (Raspberry Pi 1 and Zero is not supported).
- `To render a panel image, you must install the Grafana Image Renderer plugin.`
  This message is shown on ARM devices, like a Raspberry Pi. The Grafana Image
  Renderer plugin is not available for these devices.

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

- The [Home Assistant Community Add-ons Discord chat server][discord] for add-on
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

Copyright (c) 2018-2024 Franck Nijhof

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
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_grafana&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/addon-grafana/graphs/contributors
[create-db]: https://github.com/hassio-addons/addon-influxdb/blob/main/influxdb/DOCS.md#integrating-into-home-assistant
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-grafana/54674?u=frenck
[frenck]: https://github.com/frenck
[influxdb-addon]: https://github.com/hassio-addons/addon-influxdb
[issue]: https://github.com/hassio-addons/addon-grafana/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-grafana/releases
[semver]: https://semver.org/spec/v2.0.0.html
