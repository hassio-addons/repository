# Home Assistant Community App: n8n

[![Release][release-shield]][release] ![Project Stage][project-stage-shield] ![Project Maintenance][maintenance-shield]

[![Sponsor Frenck via GitHub Sponsors][github-sponsors-shield]][github-sponsors]

[![Support Frenck on Patreon][patreon-shield]][patreon]

Workflow automation for technical people, with Home Assistant and MQTT wired in.

## About

[n8n][n8n] is a workflow automation platform for technical people: a visual
editor in which you wire together hundreds of services, from HTTP requests,
webhooks and schedules to databases, chat platforms and AI models, with a bit
of JavaScript in between wherever you need it.

This app runs n8n inside Home Assistant, in a panel on the sidebar. A
credential for this Home Assistant installation is already in place when you
open it, with no access token to make, and so are ones for your MQTT broker
and MariaDB when those are to be found. Home Assistant automations start
workflows over the internal network; publish its port and webhooks from
anywhere reach them too.

[github-sponsors-shield]: https://frenck.dev/wp-content/uploads/2019/12/github_sponsor.png
[github-sponsors]: https://github.com/sponsors/frenck
[maintenance-shield]: https://img.shields.io/maintenance/yes/2026.svg
[n8n]: https://n8n.io
[patreon-shield]: https://frenck.dev/wp-content/uploads/2019/12/patreon.png
[patreon]: https://www.patreon.com/frenck
[project-stage-shield]: https://img.shields.io/badge/project%20stage-experimental-yellow.svg
[release-shield]: https://img.shields.io/badge/version-v0.1.0-blue.svg
[release]: https://github.com/hassio-addons/app-n8n/tree/v0.1.0