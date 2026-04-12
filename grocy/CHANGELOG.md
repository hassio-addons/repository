## What’s changed

## 🚨 Breaking changes

- Drop support for armv7 systems @frenck ([#504](https://github.com/hassio-addons/app-grocy/pull/504))

## ✨ New features

- Adds support for printer configuration @valadas ([#422](https://github.com/hassio-addons/app-grocy/pull/422))
- Add support for changing GrocyCode type @lazytarget ([#513](https://github.com/hassio-addons/app-grocy/pull/513))

## 🐛 Bug fixes

- Remove deprecated codenotary fields @frenck ([#503](https://github.com/hassio-addons/app-grocy/pull/503))
- Fix unescaped dot in nginx location regex patterns @frenck ([#522](https://github.com/hassio-addons/app-grocy/pull/522))
- Fix incorrect bashio function call syntax in init-grocy @frenck ([#523](https://github.com/hassio-addons/app-grocy/pull/523))
- Fix unquoted command substitutions in PHP-FPM run script @frenck ([#524](https://github.com/hassio-addons/app-grocy/pull/524))
- Add missing php85-tokenizer extension @frenck ([#530](https://github.com/hassio-addons/app-grocy/pull/530))
- Fix frontend assets not loading after migration from yarn to npm @frenck ([#531](https://github.com/hassio-addons/app-grocy/pull/531))
- Fix feature flags not being disabled when set to false @frenck ([#532](https://github.com/hassio-addons/app-grocy/pull/532))

## 🚀 Enhancements

- Move from base-nodejs to base, upgrade to PHP 8.4 @frenck ([#520](https://github.com/hassio-addons/app-grocy/pull/520))
- Warn about default credentials on first boot @frenck ([#527](https://github.com/hassio-addons/app-grocy/pull/527))
- Remove deprecated X-XSS-Protection header @frenck ([#528](https://github.com/hassio-addons/app-grocy/pull/528))
- Move Node.js and npm to build-only dependencies @frenck ([#529](https://github.com/hassio-addons/app-grocy/pull/529))

## 🧰 Maintenance

- Refactoring and renaming add-ons to apps @frenck ([#519](https://github.com/hassio-addons/app-grocy/pull/519))

## 📚 Documentation

- Fix missing languages in documentation @frenck ([#525](https://github.com/hassio-addons/app-grocy/pull/525))
- Remove unused reference links from documentation @frenck ([#526](https://github.com/hassio-addons/app-grocy/pull/526))
- Document barcode scanner secure context requirement @frenck ([#533](https://github.com/hassio-addons/app-grocy/pull/533))

## ⬆️ Dependency updates

- ⬆️: migrate renovate config @[renovate[bot]](https://github.com/apps/renovate) ([#475](https://github.com/hassio-addons/app-grocy/pull/475))
- ⬆️ Update grocy/grocy to v4.4.2 @[renovate[bot]](https://github.com/apps/renovate) ([#478](https://github.com/hassio-addons/app-grocy/pull/478))
- ⬆️ Update alpine_3_19/git to v2.43.7-r0 @[renovate[bot]](https://github.com/apps/renovate) ([#492](https://github.com/hassio-addons/app-grocy/pull/492))
- ⬆️ Update grocy/grocy to v4.5.0 @[renovate[bot]](https://github.com/apps/renovate) ([#483](https://github.com/hassio-addons/app-grocy/pull/483))
- Move from base-nodejs to base, upgrade to PHP 8.4 @frenck ([#520](https://github.com/hassio-addons/app-grocy/pull/520))
- ⬆️ Update ghcr.io/hassio-addons/base Docker tag to v20.0.3 @[renovate[bot]](https://github.com/apps/renovate) ([#521](https://github.com/hassio-addons/app-grocy/pull/521))
- ⬆️ Update grocy/grocy to v4.6.0 @[renovate[bot]](https://github.com/apps/renovate) ([#515](https://github.com/hassio-addons/app-grocy/pull/515))
