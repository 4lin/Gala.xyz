# Gala.xyz

**A self-hosted space strategy browser game built on the 2Moons engine.**

[Project website](https://4lin.github.io/Gala.xyz/) · [Releases](https://github.com/4lin/Gala.xyz/releases) · [Installation](docs/INSTALLATION.md) · [Changelog](CHANGELOG.md)

Gala.xyz includes the PHP game server, administration panel, templates, client scripts, installer, bundled dependencies, and automated checks. The application source is in [`download/`](download/). GitHub Pages hosts the project presentation; running the game requires your own PHP and MariaDB/MySQL server.

## Features

- Planet and moon management, buildings, research, fleets, alliances, galaxy navigation, rankings, and player profiles.
- Eight language catalogs: English, German, Spanish, French, Polish, Portuguese, Russian, and Turkish.
- Compact resource and score displays, with full values available for inspection and unchanged numeric form inputs.
- A dedicated player profile page, compact fleet selection, and shared table styling.
- Accessible notification dialogs, keyboard dismissal, and session-expiration handling.
- Registration protection with CSRF tokens, rate limiting, a honeypot, and a local CAPTCHA. Cloudflare Turnstile can be configured with your own keys.
- Administrator-managed NPC accounts with gradual resource and fleet growth, pause controls, and cron integration. NPCs do not dispatch automatic attacks.
- Correct moon resource displays: moons store transported resources and do not generate mine income.

## Distribution and artwork

This distribution includes **the original game images**, copied unchanged from the project owner's local installation, including image resources under download/addon/. Each image remains the property of its respective author or copyright holder. Inclusion does not establish redistribution permission or place images under the source-code license. Audio, Flash files, and previously excluded fonts remain excluded. See [asset provenance](docs/ASSET-PROVENANCE.md).

Credentials, database backups, logs, local development notes, and populated caches are excluded. A release is source code for a fresh installation, not a copy of an existing game database.

## Runtime status

The current development instance has been tested on PHP 7.2.34 and MariaDB 10.4.14. PHP 8.4 migration work exists, but full application compatibility has **not** been established. This is a prerelease for development and evaluation; PHP 7.2 is an unsupported legacy runtime. See [runtime status](docs/RUNTIME-STATUS.md) before choosing a deployment environment.

## Get started

1. Download the latest source release or clone this repository.
2. Serve the `download/` directory as the application's document root.
3. Create an empty database and complete the installer using your own database and administrator credentials.
4. Lock the installer, configure cron, and verify login, resource updates, and administration.

Full instructions are in [INSTALLATION.md](docs/INSTALLATION.md). Do not copy a live installation's `includes/config.php` into a public repository.

## Development checks

Run from `download/` with the target PHP runtime:

```sh
php tests/localization.php
php tests/smarty-templates.php
php tests/registration-security.php
php tests/npc-bots.php
php tests/short-numbers.php
php tests/php-runtime-compatibility.php
```

Additional tests in `download/tests/` cover queue handling, server clocks, navigation, and migration primitives. Tests requiring a browser or an installed database have their own setup; the commands above are standalone checks.

## Credits and licensing

Maintained by [4lin](https://github.com/4lin). Built on [2Moons](https://github.com/jkroepke/2Moons) by Jan-Otto Kröpke and earlier contributors. NPC growth is adapted from [mimikri/2moons-bots](https://github.com/mimikri/2moons-bots).

The repository retains its existing GPL-3.0 license. The 2Moons core and other components retain their individual licenses and copyright notices; see [THIRD-PARTY-NOTICES.md](THIRD-PARTY-NOTICES.md). Included third-party images retain their own rights and are not relicensed under GPL-3.0. OGame is a Gameforge game; this independent project is not affiliated with or endorsed by Gameforge. No rights to Gameforge artwork or trademarks are granted by this repository.

## Contributing and reporting issues

See [CONTRIBUTING.md](CONTRIBUTING.md). Report reproducible bugs through [GitHub Issues](https://github.com/4lin/Gala.xyz/issues). Report security-sensitive findings privately as described in [SECURITY.md](SECURITY.md).
