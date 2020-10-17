# Home Assistant Community Add-on: MSSQL Server

## Installation

The installation of this add-on is pretty straightforward and not different in
comparison to installing any other Home Assistant add-on.

1. Search for the "MSSQL" add-on in the Supervisor add-on store and install it.
1. Start the "MSSQL" add-on.
1. Check the logs of the "MSSQL" add-on to see it in action.

## Configuration

**Note**: _Remember to restart the add-on when the configuration is changed._

Example add-on configuration:

```yaml
ACCEPT_EULA: 1
MSSQL_SA_PASSWORD: "Strong password"
```

### Option: `ACCEPT_EULA`

Confirms your acceptance of the End-User Licensing Terms.
For the Azure SQL Edge Developer EULA can be located [here](https://go.microsoft.com/fwlink/?linkid=2139274).
Azure SQL Edge Premium EULA can be found [here](https://hub.docker.com/_/microsoft-azure-sql-edge?tab=description).

### Option: `MSSQL_SA_PASSWORD`

Specify your own strong password that is at least 8 characters and
meets the [Azure SQL Edge password requirements](https://docs.microsoft.com/en-us/sql/relational-databases/security/password-policy).
Required setting for the Azure SQL Edge image.

## Changelog & Releases

This repository keeps a change log using [GitHub's releases][releases]
functionality. The format of the log is based on
[Keep a Changelog][keepchangelog].

Releases are based on [Semantic Versioning][semver], and use the format
of ``MAJOR.MINOR.PATCH``. In a nutshell, the version will be incremented
based on the following:

- ``MAJOR``: Incompatible or major changes.
- ``MINOR``: Backwards-compatible new features and enhancements.
- ``PATCH``: Backwards-compatible bugfixes and package updates.

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

The original setup of this repository is by [Oscar Calvo][ocalvo].

For a full list of all authors and contributors,
check [the contributor's page][contributors].

## License

MIT License

Copyright (c) Oscar Calvo

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

[contributors]: https://github.com/ocalvo/addon-mssql/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/repository-community-hass-io-add-ons/24705?u=ocalvo
[ocalvo]: https://github.com/ocalvo
[issue]: https://github.com/ocalvo/addon-mssql/issues
[keepchangelog]: http://keepachangelog.com/en/1.0.0/
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/ocalvo/addon-mssql/releases
[semver]: http://semver.org/spec/v2.0.0.html
