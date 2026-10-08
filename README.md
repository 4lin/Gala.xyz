# Gala.xyz

The current PHP game source and runtime assets are in `download/`.

## Local installation

Configure Apache/PHP and MySQL, copy the game to the web root, and provide a local `includes/config.php` using the installer. Enable the installer with an empty `includes/ENABLE_INSTALL_TOOL` file only while installing; remove it after installation. Existing installations must retain their private database configuration and database contents.

Generated notes, audit reports, screenshots, sessions, caches, backups and database credentials are excluded from the published source. Archived reference exports are excluded; runtime images are served from the game's local asset directories.

## Verification

Run `php tests/smarty-templates.php`, `php tests/shipyard-queue.php`, `php tests/fleet-colonization.php`, `php tests/short-numbers.php` and `node tests/short-numbers.js` from the game directory. Browser verification of the latest visual adjustments remains pending.
