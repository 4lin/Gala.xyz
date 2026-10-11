# Installation

## Requirements and scope

The application requires a PHP web server, PDO MySQL, MariaDB/MySQL, sessions, and writable runtime directories. GD is required for the local registration CAPTCHA. The verified legacy development stack is PHP 7.2.34 with MariaDB 10.4.14. Full PHP 8.4 compatibility is still in progress; see [runtime status](RUNTIME-STATUS.md).

GitHub Pages cannot run the PHP game or database. Its role is the static project website.

## Fresh installation

1. Extract the source package and use `download/` as the game document root. Use a separate directory and an empty database for a fresh installation.
2. Create a database and a dedicated database user. Do not import a live game's database or reuse published example credentials.
3. Confirm that `includes/config.php` does not exist. The distribution includes an empty `includes/FIRST_INSTALL` marker. The installer consumes this marker and temporarily creates `includes/ENABLE_INSTALL_TOOL`.
4. Allow the web-server account to write to `includes/`, `cache/`, `cache/templates/`, and `cache/sessions/` for installation. Restrict filesystem permissions afterward as appropriate for your server.
5. For a local development preview, run from `download/`:

   ```sh
   php -S 127.0.0.1:8766 -t .
   ```

   The built-in PHP server does not apply Apache `.htaccess` rules. Use Apache or equivalent explicit access rules for a deployed instance.

6. Open `http://127.0.0.1:8766/install/index.php` and complete the extension, connection, and filesystem checks.
7. Enter your database connection and table prefix. Let the installer generate `includes/config.php` and the password salt.
8. Import the schema through the installer. It processes `install/install.sql` and substitutes the prefix and version placeholders. Do not separately re-import the same schema.
9. Create an administrator using your own username, email address, and strong password. No preconfigured administrator account is included.
10. Confirm that `includes/FIRST_INSTALL` and `includes/ENABLE_INSTALL_TOOL` are absent after installation. Confirm that `/install/index.php` reports that installation is locked.
11. Configure the universe timezone, resource multipliers, session behavior, email transport, and cron execution.
12. Verify login, administration, planet/moon switching, the galaxy, fleet selection, language selection, and resource updates. A successful HTTP status alone does not prove the absence of PHP errors.

## Administration

Sign in through the game, then open `admin.php` and enter the administrator password when requested. To create NPC accounts, open **Edit menu → NPC bots**. See [NPC-BOTS.md](NPC-BOTS.md).

## Registration protection

The local CAPTCHA works without external service keys when GD is installed. Registration also uses a session-bound CSRF token, a honeypot, confirmation validation, and rate limiting. Cloudflare Turnstile is optional: select it in administration and configure your own site key and secret. Secrets belong in private instance configuration.

## Media

This release includes original neutral placeholders rather than unverified game artwork. You may replace them with graphics you created or are licensed to redistribute. Keep the existing asset paths or update the relevant templates and CSS. Background music is omitted from the public package.

## Updating an existing game

Back up the database and source privately first. Preserve your private configuration, review schema changes, and test in a separate instance before updating. The public package does not contain account data, saved sessions, or database backups. NPC tables are created by the module when first needed.
