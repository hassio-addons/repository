# Home Assistant Community App: Folding@home

Folding@home (FAH or F@h) is a distributed computing project for performing
molecular dynamics simulations of protein dynamics. Its initial focus was on
protein folding but has shifted to more biomedical problems, such as Alzheimer's
disease, cancer, Ebola and the coronavirus.

The project uses the idle processing resources of personal computers owned by
volunteers who have installed the software on their systems.

Now you can donate the idle time of your Home Assistant instance to the
Folding@home project, helping to fight these diseases.

Join the Home Assistant Folding@home team! (id: 247478)

Team stats: <https://stats.foldingathome.org/team/247478>

## Installation

The installation of this app is pretty straightforward and not different in
comparison to installing any other Home Assistant app.

1. Click the Home Assistant My button below to open the app on your Home
   Assistant instance.

   [![Open this app in your Home Assistant instance.][addon-badge]][addon]

1. Click the "Install" button to install the app.
1. Start the "Folding@home" app.
1. Check the logs of the "Folding@home" to see if everything went well.

That is all that is needed. The app starts folding on its own.

**Note**: By default, the app folds anonymously for the Home Assistant team
(id: 247478).

Team stats: <https://stats.foldingathome.org/team/247478>

## Configuration

**Note**: _Remember to restart the app when the configuration is changed._

Example app configuration:

```yaml
log_level: info
user: Anonymous
team: 247478
machine_name: Home Assistant
cpus: 2
```

### Option: `log_level`

The `log_level` option controls the level of log output by the addon and can
be changed to be more or less verbose, which might be useful when you are
dealing with an unknown issue. Possible values are:

- `trace`: Show every detail, like all called internal functions.
- `debug`: Shows detailed debug information.
- `info`: Normal (usually) interesting events.
- `warning`: Exceptional occurrences that are not errors.
- `error`: Runtime errors that do not require immediate action.
- `fatal`: Something went terribly wrong. App becomes unusable.

Please note that each level automatically includes log messages from a
more severe level, e.g., `debug` also shows `info` messages. By default,
the `log_level` is set to `info`, which is the recommended setting unless
you are troubleshooting.

### Option: `user`

The name your work is credited to on the Folding@home statistics pages.
Defaults to `Anonymous`.

### Option: `team`

The team your work is credited to. Defaults to `247478`, the Home Assistant
team. Set it to `0` to fold without a team.

### Option: `passkey`

Optional. A passkey ties your contributions to you and qualifies you for bonus
points on work units returned quickly. Request one at
<https://apps.foldingathome.org/getpasskey>. It must be 32 hexadecimal
characters.

### Option: `account_token`

Optional. Links this machine to a Folding@home account, which is what makes it
show up in the Web Control at <https://app.foldingathome.org>. Find the token
under "Account Settings" -> "Machines" -> "Link a machine".

Folding does **not** require an account. Leave this empty and the app folds
anonymously, exactly as it did before, using the `user` and `team` above.

### Option: `machine_name`

The name this machine is shown under in the Web Control. Defaults to
`Home Assistant`. Only meaningful together with `account_token`.

### Option: `cpus`

Optional. How many CPU cores to fold with.

When unset, the client uses one less than the number of cores it finds, which
on a four core machine means three cores working flat out for as long as the
app runs. Set this lower if Home Assistant, or anything else on the same
machine, needs the headroom.

Asking for more cores than the machine has stops the client from starting, so
the app clamps the value to what is actually available and says so in the log.

## Controlling the client

The Folding@home v8 client has no web interface of its own, so this app has
no Web UI button. Monitoring and control happen in the hosted Web Control at
<https://app.foldingathome.org>.

To see this machine there, set an `account_token`. The client then keeps an
outbound connection to your Folding@home account, and the Web Control reaches
it through that. From there you can watch progress, pick a cause, or pause
folding.

None of that is required to contribute. The app tells the client to start
folding every time it starts, so it folds whether or not an account is linked.
Note that this also means pausing from the Web Control does not survive an
app restart.

Port `7396` is the client's own API. It is not published by default, because
account-linked control does not go through it and it has no authentication in
front of it. Map it under the app's Network settings only if you intend to
point a Web Control at this machine directly.

Previous versions of this documentation described embedding the old local Web
Control with the `panel_iframe` integration. That interface no longer exists in
the v8 client, so that is no longer possible.

## Known issues and limitations

- This app only runs on 64-bits intel-based computers.
- Folding runs on the CPU only. GPU folding needs an OpenCL driver for the
  specific graphics card, and none of them are usable here: Home Assistant OS
  ships no NVIDIA driver, Debian 13 no longer packages Intel's OpenCL runtime,
  and the only remaining option would quadruple the size of this app to serve
  AMD cards alone.
- The Folding@home v8 client ships no local web interface, so the app has no
  Web UI. Monitoring and controlling it from a browser requires linking an
  account, see `account_token` above.

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

Copyright (c) 2020-2026 Franck Nijhof

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
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_foldingathome&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/app-foldingathome/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-folding-home/180496?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/app-foldingathome/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/app-foldingathome/releases
[semver]: http://semver.org/spec/v2.0.0.htm
