## What’s changed

👋  Hi there! Time for a big update, **v10.0.0**

⚠️ Please read this carefully, as this release comes with a bunch of breaking changes.

The add-on has upgraded to Alpine 3.15, which means all tools are now running the latest versions.

The `homeassistant_cli` has been removed. This (third-party) CLI has some upstream updates, which broke add-on compatibility.
It, therefore, has now been removed. One can still install it using the `command_init` option if wanted, however, is no longer part of the default distribution.

The Have I Been Pwned checks have been removed from the add-on, as this is a built-in feature of the Supervisor nowadays. This means the `i_like_to_be_pwned` option has been removed from the add-on configuration. If you have this option set, you will need to remove this from your add-on options.

Lastly, the `addon.stdin` service has been removed. And I want to explain a little about the reasoning behind it.

The `addon.stdin` service allowed to run commands on this add-on, which could be helpful. However, I got contacted about this service as it has the potential to be used as an attack surface in combination with social engineering. Quite a lot of social engineering, as this is not a one-click accept kinda attack. It requires a lot of steps.

For this matter, me (@frenck) and the reporting person didn't agree on the type of issue this imposes. A CVE has been requested at MITRE by the reporter, however, I do not recognize it and do not agree on the vulnerability. For that reason, this person and the CVE are also not listed in these release notes.

The service has not been removed because I think it is a vulnerability (as a matter of fact, I don't agree it is), but the service is removed as I think we should protect users, even against possible complex social engineering; if this helps, I think we should do that. 

The above all said... You can use the plain `ssh` command as a replacement for this service; which is generally already done and has been around for ages 👍  And always check any third-party code and configuration you get from others of course! 🙏 

If these changes impacted your automations or scripts, please accept my sincere apologies.

Kind regards,

../Frenck

PS: I hope the Firefox rendering issues is finally resolved! Please let me know :)

## 🚨 Breaking changes

- 🔥 Remove STDIN service @frenck (#349)
- 🔥 Remove hibp checks @frenck (#350)
- 🔥 Remove homeassistant_cli @frenck (#352)

## 🧰 Maintenance

- Update CI Workflows @frenck (#347)
- 🔥 Remove left over hass-cli auto completion @frenck (#353)

## 📚 Documentation

- Fix privileged mode instructions for HASS 2021.12 @tigattack (#346)

## ⬆️ Dependency updates

- ⬆️ Upgrades add-on base image to 11.0.0 @frenck (#348)
- ⬆️ Upgrades ttyd to 3e37e33 @frenck (#351)
