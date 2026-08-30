# Home Assistant Community App: Mealie

[Mealie][mealie] is a recipe manager and meal planner that keeps your cooking
in your own house. Give it the address of a recipe you found online and it
pulls out the parts you actually cook from: the ingredients, the steps, the
times and the picture. The life story above the recipe stays behind.

From there it becomes a planner. Put recipes on a calendar for the week ahead
and it works out the shopping list, adding up the same ingredient across every
meal on it. Recipes can be scaled, tagged, organised into cookbooks and shared
with the rest of the household, each with their own login.

Home Assistant has [an integration for Mealie][integration], so the meal plan
and the shopping list can show up on your dashboard next to everything else.

## Installation

The installation of this app is pretty straightforward and not different in
comparison to installing any other Home Assistant app.

1. Click the Home Assistant My button below to open the app on your Home
   Assistant instance.

   [![Open this app in your Home Assistant instance.][addon-badge]][addon]

1. Click the "Install" button to install the app.
1. Start the "Mealie" app.
1. Check the logs of the "Mealie" app to see if everything went well.
1. Click the "OPEN WEB UI" button to open the Mealie web interface.

The first start takes longer than most apps, since the database is created and
migrated before Mealie begins listening.

## Logging in for the first time

Mealie creates one administrator account when it starts with an empty database.
Log in with it and change both the address and the password straight away:

- Email: `changeme@example.com`
- Password: `MyPassword`

That account is the same on every Mealie installation in the world, so treat
the first login as the first thing to fix rather than something to come back
to later. Everybody else in the house gets an account of their own, made from
the user management page.

Public sign-up is switched off. Turn on the
[`allow_signup`](#option-allow_signup) option only if you want anybody who can
reach this app to be able to make themselves an account.

## Adding recipes

The button worth finding first is "Create" and then "Import from URL". Paste
the address of a recipe page and Mealie fetches it, reads the structured recipe
data most cooking sites publish, and files the result.

Sites that publish nothing structured come in as a page of text you tidy up by
hand, and Mealie can also take a photo of a recipe, a plain block of text you
paste in, or a bulk list of URLs. Ingredients are parsed into amounts, units
and foods by a model that ships with this app, so no part of importing needs an
account anywhere or an internet service beyond the site you are importing from.

## Using it with Home Assistant

The [Mealie integration][integration] brings the meal plan, the shopping lists
and the recipe count into Home Assistant, and adds services for putting a
recipe on the plan or an item on a list from an automation.

1. In Mealie, open your profile and then "Manage API Tokens", and create a
   token.
1. In Home Assistant, go to **Settings** > **Devices & Services** > **Add
   Integration** and pick **Mealie**.
1. Fill in the address of this app and the token you just made:

   - URL: `http://a0d7b954-mealie:9000`
   - API token: _the token from step 1_

**Note**: _Use this app's hostname rather than your Home Assistant IP address.
Both sit on the same internal network, so the traffic never has to leave the
machine, and nothing has to be exposed under "Network" for this to work._

The Ingress address the panel runs on is no use here. It belongs to a session
that expires, so the integration would lose Mealie the moment it did.

## Configuration

**Note**: _Remember to restart the app when the configuration is changed._

Example app configuration:

```yaml
log_level: info
allow_signup: false
ssl: true
certfile: fullchain.pem
keyfile: privkey.pem
```

**Note**: _This is just an example, don't copy and paste it! Create your own!_

Most of what Mealie does is configured from inside Mealie itself, by the
administrator account, rather than from here. The options below are the ones
that have to be settled before it starts.

### Option: `log_level`

The `log_level` option controls the level of log output by the app and can be
changed to be more or less verbose, which might be useful when you are dealing
with an unknown issue. Possible values are:

- `trace`: Show every detail, like all called internal functions.
- `debug`: Shows detailed debug information.
- `info`: Normal (usually) interesting events.
- `notice`: Normal but significant events.
- `warning`: Exceptional occurrences that are not errors.
- `error`: Runtime errors that do not require immediate action.
- `fatal`: Something went terribly wrong. App becomes unusable.

Please note that each level automatically includes log messages from a more
severe level, e.g., `debug` also shows `info` messages. By default, the
`log_level` is set to `info`, which is the recommended setting unless you are
troubleshooting.

Mealie has fewer levels of its own, so `trace` and `debug` both put it in
`debug`, `info` and `notice` in `info`, and `fatal` in `critical`.

### Option: `base_url`

The address this app is reached at from the outside, for example
`https://mealie.example.com`.

Mealie has no way of working this out on its own, and uses it for the links in
the emails it sends and for the OpenID Connect callback. Leave it empty when
you only use this app from your own network and do not send email from it.

### Option: `allow_signup`

Lets anybody who can reach this app create an account without an invitation,
and is `false` by default.

Leave it off and invite people from the user management page instead. Mealie is
not built to be a public website, and an open sign-up form on a port you have
forwarded is an open door.

### Option: `smtp_host`

The mail server used to send invitations, password resets and notifications,
for example `smtp.example.com`.

Leave it empty to switch email off entirely. Mealie works fine without it; you
just create accounts and hand out the passwords yourself.

### Option: `smtp_port`

The port of the mail server, usually `587`.

### Option: `smtp_from_name`

The name the emails from this app appear to come from, for example `Mealie`.

### Option: `smtp_from_email`

The address the emails from this app are sent from.

### Option: `smtp_auth_strategy`

How the connection to the mail server is secured. Possible values are:

- `TLS`: STARTTLS on the normal submission port. Use this unless your provider
  says otherwise.
- `SSL`: An encrypted connection from the start, usually on port 465.
- `NONE`: No encryption and no login, which only makes sense for a relay on
  your own network.

### Option: `smtp_user`

The username for the mail server, usually the same as the sender address.

Leave it empty when `smtp_auth_strategy` is `NONE`.

### Option: `smtp_password`

The password that goes with the SMTP username.

### Option: `ssl`

Enables/Disables SSL (HTTPS) on the web interface. Set it `true` to enable it,
`false` otherwise.

**Note**: _The SSL settings only apply to [direct access](#direct-access) and
have no effect on the Ingress service._

Leave this off when something else in front of this app, such as the
[NGINX Proxy Manager app][nginx-proxy-manager], is already terminating TLS.
Turning it on also means the [Home Assistant integration](#using-it-with-home-assistant)
has to be pointed at `https://`, against a certificate that will not match this
app's internal hostname.

### Option: `certfile`

The certificate file to use for SSL.

**Note**: _The file MUST be stored in `/ssl/`, which is the default_

### Option: `keyfile`

The private key file to use for SSL.

**Note**: _The file MUST be stored in `/ssl/`, which is the default_

## Direct access

By default this app is only reachable through Home Assistant's Ingress, in a
panel on the sidebar, and nothing is exposed to your network.

Set a port for "Web interface & API" in the "Network" section of the app
configuration to expose it. You need this for anything that is not a browser
sitting in front of Home Assistant: the Mealie app on a phone, a reverse proxy
of your own, or a script talking to the API.

You do **not** need it for the [Home Assistant integration](#using-it-with-home-assistant),
which reaches this app over the internal network whether the port is published
or not.

Mealie has its own accounts and its own login screen, so that port is guarded
the same way the Ingress panel is. Turn on [`ssl`](#option-ssl) if you expose
it to anything you do not trust.

## About Ingress and Mealie

Worth knowing, because upstream says the opposite:
[Mealie does not support being served on a sub-path][subpath], which is exactly
what Ingress does. Its frontend builds every URL from the root of the domain,
so out of the box the panel would load and then ask Home Assistant for Mealie's
files rather than asking Mealie.

This app makes it work anyway. The frontend is built from source here, so two
small patches are applied on the way past: one adds a plugin that points the
app's API calls at the path Ingress handed out, and one fixes the few addresses
the browser resolves by itself, where no plugin can reach. NGINX writes that
path into the page per request, and Nuxt reads it back at runtime.

The practical consequence is in [Known quirks](#known-quirks): a couple of
things that build a link out of the browser's address still assume Mealie owns
the whole domain, and those are wrong inside the panel. Use
[direct access](#direct-access) for them.

## Backups

This app is backed up cold, which means Home Assistant stops it for the moment
it takes to copy the database. A SQLite database that is copied while it is
being written to can come back subtly broken, and a recipe collection is the
sort of thing you only notice is damaged when you go looking for something in
it.

Everything Mealie owns lives in that backup: the database, the images and the
uploaded files. Mealie also makes backups of its own, from the administrator
pages, which is the format to use when you want to move to a different Mealie
installation rather than restore this app where it stands.

## Known quirks

- The first login uses credentials that are the same everywhere. Change them
  before you do anything else.
- "Share recipe", the invite link and the reset-password link build an address
  out of what is in the browser's address bar. Inside the Ingress panel that
  address belongs to Home Assistant, and it is tied to a session that expires,
  so the links those buttons copy do not work. Open Mealie through
  [direct access](#direct-access) when you want a link to send somebody.
- Mealie cannot be installed as a progressive web app from the Ingress panel.
  Its manifest describes an app living at the root of the domain, which is not
  where Ingress puts it. Direct access is the way to install it on a phone.
- Importing from a site that publishes no structured recipe data gives you a
  wall of text rather than a filled in recipe. Nothing is wrong; that page
  simply has nothing machine readable on it.
- Ingredient parsing is good, not perfect. Unusual units and quantities written
  in words are worth checking after an import.
- Installing takes a while, and updates do too. The frontend is built from
  source as part of the image, which is slow on ARM.

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

Copyright (c) 2026 Franck Nijhof

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
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_mealie&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/app-mealie/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/?u=frenck
[frenck]: https://github.com/frenck
[integration]: https://www.home-assistant.io/integrations/mealie/
[issue]: https://github.com/hassio-addons/app-mealie/issues
[mealie]: https://mealie.io/
[nginx-proxy-manager]: https://github.com/hassio-addons/app-nginx-proxy-manager
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/app-mealie/releases
[semver]: https://semver.org/spec/v2.0.0.html
[subpath]: https://docs.mealie.io/documentation/getting-started/faq/
