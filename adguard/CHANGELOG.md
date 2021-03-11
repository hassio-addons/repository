## What’s changed

This updates AdGuard Home to the latest and greatest version (ships with AdGuard Home v0.105.2), which contains a lot of fixes.

Additionally, this add-on has breaking changes, which is the reason for the major version bump. AdGuard Home will now bind solely to the main network interface. The Supervisor provides this network information, thus having a proper, Supervisor supported and managed, network configuration is now required.

Lastly, the snapshots of this add-on are now smaller and quicker and the logs spam way less.

## 🚨 Breaking changes

- 🚑 Bind AdGuard Home to the default interface @frenck (#126)

## 🐛 Bug fixes

- 🚑 Bind AdGuard Home to the default interface @frenck (#126)
- 🚑 Ensure the add-on has proper API access @frenck (#129)
- 🚑 Fix host configuration, remove netmask @frenck (#130)

## 🚀 Enhancements

- Exclude querylogs from snapshots @frenck (#131)
- Disable Nginx access logs @frenck (#132)

## 🧰 Maintenance

- Remove obsolete webui from configuration @frenck (#107)

## ⬆️ Dependency updates

- ⬆️ Bump actions/stale from v3.0.14 to v3.0.15 @dependabot (#106)
- ⬆️ Bump frenck/action-addon-linter from v1.3.1 to v1.4 @dependabot (#105)
- Upgrade add-on base image to 9.1.1 @frenck (#109)
- Upgrade add-on base image to 9.1.2 @frenck (#110)
- ⬆️ Bump frenck/action-yamllint from v1.0.2 to v1.1 @dependabot (#111)
- ⬆️ Bump actions/cache from v2.1.3 to v2.1.4 @dependabot (#112)
- ⬆️ Bump actionshub/markdownlint from 2.0.0 to 2.0.2 @dependabot (#113)
- ⬆️ Bump actions/stale from v3.0.15 to v3.0.16 @dependabot (#115)
- ⬆️ Bump frenck/action-addon-linter from v1.4 to v2 @dependabot (#116)
- ⬆️ Upgrades AdGuard Home to v0.105.0 @pattyland (#117)
- ⬆️ Bump release-drafter/release-drafter from v5.13.0 to v5.14.0 @dependabot (#119)
- ⬆️ Upgrades AdGuard Home to v0.105.1 @pattyland (#120)
- ⬆️ Bump docker/build-push-action from v2.2.2 to v2.3.0 @dependabot (#121)
- ⬆️ Bump actions/stale from v3.0.16 to v3.0.17 @dependabot (#122)
- ⬆️ Bump actions/stale from v3.0.17 to v3.0.18 @dependabot (#124)
- ⬆️ Upgrades add-on base image to v9.1.5 @frenck (#127)
- ⬆️ Upgrades AdGuard Home to v0.105.2 @frenck (#128)
