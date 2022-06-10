## What’s changed

This is a major release of the add-on, partially rewriting its base.
It simplified things a lot, takes it into a working state; but has breaking changes.

## 🚨 Breaking changes

Username & Password are now managed via the Tautulli interface, the add-on options related to authentication have thus been removed.

Using SSL certificates with this add-on is no longer possible. If you want to use SSL, we recommend using a proxy to add/offload the addition of SSL to this add-on.

The use of a database located in `/share/tautulli` has been removed.

- 🔨Rewrite of add-on @frenck (#214)

## 🚀 Enhancements

- Migrate JSON config to YAML @frenck (#186)

## 🧰 Maintenance

- 🚀 Add-on CI improvements @frenck (#162)
- Switch to centralized GitHub Action Workflows @frenck (#185)
- 🚀 Update CI to latest version @frenck (#192)
- Replace and/or remove refrences to ludeeus @ludeeus (#210)

## 📚 Documentation

- 🚑 Fix contributing link in readme @frenck (#163)
- 📚 Fix maintenance shield @frenck (#215)

## ⬆️ Dependency updates

- ⬆️ Bump docker/setup-buildx-action from 1.4.1 to 1.5.0 @dependabot (#154)
- ⬆️ Bump dessant/lock-threads from 2.0.3 to 2.1.1 @dependabot (#156)
- ⬆️ Bump docker/setup-buildx-action from 1.5.0 to 1.5.1 @dependabot (#157)
- ⬆️ Bump frenck/action-addon-linter from 2.1 to 2.2 @dependabot (#159)
- ⬆️ Bump actions/stale from 3.0.19 to 4 @dependabot (#158)
- ⬆️ Upgrades Tautulli to v2.7.5 @frenck (#160)
- ⬆️ Bump plexapi from 4.6.1 to 4.7.0 @dependabot (#161)
- ⬆️ Bump dessant/lock-threads from 2.1.1 to 2.1.2 @dependabot (#164)
- ⬆️ Bump docker/build-push-action from 2.6.1 to 2.7.0 @dependabot (#165)
- ⬆️ Bump frenck/action-addon-linter from 2.2 to 2.3 @dependabot (#166)
- ⬆️ Bump plexapi from 4.7.0 to 4.7.1 in /tautulli @dependabot (#171)
- ⬆️ Bump pycryptodomex from 3.10.1 to 3.10.4 in /tautulli @dependabot (#172)
- ⬆️ Bump frenck/action-addon-linter from 2.3 to 2.4.1 @dependabot (#176)
- ⬆️ Bump pyopenssl from 20.0.1 to 21.0.0 in /tautulli @dependabot (#175)
- ⬆️ Bump plexapi from 4.7.1 to 4.7.2 in /tautulli @dependabot (#177)
- ⬆️ Bump docker/setup-buildx-action from 1.5.1 to 1.6.0 @dependabot (#169)
- ⬆️ Bump creyD/prettier_action from 3.3 to 4.0 @dependabot (#170)
- ⬆️ Bump pycryptodomex from 3.10.4 to 3.11.0 in /tautulli @dependabot (#179)
- ⬆️ Bump actions/checkout from 2.3.4 to 2.3.5 @dependabot (#180)
- ⬆️ Upgrades add-on base image to 10.1.0 @frenck (#184)
- ⬆️ Upgrades add-on base image to 10.2.1 @frenck (#187)
- ⬆️ Upgrades add-on base image to 10.2.2 @frenck (#188)
- ⬆️ Upgrades Tautulli to v2.7.7 @frenck (#189)
- ⬆️ Bump plexapi from 4.7.2 to 4.8.0 in /tautulli @dependabot (#190)
- ⬆️ Upgrades add-on base image to 11.0.0 @frenck (#193)
- ⬆️ Upgrades add-on base image to 11.0.0 @frenck (#194)
- ⬆️ Upgrades Tautulli to v2.8.0 @frenck (#195)
- ⬆️ Upgrades Tautulli to v2.8.1 @frenck (#197)
- ⬆️ Bump pycryptodomex from 3.11.0 to 3.13.0 in /tautulli @dependabot (#199)
- ⬆️ Bump plexapi from 4.8.0 to 4.9.0 in /tautulli @dependabot (#198)
- ⬆️ Bump plexapi from 4.9.0 to 4.9.1 in /tautulli @dependabot (#200)
- ⬆️ Bump pycryptodomex from 3.13.0 to 3.14.0 in /tautulli @dependabot (#202)
- ⬆️ Bump pyopenssl from 21.0.0 to 22.0.0 in /tautulli @dependabot (#201)
- ⬆️ Bump pycryptodomex from 3.14.0 to 3.14.1 in /tautulli @dependabot (#203)
- ⬆️ Bump plexapi from 4.9.1 to 4.9.2 in /tautulli @dependabot (#204)
- ⬆️ Bump plexapi from 4.9.2 to 4.10.1 in /tautulli @dependabot (#207)
- ⬆️ Bump plexapi from 4.10.1 to 4.11.1 in /tautulli @dependabot (#212)
- ⬆️ Bump plexapi from 4.11.1 to 4.11.2 in /tautulli @dependabot (#213)
- 🔨Rewrite of add-on @frenck (#214)
