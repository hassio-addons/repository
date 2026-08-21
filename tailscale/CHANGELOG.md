## What’s changed

## 🚨 Breaking changes

- Add support for advertising Tailscale Services @apfohl ([#715](https://github.com/hassio-addons/app-tailscale/pull/715))
- Rename the `addons` and `addon_configs` Taildrive shares to `local_apps` and `app_configs` to match Home Assistant's app terminology - config is automatically updated @lmagyar ([#722](https://github.com/hassio-addons/app-tailscale/pull/722))

## ✨ New features

- Add support for advertising Tailscale Services @apfohl ([#715](https://github.com/hassio-addons/app-tailscale/pull/715))
- Allow serving / funneling even if HA is set up with HTTPS/SSL @dynamyc010 ([#702](https://github.com/hassio-addons/app-tailscale/pull/702))
- Add log_upload config option to configure log upload separately from local app log level @lmagyar ([#681](https://github.com/hassio-addons/app-tailscale/pull/681))
- Force reauthentication when tailscale explicitly complains about login server change @lmagyar ([#673](https://github.com/hassio-addons/app-tailscale/pull/673))

## 🐛 Bug fixes

- Remove unnecessary NetworkManager/dispatcher.d scripts from Alpine package @lmagyar ([#668](https://github.com/hassio-addons/app-tailscale/pull/668))
- Fix grammar in log message @lmagyar ([#670](https://github.com/hassio-addons/app-tailscale/pull/670))
- Properly close s6 notification file descriptors @lmagyar ([#672](https://github.com/hassio-addons/app-tailscale/pull/672))
- Redirect LOG_FD also when suppressing log messages @lmagyar ([#669](https://github.com/hassio-addons/app-tailscale/pull/669))
- Graceful shutdown on SIGTERM caused by manual app stop @lmagyar ([#703](https://github.com/hassio-addons/app-tailscale/pull/703))
- Properly handle failure during service startup @lmagyar ([#729](https://github.com/hassio-addons/app-tailscale/pull/729))
- In case of invalid networking DNS settings disable MagicDNS to enable the app to start up @lmagyar ([#662](https://github.com/hassio-addons/app-tailscale/pull/662))
- Refactor MagicDNS support to properly handle appconnectors and exit nodes @lmagyar ([#667](https://github.com/hassio-addons/app-tailscale/pull/667))
- Refactor slow activities from nm-dispatcher script into separate listener service @lmagyar ([#680](https://github.com/hassio-addons/app-tailscale/pull/680))
- Fix forwarding for local tailnet connections @lmagyar ([#663](https://github.com/hassio-addons/app-tailscale/pull/663))
- Write userspace_networking as a boolean, not a string @frenck ([#739](https://github.com/hassio-addons/app-tailscale/pull/739))

## 🚀 Enhancements

- Revert bashio related temporary workarounds after new bashio release in app base image @lmagyar ([#614](https://github.com/hassio-addons/app-tailscale/pull/614))
- Adopt Bashio 0.19 APIs and drop local workarounds @frenck ([#738](https://github.com/hassio-addons/app-tailscale/pull/738))
- Change options default value and name to align with stock Tailscale's platform-specific behavior - config is automatically updated!!! @lmagyar ([#585](https://github.com/hassio-addons/app-tailscale/pull/585))

## 🧰 Maintenance

- 👷 Replace Repology with Alpine CDN datasource for package pins @frenck ([#736](https://github.com/hassio-addons/app-tailscale/pull/736))
- Remove lock and stale workflows, drop architecture and chat badges @frenck ([#737](https://github.com/hassio-addons/app-tailscale/pull/737))
- Adopt Bashio 0.19 APIs and drop local workarounds @frenck ([#738](https://github.com/hassio-addons/app-tailscale/pull/738))
- ⬆️ Update hassio-addons/workflows action to v4 @frenck ([#740](https://github.com/hassio-addons/app-tailscale/pull/740))
- Point the AppArmor profile at the S6 v3 service paths @frenck ([#741](https://github.com/hassio-addons/app-tailscale/pull/741))

## 📚 Documentation

- Remove lock and stale workflows, drop architecture and chat badges @frenck ([#737](https://github.com/hassio-addons/app-tailscale/pull/737))
- Update Docs, add notes for general and serve/funnel configuration @lmagyar ([#671](https://github.com/hassio-addons/app-tailscale/pull/671))
- Update documentation links and extend error messages @lmagyar ([#708](https://github.com/hassio-addons/app-tailscale/pull/708))
- Update docs to refer to the new networking UI in HA v2026.8 to configure http integration @lmagyar ([#727](https://github.com/hassio-addons/app-tailscale/pull/727))
- Fix typos in code comments @lmagyar ([#743](https://github.com/hassio-addons/app-tailscale/pull/743))

## ⬆️ Dependency updates

- ⬆️ Update App base image to v20.0.3 @[renovate[bot]](https://github.com/apps/renovate) ([#664](https://github.com/hassio-addons/app-tailscale/pull/664))
- ⬆️ Update App base image to v20.0.4 @[renovate[bot]](https://github.com/apps/renovate) ([#665](https://github.com/hassio-addons/app-tailscale/pull/665))
- ⬆️ Update App base image to v20.1.0 @[renovate[bot]](https://github.com/apps/renovate) ([#675](https://github.com/hassio-addons/app-tailscale/pull/675))
- ⬆️ Update App base image to v20.1.1 @[renovate[bot]](https://github.com/apps/renovate) ([#682](https://github.com/hassio-addons/app-tailscale/pull/682))
- ⬆️ Update alpine_3_23/dnsmasq to v2.91-r1 @[renovate[bot]](https://github.com/apps/renovate) ([#686](https://github.com/hassio-addons/app-tailscale/pull/686))
- ⬆️ Update alpine_3_23/nginx to v1.28.3-r1 @[renovate[bot]](https://github.com/apps/renovate) ([#687](https://github.com/hassio-addons/app-tailscale/pull/687))
- ⬆️ Update tailscale/tailscale to v1.98.3 @[renovate[bot]](https://github.com/apps/renovate) ([#689](https://github.com/hassio-addons/app-tailscale/pull/689))
- ⬆️ Update alpine_3_23/bind-tools to v9.20.23-r0 @[renovate[bot]](https://github.com/apps/renovate) ([#690](https://github.com/hassio-addons/app-tailscale/pull/690))
- ⬆️ Update alpine_3_23/nginx to v1.28.3-r2 @[renovate[bot]](https://github.com/apps/renovate) ([#691](https://github.com/hassio-addons/app-tailscale/pull/691))
- ⬆️ Update alpine_3_23/nginx to v1.28.3-r3 @[renovate[bot]](https://github.com/apps/renovate) ([#696](https://github.com/hassio-addons/app-tailscale/pull/696))
- ⬆️ Update tailscale/tailscale to v1.98.4 @[renovate[bot]](https://github.com/apps/renovate) ([#695](https://github.com/hassio-addons/app-tailscale/pull/695))
- ⬆️ Update App base image to v20.2.0 @[renovate[bot]](https://github.com/apps/renovate) ([#698](https://github.com/hassio-addons/app-tailscale/pull/698))
- ⬆️ Update App base image to v21 @[renovate[bot]](https://github.com/apps/renovate) ([#699](https://github.com/hassio-addons/app-tailscale/pull/699))
- ⬆️ Update alpine_3_24/nginx to v1.30.3-r0 @[renovate[bot]](https://github.com/apps/renovate) ([#706](https://github.com/hassio-addons/app-tailscale/pull/706))
- ⬆️ Update alpine_3_24/bind-tools to v9.20.24-r0 @[renovate[bot]](https://github.com/apps/renovate) ([#710](https://github.com/hassio-addons/app-tailscale/pull/710))
- ⬆️ Update tailscale/tailscale to v1.98.8 @[renovate[bot]](https://github.com/apps/renovate) ([#711](https://github.com/hassio-addons/app-tailscale/pull/711))
- ⬆️ Update alpine_3_24/nginx to v1.30.4-r0 @[renovate[bot]](https://github.com/apps/renovate) ([#716](https://github.com/hassio-addons/app-tailscale/pull/716))
- ⬆️ Update tailscale/tailscale to v1.98.9 @[renovate[bot]](https://github.com/apps/renovate) ([#717](https://github.com/hassio-addons/app-tailscale/pull/717))
- ⬆️ Update alpine_3_24/nginx to v1.30.4-r1 @[renovate[bot]](https://github.com/apps/renovate) ([#718](https://github.com/hassio-addons/app-tailscale/pull/718))
- ⬆️ Update alpine_3_24/bind-tools to v9.20.26-r0 @[renovate[bot]](https://github.com/apps/renovate) ([#719](https://github.com/hassio-addons/app-tailscale/pull/719))
- ⬆️ Update tailscale/tailscale to v1.98.10 @[renovate[bot]](https://github.com/apps/renovate) ([#720](https://github.com/hassio-addons/app-tailscale/pull/720))
- ⬆️ Update App base image to v21.0.1 @[renovate[bot]](https://github.com/apps/renovate) ([#721](https://github.com/hassio-addons/app-tailscale/pull/721))
- ⬆️ Update tailscale/tailscale to v1.102.1 @[renovate[bot]](https://github.com/apps/renovate) ([#724](https://github.com/hassio-addons/app-tailscale/pull/724))
- ⬆️ Update tailscale/tailscale to v1.102.2 @[renovate[bot]](https://github.com/apps/renovate) ([#725](https://github.com/hassio-addons/app-tailscale/pull/725))
- ⬆️ Update hassio-addons/workflows action to v3 @[renovate[bot]](https://github.com/apps/renovate) ([#700](https://github.com/hassio-addons/app-tailscale/pull/700))
- ⬆️ Update hassio-addons/workflows action to v3.0.1 @[renovate[bot]](https://github.com/apps/renovate) ([#733](https://github.com/hassio-addons/app-tailscale/pull/733))
- ⬆️ Update App base image to v21.0.2 @[renovate[bot]](https://github.com/apps/renovate) ([#732](https://github.com/hassio-addons/app-tailscale/pull/732))
- ⬆️ Update tailscale/tailscale to v1.102.3 @[renovate[bot]](https://github.com/apps/renovate) ([#735](https://github.com/hassio-addons/app-tailscale/pull/735))
- ⬆️ Update hassio-addons/workflows action to v4 @frenck ([#740](https://github.com/hassio-addons/app-tailscale/pull/740))
