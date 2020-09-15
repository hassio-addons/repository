# ESPHome Home Assistant Add-On

[![ESPHome logo](https://raw.githubusercontent.com/esphome/hassio/master/esphome-dev/logo.png)](https://esphome.io/)

[![GitHub stars](https://img.shields.io/github/stars/esphome/esphome.svg?style=social&label=Star&maxAge=2592000)](https://github.com/esphome/esphome)
[![GitHub Release][releases-shield]][releases]
[![Discord][discord-shield]][discord]

## About

This add-on allows you to manage and program your ESP8266 and ESP32 based microcontrollers
directly through Home Assistant **with no programming experience required**. All you need to do
is write YAML configuration files; the rest (over-the-air updates, compiling) is all
handled by ESPHome.

<p align="center">
<img title="ESPHome dashboard screenshot" src="https://raw.githubusercontent.com/esphome/hassio/master/esphome-dev/images/screenshot.png" width="700px"></img>
</p>

[View the ESPHome documentation](https://esphome.io/)

## Example

With ESPHome, you can go from a few lines of YAML straight to a custom-made
firmware. For example, to include a [DHT22][dht22].
temperature and humidity sensor, you just need to include 8 lines of YAML
in your configuration file:

<img title="ESPHome DHT configuration example" src="https://raw.githubusercontent.com/esphome/hassio/master/esphome-dev/images/dht-example.png" width="500px"></img>

Then just click UPLOAD and the sensor will magically appear in Home Assistant:

<img title="ESPHome Home Assistant MQTT discovery" src="https://raw.githubusercontent.com/esphome/hassio/master/esphome-dev/images/temperature-humidity.png" width="600px"></img>

## Installation

To install this Home Assistant add-on you need to add the ESPHome add-on repository
first:

1. Add the ESPHome add-ons repository to your Home Assistant instance. You can do this by navigating to the "Add-on store" tab in the Supervisor panel and then entering https://github.com/esphome/hassio in the "Add repository" field after selecting "Repositories" from the top-right menu.
2. Now scroll down and select the "ESPHome" add-on.
3. Press install to download the add-on and unpack it on your machine. This can take some time.
4. Optional: If you're using SSL/TLS certificates and want to encrypt your communication to this add-on, please enter `true` into the `ssl` field and set the `fullchain` and `certfile` options accordingly.
5. Start the add-on, check the logs of the add-on to see if everything went well.
6. Click "OPEN WEB UI" to open the ESPHome dashboard. You will be asked for your Home Assistant credentials - ESPHome uses Home Assistant's authentication system to log you in.

You can view the ESPHome documentation at https://esphome.io/

## Configuration

**Note**: _Remember to restart the add-on when the configuration is changed._

Example add-on configuration:

```json
{
  "ssl": false,
  "certfile": "fullchain.pem",
  "keyfile": "privkey.pem"
}
```

### Option: `ssl`

Enables or disables encrypted SSL/TLS (HTTPS) connections to the web server of this add-on.
Set it to `true` to encrypt communications, `false` otherwise.
Please note that if you set this to `true` you must also generate the key and certificate
files for encryption. For example using [Let's Encrypt](https://www.home-assistant.io/addons/lets_encrypt/)
or [Self-signed certificates](https://www.home-assistant.io/docs/ecosystem/certificates/tls_self_signed_certificate/).

### Option: `certfile`

The certificate file to use for SSL. If this file doesn't exist, the add-on start will fail.

**Note**: The file MUST be stored in `/ssl/`, which is the default for Home Assistant

### Option: `keyfile`

The private key file to use for SSL. If this file doesn't exist, the add-on start will fail.

**Note**: The file MUST be stored in `/ssl/`, which is the default for Home Assistant

### Option: `leave_front_door_open`

Adding this option to the add-on configuration allows you to disable
authentication by setting it to `true`.

### Option: `esphome_version`

Manually override which ESPHome version to use in the add-on.
For example to install the latest development version, use `"esphome_version": "dev"`,
or for version 1.14.0: `"esphome_version": "v1.14.0""`.

Please note that this does not always work and is only meant for testing, usually the
ESPHome add-on and dashboard version must match to guarantee a working system.

### Option: `relative_url`

Host the ESPHome dashboard under a relative URL, so that it can be integrated
into existing web proxies like NGINX under a relative URL. Defaults to `/`.

### Option: `status_use_ping`

By default the dashboard uses mDNS to check if nodes are online. This does
not work across subnets unless your router supports mDNS forwarding or avahi.

Setting this to `true` will make ESPHome use ICMP ping requests to get the node status. Use this if all nodes always have offline status even when they're connected.

### Option: `streamer_mode`

If set to `true`, this will enable streamer mode, which makes ESPHome hide all
potentially private information. So for example WiFi (B)SSIDs (which could be
used to find your location), usernames, etc. Please note that you need to use
the `!secret` tag in your YAML file to also prevent these from showing up
while editing and validating.

[discord-shield]: https://img.shields.io/discord/429907082951524364.svg
[dht22]: https://esphome.io/components/sensor/dht.html
[discord]: https://discord.gg/KhAMKrd
[releases-shield]: https://img.shields.io/github/release/esphome/esphome.svg
[releases]: https://esphome.io/changelog/index.html
[repository]: https://github.com/esphome/esphome
