# PSA

- **BEFORE** you upgrade, make sure you read _EVERYTHING_ in this release.
- **BIG** shoutout to @frenck for a _major_ refactor of this addon! :heart:
- You need to have version `0.92.0` of Home Assistant (or newer) to install this update.
- A link to the web client can be added to the sidebar by toggling "Add to sidebar"

# Ingress

This release adds ingress support for the web client, this is enabled as **default**.

What this means is that if you have bookmarks, iframes, panels, proxy entries, port forwarding or anything else that uses the URL _with_ port number to access the web client those will no longer work with the default configuration.

There **is** some good news! :)

By using ingress, there is no need for a separate login, you don't need to forward ports, it just works!

### Disable ingress

If you do **not** want to use these new features, you **can** _disable_ ingress.

To disable ingress add a port in the Network configuration (example 5713) to the right of 80/tcp in the "disabled" field, after adding that hit "SAVE" then restart the addon.

# Configuration

The structure of the configuration for this addon has been changed.
Make sure you control all settings and look in the addon log for clues if something fails.

- You can no longer disable the web client.
- The `ssl` option is now "global", meaning that it will enable:
  - HTTPS for the web client.
  - Port 4883 (MQTT with SSL) on the broker.
  - Port 4884 (Websockets with SSL) on the broker.

# Changes

_Now that the important changes are taken care of, let's list the "boring" stuff._

## New functionality

- Ingress support
- "Add to sidebar" support
- Get the hostname from your browser automatically.


## Version updates

What | From | To
-- | -- | --
`mosquitto` | `1.5.8` | `1.6.2`
`nginx` | `1.14.2-r0` | `1.14.2-r1`
`lua-resty-http` | `0.12-r1` | `0.13-r0`
`nginx-mod-http-lua` | `1.14.2-r0` | `1.14.2-r1`
`base image` | `3.0.1` | `3.1.0`

[Full changelog](https://github.com/hassio-addons/addon-mqtt/compare/v1.0.1...v1.1.0)

# One last thing

Thanks again to @frenck for adding/changing most of what is in this release!