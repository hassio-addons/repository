# Home Assistant Community App: Seerr

Media request and discovery manager for Jellyfin, Plex, and Emby.

## Installation

The installation of this app is pretty straightforward and not different in
comparison to installing any other Home Assistant app.

1. Click the Home Assistant My button below to open the app on your Home
   Assistant instance.

   [![Open this app in your Home Assistant instance.][addon-badge]][addon]

1. Click the "Install" button to install the app.
1. Start the "Seerr" app
1. Check the logs of the "Seerr" app to see if everything went well.
1. Click "OPEN WEB UI" to open the Seerr interface.
1. Complete the wizard shown on screen.

## Upgrading from Overseerr

This app used to ship Overseerr. Upstream has since merged Overseerr and
Jellyseerr into a single project called Seerr, and this app follows that move.

If you were already running it, there is nothing for you to do. The app keeps
its existing slug, so Home Assistant treats this as a normal update and your
configuration directory is kept. Seerr picks that directory up and migrates
your settings, users and requests on its first start. The app log confirms it:

```txt
[Seerr Migration]: Yeah! Overseerr to Seerr migration completed successfully!
```

The migration only runs one way. Take a backup before updating if you want to
be able to go back to Overseerr.

## Configuration

_This app does not require any configuration to run._

## Known issues and limitations

- This app does not support Home Assistant's Ingress feature (aka, the
  toggle that puts an app in the Home Assistant sidebar). Seerr serves
  everything from the root of the domain and has no support for running
  under a URL base path, so it cannot be placed in the sidebar without
  rewriting its responses, which would break as soon as Seerr changes.
  Upstream tracks this in [seerr-team/seerr#97][upstream-basepath].
  You could consider using an iframe panel instead.

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

Copyright (c) 2024-2026 Franck Nijhof

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
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_overseerr&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/app-seerr/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/app-seerr/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/app-seerr/releases
[semver]: http://semver.org/spec/v2.0.0.html
[upstream-basepath]: https://github.com/seerr-team/seerr/issues/97
