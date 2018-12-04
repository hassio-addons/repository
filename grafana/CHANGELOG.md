This release upgrades Grafana to 5.4.0 🎉, which offers a lot of new functionality! Especially folks using it with MySQL will be happy to see the graphical query builder in this release! 👷 

PhantomJS has been removed from the build. 🔥 It still works on AMD64 based machines (embedded into Grafana), but on ARM-based devices (e.g., Raspberry Pi), this has, and will, never work. I've tried several solutions and finally decided to add a note to the known issues and limitations in the documentation. For the record, Grafana simply does not support it, and the PhantomJS project has been abandoned as well. Grafana is planning on replacing it with Grafana 6.x.

[Full Changelog][changelog]

- Changed past to paste (#13) (@dayofdoom)
- Removes phantomjs
- Upgrades Grafana to 5.4.0
- Corrects the env var name (#16) (@goern)
- Limits supported machines (#14) (@HoppingMonk)
- Adds known issue and limitation about PhantomJS

[changelog]: https://github.com/hassio-addons/addon-grafana/compare/v1.1.0...v1.2.0