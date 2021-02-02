## What’s changed

This release upgrades a lot of the part in this add-on.
The OS, and basically all the software, including an update to the NGINX Proxy Manager itself.

As of now, the add-on is build using GitHub Actions and distributed via the GitHub Container Registry. While a big change, this change should not be noticeable to you 😉 

../Frenck

## 🐛 Bug fixes

- Add missing type to port definitions @frenck (#139)
- Grant Supervisor API access to retrieve environment information @frenck (#144)

## 🧰 Maintenance

- Cleanup repository @frenck (#130)
- Happy New Year @frenck (#131)
- Upgrade Code of Conduct @frenck (#132)
- Add new repository workflow @frenck (#133)

## 📚 Documentation

- Fix master->main in README template @frenck (#136)

## ⬆️ Dependency updates

- Upgrade add-on base image to 9.1.0 @frenck (#137)
- ⬆️ Bump certbot-dns-cloudflare from 1.7.0 to 1.11.0 in /proxy-manager @dependabot (#134)
- ⬆ Upgrades NGINX Proxy Manager to v2.7.3 @frenck (#138)
- ⬆️ Bump actions/stale from v3.0.14 to v3.0.15 @dependabot (#141)
- ⬆️ Bump frenck/action-addon-linter from v1.3.1 to v1.4 @dependabot (#142)
- ⬆ Upgrades py3-pip to 20.3.4-r0 @frenck (#140)
- Upgrade add-on base image to 9.1.1 @frenck (#143)
- Upgrade add-on base image to 9.1.2 @frenck (#146)
