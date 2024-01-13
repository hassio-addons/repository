### 🚨 THIS RELEASE HAS MAJOR BREAKING CHANGES!
### 🛑 DO NOT UPGRADE WITHOUT READING THE RELEASE NOTES!
### ⚠️ BE SURE TO BACKUP BEFORE UPGRADING!

**The v1.0.1 release is NOT backward-compatible with any existing installation prior v1.0.0.**

Unfortunately, no stable/good migration path is possible; thus, on upgrade, you will **lose all your current NPM settings and configuration**. After the upgrade, you must set up your proxy configuration from scratch.

**Please make sure you have the time to do this when you decide to upgrade.**

After upgrading, you can log in with the default username & password: `admin@example.com` / `changeme`.

Additionally, support for the `i386` and `armhf` OS/CPU architecture has been dropped (as has been dropped previously for all other Community Add-ons as well).

[If you have any more questions, please check this issue.](https://github.com/hassio-addons/addon-nginx-proxy-manager/issues/507)

## What’s changed

- Based on the latest Nginx Proxy Manager [v2.10.4](https://github.com/NginxProxyManager/nginx-proxy-manager/releases/tag/v2.10.4), which closes [CVE-2023-27224](https://www.cvedetails.com/cve/CVE-2023-27224/).
- Based on the latest Alpine Linux 3.19.
- The add-on no longer uses the MariaDB add-on. This means after you have upgraded/migrated, you could uninstall the MariaDB add-on (if you solely used it for NPM).
- Certbot now functions properly, which means all DNS challenges work as expected.
- Backups of this add-on are now complete. They will contain all data, settings, and certificates; and can be restored easily/as normal.
- All raw configuration data of NPM is now accessible via the `adddons_config` folder (for example, using Samba).

## What’s changed

## 🐛 Bug fixes

- Fix syntax error in certbot patch @frenck ([#510](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/510))

For all other changes in v1.0.0 see: <https://github.com/hassio-addons/addon-nginx-proxy-manager/releases/tag/v1.0.0>