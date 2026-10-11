# Changelog

## 0.6.2 — 2026-10-11 (prerelease)

- Restore 1,687 original game images unchanged, including sprite sheets and additional image resources under download/addon/.
- Record image SHA-256 hashes and preserve existing image paths.
- Update English asset notices. Each image remains the property of its respective author or copyright holder; inclusion grants no image rights.
- Keep private configuration, account data, audio, and previously excluded fonts outside the distribution.



## 0.6.1 — 2026-10-11 (prerelease)

- Fix the fresh-install database form when URL parameters are absent, while preserving HTML escaping.
- Open normal login after installation and clarify English administrator access instructions.
- Add a regression check for empty installer parameters and document the isolated installation smoke test and remaining usability limitations.

## 0.6.0 — 2026-10-11 (prerelease)

### Distribution

- Publish the current game source, installer, templates, scripts, bundled libraries, and tests under `download/`.
- Replace unverified media with original neutral distribution graphics and exclude private instance data.
- Add English installation, asset provenance, runtime, contribution, and security documentation.
- Add a standalone HTML project presentation for GitHub Pages.

### Game interface

- Add a dedicated player profile page and shared table styling.
- Use ship icons and compact selection cards in the fleet page, with larger themed Max buttons.
- Extend compact number displays to rankings, player profiles, resources, costs, and related views while preserving calculation and form values.
- Replace blocking game alerts with accessible dialogs and dismissible status messages.
- Improve registration form validation and session-expiration handling.

### Gameplay and fixes

- Add administrator-managed NPC growth, pause/resume controls, and cron integration.
- Fix empty galaxy systems and reset reused galaxy-row data correctly.
- Fix fictitious moon resource growth in the browser and prevent moon cache rebuilding from changing shared universe basic-income settings.
- Expand and correct eight language catalogs.
- Retain queue, navigation, clock, and PHP migration work present in the current source snapshot.

### Verification

- Compile 194 Smarty templates with the current development runtime.
- Validate eight language catalogs and static language-key references.
- Exercise registration, NPC, number-formatting, and runtime tests.
- Verify profile navigation and fleet selection in the browser without dispatching fleets.
- Verify unchanged moon resource values over time and after clicking Overview.

### Known limits

- Full PHP 8.4 deployment compatibility remains in progress.
- Neutral public graphics differ from the private installation's artwork.
- NPCs grow fleets and resources but do not launch automatic attacks.
- External CAPTCHA services require instance-specific credentials.

Older skin prereleases remain available in the repository's release history.
