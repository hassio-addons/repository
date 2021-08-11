## What’s changed

Node-RED 2.x is here! 🎉 

This add-on ships with Node-RED 2.0.5, which is a major version bump for the Node-RED Project (Congrats on the major release btw!)
Want to find out what changes in Node-RED 2.0?

https://nodered.org/blog/2021/07/20/version-2-0-released

## 🚨 Breaking changes

This release brings a couple of "breaking" changes (besides the major Node-RED upgrade of course).

The add-on configuration options `dark_mode`, `require_ssl`, and `i_like_to_be_pwnd` have been dropped
and can be removed from your add-on configuration.

- 🔥 Remove dark mode support, has been replaced by themes @frenck (#1087)
- 🔥 Clean up HIBP logic, as it is now handled by the Supervisor @frenck (#1090)
- 🔥 Clean up unused require_ssl setting @frenck (#1095)

## 🚀 Enhancements

- 🔑 Update NGINX SSL parameters @frenck (#1084)
- 🔥 Clean up really old migration logic @frenck (#1089)
- 🏎 Enable streaming mode for Ingress @frenck (#1091)

## 🧰 Maintenance

- 🚀 Add-on CI improvements @frenck (#1086)

## 📚 Documentation

- ✏️ Update documentation to match latest changes @frenck (#1092)
- ✏️ Small documentation cleanups and tweaks @frenck (#1093)

## ⬆️ Dependency updates

- ⬆️ Upgrades nodejs to 14.17.4-r0 @frenck (#1083)
- ⬆️ Upgrades add-on base image to v10.0.1 @frenck (#1085)
- Bump @node-red-contrib-themes/theme-collection from 1.0.2 to 2.0.3 in /node-red @dependabot (#1080)
- Bump node-red-contrib-modbus from 5.14.0 to 5.14.1 in /node-red @dependabot (#1082)
- Bump node-red from 1.3.5 to 2.0.5 @dependabot (#1079)
