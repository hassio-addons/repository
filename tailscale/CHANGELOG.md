## What’s changed

Major updates and tons of new features!

Special thanks to @lmagyar, @willnorris, @reey and @bitfliq  for their contributions and work on this ❤️ 

## ✨ New features

- Make exit node advertisement configurable @frenck ([#183](https://github.com/hassio-addons/addon-tailscale/pull/183))
- Make Taildrop configurable @frenck ([#185](https://github.com/hassio-addons/addon-tailscale/pull/185))
- Drop userspace networking @frenck ([#181](https://github.com/hassio-addons/addon-tailscale/pull/181))
- Make accepting magicDNS optional @frenck ([#194](https://github.com/hassio-addons/addon-tailscale/pull/194))
- Enable Tailscale's builtin inbound HTTPS proxy @lmagyar ([#137](https://github.com/hassio-addons/addon-tailscale/pull/137))
- Enable Tailscale's Funnel feature @lmagyar ([#197](https://github.com/hassio-addons/addon-tailscale/pull/197))
- make accepting subnet routes optional @willnorris ([#252](https://github.com/hassio-addons/addon-tailscale/pull/252))
- Make userspace networking configurable @lmagyar ([#199](https://github.com/hassio-addons/addon-tailscale/pull/199))
- Make advertise routes configurable @lmagyar ([#253](https://github.com/hassio-addons/addon-tailscale/pull/253))
- Clamp the MSS to the MTU for all advertised subnet's interface @lmagyar ([#222](https://github.com/hassio-addons/addon-tailscale/pull/222))
- Make subnet source NAT configurable @lmagyar ([#223](https://github.com/hassio-addons/addon-tailscale/pull/223))

## 🐛 Bug fixes

- Fix login-server option @reey ([#184](https://github.com/hassio-addons/addon-tailscale/pull/184))
- Remove duplicate status checks from dependent S6 services @lmagyar ([#196](https://github.com/hassio-addons/addon-tailscale/pull/196))

## 🚀 Enhancements

- Create fallback page for iOS browsers failing to open Tailscale login page @bitfliq ([#198](https://github.com/hassio-addons/addon-tailscale/pull/198))
- Do not opt out of client log upload in debug log level @lmagyar ([#212](https://github.com/hassio-addons/addon-tailscale/pull/212))
- Warn about key expiration @lmagyar ([#255](https://github.com/hassio-addons/addon-tailscale/pull/255))
- Use new .Self.CapMap in status JSON for HTTPS support check @lmagyar ([#260](https://github.com/hassio-addons/addon-tailscale/pull/260))
- Protect local subnets from being routed toward Tailscale subnets if they collide @lmagyar ([#201](https://github.com/hassio-addons/addon-tailscale/pull/201))

## 📚 Documentation

- Add taildrop to example configuration @lmagyar ([#188](https://github.com/hassio-addons/addon-tailscale/pull/188))
- Device limit update in DOCS.md @lmagyar ([#192](https://github.com/hassio-addons/addon-tailscale/pull/192))
- Add docs for accept_dns @frenck ([#195](https://github.com/hassio-addons/addon-tailscale/pull/195))
- Fix CONTRIBUTING Link in README.md @senden9 ([#232](https://github.com/hassio-addons/addon-tailscale/pull/232))
- Rearrange proxy documentation into alphabetical order @lmagyar ([#240](https://github.com/hassio-addons/addon-tailscale/pull/240))
- Update Installation section in documentation @lmagyar ([#242](https://github.com/hassio-addons/addon-tailscale/pull/242))

## ⬆️ Dependency updates

- ⬆️ Update Add-on base image to v13.2.2 @renovate ([#189](https://github.com/hassio-addons/addon-tailscale/pull/189))
- ⬆️ Update tailscale/tailscale to v1.40.0 @renovate ([#191](https://github.com/hassio-addons/addon-tailscale/pull/191))
- ⬆️ Update tailscale/tailscale to v1.40.1 @renovate ([#200](https://github.com/hassio-addons/addon-tailscale/pull/200))
- ⬆️ Update Add-on base image to v14 (major) @renovate ([#202](https://github.com/hassio-addons/addon-tailscale/pull/202))
- ⬆️ Update alpine_3_18/nginx to v1.24.0-r4 @renovate ([#205](https://github.com/hassio-addons/addon-tailscale/pull/205))
- ⬆️ Update alpine_3_18/nginx to v1.24.0-r5 @renovate ([#206](https://github.com/hassio-addons/addon-tailscale/pull/206))
- ⬆️ Update tailscale/tailscale to v1.42.0 @renovate ([#207](https://github.com/hassio-addons/addon-tailscale/pull/207))
- ⬆️ Update alpine_3_18/nginx to v1.24.0-r6 @renovate ([#208](https://github.com/hassio-addons/addon-tailscale/pull/208))
- ⬆️ Update Add-on base image to v14.0.1 @renovate ([#215](https://github.com/hassio-addons/addon-tailscale/pull/215))
- ⬆️ Update Add-on base image to v14.0.2 @renovate ([#217](https://github.com/hassio-addons/addon-tailscale/pull/217))
- ⬆️ Update tailscale/tailscale to v1.44.0 @renovate ([#218](https://github.com/hassio-addons/addon-tailscale/pull/218))
- ⬆️ Update Add-on base image to v14.0.3 @renovate ([#228](https://github.com/hassio-addons/addon-tailscale/pull/228))
- ⬆️ Update tailscale/tailscale to v1.44.2 @renovate ([#230](https://github.com/hassio-addons/addon-tailscale/pull/230))
- ⬆️ Update tailscale/tailscale to v1.46.0 @renovate ([#231](https://github.com/hassio-addons/addon-tailscale/pull/231))
- ⬆️ Update tailscale/tailscale to v1.46.1 @renovate ([#234](https://github.com/hassio-addons/addon-tailscale/pull/234))
- ⬆️ Update Add-on base image to v14.0.5 @renovate ([#233](https://github.com/hassio-addons/addon-tailscale/pull/233))
- ⬆️ Update Add-on base image to v14.0.6 @renovate ([#235](https://github.com/hassio-addons/addon-tailscale/pull/235))
- ⬆️ Update Add-on base image to v14.0.7 @renovate ([#237](https://github.com/hassio-addons/addon-tailscale/pull/237))
- ⬆️ Update Add-on base image to v14.0.8 @renovate ([#238](https://github.com/hassio-addons/addon-tailscale/pull/238))
- ⬆️ Update Add-on base image to v14.1.0 @renovate ([#241](https://github.com/hassio-addons/addon-tailscale/pull/241))
- ⬆️ Update tailscale/tailscale to v1.48.0 @renovate ([#243](https://github.com/hassio-addons/addon-tailscale/pull/243))
- ⬆️ Update tailscale/tailscale to v1.48.1 @renovate ([#245](https://github.com/hassio-addons/addon-tailscale/pull/245))
- ⬆️ Update tailscale/tailscale to v1.48.2 @renovate ([#256](https://github.com/hassio-addons/addon-tailscale/pull/256))
- ⬆️ Update Add-on base image to v14.1.1 @renovate ([#257](https://github.com/hassio-addons/addon-tailscale/pull/257))
- ⬆️ Update tailscale/tailscale to v1.50.0 @renovate ([#259](https://github.com/hassio-addons/addon-tailscale/pull/259))
- ⬆️ Update ghcr.io/hassio-addons/base/i386 Docker tag to v14.1.3 @renovate ([#261](https://github.com/hassio-addons/addon-tailscale/pull/261))
- ⬆️ Update Add-on base image to v14.1.3 @renovate ([#262](https://github.com/hassio-addons/addon-tailscale/pull/262))
- ⬆️ Update Add-on base image to v14.2.0 @renovate ([#263](https://github.com/hassio-addons/addon-tailscale/pull/263))
- ⬆️ Update tailscale/tailscale to v1.50.1 @renovate ([#264](https://github.com/hassio-addons/addon-tailscale/pull/264))
- ⬆️ Update Add-on base image to v14.2.1 @renovate ([#267](https://github.com/hassio-addons/addon-tailscale/pull/267))
- ⬆️ Update Add-on base image to v14.2.2 @renovate ([#270](https://github.com/hassio-addons/addon-tailscale/pull/270))
