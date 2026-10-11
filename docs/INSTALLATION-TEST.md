# Fresh installation test

Test date: 2026-10-11. The v0.6.0 release archive was downloaded from GitHub and its published SHA-256 checksum verified. The test used a separate application directory, local-only HTTP server, and empty MariaDB database. No existing game database or configuration was imported.

## Findings

- The unmodified v0.6.0 installer passed its environment checks but failed to display the database form: missing URL parameters triggered an `Undefined index: host` notice. Applying default values before HTML escaping fixes this first-installation blocker.
- The completion button incorrectly opened administration before normal login, displaying a session-expired notice. It now opens the normal login page; English completion instructions explain how to enter administration afterward.
- After correction, database connection, schema import, administrator creation, login, Overview, fleet selection with no ships, statistics, and administration worked on PHP 7.2.34 and MariaDB 10.4.14.
- The installer locked automatically after completion.
- An empty new account cannot browse distant galaxy systems without deuterium. This is a resource requirement rather than an installation failure.
- The administration overview still loads an obsolete Google feeds API which reports browser console errors. It does not block the tested login or administration pages, but remains a follow-up item.
- Neutral replacement artwork can render awkwardly when an old template uses sprite sheets. The package does not reproduce the appearance of the private installation. These assets need a dedicated presentation pass before claiming polished beginner usability.

## Beginner usability

The web wizard is short once a compatible web server and empty database exist. Preparing PHP extensions, database credentials, writable directories, deployment access rules, and cron remains technical work. A user familiar with a hosting control panel can follow the installation guide; someone with only basic browser knowledge will need help preparing the server.

This is a local smoke test, not certification of every gameplay feature, hosting provider, PHP version, or security property. No fleets were dispatched and no real email delivery was tested.
