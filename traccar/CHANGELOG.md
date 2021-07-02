## What’s changed

This release provides some major upgrades to the internals of the add-on, and also ships with Traccar v4.13.

The distributed version of Traccar v4.13, requires a Java version that is only available for 64-bits systems. Therefore, this release has dropped support for 32-bits systems (`armhf`, `armv7` and `i386`).

If you are a user of a system for which support has been dropped, you can't upgrade. You can however keep running the existing version you have installed; although we recommend moving to 64-bits.

## 🚨 Breaking changes

- Drop support for 32-bits systems @frenck (#116)

## ⬆️ Dependency updates

- ⬆️ Bump docker/login-action from v1.8.0 to v1.9.0 @dependabot (#93)
- ⬆️ Bump docker/setup-qemu-action from v1.0.2 to v1.1.0 @dependabot (#92)
- ⬆️ Bump docker/setup-buildx-action from v1.1.2 to v1.2.0 @dependabot (#91)
- ⬆️ Upgrades mariadb-client to 10.5.9-r0 @frenck (#94)
- ⬆️ Bump docker/setup-buildx-action from v1.2.0 to v1.3.0 @dependabot (#96)
- ⬆️ Bump brpaz/hadolint-action from v1.4.0 to v1.5.0 @dependabot (#97)
- ⬆️ Bump frenck/action-addon-linter from 2 to 2.1 @dependabot (#98)
- ⬆️ Bump actions/stale from 3.0.18 to 3.0.19 @dependabot (#99)
- ⬆️ Bump frenck/action-addon-information from 1.0.0 to 1.1 @dependabot (#100)
- ⬆️ Bump micnncim/action-label-syncer from 1.2.0 to 1.3.0 @dependabot (#101)
- ⬆️ Bump docker/build-push-action from 2.4.0 to 2.5.0 @dependabot (#102)
- ⬆️ Bump docker/setup-qemu-action from 1.1.0 to 1.2.0 @dependabot (#103)
- ⬆️ Bump actions/cache from 2.1.5 to 2.1.6 @dependabot (#104)
- ⬆️ Upgrades add-on base image to v9.2.1 @frenck (#105)
- ⬆️ Bump frenck/action-addon-information from 1.1 to 1.2 @dependabot (#106)
- ⬆️ Upgrades nginx to 1.18.0-r15 @frenck (#107)
- ⬆️ Upgrades nss to 3.66-r0 @frenck (#108)
- ⬆️ Upgrades Traccar to v4.13 @frenck (#109)
- ⬆️ Bump docker/login-action from 1.9.0 to 1.10.0 @dependabot (#111)
- ⬆️ Upgrades add-on base image to v10.0.0 @frenck (#112)
- ⬆️ Bump docker/build-push-action from 2.5.0 to 2.6.1 @dependabot (#114)
- ⬆️ Bump docker/setup-buildx-action from 1.3.0 to 1.4.1 @dependabot (#113)
- ⬆️ Upgrades mariadb-client to 10.5.11-r0 @frenck (#115)
- ⬆️ Upgrade to openjdk11 @frenck (#110)
