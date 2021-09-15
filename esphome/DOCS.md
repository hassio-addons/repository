# Home Assistant Community Add-on: ESPHome

## Installation

The installation of this add-on is pretty straightforward and not different in comparison to installing any other Home Assistant add-on.

1. Search for the “ESPHome” add-on in the Supervisor add-on store.
2. Press install to download the add-on and unpack it on your machine. This can take some time.
3. Optional: If you're using SSL/TLS certificates and want to encrypt your communication to this add-on, please enter `true` into the `ssl` field and set the `fullchain` and `certfile` options accordingly.
4. Start the add-on, check the logs of the add-on to see if everything went well.
5. Click "OPEN WEB UI" to open the ESPHome dashboard. You will be asked for your Home Assistant credentials - ESPHome uses Home Assistant's authentication system to log you in.

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
