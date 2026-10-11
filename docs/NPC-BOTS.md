# NPC bots

Administrators can open **Edit menu → NPC bots**, or `admin.php?page=editbots`. The first creation initializes the prefixed NPC table and registers `NpcBotsCronjob`, scheduled every five minutes through the existing game cron system.

- Create 1–20 NPC accounts per request, with a maximum of 200 per universe.
- Choose a starting galaxy and system. Occupied systems are followed by a search for free positions in the same galaxy.
- Set a daily resource-equivalent budget per NPC. The default is 100,000; the permitted range is 10,000–10,000,000.
- The current allocation is 5% metal, 3% crystal, 2% deuterium, and 90% ships: heavy fighters, battleships, and destroyers, priced using the game's costs.
- Growth is added gradually to the NPC planet, with fractional amounts carried forward. Battle losses are not restored.
- Pausing stops growth. Resuming does not award the paused interval. Downtime catch-up is capped at 24 hours.

NPC names use the `NPC` prefix. NPC login is blocked, inactivity emails are disabled, and automatic inactive-account cleanup preserves these accounts. Manual deletion remains available through existing administration tools.

This implementation adapts the growth concept from [mimikri/2moons-bots](https://github.com/mimikri/2moons-bots). Its MIT license is preserved in `download/licenses/2moons-bots-MIT.txt`.

NPC ships remain on their planets. The module does not simulate fleet flights or launch automatic attacks. Configure game cron on a new server before creating NPCs. Installation does not automatically create NPCs or alter human accounts.
