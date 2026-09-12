# Home Assistant Community App: Actual Budget

[![Release][release-shield]][release] ![Project Stage][project-stage-shield] ![Project Maintenance][maintenance-shield]

[![Sponsor Frenck via GitHub Sponsors][github-sponsors-shield]][github-sponsors]

[![Support Frenck on Patreon][patreon-shield]][patreon]

Local-first personal finance and envelope budgeting.

## About

[Actual][actual] is a budgeting app that keeps your money where you can see it.
It uses envelope budgeting: every month you give each currency unit you have a
job, and the numbers add up because you only ever assign money you actually
have.

The budget lives in your browser and syncs through this app, which is the only
place a copy of it is kept. Nothing is sent anywhere else, there is no account
to sign up for, and nobody is selling what you spend your money on.

Everyone in the house works from the same budget, and it stays usable while a
transaction is being entered on a phone in a shop with no signal, because the
data is already on the device rather than behind a request.

Actual is built to be served from the root of a host, which the sidebar is not,
so this app carries a patch that settles the base path per request. That makes
the panel work, at the cost of a storage mode Actual calls unsupported. The app
documentation explains what that means and what to do instead if it matters to
you.

[actual]: https://actualbudget.org/
[github-sponsors-shield]: https://frenck.dev/wp-content/uploads/2019/12/github_sponsor.png
[github-sponsors]: https://github.com/sponsors/frenck
[maintenance-shield]: https://img.shields.io/maintenance/yes/2026.svg
[patreon-shield]: https://frenck.dev/wp-content/uploads/2019/12/patreon.png
[patreon]: https://www.patreon.com/frenck
[project-stage-shield]: https://img.shields.io/badge/project%20stage-experimental-yellow.svg
[release-shield]: https://img.shields.io/badge/version-v0.1.0-blue.svg
[release]: https://github.com/hassio-addons/app-actual-budget/tree/v0.1.0