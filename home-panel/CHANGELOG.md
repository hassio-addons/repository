[![GitLab CI][gitlabci-shield]][gitlabci]

This version adds ingress support. :tada: Please note that the ports setup has changed in this release to default to using ingress only for the frontend. To go back to the traditional setup, map a preferred port in the network section.

Also note, that the API does not support ingress as of yet, so you will only be able to access the app remotely if you forward the API port like before.

## Changes

- 3ed0640 :arrow_up: Update Home Panel to v0.9.1 
- d2a7e15 :books: Standarizes supported architectures badges (#18) 
- 8698a76 :fire: Improves add-on configuration (#19) 
- b68d5d9 :hammer: :sparkles: Rewrite nginx and add ingress support 
- cefe6d6 :arrow_up: Update Home Panel to v0.9.2 
- 9216465 :books: Remove legacy screenshot 
- ca726bb :ambulance: Restore bashio access to config 
- 562a748 :rocket: Update base to v3.1.0 

[Full Changelog][changelog]

[changelog]: https://github.com/hassio-addons/addon-home-panel/compare/v0.3.2...v0.4.0
[gitlabci-shield]: https://gitlab.com/hassio-addons/addon-home-panel/badges/v0.4.0/pipeline.svg
[gitlabci]: https://gitlab.com/hassio-addons/addon-home-panel/pipelines
