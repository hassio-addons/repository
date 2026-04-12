# Home Assistant Community App: Grocy

[Grocy][grocy] - ERP beyond your fridge is a powerful groceries & household
management solution for your home, delivering features like:

- Stock management
- Shopping list
- Recipes
- Chores & tasks
- Inventory
- and many more.

[Try out the online demo of Grocy][grocy-demo].

## Installation

The installation of this app is pretty straightforward and not different in
comparison to installing any other Home Assistant app.

1. Click the Home Assistant My button below to open the app on your Home
   Assistant instance.

   [![Open this app in your Home Assistant instance.][addon-badge]][addon]

1. Click the "Install" button to install the app.
1. Start the "Grocy" app.
1. Check the logs of the "Grocy" app to see if everything went well.
1. Click on the "OPEN WEB UI" button to get into the interface of Grocy.
1. The default login is user: `admin` password: `admin`.
1. Enjoy the app!

## Configuration

**Note**: _Remember to restart the app when the configuration is changed._

Example app configuration:

```yaml
culture: en
currency: USD
entry_page: stock
grocycode_type: 2D
features:
  batteries: true
  calendar: true
  chores: true
  equipment: true
  recipes: true
  shoppinglist: true
  stock: true
  tasks: true
printers:
  label_printer:
    enabled: false
  thermal_printer:
    enabled: false
tweaks:
  chores_assignment: true
  multiple_shopping_lists: true
  stock_best_before_date_tracking: true
  stock_location_tracking: true
  stock_price_tracking: true
  stock_product_freezing: true
  stock_product_opened_tracking: true
  stock_count_opened_products_against_minimum_stock_amount: true
log_level: info
ssl: false
certfile: fullchain.pem
keyfile: privkey.pem
```

**Note**: _This is just an example, don't copy and paste it! Create your own!_

### Option: `log_level`

The `log_level` option controls the level of log output by the addon and can
be changed to be more or less verbose, which might be useful when you are
dealing with an unknown issue. Possible values are:

- `trace`: Show every detail, like all called internal functions.
- `debug`: Shows detailed debug information.
- `info`: Normal (usually) interesting events.
- `warning`: Exceptional occurrences that are not errors.
- `error`: Runtime errors that do not require immediate action.
- `fatal`: Something went terribly wrong. App becomes unusable.

Please note that each level automatically includes log messages from a
more severe level, e.g., `debug` also shows `info` messages. By default,
the `log_level` is set to `info`, which is the recommended setting unless
you are troubleshooting.

### Option: `ssl`

Enables/Disables SSL (HTTPS) on the web interface of Grocy
Panel. Set it `true` to enable it, `false` otherwise.

### Option: `certfile`

The certificate file to use for SSL.

**Note**: _The file MUST be stored in `/ssl/`, which is the default_

### Option: `keyfile`

The private key file to use for SSL.

**Note**: _The file MUST be stored in `/ssl/`, which is the default_

### Option: `culture`

Is used for setting the language. Choose between:

- `ca` (Catalan)
- `cs` (Czech)
- `da` (Danish)
- `de` (German)
- `el_GR` (Greek - Greece)
- `en` (English)
- `en_GB` (English - United Kingdom)
- `es` (Spanish)
- `et` (Estonian)
- `fi` (Finnish)
- `fr` (French)
- `he_IL` (Hebrew - Israel)
- `hu` (Hungarian)
- `it` (Italian)
- `ja` (Japanese)
- `ko_KR` (Korean - South Korea)
- `lt` (Lithuanian)
- `nl` (Dutch)
- `no` (Norwegian)
- `pl` (Polish)
- `pt_BR` (Portuguese - Brazil)
- `pt_PT` (Portuguese - Portugal)
- `ro` (Romanian)
- `ru` (Russian)
- `sk_SK` (Slovak - Slovakia)
- `sl` (Slovenian)
- `sv_SE` (Swedish - Sweden)
- `ta` (Tamil)
- `tr` (Turkish)
- `uk` (Ukrainian)
- `zh_CN` (Chinese - China)
- `zh_TW` (Chinese - Taiwan)

### Option: `currency`

Determines the currency as displayed in the Grocy interface, specified by the
ISO4217 three digit currency code.

Examples: `USD`, `CAD`, `GBP` or `EUR`.

### Option: `entry_page`

Allows you to specify an custom homepage if desired.

You can use the one of the following values:

- `batteries`
- `calendar`
- `chores`
- `equipment`
- `mealplan`
- `recipes`
- `shoppinglist`
- `stock`
- `tasks`

By default the homepage is set to the stock overview.

### Option: `grocycode_type`

Allows you to change the barcode type for GrocyCodes. Useful if your barcode scanner doesn't support the default.

You can use the one of the following values:

- `1D` (Code128)
- `2D` (DataMatrix)

Since v4.5.0 Grocy uses `2D` as the default.

### Option: `features`

Is used for enable or disable features in Grocy. Disabled features
are hidden from the web interface. The following features can be enabled
or disabled:

- `batteries`
- `calendar`
- `chores`
- `equipment`
- `recipes`
- `shoppinglist`
- `stock`
- `tasks`

Set it `true` to enable it, `false` otherwise.

### Option: `tweaks`

These options are used to tweak part of the core behavior of Grocy.
The following sub features can be enabled or disabled:

- `chores_assignment`
- `multiple_shopping_lists`
- `stock_best_before_date_tracking`
- `stock_location_tracking`
- `stock_price_tracking`
- `stock_product_freezing`
- `stock_product_opened_tracking`
- `stock_count_opened_products_against_minimum_stock_amount`

Set it `true` to enable it, `false` otherwise.

The following sub features can be set to specify a day (0-6), where 0 would
equal Sunday:

- `calendar_first_day_of_week`
- `meal_plan_first_day_of_week`

### Option: `grocy_ingress_user`

Allows you to specify a default ingress user if desired (e.g. `admin`).

If no ingress user is set, the default login authentication is used.

### Option: `printers`

Configures label and thermal printer support.

#### Label printer

Set `printers.label_printer.enabled` to `true` to enable label printing via a webhook.

- `enabled`: Set to `true` to enable, `false` otherwise.
- `webhook`: The URI that Grocy will POST to when asked to print a label.
- `run_server`: Set to `false` to call the webhook client-side instead of server-side.
- `params`: Additional parameters supplied to the webhook.
- `hook_json`: Set to `true` to POST as JSON, `false` to use regular form-encoded variables.

#### Thermal printer

Thermal printers are receipt printers that support the ESC/POS protocol.
See [ESC/POS protocol][escpos] for more information.

**Note:** _Only network printers are supported when running as a Home Assistant
add-on. Direct USB/serial printer connections are not available in the
containerized environment._

Set `printers.thermal_printer.enabled` to `true` to enable thermal printing.

- `enabled`: Set to `true` to enable, `false` otherwise.
- `ip`: IP address of the network printer.
- `port`: Port of the network printer.
- `print_quantity_name`: Set to `false` to omit quantity names from the printout.
- `print_notes`: Set to `false` to omit notes from the printout.

## Known issues and limitations

- Grocy support to provide custom lookup resources to lookup information
  on the internet based on the product barcode. This is currently not yet
  supported by the app.

- The barcode scanner feature requires camera access via the browser.
  Browsers only allow camera access in a [secure context][secure-context]
  (HTTPS or localhost). When accessing Grocy via the Home Assistant ingress
  panel over HTTP, the browser will deny camera access. To use the barcode
  scanner, enable SSL and access Grocy directly via its port instead of
  through ingress.

## Changelog & Releases

This repository keeps a change log using [GitHub's releases][releases]
functionality.

Releases are based on [Semantic Versioning][semver], and use the format
of `MAJOR.MINOR.PATCH`. In a nutshell, the version will be incremented
based on the following:

- `MAJOR`: Incompatible or major changes.
- `MINOR`: Backwards-compatible new features and enhancements.
- `PATCH`: Backwards-compatible bugfixes and package updates.

## Support

Got questions?

You have several options to get them answered:

- The [Home Assistant Community Apps Discord chat server][discord] for app
  support and feature requests.
- The [Home Assistant Discord chat server][discord-ha] for general Home
  Assistant discussions and questions.
- The Home Assistant [Community Forum][forum].
- Join the [Reddit subreddit][reddit] in [/r/homeassistant][reddit]

You could also [open an issue here][issue] GitHub.

## Authors & contributors

The original setup of this repository is by [Franck Nijhof][frenck].

For a full list of all authors and contributors,
check [the contributor's page][contributors].

## License

MIT License

Copyright (c) 2019-2026 Franck Nijhof

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[escpos]: https://github.com/mike42/escpos-php
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_grocy&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/app-grocy/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-grocy/112422?u=frenck
[frenck]: https://github.com/frenck
[grocy-demo]: https://demo-en.grocy.info
[grocy]: https://grocy.info/
[issue]: https://github.com/hassio-addons/app-grocy/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/app-grocy/releases
[secure-context]: https://developer.mozilla.org/en-US/docs/Web/Security/Secure_Contexts
[semver]: https://semver.org/spec/v2.0.0.html
