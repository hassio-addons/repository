# Home Assistant Community App: File Explorer

[![Release][release-shield]][release] ![Project Stage][project-stage-shield] ![Project Maintenance][maintenance-shield]

[![Sponsor Frenck via GitHub Sponsors][github-sponsors-shield]][github-sponsors]

[![Support Frenck on Patreon][patreon-shield]][patreon]

Browse, edit, upload and organize the files of your Home Assistant installation.

## About

A file manager for your Home Assistant installation, in a panel on the
sidebar. It shows the directories Home Assistant keeps its files in, and lets
you browse them, upload to them, move things about, unpack an archive, edit a
YAML file in place, preview a photo or a PDF, and search across the lot.

Underneath it is [FileBrowser Quantum][filebrowser], a modern web file manager
with an editor, previews, a search index and WebDAV built in. This app sets it
up with the Home Assistant directories as its sources: the configuration, the
media and share directories, the backups, the certificates, and the apps and
their configuration.

Open it from the sidebar and Home Assistant signs you in, with an account of
your own. Publish its port and it is a WebDAV share as well, so a directory
can be mounted as a network drive on your computer.

[filebrowser]: https://filebrowserquantum.com/
[github-sponsors-shield]: https://frenck.dev/wp-content/uploads/2019/12/github_sponsor.png
[github-sponsors]: https://github.com/sponsors/frenck
[maintenance-shield]: https://img.shields.io/maintenance/yes/2026.svg
[patreon-shield]: https://frenck.dev/wp-content/uploads/2019/12/patreon.png
[patreon]: https://www.patreon.com/frenck
[project-stage-shield]: https://img.shields.io/badge/project%20stage-experimental-yellow.svg
[release-shield]: https://img.shields.io/badge/version-v0.1.0-blue.svg
[release]: https://github.com/hassio-addons/app-file-explorer/tree/v0.1.0