# Home Assistant Community App: Stirling PDF

[Stirling PDF][stirling-pdf] is the workshop for the PDF that landed in your
inbox and is not quite what you needed. Merge, split, rotate, crop and reorder
pages. Compress a scan that is too large to send. Convert a Word document, a
spreadsheet, a web page or a folder of photos into a PDF, and convert a PDF
back out again. Sign it, stamp it, add a watermark, fill in a form, or black
out the parts that should not have been in there.

It also reads. An OCR pass turns a scanned page from a picture of text into
text you can search, select and copy, which is the difference between a pile
of scans and an archive.

None of it leaves the house. The file is uploaded to this app, worked on here
and handed back, which is the whole reason to run it yourself rather than
paste a bank statement into a free website.

## Installation

The installation of this app is pretty straightforward and not different in
comparison to installing any other Home Assistant app.

1. Click the Home Assistant My button below to open the app on your Home
   Assistant instance.

   [![Open this app in your Home Assistant instance.][addon-badge]][addon]

1. Click the "Install" button to install the app.
1. Start the "Stirling PDF" app.
1. Check the logs of the "Stirling PDF" app to see if everything went well.
1. Click the "OPEN WEB UI" button to open the Stirling PDF web interface.

This app is a large download. It carries a Java runtime, a headless
LibreOffice, an OCR engine and the usual row of PDF command line tools,
because that is what the tools in the interface are made of.

The first start takes a minute or two longer than later ones, while it writes
its settings and prepares its database.

## Logging in

Stirling PDF is open core. Its accounts, its login screen and everything built
on them live in a directory of the upstream repository that is not covered by
the MIT license and may not be redistributed, so this app is built from the
open source part alone. Stirling PDF itself has no login screen here, and no
way to add one.

You are asked to log in anyway, because this app does it instead of Stirling
PDF, using the accounts you already have:

- Through the Ingress panel, Home Assistant has already logged you in and this
  app is only reachable from Home Assistant. You see no second prompt.
- Through the [direct port](#direct-access), your browser asks for a username
  and password, and this app checks them against Home Assistant. The same
  accounts, the same passwords.

So there is a login, it just is not Stirling PDF's. What you do not get is
what those upstream accounts are for: several users with separate files,
teams, single sign-on and an audit trail. Everybody who logs in here sees the
same app.

## Using it

Drop a file onto the page and the tools that can act on it become available.
The ones that are greyed out are the ones that do not apply to what you gave
it, or the handful this app does not carry (see [What is
missing](#what-is-missing)).

A few worth knowing about:

- **OCR** turns a scan into searchable text. English is installed; see
  [More OCR languages](#more-ocr-languages) to add others.
- **Compress** takes a size target and works towards it, which is the usual
  answer to an upload form that refuses anything over ten megabytes.
- **Convert** goes both ways between PDF and Word, Excel, PowerPoint, images,
  HTML and Markdown. The office side is real LibreOffice doing the work.
- **Redact** in its automatic mode removes the text underneath rather than
  drawing a black box over it, which is the part people usually get wrong.
- **Pipeline** saves a sequence of operations and runs it over a batch of
  files in one go.

## More OCR languages

Only English is installed, since every language is a separate file and most
people need one or two.

Download the `.traineddata` file for the language you want from the
[tesseract-ocr repository][tessdata], and put it in the `tessdata` folder
inside this app's configuration directory:

```text
/addon_configs/a0d7b954_stirling-pdf/tessdata/deu.traineddata
```

Restart the app, and the language appears in the OCR tool. The log lists each
one it picked up. Use the "fast" variants unless you have reason not to; they
are a fraction of the size and the difference on a clean scan is very small.

## Configuration

**Note**: _Remember to restart the app when the configuration is changed._

Example app configuration:

```yaml
log_level: info
max_file_size: 100
leave_front_door_open: false
ssl: false
certfile: fullchain.pem
keyfile: privkey.pem
```

**Note**: _This is just an example, don't copy and paste it! Create your own!_

Almost everything about Stirling PDF is configured from inside Stirling PDF,
on its settings page. The options below are the ones that have to be settled
before it starts.

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

Stirling PDF has fewer levels of its own, so `info` and `notice` both put it in
`INFO`, and `error` and `fatal` both in `ERROR`.

### Option: `base_url`

The address this app is reached at from the outside, for example
`https://pdf.example.com`.

Stirling PDF uses it for the QR codes that hand a job to your phone and for
the links the share buttons copy. Leave it empty unless you have published the
port and put a name in front of it. Inside the Ingress panel the address in
the browser belongs to Home Assistant and expires, so it is no use for this.

### Option: `max_file_size`

The largest file, in megabytes, that may be uploaded. Leave it empty for no
limit.

A PDF is held in memory while it is worked on, so on a machine with little of
it, a limit is a kinder failure than the one you get without it.

### Option: `leave_front_door_open`

Turns off the Home Assistant login check on the
[direct port](#direct-access), and is `false` by default.

Leave it alone. With it off, everything arriving on that port is checked
against Home Assistant first. With it on, nothing is: Stirling PDF has no
login of its own to fall back on, so anybody who can reach the port can use
every tool on it and read every document that goes through it. The app logs a
warning on every start while it is enabled.

The one honest reason to turn it on is that something in front of this app is
already doing the authenticating, and the extra prompt is in the way.

### Option: `ssl`

Enables/Disables SSL (HTTPS) on the web interface. Set it `true` to enable it,
`false` otherwise.

**Note**: _The SSL settings only apply to [direct access](#direct-access) and
have no effect on the Ingress service._

Leave this off when something else in front of this app, such as the
[NGINX Proxy Manager app][nginx-proxy-manager], is already terminating TLS.

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
configuration to expose it. You need this for the REST API, for a reverse
proxy of your own, or for the phone features that need a browser to reach this
app directly.

That port asks for a password. Your browser prompts for one the first time you
open it, and the username and password are the ones you use for Home
Assistant. Nothing else gets through, which matters more here than for most
apps: PDFs are rarely boring, and are frequently payslips, bank statements and
passport scans.

The same check applies to the API, which takes the credentials as HTTP Basic
auth. From a Home Assistant `rest_command`:

```yaml
rest_command:
  compress_pdf:
    url: "http://a0d7b954-stirling-pdf:8080/api/v1/misc/compress-pdf"
    method: post
    username: !secret ha_username
    password: !secret ha_password
```

Turn the check off with
[`leave_front_door_open`](#option-leave_front_door_open) only when something
in front of this app is already doing it.

## What is missing

Two things upstream ships that this app does not:

- **PDF to EPUB.** It is the only tool that needs Calibre, and Calibre costs
  833MB installed because it brings a browser engine with it. The tool is
  switched off by name, so it is greyed out rather than offered and then
  failing. Every other conversion, the office formats included, goes through
  LibreOffice and works.
- **Several users, teams, single sign-on and the audit log.** These are the
  parts of Stirling PDF that are not open source. Logging in still works, and
  is described under [Logging in](#logging-in); what you do not get is more
  than one account with files of their own.

**PDF to CBR** is also absent, for a different reason: it needs `rar`, which
is not free software and cannot be shipped in an image that is redistributed.
**URL to PDF** is off because upstream ships it off, having concluded it is
not safe to expose.

## Backups

This app is backed up cold, which means Home Assistant stops it for the moment
it takes to copy its data.

What is in the backup is the settings, the saved pipelines, the signatures and
the custom files: everything Stirling PDF owns. The files you convert are not
in it, and were never meant to be. They go up, get worked on and come back
down, and the working copies live outside the backup and are cleaned up behind
you.

## Known quirks

- Everybody who logs in sees the same app. There is one set of settings, one
  set of saved pipelines and one set of signatures, shared by whoever reaches
  it. Stirling PDF's own multi-user support is not in the open source build.
- The first start after an update is slower than the rest, and the panel will
  not answer until it finishes. The log says what it is doing.
- Conversion of a large or complicated office document is slow, particularly
  on ARM. LibreOffice is doing a real rendering pass, not a translation.
- OCR is slower still, and its accuracy depends on the scan. A crooked page
  photographed on a desk gives worse results than a flatbed scan, and no
  setting fixes that after the fact.
- The tools that would install this app on your phone as a progressive web app
  describe an app living at the root of a domain, which is not where Ingress
  puts it. Use direct access if you want that.

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
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_stirling-pdf&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/app-stirling-pdf/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/app-stirling-pdf/issues
[nginx-proxy-manager]: https://github.com/hassio-addons/app-nginx-proxy-manager
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/app-stirling-pdf/releases
[semver]: https://semver.org/spec/v2.0.0.html
[stirling-pdf]: https://www.stirlingpdf.com/
[tessdata]: https://github.com/tesseract-ocr/tessdata_fast
