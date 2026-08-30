# Home Assistant Community App: VictoriaMetrics

[VictoriaMetrics][victoriametrics] is a fast, cost effective and scalable time
series database. It speaks the Prometheus query language and API, but stores
the same data in a fraction of the space and happily runs on the kind of
hardware Home Assistant tends to live on.

Home Assistant's own recorder is built to answer "what is happening now". It is
not built to answer "how has this changed over the past three years", and
keeping enough history around to do so makes it slower at the job it is
actually for. This app gives those long term numbers a home of their own: point
it at Home Assistant, pick how long to keep things, and query the result from
its built-in web interface or from Grafana.

## Installation

The installation of this app is pretty straightforward and not different in
comparison to installing any other Home Assistant app.

1. Click the Home Assistant My button below to open the app on your Home
   Assistant instance.

   [![Open this app in your Home Assistant instance.][addon-badge]][addon]

1. Click the "Install" button to install the app.
1. Start the "VictoriaMetrics" app.
1. Check the logs of the "VictoriaMetrics" app to see if everything went well.
1. Click the "OPEN WEB UI" button to open the VictoriaMetrics web interface.

The database starts empty and collects nothing on its own. What you do next
depends on where your metrics are coming from:

- To collect them from Home Assistant, follow
  [Collecting Home Assistant metrics](#collecting-home-assistant-metrics), or
  have Home Assistant push them with
  [the InfluxDB integration](#sending-home-assistant-metrics-with-the-influxdb-integration).
- To collect them from other machines, see
  [Collecting metrics from elsewhere](#collecting-metrics-from-elsewhere).
- To have something else send them here, see
  [Writing metrics from elsewhere](#writing-metrics-from-elsewhere).

## Collecting Home Assistant metrics

Home Assistant can publish everything it knows in the format this database
speaks, but only once the [Prometheus integration][prometheus] is enabled.
Adding this to your `configuration.yaml` is enough:

```yaml
prometheus:
```

Restart Home Assistant, then turn on the `home_assistant` option of this app
and restart it as well. Give it a few minutes and try a query like
`homeassistant_sensor_temperature_celsius` to see what came in.

That integration takes filters of its own, which is where you decide _which_
entities end up in here. Sending everything is a fine place to start, but on a
large installation it is worth excluding the entities you know you will never
plot.

This app reaches that endpoint through the Supervisor, so there is no access
token to create and no address to fill in. If it cannot reach it at startup,
the log says so and tells you what to add.

## Sending Home Assistant metrics with the InfluxDB integration

VictoriaMetrics also speaks the InfluxDB line protocol, so Home Assistant's
[InfluxDB integration][influxdb] can write straight into it. This is the other
way round from the option above: Home Assistant pushes as things change,
instead of this app pulling every scrape interval.

Pick this one if you already run that integration, if you would rather use its
`include`/`exclude` filtering than the Prometheus integration's, or if you want
a value recorded the moment it changes. Pick the scrape route if you want the
regular heartbeat that most Prometheus tooling and Grafana dashboards assume.
Running both means storing everything twice.

**Note**: _Home Assistant allows only one `influxdb:` block. If you already
send to an InfluxDB database and want to keep it, you cannot point a second one
here, so use [the scrape route](#collecting-home-assistant-metrics) instead:
the two collect independently and can run side by side._

This route needs the port under [Direct access](#direct-access), since the
integration is not a browser and cannot go through Ingress. Point the
integration at it with a Home Assistant username and password, which is what
the port's authentication check accepts:

```yaml
influxdb:
  host: a0d7b954-victoriametrics
  port: 8428
  ssl: false
  api_version: 1
  username: your-ha-user
  password: your-ha-password
  database: home_assistant
  measurement_attr: entity_id
  tags_attributes:
    - friendly_name
    - unit_of_measurement
  ignore_attributes:
    - device_class
    - editable
    - icon
    - options
    - state_class
    - supported_features
  include:
    domains:
      - binary_sensor
      - climate
      - sensor
      - switch
```

**Note**: _`api_version` must be `1`, which is the default. Version 2 sends a
token instead of a username and password, and this app has no way to check
that against Home Assistant._

### What the data looks like

The measurement and the field name are joined into the metric name, and the
tags become labels. With `measurement_attr: entity_id`, a
`sensor.office_temperature` reading of `21.5` arrives as:

```text
office_temperature_value{db="home_assistant", domain="sensor",
                         entity_id="office_temperature",
                         friendly_name="Office Temperature"} 21.5
```

So queries end in `_value`, and the `database` you configure comes along as a
`db` label.

**Note**: _Set `measurement_attr` to `entity_id` as shown above. Its default is
`unit_of_measurement`, which names the measurement after the unit, and a
temperature sensor then turns into a metric literally called `°C_value`.
`domain__device_class` is the other sensible choice._

### Keep the attributes under control

The integration sends every attribute of an entity as a separate field, and
each field becomes a metric of its own. Left alone, one temperature sensor
does not produce one metric, it produces five:

```text
office_temperature_value           <- the one you wanted
office_temperature_state
office_temperature_icon            <- "mdi:thermometer"
office_temperature_friendly_name   <- "Office"
office_temperature_device_class    <- "temperature"
```

Multiply that by every entity in the house and most of the database is text
attributes that never change. `ignore_attributes` is what prunes them, and the
list in the example above covers the usual offenders; add to it whenever you
spot a metric you have no use for.

The two attributes worth keeping are in `tags_attributes` instead, which turns
them into labels on the metric rather than metrics of their own. That is where
`unit_of_measurement` matters: naming the measurement after the `entity_id`
means the unit is no longer part of the name, so without this you have no idea
whether a number is Celsius or Fahrenheit.

### What this route cannot do

Only the writing half of InfluxDB is supported. VictoriaMetrics answers
`/query` with just enough to keep InfluxDB clients happy during their initial
handshake, and does not run InfluxQL or Flux at all.

So the [InfluxDB sensor platform][influxdb-sensor], which reads values back out
of a database and into Home Assistant, does not work against this app. Query
the data from Grafana or `vmui` instead.

## Collecting metrics from elsewhere

To scrape targets other than Home Assistant, for example a router, a NAS or a
`node_exporter` running on another machine, write a file with the Prometheus
`scrape_configs` you want and point the `scrape_config` option at it.

The file goes in this app's own configuration directory, which you can reach
with the [File editor][file-editor] app or over Samba, and only its
`scrape_configs` section is read:

```yaml
scrape_configs:
  - job_name: nas
    static_configs:
      - targets:
          - 192.168.1.10:9100
```

These jobs are added to the Home Assistant one rather than replacing it. The
configuration is checked when the app starts; if something in it is wrong, the
app stops with the parse error in its log instead of starting up half working.

## Writing metrics from elsewhere

VictoriaMetrics also accepts data that is pushed to it, in Prometheus remote
write, InfluxDB, Graphite, OpenTSDB and DataDog formats among others. Anything
that can send to one of those can send here, once the port is exposed as
described under [Direct access](#direct-access). See the
[upstream documentation][data-ingestion] for the exact endpoints.

Home Assistant itself can do this through its InfluxDB integration, which has
[a section of its own](#sending-home-assistant-metrics-with-the-influxdb-integration).

## Viewing your metrics

The app ships with `vmui`, VictoriaMetrics' own web interface, which is what
the "OPEN WEB UI" button opens. It is good at exploring: run a query, see the
graph, look at what labels exist. For dashboards you will want Grafana.

## Using it with the Grafana app

The [Grafana app][grafana-addon] is the other half of this setup. It does not
come pre-configured, so the data source is added by hand once.

First, set a port for "HTTP API & web interface" in the "Network" section of
**this** app's configuration, as described under
[Direct access](#direct-access). Grafana runs in its own container and talks to
this one over the network, which Ingress does not allow.

Then, optionally but worth it, add VictoriaMetrics' own data source to the
Grafana app's `plugins` option and restart it:

```yaml
plugins:
  - victoriametrics-metrics-datasource
```

It teaches Grafana [MetricsQL][metricsql], so the extra functions turn up in
the query builder with autocomplete instead of having to be typed blind. The
[gaps](#why-graphs-have-gaps) further down are much less annoying to deal with
when the editor knows what you are writing.

Now create the data source in Grafana:

1. Log in to Grafana.
1. Create a new data source:

   - Name: anything you want, e.g., VictoriaMetrics
   - Type: **VictoriaMetrics** if you installed the plugin above, otherwise
     **Prometheus**
   - HTTP > URL: `http://a0d7b954-victoriametrics:8428`
   - HTTP > Access: Server (Default)
   - Auth: enable **Basic auth**
   - Basic Auth Details > User: _your Home Assistant username_
   - Basic Auth Details > Password: _your Home Assistant password_

1. Hit Save & Test.

**Note**: _Use this app's hostname rather than your Home Assistant IP address.
Both apps sit on the same internal network, so the traffic never has to leave
the machine._

The credentials are a real Home Assistant login, because that is what guards
the port; see [Direct access](#direct-access). Making a separate Home Assistant
user for Grafana is a tidy way to keep it out of your own account.

VictoriaMetrics also answers the Prometheus API under `/prometheus`, so you may
see `http://a0d7b954-victoriametrics:8428/prometheus` in guides written for
other setups. Both work.

### Writing queries

If you went with the Prometheus data source type, Grafana sends the query
through untouched, so MetricsQL still works, but the query builder does not
know those functions exist. Switch the panel to "Code" mode to use one.

That matters more than it sounds, because of how Home Assistant records things.

## Why graphs have gaps

This is the single most common surprise, and it is not a fault in either
Home Assistant or this app.

Home Assistant only records a value **when it changes**. A switch that has been
on all afternoon is one data point, not one every minute. Prometheus style
databases assume the opposite, that samples arrive on a steady beat, so once
the last sample falls outside the lookback window the line simply stops. You
get a graph that is drawn for a while and then goes blank, even though nothing
is missing.

Two things fix it, and it is worth doing both:

1. In the panel, set **Connect null values** to **Always**.
2. Wrap the query in `keep_last_value()`, in "Code" mode:

   ```promql
   keep_last_value(office_temperature_value)
   ```

`keep_last_value()` carries the last known value forward until the next one
arrives, which is exactly how Home Assistant's own history graphs read the same
data. Over a six hour window with a sensor that changed twice, a plain query
returns points for the first hour or so and nothing after; the same query
wrapped in `keep_last_value()` returns the full line.

## Configuration

**Note**: _Remember to restart the app when the configuration is changed._

Example app configuration:

```yaml
log_level: info
home_assistant: true
scrape_interval: 60s
retention_period: 3y
min_free_disk_space: 1GB
ssl: true
certfile: fullchain.pem
keyfile: privkey.pem
```

**Note**: _This is just an example, don't copy and paste it! Create your own!_

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

VictoriaMetrics has fewer levels of its own, so `trace`, `debug`, `info` and
`notice` all put it in `INFO`, `warning` in `WARN`, `error` in `ERROR` and
`fatal` in `FATAL`.

### Option: `home_assistant`

Collect the metrics Home Assistant exposes about itself and your entities.
Off by default, since it only works once the
[Prometheus integration][prometheus] is enabled, as described above.

Leave it off if you would rather collect those metrics some other way, or if
this database is only here to receive data pushed to it from elsewhere. The
[InfluxDB integration](#sending-home-assistant-metrics-with-the-influxdb-integration)
is the other way to get Home Assistant's own data in here; there is no point
running both unless you want it stored twice.

### Option: `scrape_interval`

How often metrics are collected from every target, for example `60s`, `30s` or
`5m`.

A shorter interval gives you more detail and costs more disk space and more
work for Home Assistant on every scrape. `60s` is plenty for the kind of
things a home produces; going below `30s` is rarely worth it.

### Option: `scrape_config`

The name of a YAML file in this app's configuration directory that holds extra
`scrape_configs` jobs, as described under
[Collecting metrics from elsewhere](#collecting-metrics-from-elsewhere).

Leave it empty when Home Assistant is the only thing you collect from.

### Option: `retention_period`

How long metrics are kept before they are deleted automatically.

Use a number with one of these suffixes:

| Suffix | Meaning |
| ------ | ------- |
| `s`    | Second  |
| `h`    | Hour    |
| `d`    | Day     |
| `w`    | Week    |
| `M`    | Month   |
| `y`    | Year    |

For example `1y`, `18M` or `90d`. Without a suffix the number counts months.

**Warning**: _The month suffix is a capital `M`. A lower case `m` means minutes
and is rejected, rather than quietly throwing away everything older than a few
minutes. The app refuses to start on a value it does not understand and tells
you why._

Longer retention mostly costs disk space, not speed. VictoriaMetrics
compresses heavily, and a typical Home Assistant installation lands somewhere
around a gigabyte per year; a large one with a short scrape interval can be
several times that.

The default of `3y` is long enough to compare this winter against the two
before it, which is the sort of question this database exists to answer, while
still landing in single digit gigabytes on a normal installation. Watch what
yours actually uses over the first few weeks before deciding this machine can
hold a decade.

### Option: `dedup_min_scrape_interval`

Keep only the last sample of every time series per interval, for example
`60s`.

This is useful when the same metrics reach this database from more than one
place, for example when two collectors watch the same target for redundancy.
Leave it empty to store every sample as it arrives.

### Option: `min_free_disk_space`

New metrics are refused once free disk space drops below this amount, for
example `1GB` or `500MB`.

A time series database will happily grow until nothing is left, and a full
disk takes Home Assistant down with it. This is the floor that stops that from
happening: writing pauses, queries keep working, and the log tells you what
happened. Raise it if this app shares its disk with things that need room to
breathe.

### Option: `latency_offset`

How long freshly arrived metrics are held back from queries, for example `1m`,
`5s`, or `0s` to switch it off entirely.

VictoriaMetrics does this because a scrape that is still in progress would
otherwise be read as a real drop in the data. The cost is that the newest
values are not there yet: ask for a sensor reading that arrived ten seconds
ago and you get nothing back, which looks a lot like the app is broken.

The default of `1m` is right for the [scrape route](#collecting-home-assistant-metrics),
where a scrape genuinely can be half finished. It buys you nothing when Home
Assistant pushes through [the InfluxDB integration](#sending-home-assistant-metrics-with-the-influxdb-integration),
because each write is complete on arrival, so set it to `1s` there and your
dashboards will keep up with the house.

Graphs over the last hour or more do not notice this either way. It only shows
in panels displaying the current value.

### Option: `memory_allowed_percent`

The percentage of system memory the caches may occupy, between `10` and `90`.

Leave it unset unless you have a reason. The default of 60% suits most
machines. Lower it when this app has to share a small device with a lot else,
raise it when queries over long time ranges feel slow and there is memory to
spare.

### Option: `ssl`

Enables/Disables SSL (HTTPS) on the web interface. Set it `true` to enable it,
`false` otherwise.

**Note**: _The SSL settings only apply to direct access and have no effect on
the Ingress service._

### Option: `certfile`

The certificate file to use for SSL.

**Note**: _The file MUST be stored in `/ssl/`, which is the default_

### Option: `keyfile`

The private key file to use for SSL.

**Note**: _The file MUST be stored in `/ssl/`, which is the default_

### Option: `leave_front_door_open`

Adding this option to the app configuration allows you to disable
authentication on the direct port and is `false` by default.

**Note**: _We STRONGLY suggest, not to use this, even for testing purposes!_

## Direct access

By default this app is only reachable through Home Assistant's Ingress, which
means Home Assistant takes care of authenticating you.

Set a port for "HTTP API & web interface" in the "Network" section of the app
configuration to expose it on your network. You need this for anything that is
not a browser: Grafana reading from it, other machines writing to it, or your
own scripts querying the API.

VictoriaMetrics has no user accounts of its own, so this app checks every
request against Home Assistant instead. That check also accepts Basic
authentication with the username and password of a Home Assistant user, which
is what lets scrapers, remote write clients and `curl` through:

```bash
curl -u "your-ha-user:your-password" \
  "http://homeassistant.local:8428/api/v1/query?query=up"
```

**Warning**: _Without that check, anybody who can reach the port can read
every metric you have collected and delete the entire database in a single
request. Leave `leave_front_door_open` alone._

## Backups

This app is backed up cold, which means Home Assistant stops it for the moment
it takes to copy the database. A time series database that is copied while it
is writing can come back subtly broken, and finding out a year later is not
the moment you want to discover that.

The trade is a short gap in your metrics whenever a backup runs, and backups
that grow with your history. If you keep years of data, consider whether this
app belongs in your daily backup or only in the occasional full one.

## Known quirks

- Graphs go blank between state changes unless you fill the gaps. This one
  catches nearly everybody; see [Why graphs have gaps](#why-graphs-have-gaps).
- The newest minute of data does not show up in queries yet, because recent
  points are held back on purpose. Lower the
  [`latency_offset`](#option-latency_offset) option to `1s` if you push metrics
  here rather than having them scraped.
- The web interface is `vmui`, which is aimed at exploring rather than
  dashboards. Use Grafana for anything you want to keep looking at.
- Metrics only appear for entities you actually send. If something is missing,
  it is almost always filtered out in Home Assistant rather than lost here.
- The first scrape after Home Assistant restarts can be empty, since the
  Prometheus integration needs its entities back before it has anything to
  report.
- There is no downsampling. Old data keeps its full resolution forever rather
  than being thinned out, which is why retention is worth thinking about. It is
  not a feature the open source build has.
- There is no alerting or recording rule engine here. Those live in `vmalert`,
  which this app does not ship; use Home Assistant's own automations against
  the data instead.

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
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_victoriametrics&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/app-victoriametrics/graphs/contributors
[data-ingestion]: https://docs.victoriametrics.com/victoriametrics/data-ingestion/
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[file-editor]: https://github.com/home-assistant/addons/tree/master/configurator
[forum]: https://community.home-assistant.io/t/?u=frenck
[frenck]: https://github.com/frenck
[grafana-addon]: https://github.com/hassio-addons/app-grafana
[influxdb-sensor]: https://www.home-assistant.io/integrations/influxdb/#sensor
[influxdb]: https://www.home-assistant.io/integrations/influxdb/
[metricsql]: https://docs.victoriametrics.com/metricsql/
[issue]: https://github.com/hassio-addons/app-victoriametrics/issues
[prometheus]: https://www.home-assistant.io/integrations/prometheus/
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/app-victoriametrics/releases
[semver]: https://semver.org/spec/v2.0.0.html
[victoriametrics]: https://victoriametrics.com/
