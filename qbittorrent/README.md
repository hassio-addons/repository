# Home Assistant Community App: qBittorrent

[![Release][release-shield]][release] ![Project Stage][project-stage-shield] ![Project Maintenance][maintenance-shield]

[![Sponsor Frenck via GitHub Sponsors][github-sponsors-shield]][github-sponsors]

[![Support Frenck on Patreon][patreon-shield]][patreon]

Fast, stable and lightweight BitTorrent client.

## About

[qBittorrent][qbittorrent] is a BitTorrent client that does the job without
asking for anything in return. No advertising, no bundled extras and no
account: it is the open source client people move to when they want the
features of the big ones and none of the rest.

This app runs the headless build, so what you get is the web interface. It
handles the things a long running client needs: a queue with limits, categories
and tags that decide where files land, RSS feeds that download new episodes on
their own, scheduling so the upload does not fight the rest of the house for
bandwidth, and a full API for anything else.

Downloads land in the `media` folder, which puts them in reach of Home
Assistant's media browser and of the other apps that map it. Home Assistant
also has [an integration for qBittorrent][integration], so the speeds and the
torrent counts can sit on your dashboard next to everything else.

[github-sponsors-shield]: https://frenck.dev/wp-content/uploads/2019/12/github_sponsor.png
[github-sponsors]: https://github.com/sponsors/frenck
[integration]: https://www.home-assistant.io/integrations/qbittorrent/
[maintenance-shield]: https://img.shields.io/maintenance/yes/2026.svg
[patreon-shield]: https://frenck.dev/wp-content/uploads/2019/12/patreon.png
[patreon]: https://www.patreon.com/frenck
[project-stage-shield]: https://img.shields.io/badge/project%20stage-experimental-yellow.svg
[qbittorrent]: https://www.qbittorrent.org/
[release-shield]: https://img.shields.io/badge/version-v0.1.0-blue.svg
[release]: https://github.com/hassio-addons/app-qbittorrent/tree/v0.1.0