Hi there! 👋

This is a big one! The app now runs on Alpine 3.24, and it arrives packed with new tooling and some nice reliability improvements.

The headline change: Vim has been replaced by Neovim. Your muscle memory is safe though, `vi`, `vim`, `nvim`, and `neovim` all launch Neovim, so you can keep typing whatever you are used to.

This release also ships a bunch of tools you previously had to install yourself. Network troubleshooting got a lot friendlier with `tcpdump`, `mtr`, and `ncat`, while `ncdu`, `lsblk`, and `smartctl` help you keep an eye on your storage and disk health. And for the file wranglers among you,  Midnight Commander (`mc`) and GNU Screen now come right out of the box.

On top of the new goodies, the  app got a little tougher. It now shuts down cleanly when SSH access is disabled (thanks @agners!), and it keeps starting up even when installing your custom packages fails, so a flaky network no longer locks you out of your own system.

Enjoy the release! 🎉

../Frenck  

https://frenck.dev

## What’s changed

## ✨ New features

- ✨ Replace Vim with Neovim, mapping vi/vim/neovim to nvim @frenck ([#1075](https://github.com/hassio-addons/app-ssh/pull/1075))
- ✨ Add network debugging tools (tcpdump, ncat, mtr) @frenck ([#1076](https://github.com/hassio-addons/app-ssh/pull/1076))
- ✨ Add disk and storage tools (ncdu, lsblk, smartmontools) @frenck ([#1077](https://github.com/hassio-addons/app-ssh/pull/1077))
- ✨ Add Midnight Commander (mc) @frenck ([#1078](https://github.com/hassio-addons/app-ssh/pull/1078))
- ✨ Add GNU Screen @frenck ([#1079](https://github.com/hassio-addons/app-ssh/pull/1079))

## 🐛 Bug fixes

- 🐛 Exit cleanly when SSH access is disabled @agners ([#1051](https://github.com/hassio-addons/app-ssh/pull/1051))
- 🔒 Restrict permissions on generated service credential files @frenck ([#1068](https://github.com/hassio-addons/app-ssh/pull/1068))
- 🔒 Exclude the SSH environment file from backups @frenck ([#1069](https://github.com/hassio-addons/app-ssh/pull/1069))
- 🐛 Fix malformed redirect when setting the account password @frenck ([#1067](https://github.com/hassio-addons/app-ssh/pull/1067))
- 🐛 Keep starting when custom package installation fails @frenck ([#1072](https://github.com/hassio-addons/app-ssh/pull/1072))

## 🚀 Enhancements

- 🔨 Use bashio::app.* instead of deprecated bashio::addon.* @frenck ([#1065](https://github.com/hassio-addons/app-ssh/pull/1065))
- 🔨 Tidy compatibility-mode sshd_config regexes @frenck ([#1070](https://github.com/hassio-addons/app-ssh/pull/1070))

## 🧰 Maintenance

- 🔧 Migrate to workflows v3.0.0 and clean up README badges @frenck ([#1066](https://github.com/hassio-addons/app-ssh/pull/1066))

## 📚 Documentation

- 📝 Clean up documentation: drop stale SSH-Audit refs and fix copy @frenck ([#1071](https://github.com/hassio-addons/app-ssh/pull/1071))
- 📝 Document clipboard copy and paste in the Web Terminal @frenck ([#1073](https://github.com/hassio-addons/app-ssh/pull/1073))
- 📝 Document running ha and the Supervisor API non-interactively @frenck ([#1074](https://github.com/hassio-addons/app-ssh/pull/1074))
- 📝 Add an example to the packages option documentation @frenck ([#1080](https://github.com/hassio-addons/app-ssh/pull/1080))

## ⬆️ Dependency updates

- ⬆️ Update alpine_3_23/vim to v9.2.0452-r0 @[renovate[bot]](https://github.com/apps/renovate) ([#1047](https://github.com/hassio-addons/app-ssh/pull/1047))
- ⬆️ Update alpine_3_23/vim to v9.2.0481-r0 @[renovate[bot]](https://github.com/apps/renovate) ([#1049](https://github.com/hassio-addons/app-ssh/pull/1049))
- ⬆️ Update Docker to v29.5.1-r0 @[renovate[bot]](https://github.com/apps/renovate) ([#1050](https://github.com/hassio-addons/app-ssh/pull/1050))
- ⬆️ Update alpine_3_23/rsync to v3.4.3-r0 @[renovate[bot]](https://github.com/apps/renovate) ([#1052](https://github.com/hassio-addons/app-ssh/pull/1052))
- ⬆️ Update alpine_3_23/vim to v9.2.0498-r0 @[renovate[bot]](https://github.com/apps/renovate) ([#1053](https://github.com/hassio-addons/app-ssh/pull/1053))
- ⬆️ Update alpine_3_23/bind-tools to v9.20.23-r0 @[renovate[bot]](https://github.com/apps/renovate) ([#1054](https://github.com/hassio-addons/app-ssh/pull/1054))
- ⬆️ Update alpine_3_23/vim to v9.2.0514-r0 @[renovate[bot]](https://github.com/apps/renovate) ([#1055](https://github.com/hassio-addons/app-ssh/pull/1055))
- ⬆️ Update App base image to v21.0.0 and Alpine 3.24 packages @[renovate[bot]](https://github.com/apps/renovate) ([#1062](https://github.com/hassio-addons/app-ssh/pull/1062))
