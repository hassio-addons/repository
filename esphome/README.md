# ESPHome Home Assistant Add-On

# This Add-on is Deprecated

Please add the ESPHome repo https://github.com/esphome/home-assistant-addon and install the ESPHome add-on from there to continue getting updates.

[![Open your Home Assistant instance and show the add add-on repository dialog with a specific repository URL pre-filled.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Fesphome%2Fhome-assistant-addon)

[![Open your Home Assistant instance and show the dashboard of a Supervisor add-on.](https://my.home-assistant.io/badges/supervisor_addon.svg)](https://my.home-assistant.io/redirect/supervisor_addon/?addon=5c53de3b_esphome)

## About

This add-on allows you to manage and program your ESP8266 and ESP32 based microcontrollers
directly through Home Assistant **with no programming experience required**. All you need to do
is write YAML configuration files; the rest (over-the-air updates, compiling) is all
handled by ESPHome.

<p align="center">
<img title="ESPHome dashboard screenshot" src="https://raw.githubusercontent.com/esphome/hassio/main/esphome-dev/images/screenshot.png" width="700px"></img>
</p>

[View the ESPHome documentation](https://esphome.io/)

## Example

With ESPHome, you can go from a few lines of YAML straight to a custom-made
firmware. For example, to include a [DHT22][dht22].
temperature and humidity sensor, you just need to include 8 lines of YAML
in your configuration file:

<img title="ESPHome DHT configuration example" src="https://raw.githubusercontent.com/esphome/hassio/main/esphome-dev/images/dht-example.png" width="500px"></img>

Then just click UPLOAD and the sensor will magically appear in Home Assistant:

<img title="ESPHome Home Assistant MQTT discovery" src="https://raw.githubusercontent.com/esphome/hassio/main/esphome-dev/images/temperature-humidity.png" width="600px"></img>

[discord-shield]: https://img.shields.io/discord/429907082951524364.svg
[dht22]: https://esphome.io/components/sensor/dht.html
[discord]: https://discord.gg/KhAMKrd
[releases-shield]: https://img.shields.io/github/release/esphome/esphome.svg
[releases]: https://esphome.io/changelog/index.html
[repository]: https://github.com/esphome/esphome
