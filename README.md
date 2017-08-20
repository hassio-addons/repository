# Community Hass.io add-ons for Home Assistant

![Project Stage][project-stage-shield]
![Maintenance][maintenance-shield]
![Awesome][awesome-shield]
[![License][license-shield]](LICENSE.md)

Hass.io allows anyone to create add-on repositories to share their add-ons for
Hass.io easily. This repository is one of those repositories, providing extra
Home Assistant add-ons for your Hass.io installation.

The primary goal of this project is to provide you (as a Hass.io /
Home Assistant user) with additional, high quality, add-ons that allow you to
take your automated home to the next level.

## Installation

Adding this add-ons repository to your Hass.io Home Assistant instance is
pretty easy. Follow [the official instructions][third-party-addons] on the
website of Home Assistant, and use the following URL:

```txt
https://github.com/hassio-addons/repository
```

## Add-ons provided by this repository

### &#10003; [Homebridge][addon-homebridge]

![Latest Version][homebridge-version-shield]
![Supports armhf Architecture][homebridge-armhf-shield]
![Supports aarch64 Architecture][homebridge-aarch64-shield]
![Supports amd64 Architecture][homebridge-amd64-shield]
![Supports i386 Architecture][homebridge-i386-shield]
![Docker Pulls][homebridge-pulls-shield]

Homebridge is a server that emulates the iOS HomeKit API, allowing you to
control your Home Assistant through via Apple devices (including Siri).

[:books: Homebridge add-on documentation][addon-homebridge]

### &#10003; [SSH - Secure Shell][addon-ssh]

![Latest Version][ssh-version-shield]
![Supports armhf Architecture][ssh-armhf-shield]
![Supports aarch64 Architecture][ssh-aarch64-shield]
![Supports amd64 Architecture][ssh-amd64-shield]
![Supports i386 Architecture][ssh-i386-shield]
![Docker Pulls][ssh-pulls-shield]

Log in to your Hass.io Home Assistant instance using SSH.
This is an enhanced version of the provided SSH add-on by Home Assistant and 
focusses on security, usability, and flexibility.

[:books: SSH add-on documentation][addon-ssh]

### &#10003; [Terminal][addon-terminal]

![Latest Version][terminal-version-shield]
![Supports armhf Architecture][terminal-armhf-shield]
![Supports aarch64 Architecture][terminal-aarch64-shield]
![Supports amd64 Architecture][terminal-amd64-shield]
![Supports i386 Architecture][terminal-i386-shield]
![Docker Pulls][terminal-pulls-shield]

This add-on allows you to log in to your Hass.io Home Assistant instance using
a web terminal. It is like SSH but in your Home Assistant frontend.

[:books: Terminal add-on documentation][addon-terminal]

## Changelog

This add-on repository itself does not keep a change log, the individual
add-ons, however, do. The format is based on [Keep a Changelog][keepchangelog]
moreover, these add-ons adhere to [Semantic Versioning][semver].

## Support

Got questions?

You have several options to get them answered:

- The Home Assistant [Community Forums][forums], we have a 
  [dedicated topic][forums] on that forum regarding this repository.
- The Home Assistant [Discord Chat Server][discord] for general Home Assistant 
  discussions and questions.
- Join the [Reddit subreddit][reddit] in [/r/homeassistant][reddit]

You could also open an issue here on GitHub. Note, we use a separate
GitHub repository for each add-on. Please ensure you are creating the issue
on the correct GitHub repository matching the add-on.

- [Open an issue for the addon: Homebridge][homebridge-issue]
- [Open an issue for the addon: SSH - Secure Shell][ssh-issue]
- [Open an issue for the addon: Terminal][terminal-issue]
- For a general repository issues or add-on ideas [open a issue here][issue]

## Contributing

This is an active open-source project. We are always open to people who want to
use the code or contribute to it.

We've set up a separate document for our [contribution guidelines](CONTRIBUTING.md).

Thank you for being involved! :heart_eyes:

We are also looking for maintainers!  
Please send [Franck Nijhof][frenck] a message when you are interested in becoming one.

## Authors & contributors

The original setup of this repository is by [Franck Nijhof][frenck].

For a full list of all authors and contributors,
check [the contributor's page][contributors].

## License

MIT License

Copyright (c) 2017 Franck Nijhof

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

[issue]: https://github.com/hassio-addons/repository/issues
[addon-homebridge]: https://github.com/hassio-addons/addon-homebridge
[addon-ssh]: https://github.com/hassio-addons/addon-ssh
[addon-terminal]: https://github.com/hassio-addons/addon-terminal
[awesome-shield]: https://img.shields.io/badge/awesome%3F-yes-brightgreen.svg
[contributors]: https://github.com/hassio-addons/repository/graphs/contributors
[discord]: https://discord.gg/c5DvZ4e
[forums]: https://community.home-assistant.io/t/repository-community-hass-io-add-ons/24705?u=frenck
[frenck]: https://community.home-assistant.io/u/frenck/summary
[homebridge-aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[homebridge-amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[homebridge-armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[homebridge-i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[homebridge-issue]: https://github.com/hassio-addons/addon-homebridge/issues
[homebridge-pulls-shield]: https://img.shields.io/docker/pulls/hassioaddons/homebridge-armhf.svg
[homebridge-version-shield]: https://images.microbadger.com/badges/version/hassioaddons/homebridge-armhf.svg
[keepchangelog]: http://keepachangelog.com/en/1.0.0/
[license-shield]: https://img.shields.io/github/license/hassio-addons/repository.svg
[maintenance-shield]: https://img.shields.io/maintenance/yes/2017.svg
[project-stage-shield]: https://img.shields.io/badge/Project%20Stage-Development-yellowgreen.svg
[reddit]: https://reddit.com/r/homeassistant
[semver]: http://semver.org/spec/v2.0.0.html
[ssh-aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[ssh-amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[ssh-armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[ssh-i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[ssh-issue]: https://github.com/hassio-addons/addon-ssh/issues
[ssh-pulls-shield]: https://img.shields.io/docker/pulls/hassioaddons/ssh-armhf.svg
[ssh-version-shield]: https://images.microbadger.com/badges/version/hassioaddons/ssh-armhf.svg
[terminal-aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[terminal-amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[terminal-armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[terminal-i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[terminal-issue]: https://github.com/hassio-addons/addon-terminal/issues
[terminal-pulls-shield]: https://img.shields.io/docker/pulls/hassioaddons/terminal-armhf.svg
[terminal-version-shield]: https://images.microbadger.com/badges/version/hassioaddons/terminal-armhf.svg
[third-party-addons]: https://home-assistant.io/hassio/installing_third_party_addons/
