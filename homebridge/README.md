# Hass.io Add-on: Homebridge

![Project Stage][project-stage-shield]
![Maintenance][maintenance-shield]
![Awesome][awesome-shield]
[![License][license-shield]](LICENSE.md)


This add-on provides the installation, configuration, and integration for
[Homebridge][homebridge].

Homebridge is a server that emulates the iOS HomeKit API, allowing you to
control your Home Assistant through via Apple devices (including Siri).

Since Siri supports devices added through HomeKit, this means that with
Homebridge you can ask Siri to control devices that don't have any support for
HomeKit at all. For instance, using just some of the available plugins,
you can say:

* _Siri, unlock the back door._
* _Siri, open the garage door._
* _Siri, turn on the coffee maker._
* _Siri, turn on the living room lights._
* _Siri, good morning!_

## Docker status

[![Docker Architecture][armhf-arch-shield]][armhf-dockerhub]
[![Docker Version][armhf-version-shield]][armhf-microbadger]
[![Docker Layers][armhf-layers-shield]][armhf-microbadger]
[![Docker Pulls][armhf-pulls-shield]][armhf-dockerhub]

[![Docker Architecture][aarch64-arch-shield]][aarch64-dockerhub]
[![Docker Version][aarch64-version-shield]][aarch64-microbadger]
[![Docker Layers][aarch64-layers-shield]][aarch64-microbadger]
[![Docker Pulls][aarch64-pulls-shield]][aarch64-dockerhub]

[![Docker Architecture][amd64-arch-shield]][amd64-dockerhub]
[![Docker Version][amd64-version-shield]][amd64-microbadger]
[![Docker Layers][amd64-layers-shield]][amd64-microbadger]
[![Docker Pulls][amd64-pulls-shield]][amd64-dockerhub]

[![Docker Architecture][i386-arch-shield]][i386-dockerhub]
[![Docker Version][i386-version-shield]][i386-microbadger]
[![Docker Layers][i386-layers-shield]][i386-microbadger]
[![Docker Pulls][i386-pulls-shield]][i386-dockerhub]

## Installation

The installation of this add-on is pretty straight forward and not different in
comparison to installing any other Hass.io add-on.

1. [Add our Hass.io add-ons repository][repository] to your Hass.io instance
2. Install the "Homebridge" add-on
3. Start the "Homebridge" add-on
4. Check the logs of the "Homebridge" add-on to see if everything went well and
to find the pin code needed to add your Home Assistant instance to
your iOS device

Please read the rest of this document further instructions.

## Configuration

On the first run, this add-on will create the necessary configuration files
for you. Stored in `/config/homebridge/`. You can modify the configuration
to your own liking. For documentation on configuring Homebridge, please refer
to the [Homebridge GitHub][homebridge] repository. For documentation on
configuring the Home Assistant for Homebridge plugin, please refer to the
[Home Assistant for Homebridge GitHub][homebridge-homeassistant] repository.

The add-on has a limited configuration possibility as well.

_Please remember to restart the add-on when the configuration changes._

Example add-on configuration:
```json
{
  "debug": false,
  "plugins": []
}
```

**Option: `debug`**

When set to `true` the addon will output more information in the logs of the
add-on. The add-on will also start all the services in debug mode, which causes
more output in the log files.

This might be useful when you're dealing with an unknown issue. It is
recommended leaving to option set to `false`, unless you are troubleshooting.

**Option: `plugins`**

This Homebridge add-on has support for installing additional Homebridge plugins.
Plugins are NodeJS modules published through NPM and tagged with the keyword
`homebridge-plugin`. They must have a name with the prefix `homebridge-`,
like `homebridge-mysmartlock`.

The `homebridge-homeassistant` plugin is already installed for you.

You can install a plugin by adding it to the add-on configuration. The add-on
will ensure the plugin is installed on start.

Example add-on configuration:
```json
{
  "debug": false,
  "plugins": [
    "homebridge-dummy",
    "homebridge-mysmartlock"
  ]
}
```

You can explore all available plugins at the NPM website by [searching for the
keyword `homebridge-plugin`][homebridge-plugins].

## Adding Homebridge to iOS

Using the Home app (or most other HomeKit apps), you should be able to add the
single accessory "Home Assistant", assuming that you're still running the
Homebridge add-on and you're on the same (Wifi) network. Adding this accessory
will automatically add all accessories and platforms defined in your
Home Assistant instance.

When you attempt to add the "Home Assistant" accessory, it will ask for a
"PIN code". This pin code is randomly generated when this add-on is run for
the first time. You can find the generated PIN code in the add-on logs and in
your `/config/homebridge/config.json` file (where you, of course,
can change it as well).


## Known issues and limitations

* Once your device has been added to HomeKit, you should be able to tell Siri to
control your devices. However, realize that Siri is a cloud service, and iOS may
need some time to synchronize your device information with iCloud.
* Siri will almost always prefer its default phrase handling over HomeKit
devices. For instance, if you name your Sonos device "Radio" and try saying
"Siri, turn on the Radio" then Siri will probably start playing an iTunes Radio
station on your phone. Even if you name it "Sonos" and say
"Siri, turn on the Sonos", Siri will probably just launch the Sonos app instead.
This is why, for instance, the suggested `name` for the Sonos accessory
is "Speakers".
* One installation of Homebridge can only expose 100 accessories due to a
HomeKit limit.
* Once an accessory has been added to the Home app, changing its name via
Homebridge won't be automatically reflected in iOS. You must change it via
the Home app as well.
* IPv6 support has been removed from this addon, because of known issues with
libraries used by Homebridge. If you rely solely on IPv6 in your network,
this add-on would not work.
* If you have set up SSL using a self-signed certificate, you will need to
set verify_ssl to false in your `/config/homebridge/config.json` file to allow
bypassing the Node.js certificate checks.
* Errors on startup. The following errors are experienced when starting
Homebridge and can be safely ignored.
```
*** WARNING *** The program 'nodejs' uses the Apple Bonjour compatibility layer of Avahi
*** WARNING *** Please fix your application to use the native API of Avahi!
*** WARNING *** For more information see http://0pointerde/avahi-compat?s=libdns_sd&e=nodejs
*** WARNING *** The program 'nodejs' called 'DNSServiceRegister()' which is not supported (or only supported partially) in the Apple Bonjour compatibility layer of Avahi
*** WARNING *** Please fix your application to use the native API of Avahi!
*** WARNING *** For more information see http://0pointerde/avahi-compat?s=libdns_sd&e=nodejs&f=DNSServiceRegister
```

## FAQ

**Homebridge cannot connect or login to Home Assistant**

Please be sure to set `host` and `password` parameters in the
`/config/homebridge/config.json` file.  
Normally `http://172.17.0.1:8123` should be a sufficient `host` to use when
running hass.io.  
If a password protects you Home Assistant instance, you'll also need to
set the `password`, which is empty by default.

**My iOS App Can't Find Homebridge/Home Assistant**

Two reasons why Homebridge may not be discoverable:

  1. Homebridge server thinks it's been paired with, but iOS thinks otherwise.
  Fix: deleted `persist/` directory which is in your `config/homebridge` directory
  and restart the add-on.

  2. iOS device has gotten your Homebridge `username` (looks like a MAC address)
  "stuck" somehow, where it's in the database but inactive. Fix: change your
  `username` in the "bridge" section of `/config/homebridge/config.json` to be
  some new value and restart the add-on.


## Support

Got questions? Got some unexpected behavior caused by this plugin?

Please [open an issue on our GitHub repository][issues] and we'll do our best
to help you out.

## Credits

A big shout out to the following people, without them this add-on wasn't possible:
- The team & community of [Home Assistant][home-assistant] for developing such an
excellent home automation toolkit
- [Nick Farina][nfarina] for developing [Homebrige][homebridge]

This add-on has been inspired by the following repositories:
- [docker-homebridge][oznu-docker-homebridge] by [Oznu][oznu]
- [homebridge-docker][ckuburlis-homebridge-docker]by [ckuburlis]
- [hassio-addons][olivierguerriat-hassio-addons] by [Olivier Guerriat][olivierguerriat]

Thank you all!


## More Hass.io add-ons

Do you like this add-on? Want some more functionality to your Hass.io Home
Assistant instance?

We've created multiple add-ons for Hass.io. For a full list, check out
our[GitHub Repository][repository].

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



[aarch64-arch-shield]: https://img.shields.io/badge/architecture-aarch64-blue.svg
[aarch64-dockerhub]: https://hub.docker.com/r/hassioaddons/homebridge-aarch64
[aarch64-layers-shield]: https://images.microbadger.com/badges/image/hassioaddons/homebridge-aarch64.svg
[aarch64-microbadger]: https://microbadger.com/images/hassioaddons/homebridge-aarch64
[aarch64-pulls-shield]: https://img.shields.io/docker/pulls/hassioaddons/homebridge-aarch64.svg
[aarch64-version-shield]: https://images.microbadger.com/badges/version/hassioaddons/homebridge-aarch64.svg
[amd64-arch-shield]: https://img.shields.io/badge/architecture-amd64-blue.svg
[amd64-dockerhub]: https://hub.docker.com/r/hassioaddons/homebridge-amd64
[amd64-layers-shield]: https://images.microbadger.com/badges/image/hassioaddons/homebridge-amd64.svg
[amd64-microbadger]: https://microbadger.com/images/hassioaddons/homebridge-amd64
[amd64-pulls-shield]: https://img.shields.io/docker/pulls/hassioaddons/homebridge-amd64.svg
[amd64-version-shield]: https://images.microbadger.com/badges/version/hassioaddons/homebridge-amd64.svg
[armhf-arch-shield]: https://img.shields.io/badge/architecture-armhf-blue.svg
[armhf-dockerhub]: https://hub.docker.com/r/hassioaddons/homebridge-armhf
[armhf-layers-shield]: https://images.microbadger.com/badges/image/hassioaddons/homebridge-armhf.svg
[armhf-microbadger]: https://microbadger.com/images/hassioaddons/homebridge-armhf
[armhf-pulls-shield]: https://img.shields.io/docker/pulls/hassioaddons/homebridge-armhf.svg
[armhf-version-shield]: https://images.microbadger.com/badges/version/hassioaddons/homebridge-armhf.svg
[awesome-shield]: https://img.shields.io/badge/awesome%3F-yes-brightgreen.svg
[ckuburlis-homebridge-docker]: https://github.com/ckuburlis/homebridge-docker
[ckuburlis]: https://github.com/ckuburlis
[home-assistant]: https://home-assistant.io
[homebridge-homeassistant]: https://github.com/home-assistant/homebridge-homeassistant
[homebridge-plugins]: https://www.npmjs.com/search?q=homebridge-plugin
[homebridge]: https://github.com/nfarina/homebridge
[i386-arch-shield]: https://img.shields.io/badge/architecture-i386-blue.svg
[i386-dockerhub]: https://hub.docker.com/r/hassioaddons/homebridge-i386
[i386-layers-shield]: https://images.microbadger.com/badges/image/hassioaddons/homebridge-i386.svg
[i386-microbadger]: https://microbadger.com/images/hassioaddons/homebridge-i386
[i386-pulls-shield]: https://img.shields.io/docker/pulls/hassioaddons/homebridge-i386.svg
[i386-version-shield]: https://images.microbadger.com/badges/version/hassioaddons/homebridge-i386.svg
[issues]: https://github.com/hassio-addons/repository/issues
[license-shield]: https://img.shields.io/github/license/hassio-addons/repository.svg
[maintenance-shield]: https://img.shields.io/maintenance/yes/2017.svg
[nfarina]: https://github.com/nfarina
[olivierguerriat-hassio-addons]: https://github.com/olivierguerriat/hassio-addons
[olivierguerriat]: https://github.com/olivierguerriat
[oznu-docker-homebridge]: https://github.com/oznu/docker-homebridge
[oznu]: https://github.com/oznu
[project-stage-shield]: https://img.shields.io/badge/Project%20Stage-Development-yellowgreen.svg
[repository]: https://github.com/hassio-addons/repository
