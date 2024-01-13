### 🚨 THIS RELEASE HAS MAJOR BREAKING CHANGES!
### 🛑 DO NOT UPGRADE WITHOUT READING THE RELEASE NOTES!
### ⚠️ BE SURE TO BACKUP BEFORE UPGRADING!

**The v1.0.0 release is NOT backward-compatible with any existing installation prior v1.0.0.**

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

## 🚨 Breaking changes

- Remove MariaDB/MySQL support @frenck ([#474](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/474))
- Drop support for armhf & i386 @frenck ([#498](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/498))

## 🐛 Bug fixes

- Fix NPM build with NodeJS 18x @frenck ([#429](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/429))
- Clean up upstream user @frenck ([#473](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/473))
- Fix copy paste error in npm init script @frenck ([#501](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/501))
- Patch certbot plugin handling @frenck ([#508](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/508))

## 🚀 Enhancements

- Migrate add-on to new Home Assistant configuration mapping @frenck ([#500](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/500))
- Patch Nginx Proxy Manager instead of hacking around it @frenck ([#505](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/505))

## 🧰 Maintenance

- 🎆 Updates maintenance/license year to 2023 @frenck ([#408](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/408))
- Add Renovate for dependency management @frenck ([#411](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/411))
- Updated icon and logo @InTheDaylight14 ([#399](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/399))
- Remove mariadb dependencies @frenck ([#475](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/475))
- Migrate old-style base scripts s6-rc @frenck ([#499](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/499))

## 📚 Documentation

- Fix broken URL @wrt54g ([#430](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/430))
- Update documentation for upcoming release @frenck ([#506](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/506))

## ⬆️ Dependency updates

<details>
<summary>Details</summary>

- ⬆️ Update alpine_3_17/nodejs to v18 @renovate ([#415](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/415))
- ⬆️ Update alpine_3_17/npm to v9 @renovate ([#416](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/416))
- ⬆️ Update Python to v3.10.10-r0 @renovate ([#413](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/413))
- ⬆️ Update ghcr.io/hassio-addons/base Docker tag to v13 @renovate ([#417](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/417))
- ⬆️ Update alpine_3_17/mariadb-client to v10.6.12-r0 @renovate ([#420](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/420))
- ⬆️ Update alpine_3_17/certbot to v1.32.0-r0 @renovate ([#422](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/422))
- ⬆️ Update alpine_3_17/git to v2.38.4-r1 @renovate ([#423](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/423))
- ⬆️ Update alpine_3_17/apache2-utils to v2.4.56-r0 @renovate ([#418](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/418))
- ⬆️ Update alpine_3_17/patch to v2.7.6-r8 @renovate ([#421](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/421))
- ⬆️ Update alpine_3_17/py3-pip to v22.3.1-r1 @renovate ([#426](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/426))
- ⬆️ Update alpine_3_17/logrotate to v3.20.1-r3 @renovate ([#425](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/425))
- ⬆️ Update alpine_3_17/libffi-dev to v3.4.4-r0 @renovate ([#419](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/419))
- ⬆️ Update alpine_3_17/libcap to v2.66-r0 @renovate ([#424](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/424))
- ⬆️ Update OpenSSL to v3 (major) @renovate ([#427](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/427))
- ⬆️ Update OpenSSL to v3.0.8-r2 @renovate ([#431](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/431))
- ⬆️ Update ghcr.io/hassio-addons/base Docker tag to v13.1.5 @renovate ([#433](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/433))
- ⬆️ Update alpine_3_17/patch to v2.7.6-r9 @renovate ([#432](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/432))
- ⬆️ Update NginxProxyManager/nginx-proxy-manager to v2.10.1 @renovate ([#412](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/412))
- ⬆️ Update OpenSSL to v3.0.8-r3 @renovate ([#434](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/434))
- ⬆️ Update ghcr.io/hassio-addons/base Docker tag to v13.2.0 @renovate ([#435](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/435))
- ⬆️ Update NginxProxyManager/nginx-proxy-manager to v2.10.2 @renovate ([#436](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/436))
- ⬆️ Update Python to v3.10.11-r0 @renovate ([#440](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/440))
- ⬆️ Update alpine_3_17/apache2-utils to v2.4.57-r0 @renovate ([#441](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/441))
- ⬆️ Update ghcr.io/hassio-addons/base Docker tag to v13.2.1 @renovate ([#442](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/442))
- ⬆️ Update OpenSSL to v3.0.8-r4 @renovate ([#443](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/443))
- ⬆️ Update ghcr.io/hassio-addons/base Docker tag to v13.2.2 @renovate ([#444](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/444))
- ⬆️ Update alpine_3_17/git to v2.38.5-r0 @renovate ([#445](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/445))
- ⬆️ Update NginxProxyManager/nginx-proxy-manager to v2.10.4 @renovate ([#448](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/448))
- ⬆️ Update certbot-dns-cloudflare to v2 @renovate ([#428](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/428))
- ⬆️ Update ghcr.io/hassio-addons/base Docker tag to v14 @renovate ([#453](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/453))
- ⬆️ Update NGINX to v1.24.0-r7 @renovate ([#472](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/472))
- ⬆️ Update alpine_3_18/apache2-utils to v2.4.58-r0 @renovate ([#479](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/479))
- ⬆️ Update certbot-dns-cloudflare to v2.7.2 @renovate ([#480](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/480))
- ⬆️ Update ghcr.io/hassio-addons/base Docker tag to v14.3.0 @renovate ([#481](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/481))
- ⬆️ Update OpenSSL to v3.1.4-r0 @renovate ([#482](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/482))
- ⬆️ Update ghcr.io/hassio-addons/base Docker tag to v14.3.1 @renovate ([#484](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/484))
- ⬆️ Update certbot-dns-cloudflare to v2.7.3 @renovate ([#483](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/483))
- ⬆️ Update OpenSSL to v3.1.4-r1 @renovate ([#489](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/489))
- ⬆️ Update ghcr.io/hassio-addons/base Docker tag to v14.3.2 @renovate ([#491](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/491))
- ⬆️ Update certbot-dns-cloudflare to v2.8.0 @renovate ([#486](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/486))
- ⬆️ Update ghcr.io/hassio-addons/base Docker tag to v15 @renovate ([#494](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/494))
- ⬆️ Update OpenSSL to v3.1.4-r3 @renovate ([#503](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/503))
- ⬆️ Update ghcr.io/hassio-addons/base-nodejs Docker tag to v0.1.1 @renovate ([#504](https://github.com/hassio-addons/addon-nginx-proxy-manager/pull/504))

</details>
