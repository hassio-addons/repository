## ⚠️ Breaking change: this app now runs on Debian

This release moves the app from Alpine Linux to Debian, and it now ships its own Python runtime instead of using the one the distribution provides.

**You only need to do something if you use the `system_packages` option.** Those are Alpine package names today and they need to become Debian ones. Many are identical, but some differ, for example `build-base` becomes `build-essential`. If you were using that option to install a Python library (something like `py3-numpy`), move it to `python_packages` instead. Everything else keeps working untouched: your apps, your `appdaemon.yaml`, and the `python_packages` option itself.

### Why

Alpine has moved its Python to 3.14, which the current AppDaemon release cannot run on at all. Shipping our own Python means this app can follow the Python version AppDaemon actually supports, instead of whatever the distribution happens to ship that cycle.

The second reason is `python_packages`. Alpine builds on musl, and most projects on PyPI do not publish musl builds, so installing a package meant compiling it from source inside a container that has no compiler. That is the confusing error many of you have run into over the years. On Debian those same packages install as prebuilt wheels, so things like `scikit-learn` and `opencv-python` now simply work, in seconds rather than failing outright.

The trade off is image size, which roughly doubles from about 140 MB to about 340 MB.

---

## What’s changed

## 🚨 Breaking changes

- 💥 Migrate to Debian base with an app-managed Python runtime @frenck ([#518](https://github.com/hassio-addons/app-appdaemon/pull/518))

## 🐛 Bug fixes

- 🐛 Wait for Home Assistant to finish starting @frenck ([#521](https://github.com/hassio-addons/app-appdaemon/pull/521))

## 🧰 Maintenance

- 💥 Migrate to Debian base with an app-managed Python runtime @frenck ([#518](https://github.com/hassio-addons/app-appdaemon/pull/518))
- ♻️ Move the user bundle to /etc/s6-overlay/user-bundles.d @frenck ([#519](https://github.com/hassio-addons/app-appdaemon/pull/519))
- 🧹 Repository housekeeping @frenck ([#520](https://github.com/hassio-addons/app-appdaemon/pull/520))

## ⬆️ Dependency updates

- ⬆️ Update hassio-addons/workflows action to v4 @[renovate[bot]](https://github.com/apps/renovate) ([#516](https://github.com/hassio-addons/app-appdaemon/pull/516))

