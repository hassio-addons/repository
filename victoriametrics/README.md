# Home Assistant Community App: VictoriaMetrics

[![Release][release-shield]][release] ![Project Stage][project-stage-shield] ![Project Maintenance][maintenance-shield]

[![Sponsor Frenck via GitHub Sponsors][github-sponsors-shield]][github-sponsors]

[![Support Frenck on Patreon][patreon-shield]][patreon]

Fast and resource efficient time series database for your metrics.

## About

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

[github-sponsors-shield]: https://frenck.dev/wp-content/uploads/2019/12/github_sponsor.png
[github-sponsors]: https://github.com/sponsors/frenck
[maintenance-shield]: https://img.shields.io/maintenance/yes/2026.svg
[patreon-shield]: https://frenck.dev/wp-content/uploads/2019/12/patreon.png
[patreon]: https://www.patreon.com/frenck
[project-stage-shield]: https://img.shields.io/badge/project%20stage-experimental-yellow.svg
[release-shield]: https://img.shields.io/badge/version-v0.1.0-blue.svg
[release]: https://github.com/hassio-addons/app-victoriametrics/tree/v0.1.0
[victoriametrics]: https://victoriametrics.com/