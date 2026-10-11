<?php
require dirname(__DIR__).'/includes/classes/RegistrationSecurity.class.php';
function checkRegistration($condition,$label){if(!$condition)throw new Exception($label);}
$_SESSION=array();$form=RegistrationSecurity::issue(1000);
checkRegistration(RegistrationSecurity::validForm($form['id'],$form['token'],'',1001),'valid form rejected');
checkRegistration(!RegistrationSecurity::validForm($form['id'],'fake','',1001),'forged CSRF accepted');
checkRegistration(!RegistrationSecurity::validForm($form['id'],$form['token'],'bot',1001),'honeypot accepted');
checkRegistration(!RegistrationSecurity::validForm($form['id'],$form['token'],'',1901),'expired form accepted');
RegistrationSecurity::consume($form['id']);checkRegistration(!RegistrationSecurity::validForm($form['id'],$form['token'],'',1002),'replayed form accepted');
$form=RegistrationSecurity::issue();$answer=RegistrationSecurity::challenge($form['id']);checkRegistration(RegistrationSecurity::verifyLocal($form['id'],strtolower($answer)),'correct code rejected');checkRegistration(!RegistrationSecurity::verifyLocal($form['id'],$answer),'replayed CAPTCHA accepted');
RegistrationSecurity::challenge($form['id']);checkRegistration(!RegistrationSecurity::verifyLocal($form['id'],'WRONG'),'wrong CAPTCHA accepted');
$folder=sys_get_temp_dir().'/gala-registration-test-'.uniqid();mkdir($folder);
try {for($i=0;$i<10;$i++)checkRegistration(RegistrationSecurity::allowAttempt($folder,'127.0.0.1',1,1000),'early throttling');checkRegistration(!RegistrationSecurity::allowAttempt($folder,'127.0.0.1',1,1001),'rate limit bypass');checkRegistration(RegistrationSecurity::allowAttempt($folder,'127.0.0.1',1,1900),'rate limit failed to expire');checkRegistration(RegistrationSecurity::allowAttempt($folder,'127.0.0.2',1,1000),'unrelated IP blocked');}finally{foreach(glob($folder.'/*.json') as $file)unlink($file);rmdir($folder);}
$result=array('success'=>true,'hostname'=>'gala.xyz','action'=>'register');checkRegistration(RegistrationSecurity::validTurnstileResponse($result,'gala.xyz'),'valid Turnstile result rejected');checkRegistration(!RegistrationSecurity::validTurnstileResponse($result,'wrong.example'),'wrong host accepted');$result['action']='login';checkRegistration(!RegistrationSecurity::validTurnstileResponse($result,'gala.xyz'),'wrong action accepted');$result['action']='register';$result['success']=false;checkRegistration(!RegistrationSecurity::validTurnstileResponse($result,'gala.xyz'),'failed provider accepted');checkRegistration(!RegistrationSecurity::verifyTurnstile('','','gala.xyz'),'missing keys accepted');
echo "PASS: CSRF, honeypot, expiry, single use, CAPTCHA, rate limiting and Turnstile hostname/action checks.\n";
