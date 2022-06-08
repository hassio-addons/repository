## What’s changed

This is a major release of the add-on, with some breaking changes, fixes, and major upgrades to its dependencies.

v12.0.1 additionally cleans up a node that was missed (thanks, @regevbr for spotting that).
v12.0.2 fixes a possible issue during startup in case of connection problems.

## 🚨 Breaking changes

The following Node-RED where previously built-in, and have been removed:

- `node-red-contrib-alexa-home-skill`
- `node-red-contrib-looptimer`
- `node-red-contrib-statistics`
- `node-red-contrib-stoptimer`
- `node-red-contrib-timecheck`
- `node-red-contrib-traffic`
- `node-red-node-msgpack`
- `node-red-node-sentiment`

They have been removed because of their low usage/installs and most
of them have not been maintained for years now. If you like to keep any of those, you can add/install them again yourself.

Additionally, the Raspberry Pi GPIO support has been removed.
It has always been flaky at best, and in many cases not working at all.
Besides, it generated errors/warnings when using the add-on on a device that is not a Raspberry Pi.
Removing it reduces the add-on size by ~20% and improves the security rating of the add-on.

- 🔥 Cleanup built-in nodes @frenck (#1359)
- 🔥 Remove GPIO support @frenck (#1360)

## 🐛 Bug fixes

- 🚑 Fix serial port binding issue @frenck (#1357)
- 🚑 Ensure add-on starts without internet @frenck (#1368)

## 🧰 Maintenance

- 🧹 Clean up another 5Mb of cache files @frenck (#1361)
- 🧹 Clean up gpio node @regevbr (#1362)

## 📚 Documentation

- 📚 Minor typo for add repo link @sinclairpaul (#1343)
- 📚 Use new My Home Assistant link format @frenck (#1358)

## ⬆️ Dependency updates

- Bump node-red-contrib-persistent-fsm from 1.1.0 to 1.2.0 in /node-red @dependabot (#1344)
- Bump node-red-dashboard from 3.1.6 to 3.1.7 in /node-red @dependabot (#1345)
- Bump node-red-node-feedparser from 0.2.2 to 0.3.0 in /node-red @dependabot (#1355)
- ⬆️ Upgrades add-on base image to 12.0.0 @frenck (#1356)
