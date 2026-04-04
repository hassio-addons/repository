## What’s changed

## ✨ New features

- Make always use DERP option configurable @lmagyar ([#592](https://github.com/hassio-addons/app-tailscale/pull/592))
- Add support for Taildrive @lmagyar ([#617](https://github.com/hassio-addons/app-tailscale/pull/617))
- Make service name option configurable for Share Home Assistant option @lmagyar ([#626](https://github.com/hassio-addons/app-tailscale/pull/626))

## 🐛 Bug fixes

- Fix MagicDNS incompatibility with Home Assistant's DNS @lmagyar ([#455](https://github.com/hassio-addons/app-tailscale/pull/455))
- Fix DNS service default option value handling @lmagyar ([#616](https://github.com/hassio-addons/app-tailscale/pull/616))
- Fix DNS service default option value handling @lmagyar ([#618](https://github.com/hassio-addons/app-tailscale/pull/618))
- Reinitialize bashio log outputs to the redirected stdout @lmagyar ([#567](https://github.com/hassio-addons/app-tailscale/pull/567))
- Fix DNS service: always resolve letsencrypt's api locally @lmagyar ([#622](https://github.com/hassio-addons/app-tailscale/pull/622))
- Fix NetworkManager dispatcher script crashes due to s6-overlay changes @lmagyar ([#653](https://github.com/hassio-addons/app-tailscale/pull/653))
- Prevent logging SERVFAIL by MagicDNS, caused by Supervisor's hourly DNS tests @lmagyar ([#636](https://github.com/hassio-addons/app-tailscale/pull/636))

## 🚀 Enhancements

- Drop path for ipcalc @lmagyar ([#613](https://github.com/hassio-addons/app-tailscale/pull/613))
- Make all config options mandatory @lmagyar ([#541](https://github.com/hassio-addons/app-tailscale/pull/541))

## 🧰 Maintenance

- Fix missed add-on to app renames @lmagyar ([#615](https://github.com/hassio-addons/app-tailscale/pull/615))

## 📚 Documentation

- Update documentation of service dependencies @lmagyar ([#623](https://github.com/hassio-addons/app-tailscale/pull/623))
- Update links to Tailscale documentation @lmagyar ([#627](https://github.com/hassio-addons/app-tailscale/pull/627))
- Update documentation of accept DNS option @lmagyar ([#629](https://github.com/hassio-addons/app-tailscale/pull/629))
- Change Home Assistant Discord join link @lmagyar ([#655](https://github.com/hassio-addons/app-tailscale/pull/655))

## ⬆️ Dependency updates

- ⬆️ Update hassio-addons/workflows action to v2.0.4 @[renovate[bot]](https://github.com/apps/renovate) ([#621](https://github.com/hassio-addons/app-tailscale/pull/621))
- ⬆️ Update alpine_3_23/nginx to v1.28.2-r0 @[renovate[bot]](https://github.com/apps/renovate) ([#625](https://github.com/hassio-addons/app-tailscale/pull/625))
- ⬆️ Update alpine_3_23/nginx to v1.28.2-r1 @[renovate[bot]](https://github.com/apps/renovate) ([#633](https://github.com/hassio-addons/app-tailscale/pull/633))
- ⬆️ Update alpine_3_23/bind-tools to v9.20.19-r0 @[renovate[bot]](https://github.com/apps/renovate) ([#635](https://github.com/hassio-addons/app-tailscale/pull/635))
- ⬆️ Update tailscale/tailscale to v1.94.2 @[renovate[bot]](https://github.com/apps/renovate) ([#634](https://github.com/hassio-addons/app-tailscale/pull/634))
- ⬆️ Update hassio-addons/workflows action to v2.0.5 @[renovate[bot]](https://github.com/apps/renovate) ([#638](https://github.com/hassio-addons/app-tailscale/pull/638))
- Follow up on "Update hassio-addons/workflows action to v2.0.5", add permissions to deploy.yaml also @lmagyar ([#639](https://github.com/hassio-addons/app-tailscale/pull/639))
- ⬆️ Update alpine_3_23/bind-tools to v9.20.20-r0 @[renovate[bot]](https://github.com/apps/renovate) ([#640](https://github.com/hassio-addons/app-tailscale/pull/640))
- ⬆️ Update tailscale/tailscale to v1.96.2 @[renovate[bot]](https://github.com/apps/renovate) ([#644](https://github.com/hassio-addons/app-tailscale/pull/644))
- ⬆️ Update alpine_3_23/bind-tools to v9.20.21-r0 @[renovate[bot]](https://github.com/apps/renovate) ([#649](https://github.com/hassio-addons/app-tailscale/pull/649))
- ⬆️ Update alpine_3_23/nginx to v1.28.3-r0 @[renovate[bot]](https://github.com/apps/renovate) ([#650](https://github.com/hassio-addons/app-tailscale/pull/650))
- ⬆️ Update tailscale/tailscale to v1.96.4 @[renovate[bot]](https://github.com/apps/renovate) ([#645](https://github.com/hassio-addons/app-tailscale/pull/645))
- ⬆️ Update App base image to v20.0.2 @[renovate[bot]](https://github.com/apps/renovate) ([#654](https://github.com/hassio-addons/app-tailscale/pull/654))
- ⬆️ Update alpine_3_23/bind-tools to v9.20.22-r0 @[renovate[bot]](https://github.com/apps/renovate) ([#656](https://github.com/hassio-addons/app-tailscale/pull/656))
- ⬆️ Update hassio-addons/workflows action to v2.0.6 @[renovate[bot]](https://github.com/apps/renovate) ([#652](https://github.com/hassio-addons/app-tailscale/pull/652))
