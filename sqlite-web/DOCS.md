# Home Assistant Community App: SQLite Web

This enables you to easily explore all tables and content that is saved in your database.

## Installation

The installation of this app is pretty straightforward and not different in
comparison to installing any other Home Assistant app.

1. Click the Home Assistant My button below to open the app on your Home
   Assistant instance.

   [![Open this app in your Home Assistant instance.][app-badge]][app]

1. Click the "Install" button to install the app.
1. Start the "SQLite Web" app
1. Check the logs of the "SQLite Web" app to see if everything went well.
1. Click "OPEN WEB UI" to open the SQLite Web interface.
1. Log in with your Home Assistant user.

## Configuration

**Note**: _Remember to restart the app when the configuration is changed._

### Option: Database

An optional database path that can set to instruct SQLite web to use a specific
database file. When not set, the default Home Assistant database file location
is used.

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

The original setup of this repository is by [Joakim Sørensen][ludeeus].

For a full list of all authors and contributors,
check [the contributor's page][contributors].

## License

MIT License

Copyright (c) 2018-2019 Joakim Sørensen
Copyright (c) 2019-2026 Franck Nijhof

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

[app-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[app]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_sqlite-web&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/app-sqlite-web/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-app-sqlite-web/68912?u=frenck
[issue]: https://github.com/hassio-addons/app-sqlite-web/issues
[ludeeus]: https://github.com/ludeeus
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/app-sqlite-web/releases
[semver]: http://semver.org/spec/v2.0.0.html
