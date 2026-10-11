# Runtime status

The verified development environment runs PHP 7.2.34 and MariaDB 10.4.14. PHP 7.2 is no longer supported upstream. This prerelease should be treated as development/evaluation software until a supported runtime is validated end to end.

PHP 8.4 migration work covers shared runtime primitives and selected authentication/configuration paths. It has not established complete application compatibility. Passing standalone compatibility checks does not prove that every game page, installer step, cron task, or integration works on PHP 8.4.

The source includes targeted tests for session behavior, HTTP helpers, language access, database compatibility, timestamp handling, queues, and resource formatting. Preserve deprecation/error reporting during migration and verify real user flows against a separate database.

Bundled legacy dependencies are retained with their notices for compatibility. Review and update them as part of a supported-runtime deployment plan. No release claim is made that the game has received a comprehensive security audit.
