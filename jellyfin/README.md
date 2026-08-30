# Home Assistant Community App: Jellyfin

[![Release][release-shield]][release] ![Project Stage][project-stage-shield] ![Project Maintenance][maintenance-shield]

[![Sponsor Frenck via GitHub Sponsors][github-sponsors-shield]][github-sponsors]

[![Support Frenck on Patreon][patreon-shield]][patreon]

The free software media system for your movies, shows and music.

## About

[Jellyfin][jellyfin] is a media server. Point it at the folders holding your
films, series and music, and it works out what everything is, collects the
artwork and descriptions, and hands it all to whatever you want to watch on:
a browser, a phone, a tablet, a games console or a TV.

Nothing about it phones home. There is no account to make, no subscription and
no paid tier holding features back; the server on your own machine is the whole
product. This app runs that server next to Home Assistant, with its library
sitting in the same `media` folder the rest of your apps use.

Transcoding, for the times a device cannot play a file as it is, can be handed
to an Intel or AMD graphics chip, using the same patched FFmpeg the Jellyfin
project ships. Home Assistant's own [Jellyfin integration][integration] brings
the library into the media browser and every device playing from it in as a
media player.

[github-sponsors-shield]: https://frenck.dev/wp-content/uploads/2019/12/github_sponsor.png
[github-sponsors]: https://github.com/sponsors/frenck
[integration]: https://www.home-assistant.io/integrations/jellyfin/
[jellyfin]: https://jellyfin.org
[maintenance-shield]: https://img.shields.io/maintenance/yes/2026.svg
[patreon-shield]: https://frenck.dev/wp-content/uploads/2019/12/patreon.png
[patreon]: https://www.patreon.com/frenck
[project-stage-shield]: https://img.shields.io/badge/project%20stage-experimental-yellow.svg
[release-shield]: https://img.shields.io/badge/version-v0.1.0-blue.svg
[release]: https://github.com/hassio-addons/app-jellyfin/tree/v0.1.0