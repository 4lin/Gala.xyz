<?php

/**
 *  2Moons 
 *   by Jan-Otto Kröpke 2009-2016
 *
 * For the full copyright and license information, please view the LICENSE
 *
 * @package 2Moons
 * @author Jan-Otto Kröpke <slaver7@gmail.com>
 * @copyright 2009 Lucky
 * @copyright 2016 Jan-Otto Kröpke <slaver7@gmail.com>
 * @licence MIT
 * @version 1.8.0
 * @link https://github.com/jkroepke/2Moons
 */

class ShowRegisterPage extends AbstractLoginPage
{
	function __construct() 
	{
		parent::__construct();
        require_once 'includes/classes/RegistrationSecurity.class.php';
        Session::load();
	}
	
    public function captcha()
    {
        $id = HTTP::_GP('form', '');
        $answer = RegistrationSecurity::challenge($id);
        if ($answer === null || !function_exists('imagecreatetruecolor')) {
            http_response_code(400);
            exit;
        }
        header('Content-Type: image/png');
        header('Cache-Control: no-store, private');
        header('X-Content-Type-Options: nosniff');
        $image = imagecreatetruecolor(200, 64);
        $background = imagecolorallocate($image, 232, 239, 243);
        $ink = imagecolorallocate($image, 27, 46, 59);
        $noise = imagecolorallocate($image, 125, 151, 162);
        imagefill($image, 0, 0, $background);
        for ($i=0; $i<7; $i++) imageline($image, random_int(0,199), random_int(0,63), random_int(0,199), random_int(0,63), $noise);
        for ($i=0; $i<6; $i++) imagestring($image, 5, 20+$i*28, random_int(18,30), $answer[$i], $ink);
        imagepng($image); imagedestroy($image);
        exit;
    }

	function show()
	{
		global $LNG;
		$universeSelect	= array();	
		$referralData	= array('id' => 0, 'name' => '');
		$accountName	= "";
		
		$externalAuth	= HTTP::_GP('externalAuth', array());
		$referralID 	= HTTP::_GP('referralID', 0);

		foreach(Universe::availableUniverses() as $uniId)
		{
			$config = Config::get($uniId);
			$universeSelect[$uniId]	= $config->uni_name.($config->game_disable == 0 || $config->reg_closed == 1 ? $LNG['uni_closed'] : '');
		}
		
		if(!isset($externalAuth['account'], $externalAuth['method']))
		{
			$externalAuth['account']	= 0;
			$externalAuth['method']		= '';
		}
		else
		{
			$externalAuth['method']		= strtolower(str_replace(array('_', '\\', '/', '.', "\0"), '', $externalAuth['method']));
			if($externalAuth['method'] === 'openid') {
				$externalAuth['method'] = '';
				$externalAuth['account'] = 0;
			}
		}
		
		if(!empty($externalAuth['account']) && file_exists('includes/extauth/'.$externalAuth['method'].'.class.php'))
		{
			$path	= 'includes/extauth/'.$externalAuth['method'].'.class.php';
			require($path);
			$methodClass	= ucwords($externalAuth['method']).'Auth';
			/** @var $authObj externalAuth */
			$authObj		= new $methodClass;
			
			if(!$authObj->isActiveMode())
			{
				$this->redirectTo('index.php?code=5');
			}
			
			if(!$authObj->isValid())
			{
				$this->redirectTo('index.php?code=4');
			}
			
			$accountData	= $authObj->getAccountData();
			$accountName	= $accountData['name'];
		}

		$config			= Config::get();
		if($config->ref_active == 1 && !empty($referralID))
		{
			$db = Database::get();

			$sql = "SELECT username FROM %%USERS%% WHERE id = :referralID AND universe = :universe;";
			$referralAccountName = $db->selectSingle($sql, array(
				':referralID'	=> $referralID,
				':universe'		=> Universe::current()
			), 'username');

			if(!empty($referralAccountName))
			{
				$referralData	= array('id' => $referralID, 'name' => $referralAccountName);
			}
		}
		
		$this->assign(array(
			'registrationForm'    => RegistrationSecurity::issue(),
            'captchaProvider'     => RegistrationSecurity::provider($config),
            'captchaSiteKey'      => $config->cappublic,
            'referralData'		=> $referralData,
			'accountName'		=> $accountName,
			'externalAuth'		=> $externalAuth,
			'universeSelect'	=> $universeSelect,
			'registerRulesDesc'	=> sprintf($LNG['registerRulesDesc'], '<a href="index.php?page=rules">'.$LNG['menu_rules'].'</a>')
		));
		
		$this->display('page.register.default.tpl');
	}
	
	function send() 
	{
		global $LNG;
		$config		= Config::get();

		if($config->game_disable == 0 || $config->reg_closed == 1)
		{
			$this->printMessage($LNG['registerErrorUniClosed'], array(array(
				'label'	=> $LNG['registerBack'],
				'url'	=> 'index.php?page=register',
			)));
		}

        if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
            http_response_code(405);
            header('Allow: POST');
            $this->printMessage($LNG['registerErrorCaptcha']);
        }
        $formId = HTTP::_GP('registrationForm', '');
        $formToken = HTTP::_GP('registrationToken', '');
        $honeypot = HTTP::_GP('website', '');
        $clientAddress = isset($_SERVER['REMOTE_ADDR']) ? $_SERVER['REMOTE_ADDR'] : '';
        if (!RegistrationSecurity::allowAttempt(CACHE_PATH.'sessions', $clientAddress, Universe::current())) {
            http_response_code(429);
            header('Retry-After: 900');
            $this->printMessage($LNG['ui_register_rate_limit'], array(array('label'=>$LNG['registerBack'],'url'=>'index.php?page=register')));
        }
        if (!RegistrationSecurity::validForm($formId, $formToken, $honeypot)) {
            http_response_code(400);
            $this->printMessage($LNG['ui_register_expired'], array(array('label'=>$LNG['registerBack'],'url'=>'index.php?page=register')));
        }

		$userName 		= HTTP::_GP('username', '', UTF8_SUPPORT);
		$password 		= HTTP::_GP('password', '', true);
		$password2 		= HTTP::_GP('passwordReplay', '', true);
		$mailAddress 	= HTTP::_GP('email', '');
		$mailAddress2	= HTTP::_GP('emailReplay', '');
		$rulesChecked	= HTTP::_GP('rules', 0);
		$language 		= HTTP::_GP('lang', '');
		
		$referralID 	= HTTP::_GP('referralID', 0);

		$externalAuth	= HTTP::_GP('externalAuth', array());
		if(!isset($externalAuth['account'], $externalAuth['method']))
		{
			$externalAuthUID	= 0;
			$externalAuthMethod	= '';
		}
		else
		{
			$externalAuthUID	= $externalAuth['account'];
			$externalAuthMethod	= strtolower(str_replace(array('_', '\\', '/', '.', "\0"), '', $externalAuth['method']));
			if($externalAuthMethod === 'openid') {
				$externalAuthMethod = '';
				$externalAuthUID = 0;
			}
		}
		
		$errors 	= array();
		
		if(empty($userName)) {
			$errors[]	= $LNG['registerErrorUsernameEmpty'];
		}
		
		if(!PlayerUtil::isNameValid($userName) || (function_exists('mb_strlen') ? mb_strlen($userName, 'UTF-8') : strlen($userName)) < 3 || (function_exists('mb_strlen') ? mb_strlen($userName, 'UTF-8') : strlen($userName)) > 32) {
			$errors[]	= $LNG['registerErrorUsernameChar'];
		}
		
		if(strlen($password) < 8 || strlen($password) > 128) {
			$errors[]	= $LNG['registerErrorPasswordLength'];
		}
			
		if($password != $password2) {
			$errors[]	= $LNG['registerErrorPasswordSame'];
		}
			
		if(!PlayerUtil::isMailValid($mailAddress)) {
			$errors[]	= $LNG['registerErrorMailInvalid'];
		}
			
		if(empty($mailAddress)) {
			$errors[]	= $LNG['registerErrorMailEmpty'];
		}
		
		if($mailAddress != $mailAddress2) {
			$errors[]	= $LNG['registerErrorMailSame'];
		}
		
		if($rulesChecked != 1) {
			$errors[]	= $LNG['registerErrorRules'];
		}
		
		$db = Database::get();

		$sql = "SELECT (
				SELECT COUNT(*)
				FROM %%USERS%%
				WHERE universe = :universe
				AND username = :userName
			) + (
				SELECT COUNT(*)
				FROM %%USERS_VALID%%
				WHERE universe = :universe
				AND username = :userName
			) as count;";

		$countUsername = $db->selectSingle($sql, array(
			':universe'	=> Universe::current(),
			':userName'	=> $userName,
		), 'count');

		$sql = "SELECT (
			SELECT COUNT(*)
			FROM %%USERS%%
			WHERE universe = :universe
			AND (
				email = :mailAddress
				OR email_2 = :mailAddress
			)
		) + (
			SELECT COUNT(*)
			FROM %%USERS_VALID%%
			WHERE universe = :universe
			AND email = :mailAddress
		) as count;";

		$countMail = $db->selectSingle($sql, array(
			':universe'		=> Universe::current(),
			':mailAddress'	=> $mailAddress,
		), 'count');
		
		if($countUsername!= 0) {
			$errors[]	= $LNG['registerErrorUsernameExist'];
		}
			
		if($countMail != 0) {
			$errors[]	= $LNG['registerErrorMailExist'];
		}
		
		if (RegistrationSecurity::provider($config) === 'recaptcha')
		{
            require('includes/libs/reCAPTCHA/autoload.php');

            $recaptcha = new \ReCaptcha\ReCaptcha($config->capprivate);
            $resp = $recaptcha->verify(HTTP::_GP('g-recaptcha-response', ''), Session::getClientIp());
            if (!$resp->isSuccess())
            {
                $errors[]	= $LNG['registerErrorCaptcha'];
            }
		}
						
        $provider = RegistrationSecurity::provider($config);
        if ($provider === 'local' && !RegistrationSecurity::verifyLocal($formId, HTTP::_GP('captchaAnswer', ''))) {
            $errors[] = $LNG['registerErrorCaptcha'];
        } elseif ($provider === 'turnstile') {
            $hostname = parse_url('http://'.HTTP_HOST, PHP_URL_HOST);
            if (!RegistrationSecurity::verifyTurnstile(HTTP::_GP('cf-turnstile-response',''), $config->capprivate, $hostname)) $errors[] = $LNG['registerErrorCaptcha'];
        }

		if (!empty($errors)) {
			$this->printMessage(implode("<br>\r\n", $errors), array(array(
				'label'	=> $LNG['registerBack'],
				'url'	=> 'index.php?page=register',
			)));
		}

		$path	= 'includes/extauth/'.$externalAuthMethod.'.class.php';

		if(!empty($externalAuth['account']) && file_exists($path))
		{
			require($path);

			$methodClass		= ucwords($externalAuthMethod).'Auth';
			/** @var $authObj externalAuth */
			$authObj			= new $methodClass;
			$externalAuthUID	= 0;
			if($authObj->isActiveMode() && $authObj->isValid()) {
				$externalAuthUID	= $authObj->getAccount();
			}
		}
		
		if($config->ref_active == 1 && !empty($referralID))
		{
			$sql = "SELECT COUNT(*) as state FROM %%USERS%% WHERE id = :referralID AND universe = :universe;";
			$Count = $db->selectSingle($sql, array(
				':referralID' 	=> $referralID,
				':universe'		=> Universe::current()
			), 'state');

			if($Count == 0)
			{
				$referralID	= 0;
			}
		}
		else
		{
			$referralID	= 0;
		}
		
        RegistrationSecurity::consume($formId);
		$validationKey	= bin2hex(random_bytes(16));

		$sql = "INSERT INTO %%USERS_VALID%% SET
				`userName` = :userName,
				`validationKey` = :validationKey,
				`password` = :password,
				`email` = :mailAddress,
				`date` = :timestamp,
				`ip` = :remoteAddr,
				`language` = :language,
				`universe` = :universe,
				`referralID` = :referralID,
				`externalAuthUID` = :externalAuthUID,
				`externalAuthMethod` = :externalAuthMethod;";


		$db->insert($sql, array(
			':userName'				=> $userName,
			':validationKey'		=> $validationKey,
			':password'				=> PlayerUtil::cryptPassword($password),
			':mailAddress'			=> $mailAddress,
			':timestamp'			=> TIMESTAMP,
			':remoteAddr'			=> Session::getClientIp(),
			':language'				=> $language,
			':universe'				=> Universe::current(),
			':referralID'			=> $referralID,
			':externalAuthUID'		=> $externalAuthUID,
			':externalAuthMethod'	=> $externalAuthMethod
		));

		$validationID	= $db->lastInsertId();
		$verifyURL	= 'index.php?page=vertify&i='.$validationID.'&k='.$validationKey;
		
		if($config->user_valid == 0 || !empty($externalAuthUID))
		{
			$this->redirectTo($verifyURL);
		}
		else
		{
			require 'includes/classes/Mail.class.php';
			$MailRAW		= $LNG->getTemplate('email_vaild_reg');
			$MailContent	= str_replace(array(
				'{USERNAME}',
				'{PASSWORD}',
				'{GAMENAME}',
				'{VERTIFYURL}',
				'{GAMEMAIL}',
			), array(
				$userName,
				$password,
				$config->game_name.' - '.$config->uni_name,
				HTTP_PATH.$verifyURL,
				$config->smtp_sendmail,
			), $MailRAW);

			$subject	= sprintf($LNG['registerMailVertifyTitle'], $config->game_name);
			Mail::send($mailAddress, $userName, $subject, $MailContent);
			
			$this->printMessage($LNG['registerSendComplete']);
		}
	}
}
