# Home Assistant Community App: Studio Code Server

This app runs [code-server](https://github.com/coder/code-server), which
gives you a Visual Studio Code experience straight from the browser. It allows
you to edit your Home Assistant configuration directly from your web browser,
directly from within the Home Assistant frontend.

The app has the Home Assistant, MDI icons and YAML extensions pre-installed
and pre-configured right out of the box. This means that auto-completion works
instantly, without the need for configuring anything.

## Installation

The installation of this app is pretty straightforward and not different in
comparison to installing any other Home Assistant app.

1. Click the Home Assistant My button below to open the app on your Home
   Assistant instance.

   [![Open this app in your Home Assistant instance.][addon-badge]][addon]

1. Click the "Install" button to install the app.
1. Start the "Studio Code Server" app.
1. Check the logs of the "Studio Code Server" app to see if everything went
   well.
1. Click the "OPEN WEB UI" button to open Studio Code Server.

## Configuration

**Note**: _Remember to restart the app when the configuration is changed._

Example app configuration:

```yaml
log_level: info
config_path: /share/my_path
packages:
  - mariadb-client
init_commands:
  - ls -la
```

**Note**: _This is just an example, don't copy and paste it! Create your own!_

### Option: `log_level`

The `log_level` option controls the level of log output by the app and can
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

### Option: `config_path`

This option allows you to override the default path the app will open
when accessing the web interface. For example, use a different
configuration directory like `/share/myconfig` instead of `/config`. If set
to `/root` then all the common folders of HA such as `/config`, `/ssl`,
`/share`, etc. will appear as subfolders for each access.

When not configured, the app will automatically use the default: `/config`

### Option: `packages`

Allows you to specify additional [Debian packages][debian-packages] to be
installed in your shell environment (e.g., Python, PHP, Go).

**Note**: _Adding many packages will result in a longer start-up
time for the app._

### Option: `init_commands`

Customize your VSCode environment even more with the `init_commands` option.
Add one or more shell commands to the list, and they will be executed every
single time this app starts.

## Resetting your VSCode settings to the app defaults

The app updates your settings to be optimized for use with Home Assistant.
As soon as you change a setting, the app will stop doing that since it
might be destructive. However, in case you changed some things, but want to
return to the defaults as delivered by this app, do the following:

1. Open the Visual Studio Code editor.
1. Click on `Terminal` in the top menu bar and click on `New Terminal`.
1. Execute the following command in the terminal window: `reset-settings`.
1. Done!

## Using AI coding assistants

This app is built on [code-server][code-server], which is a build of
VS Code that uses the [Open VSX][open-vsx] extension registry instead of the
Microsoft Marketplace. Microsoft only allows their marketplace to be used by
their own branded builds of Visual Studio Code, so which assistants you can
use is decided by what is published on Open VSX.

- **GitHub Copilot is not available.** The `GitHub.copilot` and
  `GitHub.copilot-chat` extensions are published exclusively on the Microsoft
  Marketplace and are not on Open VSX, so they cannot be found or installed
  from within this app. VS Code may still advertise its built-in AI
  features; attempting to enable them fails with
  `extension GitHub.copilot-chat not found`.
- **Claude Code works.** The `Anthropic.claude-code` extension is published on
  Open VSX and can be installed from the Extensions view as usual. It bundles
  its own `claude` binary, so no separate Node.js installation is needed.

Because the app runs behind Home Assistant ingress, browser-based sign-in
flows that redirect back to a `vscode://` URL do not work. Sign in from a
terminal inside the editor instead:

1. Open the Visual Studio Code editor.
1. Click on `Terminal` in the top menu bar and click on `New Terminal`.
1. Run `claude` and use the `/login` command, which prints a URL and asks you
   to paste back the code it gives you.

Claude Code keeps its settings and credentials in a configuration folder that
this app points at its own data folder, so your login survives app restarts
and updates.

The bundled `claude` binary lives inside the extension folder. If you want it
on your `PATH` for use in the terminal, add the following to the app's
`init_commands` option:

```yaml
init_commands:
  - for f in /data/vscode/extensions/anthropic.claude-code-*/resources/native-binary/claude; do test -x $f && ln -sf $f /usr/local/bin/claude; done; true
```

Init commands run before the editor starts, so the link appears after the
first restart following the installation of the extension.

Claude Code's optional voice input needs ALSA, which the app does not ship.
Add it using the `packages` option if you want to use it:

```yaml
packages:
  - libasound2t64
```

## Known issues and limitations

- Can this app run on a Raspberry Pi? Yes, but only if you run a 64 bits
  operating system. Also, see point below.
- This app currently only supports AMD64 and aarch64/ARM64 machines.
  Although we support ARM devices, please be aware, that this app is quite
  heavy to run, and requires quite a bit of RAM. We do not recommended to run
  it on devices with less than 4Gb of memory.
- **Do not use the root directory (`/`) as your workspace.** Opening the root
  directory causes severe performance issues, as VS Code will attempt to index
  the entire filesystem, resulting in excessive CPU and memory usage. Always
  use `/config` (the default) or another specific directory. The app will
  prevent startup if the root directory is configured as the workspace.
- "Visual Studio Code is unable to watch for file changes in this large
  workspace" (error ENOSPC)

  This issue is caused by your system not having enough file handles,
  which causes VSCode to be unable to watch all your files. For HassOS,
  currently the only option is to click on the little cog when the
  notification appears and tell it to not show again. In case you have
  a generic Linux setup (e.g., Ubuntu), follow this guide by Microsoft:

  <https://code.visualstudio.com/docs/setup/linux#_visual-studio-code-is-unable-to-watch-for-file-changes-in-this-large-workspace-error-enospc>

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

You could also [open an issue here][issue] on GitHub.

## Authors & contributors

The original setup of this repository is by [Franck Nijhof][frenck].

For a full list of all authors and contributors,
check [the contributors' page][contributors].

## License

MIT License

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

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_vscode&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[code-server]: https://github.com/coder/code-server
[contributors]: https://github.com/hassio-addons/app-vscode/graphs/contributors
[debian-packages]: https://packages.debian.org
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-visual-studio-code/107863?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/app-vscode/issues
[open-vsx]: https://open-vsx.org
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/app-vscode/releases
[semver]: https://semver.org/spec/v2.0.0
