# Home Assistant Community Add-on: Lutron Certificate

[![Release][release-shield]][release] ![Project Stage][project-stage-shield] ![Project Maintenance][maintenance-shield]

[![Discord][discord-shield]][discord] [![Community Forum][forum-shield]][forum]

[![Buy me a coffee][buymeacoffee-shield]][buymeacoffee]

A simple utility to generate signed certificate files to allow local control of
a Lutron Caseta smart bridge.

## Deprecation warning

**This add-on is in a deprecated state!**

This add-on used to be helpful when in need of getting the signed certificates
of your Lutron Caseta smart bridge in order to use it with Home Assistant.

Nowadays, Home Assistant does support/help with this itself and this add-on
is therefore no longer needed.

If you want to integrate Lutron Caseta with Home Assistant, than follow
the instructions on the Home Assistant Lutron Caseta integration documentation
page:

<https://www.home-assistant.io/integrations/lutron_caseta/#configuration>

## About

This add-on will guide you through the necessary steps to create signed
certificate files necessary to control your Lutron Caseta smart bridge with
Home Assistant.

Three files will be created during successful execution of the wizard:

- `/ssl/lutron/caseta.key`: the private key file used to generate the
  certificate.
- `/ssl/lutron/caseta.crt`: the signed certificate file used to connect to
  the Lutron Caseta bridge.
- `/ssl/lutron/caseta-bridge.crt`: the certificate authority file that is
  downloaded from the Lutron Caseta bridge.

Be sure to add Lutron Caseta to your `configuration.yaml` after starting the
add-on:

```yaml
lutron_caseta:
  host: 192.168.1.100
  keyfile: /ssl/lutron/caseta.key
  certfile: /ssl/lutron/caseta.crt
  ca_certs: /ssl/lutron/caseta-bridge.crt
```

For more information on how to configure Lutron Caseta in Home Assistant see
the [Lutron Caseta documentation][lutron-caseta-docs].


[buymeacoffee-shield]: https://www.buymeacoffee.com/assets/img/guidelines/download-assets-sm-2.svg
[buymeacoffee]: https://www.buymeacoffee.com/dale3h
[discord-shield]: https://img.shields.io/discord/478094546522079232.svg
[discord]: https://discord.me/hassioaddons
[forum-shield]: https://img.shields.io/badge/community-forum-brightgreen.svg
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-lutron-certificate/70317?u=frenck
[lutron-caseta-docs]: https://www.home-assistant.io/components/lutron_caseta/
[maintenance-shield]: https://img.shields.io/maintenance/yes/2021.svg
[project-stage-shield]: https://img.shields.io/badge/project%20stage-%20!%20DEPRECATED%20%20%20!-ff0000.svg
[release-shield]: https://img.shields.io/badge/version-v0.8.0-blue.svg
[release]: https://github.com/hassio-addons/addon-lutron-cert/tree/v0.8.0