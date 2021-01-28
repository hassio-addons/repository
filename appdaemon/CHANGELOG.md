## What’s changed

This patch release applies a patch to fix an issue with AppDaemon's dependencies.

The bug is reported upstream, but not recognized as one by AppDaemon's collaborators; thus this release applies a patch during build-time to ensure you as a user of the add-on won't run into it.

## 🐛 Bug fixes

- Patch AppDaemon Engine.io dependency issues @frenck (#67)

## ⬆️ Dependency updates

- ⬆️ Bump frenck/action-addon-linter from v1.3.1 to v1.4 @dependabot (#63)
- ⬆ Upgrades py3-pip to 20.3.4-r0 @frenck (#65)
- Upgrade add-on base image to 9.1.1 @frenck (#66)
