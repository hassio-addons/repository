[Full Changelog][changelog]

🎉  This is a major release of the add-on, changing and improving a lot!

✨ First of all, this release introduces Ingress support. This means you can now access the interface from Home Assistant, even via the NabuCasa cloud. If you had configured a `panel_iframe`, you can no go ahead and remove that and check the "Show in Sidebar" toggle on the add-on page. Still, want to access the Pi-Hole web interface directly? You can always do that, by setting a port in the add-on network options.

🔐 Pi-hole has single password protection (yeah, without username even), which is not really uh... Ok, we've improved that by adding Home Assistant authentication. You can now login with your HA username/password. However, when using Ingress, Home Assistant will take care of that for you 🎉  (So this only applies to direct access).

🏡 Integrating the add-on with Home Assistant has always been a pain. We've solved that in this release, by adding a special endpoint for Pi-Hole integration of Home Assistant. The example in the add-on documentation is now a "copy, paste, restart & enjoy"-example. There is nothing more to it.

🌐 The add-on has been adjusted to work and play nicely with the new Hass.io DNS services. Should solve a lot of headaches for quite a few people.

### :hammer: Changes

- :arrow_up: Upgrades gcc/g++ to 8.3.0-r0
- :arrow_up: Upgrades wget to 1.20.3-r0
- :arrow_up: Upgrades Pi-hole web interface to v4.3
- :pencil2: Maintaince -> Maintenance
- :arrow_up: Upgrades libexecinfo-dev to 1.1-r1
- :arrow_up: Upgrades linux-headers to 4.19.36-r0
- :arrow_up: Upgrades nettle-dev to 3.4.1-r1
- :fire: Removes Bash, since the base image provides it
- :arrow_up: Upgrades bc to 1.07.1-r1
- :arrow_up: Upgrades bind-tools to 9.14.3-r0
- :arrow_up: Upgrades coreutils to 8.31-r0
- :arrow_up: Upgrades git to 2.22.0-r0
- :arrow_up: Upgrades grep to 3.3-r0
- :arrow_up: Upgrades libcap to 2.27-r0
- :arrow_up: Upgrades libxml2 to 2.9.9-r2
- :arrow_up: Upgrades ncurses to 6.1_p20190518-r0
- :arrow_up: Upgrades openssl to 1.1.1c-r0
- :arrow_up: Upgrades perl to 5.28.2-r1
- :arrow_up: Upgrades sed to 4.7-r0
- :arrow_up: Upgrades sudo to 1.8.27-r0
- :arrow_up: Upgrades Pi-hole core to v4.3.1
- :ambulance: Fixes path handling for SSL certificates
- :arrow_up: Upgrades add-on base image to v4.1.1
- :arrow_up: Upgrades musl-dev to 1.1.22-r3
- :arrow_up: Upgrades php to 7.3.8-r0
- :arrow_up: Upgrades nginx to 1.16.1-r0
- :arrow_up: Upgrades Pi-hole FTL to v4.3.1
- :tractor: :hammer: Complete rewrite of the add-on
- :books: Updates documentation to match latest changes

[changelog]: https://github.com/hassio-addons/addon-pi-hole/compare/v3.0.2...v4.0.0

Questions? Join our Discord server! https://discord.me/hassioaddons
Enjoying my add-ons? Consider supporting my work: https://patreon.com/frenck