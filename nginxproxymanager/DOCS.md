# Home Assistant Community App: Nginx Proxy Manager

This app enables you to easily forward incoming connections to anywhere,
including free SSL, without having to know too much about Nginx
or Let’s Encrypt.

Forward your domain to your Home Assistant, apps, or websites running
at home or anywhere else, straight from a simple, powerful interface.

Want to protect the website with a username/password? Well, it can do that too!
Enable authentication and create a list of usernames/password that can access
that specific application.

For the power users, you can customize the behavior of each host in the
Nginx proxy manager by providing additional Nginx directives.

## Installation

The installation of this app is pretty straightforward and not different in
comparison to installing any other Home Assistant app.

1. Click the Home Assistant My button below to open the app on your Home
   Assistant instance.

   [![Open this app in your Home Assistant instance.][app-badge]][app]

1. Click the "Install" button to install the app.
1. Start the "Nginx Proxy Manager" app
1. Check the logs of the "Nginx Proxy Manager" app to see if everything went well.
1. Click the "OPEN WEB UI" button and follow the setup wizard to create
   your administrator account.
1. Forward port `443` (and optionally `80`) from your router to your
   Home Assistant machine.
1. Enjoy the app!

## Configuration

This app does not provide any configuration options.

## Ports

This app binds three ports on your Home Assistant machine:

| Port  | Purpose                                                       |
| ----- | ------------------------------------------------------------- |
| `80`  | HTTP entrance, also used by Let's Encrypt to validate domains |
| `81`  | The admin web interface                                       |
| `443` | HTTPS entrance                                                |

Ports `80` and `443` need to be free on your machine. If Home Assistant
itself is serving SSL on port `443`, or another app already uses one of
these ports, this app will not start. The host side of each port can be
changed in the app's "Network" configuration.

## Storage

Everything this app stores lives in its own configuration folder, which
you can reach at `/addon_configs/a0d7b954_nginxproxymanager` with the
"File editor" or "Samba" apps:

| Item              | Contents                                     |
| ----------------- | -------------------------------------------- |
| `database.sqlite` | Your hosts, users, certificates and settings |
| `access`          | Username and password files for access lists |
| `custom_ssl`      | Certificates you uploaded yourself           |
| `letsencrypt`     | Certificates issued by Let's Encrypt         |
| `logs`            | Certbot logs, excluded from backups          |
| `nginx`           | The generated Nginx configuration            |
| `nginx/custom`    | Your own additional Nginx directives         |

Files placed in `nginx/custom` are included by the generated configuration,
which is how the advanced options in the web interface are applied.

## Troubleshooting

Start with the app's own log, which carries both the Nginx and the Nginx
Proxy Manager output.

If a certificate fails to issue or renew, certbot writes its own, more
detailed log to `logs/letsencrypt.log` in the folder above. The most common
causes are port `80` not being reachable from the internet, or DNS for the
domain not pointing at your connection.

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
check [the contributor's page][contributors].

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

[app-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[app]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_nginxproxymanager&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/app-nginx-proxy-manager/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-nginx-proxy-manager/111830?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/app-nginx-proxy-manager/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/app-nginx-proxy-manager/releases
[semver]: https://semver.org/spec/v2.0.0.html
