<?php
function ShowEditBotsPage() {
    global $USER,$LNG;
    if ((int)$USER['authlevel']!==AUTH_ADM) { http_response_code(403); throw new Exception('Permission error'); }
    require_once 'includes/classes/NpcBotManager.class.php';
    $manager=new NpcBotManager();
    $uni=Universe::getEmulated();
    // Universe::setEmulated() saves and closes PHP's session in this legacy engine.
    if (session_status()!==PHP_SESSION_ACTIVE) session_start();
    if (empty($_SESSION['npc_admin_csrf'])) $_SESSION['npc_admin_csrf']=bin2hex(random_bytes(32));
    $message=''; $error='';
    if ($_SERVER['REQUEST_METHOD']==='POST') {
        if (!isset($_POST['token']) || !is_string($_POST['token']) || !hash_equals($_SESSION['npc_admin_csrf'],$_POST['token'])) { http_response_code(403); $error=$LNG['ui_npc_error']; }
        else {
            try {
                $action=isset($_POST['action'])&&is_string($_POST['action'])?$_POST['action']:'';
                if ($action==='create') {
                    $created=$manager->create($uni,isset($_POST['count'])?$_POST['count']:0,isset($_POST['budget'])?$_POST['budget']:0,isset($_POST['galaxy'])?$_POST['galaxy']:0,isset($_POST['system'])?$_POST['system']:0,$USER['lang']);
                    $message=sprintf($LNG['ui_npc_created'],$created);
                } elseif ($action==='save' && $manager->installed()) {
                    $manager->configure($uni,isset($_POST['id'])?$_POST['id']:0,isset($_POST['active'])?$_POST['active']:0,isset($_POST['budget'])?$_POST['budget']:0);
                    $message=$LNG['ui_npc_saved'];
                } else throw new InvalidArgumentException('Invalid NPC action');
                $_SESSION['npc_admin_csrf']=bin2hex(random_bytes(32));
            } catch (InvalidArgumentException $e) { $error=$LNG['ui_npc_error']; }
        }
    }
    $template=new template();
    $template->assign_vars(array('npcToken'=>$_SESSION['npc_admin_csrf'],'npcUniverse'=>$uni,'npcList'=>$manager->listing($uni),'npcMessage'=>$message,'npcError'=>$error,'npcGalaxy'=>(int)$USER['galaxy'],'npcSystem'=>(int)$USER['system'],'npcMaxGalaxy'=>(int)Config::get($uni)->max_galaxy,'npcMaxSystem'=>(int)Config::get($uni)->max_system));
    $template->show('NpcBotsPage.tpl');
}
