[![GitLab CI][gitlabci-shield]][gitlabci]

### ***Please read before upgrading!!***

TLDR: The whole app has been rewritten. You will lose all your data.

Please read the release over on the upstream repository. There are a lot of changes:

https://github.com/timmo001/home-panel/releases/tag/v2.0.0

Any bugs or feature requests for the app itself should be opened on the upstream repo as mentioned on the release above.

The add-on specific changes include one port, upgrades and ingress support :tada: 

> There was a lot that had to change in this app to support ingress. The way that the app originally worked was to use routing (the url decides what section you want) but this causes issues with ingress. So I moved the setup of the app to use single page and a single url, but instead use states. Socket.io was also a bit of a pain to get working, since it defaults to the root of the url you are on.

## Changes

- 5cb1f83 :fire: :arrow_up: Home Panel v2 addon upgrade (#25) 
- ef0ea60 :hammer: :arrow_up: Upgrade base and use Hass.io DNS as NGinx resolver 
- 2b7cd69 :hammer: Re enable ingress 
- cbff72e :docs: Update docs 
- 9d23c5e :hammer: Update run script 
- 79adbb3 :hammer: Compile on build 
- 1209e84 :hammer: Fix config 
- 5f17136 :hammer: Update build 
- fb1b268 :fire: Add missing dependency 
- ad5d23b :hammer: Check for key first 
- eed9ee0 :ambulance: Fix secrets check 
- 8d5ea96 :hammer: Update download url 
- 9ad7d18 :hammer: Update url 
- 1aef54d :shirt: Shellcheck fix 
- 7e0bd6a :shirt: Fix shellcheck 
- 2528ae6 :arrow_up: Update openssl 
- 21c927f :hammer: Update temp link 
- a72d708 :hammer: Update temporary url to working ingress 
- 13fdd82 :hammer: Fix banner 
- 28a1b5b :sparkles: Replace links with v2.0.0 link 

[Full Changelog][changelog]

[changelog]: https://github.com/hassio-addons/addon-home-panel/compare/v0.5.0...v1.0.0
[gitlabci-shield]: https://gitlab.com/hassio-addons/addon-home-panel/badges/v1.0.0/pipeline.svg
[gitlabci]: https://gitlab.com/hassio-addons/addon-home-panel/pipelines
