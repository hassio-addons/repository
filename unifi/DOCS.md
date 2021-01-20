# Home Assistant Community Add-on: UniFi Controller

This add-on runs Ubiquiti Networks' UniFi Controller software, which allows
you to manage your UniFi network via the web browser. The add-on provides a
single-click installation and run solution for Home Assistant, allowing users
to get their network up, running, and updated, easily.

This add-on supports all Home Assistant supported architectures, including the
Raspberry Pi.

## Installation

The installation of this add-on is pretty straightforward and not different in
comparison to installing any other Home Assistant add-on.

1. Search for the "UniFi Controller" add-on in the Supervisor add-on store
   and install it.
1. Start the "UniFi Controller" add-on.
1. Check the logs of the "UniFi Controller" to see if everything went well.
1. Click the "OPEN WEB UI" button, and follow the initial wizard.
1. After completing the wizard, log in with the credentials just created.
1. Go to the settings (gears icon in the bottom left) -> Controller (tab).
1. Change the `Controller Hostname/IP` to match the IP or hostname of
   the device running Home Assistant.
1. Check the box `Override inform host with controller hostname/IP`.
1. Hit the "Apply Changes" button to activate the settings.
1. Ready to go!

## Configuration

**Note**: _Remember to restart the add-on when the configuration is changed._

Example add-on configuration, with all available options:

```yaml
log_level: info
ssl: true
certfile: fullchain.pem
keyfile: privkey.pem
memory_max: 2048
memory_init: 512
```

**Note**: _This is just an example, don't copy and paste it! Create your own!_

### Option: `log_level`

The `log_level` option controls the level of log output by the addon and can
be changed to be more or less verbose, which might be useful when you are
dealing with an unknown issue. Possible values are:

- `trace`: Show every detail, like all called internal functions.
- `debug`: Shows detailed debug information.
- `info`: Normal (usually) interesting events.
- `warning`: Exceptional occurrences that are not errors.
- `error`: Runtime errors that do not require immediate action.
- `fatal`: Something went terribly wrong. Add-on becomes unusable.

Please note that each level automatically includes log messages from a
more severe level, e.g., `debug` also shows `info` messages. By default,
the `log_level` is set to `info`, which is the recommended setting unless
you are troubleshooting.

### Option: `ssl`

Enables/Disables the use of a custom SSL (HTTPS) certificate with the in UniFi
web interface. Set it `true` to enable it, `false` otherwise.

**Note**: _When leaving this option disabled, UniFi will use a
custom/self-signed SSL certificate._

### Option: `certfile`

The certificate file to use for SSL.

**Note**: _The file MUST be stored in `/ssl/`, which is the default_

### Option: `keyfile`

The private key file to use for SSL.

**Note**: _The file MUST be stored in `/ssl/`, which is the default_

### Option: `memory_max`

This option allows you to change the amount of memory the UniFi Controller
is allowed to consume. By default, this is limited to 1 GB. You might want
to increase this, in order to reduce CPU load or reduce this, in order
to optimize your system for lower memory usage.

This option takes the number of Megabyte, for example, the default is 1024.

### Option: `memory_init`

This option allows you to change the amount of memory the UniFi Controller
will initially reserve/consume when starting. By default, this is limited to
512M.

This option takes the number of Megabyte, for example, the default is 512.

## Automated backups

The UniFi Controller ships with an automated backup feature. This feature works
but has been adjusted to put the created backups in a different location.

Backups are created in `/backup/unifi`. You can access this folder using
the normal Home Assistant methods (e.g., using Samba, Terminal, SSH).

## Migrating from an existing controller

If you want to migrate from an existing controller to the controller provided
by this addon, Ubiquiti has an excellent tutorial on this:

<https://help.ubnt.com/hc/en-us/articles/115002869188>

This article explains in detail how to use the UniFi Site Export Wizard
to quickly and easily export sites from one Controller
(including configuration and devices) to another (e.g., this add-on).

## Manually adopting a device

Alternatively to setting up a custom inform address (installation steps 7-9)
you can manually adopt a device by following these steps:

- SSH into the device using `ubnt` as username and `ubnt` as password
- `$ mca-cli`
- `$ set-inform http://<IP of Hassio>:<controller port (default:8080)>/inform`
  - for example `$ set-inform http://192.168.1.14:8080/inform`

## Known issues and limitations

- The AP seems stuck in "adopting" state: Please read the installation
  instructions carefully. You need to change some controller settings
  in order for this add-on to work properly. Using the Ubiquiti Discovery
  Tool, or SSH'ing into the AP and setting the INFORM after adopting
  will resolve this. (see: _Manually adopting a device_)
- This add-on does support ARM-based devices, nevertheless, they must
  at least be an ARMv7 device. (Raspberry Pi 1 and Zero is not supported).
- When using SSL, the following warning is shown in the add-on logs:
  `Warning: The JKS keystore uses a proprietary format.`. This warning can
  be safely ignored. There is nothing wrong and your add-on will function
  normally.
- The following error can show up in the log, but can be safely ignored:

  ```
    INFO: I/O exception (java.net.ConnectException) caught when processing
    request: Connection refused (Connection refused)`. This is a known issue,
    however, the add-on functions normally.
  ```

- Due limitation, renewed SSL certificates are not picked up automatically.
  You'd have to restart the add-on in order for UniFi to pick up the change.
- Due to security policies in the UniFi Controller software, it is currently
  impossible to add the UniFI web interface to your Home Assistant frontend
  using a `panel_iframe`.
- The broadcast feature of the EDU type APs are currently not working with
  this add-on. Due to a limitation in Home Assistant, is it currently impossible
  to open the required "range" of ports needed for this feature to work.
- This add-on cannot support Ingress due to technical limitations of the
  UniFi software.

## Changelog & Releases

This repository keeps a change log using [GitHub's releases][releases]
functionality. The format of the log is based on
[Keep a Changelog][keepchangelog].

Releases are based on [Semantic Versioning][semver], and use the format
of `MAJOR.MINOR.PATCH`. In a nutshell, the version will be incremented
based on the following:

- `MAJOR`: Incompatible or major changes.
- `MINOR`: Backwards-compatible new features and enhancements.
- `PATCH`: Backwards-compatible bugfixes and package updates.

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

The original setup of this repository is by [Franck Nijhof][frenck].

For a full list of all authors and contributors,
check [the contributor's page][contributors].

## License

MIT License

Copyright (c) 2018-2021 Franck Nijhof

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

[contributors]: https://github.com/hassio-addons/addon-unifi/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-unifi-controller/56297?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-unifi/issues
[keepchangelog]: http://keepachangelog.com/en/1.0.0/
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-unifi/releases
[semver]: http://semver.org/spec/v2.0.0.htm
