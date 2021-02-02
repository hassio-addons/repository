## What’s changed

⚠️ This major release of the SQLite Web add-on comes with a lot of breaking changes, so please read this carefully!

This add-on has been simplified to match the task it was built for: Explore the Home Assistant SQLite database.
It now is a single click install and user experience, without the need for any configuration.

Breaking changes:
- Direct access to SQLite Web has been removed.
- Datasette has been removed.
- All options have been removed.

The add-on now opens the Home Assistant database, from its default location and is served via Ingress only.

## 🚨 Breaking changes

- Major refactor of add-on @frenck (#114)

## 🐛 Bug fixes

- Fix larger table widths on larger screens @frenck (#116)
- Fix incorrect ingress template filename @frenck (#117)

## 🚀 Enhancements

- Major refactor of add-on @frenck (#114)

## 🧰 Maintenance

- Cleanup repository @frenck (#105)
- Happy New Year @frenck (#106)
- Upgrade Code of Conduct @frenck (#107)
- Add new repository workflow @frenck (#108)
- Remove obsolete webui from configuration @frenck (#111)

## ⬆️ Dependency updates

- ⬆️ Bump actions/stale from v3.0.14 to v3.0.15 @dependabot (#110)
- ⬆️ Bump frenck/action-addon-linter from v1.3.1 to v1.4 @dependabot (#109)
- Upgrade add-on base image to 9.1.2 @frenck (#113)
- ⬆️ Bump frenck/action-yamllint from v1.0.2 to v1.1 @dependabot (#115)
