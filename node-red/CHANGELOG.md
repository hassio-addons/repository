Hey hi there! 👋 

This is a big one, so grab a coffee first. ☕ The headline act: Node-RED has been updated to version 5, running on a fresh Alpine 3.24 base image. Around that, there is a good round of long overdue spring cleaning, a nice new feature, and yes, a couple of breaking changes. Please give the notes below a quick read before you hit that update button.

⚠️ Breaking changes

Node-RED Dashboard (v1) is no longer bundled. The classic node-red-dashboard has been unmaintained upstream for a while, and on top of that it kept claiming the dashboard route and colliding with the newer FlowFuse Dashboard 2. So it had to go. Do you still rely on it? You can add it back yourself through the extra options.

Even better, this is a great moment to move over to its maintained successor, @flowfuse/node-red-dashboard.

The Twitter node has been removed. node-red-node-twitter has been unmaintained for years, and the API it relied on is no longer usable anyway. If you really need it, you can still install it via npm_packages.

✨ What is new

Node-RED can now be reached over IPv6 on the direct access port. Great news if your provider only hands you an IPv6 address from the outside world (looking at you, DS-Lite and CGNAT 👀). Nothing to configure, it just works. Ingress keeps working exactly as before.

🎨 A small heads up on themes

The dark theme was renamed to dark-modern upstream. You do not need to do anything: your existing dark setting keeps working, the correct theme is applied right away, and your configuration is migrated to dark-modern automatically.

A big thank you to everyone who reported issues and contributed to this release! 💚

../Frenck

Blogging my personal ramblings at [frenck.dev](https://frenck.dev)

## What’s changed

## 🚨 Breaking changes

- 🔥 Remove unmaintained node-red-node-twitter package @frenck ([#2233](https://github.com/hassio-addons/app-node-red/pull/2233))
- 🔥 Remove deprecated Node-RED Dashboard @frenck ([#2234](https://github.com/hassio-addons/app-node-red/pull/2234))

## ✨ New features

- ✨ Listen on IPv6 for direct access @frenck ([#2236](https://github.com/hassio-addons/app-node-red/pull/2236))

## 🚀 Enhancements

- 🐛 Use bashio::app functions for bashio v0.18 compatibility @frenck ([#2228](https://github.com/hassio-addons/app-node-red/pull/2228))
- Rename 'dark' theme to 'dark-modern' @bonanitech ([#2221](https://github.com/hassio-addons/app-node-red/pull/2221))

## 🧰 Maintenance

- 🔧 Use npm --omit flags instead of deprecated install flags @frenck ([#2230](https://github.com/hassio-addons/app-node-red/pull/2230))
- 🔥 Remove unmaintained node-red-node-twitter package @frenck ([#2233](https://github.com/hassio-addons/app-node-red/pull/2233))
- 🔧 Add missing shellcheck directive to NGINX s6 scripts @frenck ([#2231](https://github.com/hassio-addons/app-node-red/pull/2231))
- 🔧 Drop redundant $NODE_OPTIONS token from start script @frenck ([#2232](https://github.com/hassio-addons/app-node-red/pull/2232))
- 🔧 Align engines.node with Node-RED 5 requirement @frenck ([#2229](https://github.com/hassio-addons/app-node-red/pull/2229))

## 📚 Documentation

- 📝 Fix broken branch links and typos in README and docs @frenck ([#2235](https://github.com/hassio-addons/app-node-red/pull/2235))

## ⬆️ Dependency updates

- ⬆️ Update alpine_3_23/nginx to v1.28.3-r1 @[renovate[bot]](https://github.com/apps/renovate) ([#2216](https://github.com/hassio-addons/app-node-red/pull/2216))
- ⬆️ Update App base image to v21 @[renovate[bot]](https://github.com/apps/renovate) ([#2225](https://github.com/hassio-addons/app-node-red/pull/2225))
- ⬆️ Update node-red to v5 @[renovate[bot]](https://github.com/apps/renovate) ([#2227](https://github.com/hassio-addons/app-node-red/pull/2227))
- ⬆️ Update hassio-addons/workflows action to v3 @[renovate[bot]](https://github.com/apps/renovate) ([#2226](https://github.com/hassio-addons/app-node-red/pull/2226))
- ⬆️ Update js-yaml to v4.2.0 @[renovate[bot]](https://github.com/apps/renovate) ([#2220](https://github.com/hassio-addons/app-node-red/pull/2220))
- ⬆️ Update @node-red-contrib-themes/theme-collection to v5 @[renovate[bot]](https://github.com/apps/renovate) ([#2224](https://github.com/hassio-addons/app-node-red/pull/2224))
- ⬆️ Update node-red-node-email to v5.2.4 @[renovate[bot]](https://github.com/apps/renovate) ([#2219](https://github.com/hassio-addons/app-node-red/pull/2219))
