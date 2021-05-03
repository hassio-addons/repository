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

[discord-shield]: https://img.shields.io/discord/429907082951524364.svg
[dht22]: https://esphome.io/components/sensor/dht.html
[discord]: https://discord.gg/KhAMKrd
[releases-shield]: https://img.shields.io/github/release/esphome/esphome.svg
[releases]: https://esphome.io/changelog/index.html
[repository]: https://github.com/esphome/esphome
