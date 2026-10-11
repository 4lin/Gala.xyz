<?php
require_once 'includes/classes/cronjob/CronjobTask.interface.php';
require_once 'includes/classes/NpcBotManager.class.php';
class NpcBotsCronjob implements CronjobTask {
    public function run() { (new NpcBotManager())->tick(); }
}
