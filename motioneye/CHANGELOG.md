## What’s changed

### ⚠️ Important Backup before upgrade 🚨

The motionEye add-on hasn't had maintenance for a long time. This is mainly caused by the motionEye project, which has yet to release any updates that enable further upgrades and maintenance.

This becomes problematic with the world moving on, including the Home Assistant project. Both in terms of the security of dependencies used, but also compatibility. With the release of the Home Assistant Operating System, many people reported issues with the add-on. But, there was no path forward.

Because of that, I was left with two options. Either drop the add-on or runs the development version of motionEye. motionEye is still in active development, and they have been working on many upgrades (but just haven't released anything stable). That said, both are, in my opinion, not good options; this became picking the least bad of the two.

I choose to try the latter. Therefore, the add-on now runs the development version of motionEye.

⚠️ As this is a development version, it might contain new issues and be unstable. Therefore, back up the add-on so you can roll back if needed. **Backups are the only way to roll back an add-on to a previous version reliably**.

## 🧰 Maintenance

- Add Renovate for dependency management @frenck ([#401](https://github.com/hassio-addons/addon-motioneye/pull/401))
- 🎆 Updates maintenance/license year to 2023 @frenck ([#402](https://github.com/hassio-addons/addon-motioneye/pull/402))
- Migrate old-style base scripts s6-rc @frenck ([#405](https://github.com/hassio-addons/addon-motioneye/pull/405))
- Clean up no longer needed python version indicator @frenck ([#406](https://github.com/hassio-addons/addon-motioneye/pull/406))
- Extract version for the motion project @frenck ([#407](https://github.com/hassio-addons/addon-motioneye/pull/407))

## 📚 Documentation

- Fix broken URL @wrt54g ([#392](https://github.com/hassio-addons/addon-motioneye/pull/392))

## ⬆️ Dependency updates

- ⬆️ Upgrades add-on base image to 13.2.1 @frenck ([#399](https://github.com/hassio-addons/addon-motioneye/pull/399))
- ⬆️ Update motionEye to 0.43 (dev) @frenck ([#400](https://github.com/hassio-addons/addon-motioneye/pull/400))
- ⬆️ Update Motion-Project/motion to v4.5.1 @renovate ([#409](https://github.com/hassio-addons/addon-motioneye/pull/409))
