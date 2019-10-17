[Full Changelog][changelog]

 ⚠️ **This is a MAJOR release, create snapshots before upgrading!** ⚠️ 

### :tada: **This release upgrades the add-on to use Node-RED 1.0!** 🎉 

Node-RED has put out an [extensive blog post][blog] about this major release, informing you of all the major changes in this release. 

One thing, in particular, to keep in mind: This release changes the message passing between nodes to be always asynchronous rather than it being sometimes asynchronous and sometimes synchronous depending on the implementation of individual nodes.

This will, in some cases, change the relative ordering of messages when a flow branches. For more details on this change, read [this blog post][async].

But wait, there is more!

- All nodes missing in Node-RED v1.0 have been added/compensated for 😃 
- The Midnight Red theme by @bonanitech, has been updated and now supports the Dashboard as well! 😎 
- Our friends at [Snyk.io][snyk] reduced some vulnerabilities ❤️  
- Everything else has been upgraded to latest greatest 🚀 

[snyk]: https://snyk.io
[blog]: https://nodered.org/blog/2019/09/30/version-1-0-released
[async]: https://nodered.org/blog/2019/08/16/going-async


### 🔨  Changes

- :arrow_up: Updates node-red-contrib-cast to v0.2.11 (#314)
- :arrow_up: Updates node-red-node-serialport to v0.8.8 (#317)
- :arrow_up: Updates node-red-contrib-influxdb to v0.4.0 (#323)
- :arrow_up: Update dark theme configuration (#332)
- :arrow_up: Updates node-red-dashboard to v2.17.1 (#334)
- :ambulance: node-red/package.json & node-red/.snyk to reduce vulnerabilities (#327)
- :arrow_up: Pin snyk to 1.234.2 (#336)
- :arrow_up: Updates node-red to v1.0.2 (#337)
- :arrow_up: Updates node-red-contrib-theme-midnight-red to v1.0.5 (#338)
- :arrow_up: Upgrades openssh-client to 8.1_p1-r0
- :fire: Removes modclean, conflicts with Node-RED 1.0
- :hammer: Adds no audit & update notifier to npm install
- :sparkles: Re-adds missing nodes in Node-RED 1.0
- :hammer: Sets node engine >=10
- :fire: Removes notice, dark theme now supports Node-RED Dashboard
- :books: Update documentation to match latest state of the add-on

[changelog]: https://github.com/hassio-addons/addon-node-red/compare/v4.2.1...v5.0.0

Questions? Join our Discord server! https://discord.me/hassioaddons
Enjoying my add-ons? Consider supporting my work: https://patreon.com/frenck