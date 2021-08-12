## What’s changed

⚠️  This is a major release with breaking changes!
Please read them carefully.

**Besides that, we call this version 1.0.0! Magic** 🪄 

## 🚨 Breaking changes

- 🔥 **Drop support for 32-bits systems (armv7, i386)** @frenck (#242)
  As announced in the previous release, support for the 32-bits operating system has been dropped. Please migrate to a 64-bits (operating) system in order to use this add-on.

- 🥶 **Use cold backups** @frenck (#243)
  To make backups (snapshots) more reliable, the add-on will now shut down during the time Home Assistant is making the backup (and of course will start again after the backup is done).

- 🔥 **Drop support for custom SSL certificates** @frenck (#244)
  Lately, SSL gave problems for a lot of users, which is partly additionally hard because UniFi runs quite some old internals. Therefore, we've removed the SSL options from the add-on. The add-on will migrate your UniFi configuration to use a self-signed SSL certificate on upgrade. If you want to run the UniFi controller with your own SSL certificate, we recommend using a reverse proxy to achieve that.

## 🚀 Enhancements

- 🏎 Reduce default memory footprint @frenck (#245)

## 🧰 Maintenance

- 🚀 Add-on CI improvements @frenck (#241)

## 📚 Documentation

- ✏️ Mark add-on stable @frenck (#246)

## ⬆️ Dependency updates

- ⬇️  Downgrade MongoDB to 3.4 to provide an upgrade path @frenck (#247)
