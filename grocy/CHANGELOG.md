## What’s changed

🙏  Finally, the annoying 404-page bug when using Ingress is fixed. 

The add-on now patches Grocy to handle relative URLs better, fixing support for Ingress at full. 😎

## ✨ New features

- Implement feature setting stock count opened products against minimum stock amount @tringler (#151)

## 🐛 Bug fixes

- Add missing php7-ldap and php7-exif packages @mountainsandcode (#150)
- Fix Grocy current relative URL handling brain-damage @frenck (#157)

## 🚀 Enhancements

- Make NGinx doing less log spam @frenck (#156)

## ⬆️ Dependency updates

- ⬆️ Bump actions/stale from v3.0.17 to v3.0.18 @dependabot (#143)
- ⬆️  Upgrades git to 2.30.2-r0 @frenck (#149)
- ⬆️ Bump release-drafter/release-drafter from v5.14.0 to v5.15.0 @dependabot (#148)
- ⬆️ Bump ludeeus/action-shellcheck from 1.0.0 to 1.1.0 @dependabot (#152)
- ⬆️ Upgrades add-on base image to v9.1.6 @frenck (#155)
