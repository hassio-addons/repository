# Home Assistant Community App: NZBGet

[![Release][release-shield]][release] ![Project Stage][project-stage-shield] ![Project Maintenance][maintenance-shield]

[![Sponsor Frenck via GitHub Sponsors][github-sponsors-shield]][github-sponsors]

[![Support Frenck on Patreon][patreon-shield]][patreon]

Efficient Usenet downloader, written in C++.

## About

[NZBGet][nzbget] is a Usenet downloader built around doing the work with as
little as it can. It was written in C++ for hardware that had nothing to spare,
and on anything larger that turns into downloads which fill the line while the
rest of the machine carries on as if nothing were happening.

Handing it an nzb file is the whole job: it fetches the articles, checks them
against the par2 files that came with them and repairs whatever arrived
damaged, unpacks the archives, and passes the result to whatever you want run
afterwards. Categories decide where things end up, RSS feeds pull in new items
on their own, and there is a JSON-RPC API for everything else.

Downloads land in the `media` folder, which puts them in reach of Home
Assistant's media browser and of the other apps that map it. Home Assistant
also has [an integration for NZBGet][integration], so the speed and the size of
the queue can sit on your dashboard, with services to pause, resume and cap the
download rate from an automation.

[github-sponsors-shield]: https://frenck.dev/wp-content/uploads/2019/12/github_sponsor.png
[github-sponsors]: https://github.com/sponsors/frenck
[integration]: https://www.home-assistant.io/integrations/nzbget/
[maintenance-shield]: https://img.shields.io/maintenance/yes/2026.svg
[nzbget]: https://nzbget.com/
[patreon-shield]: https://frenck.dev/wp-content/uploads/2019/12/patreon.png
[patreon]: https://www.patreon.com/frenck
[project-stage-shield]: https://img.shields.io/badge/project%20stage-experimental-yellow.svg
[release-shield]: https://img.shields.io/badge/version-v0.1.0-blue.svg
[release]: https://github.com/hassio-addons/app-nzbget/tree/v0.1.0