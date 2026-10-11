# Contributing

Use English for issue descriptions, pull requests, documentation, and commit messages. Preserve the game's translated language catalogs.

Describe the behavior being changed, include a minimal reproduction, and explain validation. Keep changes scoped and preserve exact values used for calculations and forms when changing display formatting.

Run relevant tests from `download/tests/` with the target runtime. Test database changes against a separate disposable instance. Never include credentials, private configuration, saved sessions, database dumps, or game-account data in a pull request.

Preserve third-party license notices. Submit only artwork you own or can redistribute under documented terms. Include provenance for new dependencies and media.

Security-sensitive reports should follow [SECURITY.md](SECURITY.md) rather than disclose exploit details in public issues.
