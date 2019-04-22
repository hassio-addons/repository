[![GitLab CI][gitlabci-shield]][gitlabci]

This version adds ingress support. :tada: Please note that the ports setup has changed in this release to default to using ingress only for the frontend (Riot). To go back to the traditional setup, map a preferred port in the network section.

Also, note that the Synapse (the Matrix server) will still be on port 8448 (by default) so you will still have to forward that port (or use a VPN solution) if you want to use Matrix outside of your home network.

## Changes

- f5e8919 :hammer: Major refactor of add-on (#11) 
  - Moves add-on onto Python base images
  - Moves requirements into a separate TXT file, so renovatebot can help out
  - Adds support for Ingress
  - Adds port descriptions
  - Adds HA authentication when accessing riot directly
  - Replaces Nginx configuration
  - Improved python cleanup logic in Dockerfile
  - Updated documentation
  - Makes NGinx wait for Synapse to start
  - Forces ports & interfaces to use
- 2ac6f21 :arrow_up: Updates pysaml2 to v4.7.0 (#12) 
- 38351f8 :ambulance: Ensure keys are generated on the first run

[Full Changelog][changelog]

[changelog]: https://github.com/hassio-addons/addon-matrix/compare/v0.3.1...v0.4.0
[gitlabci-shield]: https://gitlab.com/hassio-addons/addon-matrix/badges/v0.4.0/pipeline.svg
[gitlabci]: https://gitlab.com/hassio-addons/addon-matrix/pipelines
