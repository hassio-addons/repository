# Home Assistant Community Add-on: FTP

The FTP protocol might be come in handy sometimes. While old,
it still has its use. For example, most IP Cameras still support the upload
of images or videos via FTP.

This add-on provides an FTP Server for Hass.io in a reasonably secure manner.
While FTP is not entirely secure by its (unencrypted) nature, this add-on
supports FTP over SSL (FTPS) and jails (chroot) the virtual users in their
home directories.

Of course, if you'd really want to, you could also use this add-on to again
access to your Home Assistant configuration via FTP.

## Installation

The installation of this add-on is pretty straightforward and not different in
comparison to installing any other Home Assistant add-on.

1. Click the Home Assistant My button below to open the add-on on your Home
   Assistant instance.

   [![Open this add-on in your Home Assistant instance.][addon-badge]][addon]

1. Click the "Install" button to install the add-on.
1. Start the "FTP" add-on
1. Check the logs of the "FTP" add-on to see if everything went well.

## Configuration

**Note**: _Remember to restart the add-on when the configuration is changed._

Example add-on configuration:

```yaml
log_level: info
port: 21
data_port: 20
banner: Welcome to the Hass.io FTP service.
pasv: true
pasv_min_port: 30000
pasv_max_port: 30010
pasv_address: ""
ssl: false
certfile: fullchain.pem
keyfile: privkey.pem
implicit_ssl: false
max_clients: 5
users:
  - username: hassio
    password: changeme
    allow_chmod: true
    allow_download: true
    allow_upload: true
    allow_dirlist: true
    addons: false
    backup: true
    config: true
    media: true
    share: true
    ssl: false
  - username: camera
    password: changeme
    allow_chmod: false
    allow_download: false
    allow_upload: true
    allow_dirlist: true
    addons: false
    backup: false
    config: false
    media: false
    share: true
    ssl: false
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

These log level also affects the log levels of the FTP server.

### Option: `port`

The port the FTP will listen on for incoming FTP connections.

### Option: `data_port`

The port from which PORT style connections originate.

### Option: `banner`

This string option allows you to provide the greeting banner displayed by
the FTP server when a connection first comes in.

### Option: `pasv`

Set to `false` if you want to disallow the PASV method of obtaining a data
connection. For more information about passive versus active FTP, see
[this excellent Stack Overflow][passive-vs-active] answer.

### Option: `pasv_min_port`

The minimum port to allocate for PASV style data connections. Can be used to
specify a narrow port range to assist firewalling.

### Option: `pasv_max_port`

The maximum port to allocate for PASV style data connections. Can be used to
specify a narrow port range to assist firewalling.

### Option: `pasv_address`

Use this option to override the IP address that the FTP server will advertise
in response to the PASV command. Provide a numeric IP address, or provide a
hostname which will be DNS resolved for you at startup. When left empty, the
address is taken from the incoming connected socket.

### Option: `pasv_addr_resolve`

Set to `true` to allow a hostname to be resolved for PASV connections.

### Option: `ssl`

Enables/Disables SSL on the FTP Server. Set it `true` to enable it,
`false` otherwise.

### Option: `certfile`

The certificate file to use for SSL.

**Note**: _The file MUST be stored in `/ssl/`, which is the default_

### Option: `keyfile`

The private key file to use for SSL.

**Note**: _The file MUST be stored in `/ssl/`, which is the default_

### Option: `implicit_ssl`

If set to `true`, an SSL handshake is the first thing expect on all connections
(the FTPS protocol).

### Option: `max_clients`

This is the maximum number of clients which may be connected at the same time.
Any additional clients connecting will get an error message.

### Option: `users`

This option allows you to specify a list of one or more users. Each user can
have its own permissions like defined in the sub-options below.

#### Sub-option: `username`

The username the user needs to use to login to the FTP server. A valid username
has a maximum of 32 characters, contains only `A-Z` and `0-9`.
Usernames may contain a hyphen (`-`) but must not start or end with one.

#### Sub-option: `password`

The password the user logs in with.

#### Sub-option: `allow_chmod`

Setting this option to `true` will allow the use of the `SITE CHMOD` command for
that user.

#### Sub-option: `allow_download`

Setting this option to `true` will allow the user to download files from the
FTP server.

#### Sub-option: `allow_upload`

This controls whether any FTP commands which change the filesystem are
allowed or not.

These commands are `STOR`, `DELE`, `RNFR`, `RNTO`, `MKD`, `RMD`,
`APPE`, and `SITE`.

#### Sub-option: `allow_dirlist`

Setting this option to `true`, allows to user to browse all directories
the user was given access to by using the list commands.

#### Sub-option: `addons`

Allow the user to access the `/addons` directory.

#### Sub-option: `backup`

Allow the user to access the `/backup` directory.

#### Sub-option: `config`

Allow the user to access the `/config` directory.

#### Sub-option: `media`

Allow the user to access the `/media` directory.

#### Sub-option: `share`

Allow the user to access the `/share` directory.

#### Sub-option: `ssl`

Allow the user to access the `/ssl` directory.

### Option: `i_like_to_be_pwned`

Adding this option to the add-on configuration allows to you bypass the
HaveIBeenPwned password requirement by setting it to `true`.

**Note**: _We STRONGLY suggest picking a stronger/safer password instead of
using this option! USE AT YOUR OWN RISK!_

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

Copyright (c) 2017-2024 Franck Nijhof

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
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_ftp&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/addon-ftp/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-ftp/36799?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-ftp/issues
[passive-vs-active]: https://stackoverflow.com/a/1699163/299699
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-ftp/releases
[semver]: http://semver.org/spec/v2.0.0.htm
