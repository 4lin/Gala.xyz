<?php

class ShowTutorialPage extends AbstractPage 

{
	public static $requireModule = MODULE_SUPPORT;

	function __construct() 

	{
		parent::__construct();
	}

function show()

{
	global $USER, $PLANET, $LNG, $reslist, $resource;

		$this->tplObj->assign_vars(array(

		'tut_welcome'				=> $LNG['tut_welcome'],
		'tut_welcom_desc'			=> $LNG['tut_welcom_desc'],
		'tut_welcom_desc2'			=> $LNG['tut_welcom_desc2'],
		'tut_welcom_desc3'			=> $LNG['tut_welcom_desc3'],
		'tut_welcom_desc4'			=> $LNG['tut_welcom_desc4'],
		'tut_welcom_desc5'			=> $LNG['tut_welcom_desc5'],
		'tut_go'					=> $LNG['tut_go'],
		'tut_go_to'					=> $LNG['tut_go_to'],
		'tut_m1'					=> $LNG['tut_m1'],
		'tut_m2'					=> $LNG['tut_m2'],
		'tut_m3'					=> $LNG['tut_m3'],
		'tut_m4'					=> $LNG['tut_m4'],
		'tut_m5'					=> $LNG['tut_m5'],
		'tut_m6'					=> $LNG['tut_m6'],
		'tut_m7'					=> $LNG['tut_m7'],
		'tut_m8'					=> $LNG['tut_m8'],
		'tut_m9'					=> $LNG['tut_m9'],
		'tut_objects'				=> $LNG['tut_objects'],
		'tut_m1_name'				=> $LNG['tut_m1_name'],
		'tut_m1_desc'				=> $LNG['tut_m1_desc'],
		'tut_m1_quest'				=> $LNG['tut_m1_quest'],
		'tut_m1_quest2'				=> $LNG['tut_m1_quest2'],
		'tut_m1_quest3'				=> $LNG['tut_m1_quest3'],
		'tut_m1_quest4'				=> $LNG['tut_m1_quest4'],
		'tut_m1_quest5'				=> $LNG['tut_m1_quest5'],
		'tut_m1_gain'				=> $LNG['tut_m1_gain'],
		'tut_m1_ready'				=> $LNG['tut_m1_ready'],
		'tut_m2_name'				=> $LNG['tut_m2_name'],
		'tut_m2_desc'				=> $LNG['tut_m2_desc'],
		'tut_m2_quest'				=> $LNG['tut_m2_quest'],
		'tut_m2_quest2'				=> $LNG['tut_m2_quest2'],
		'tut_m2_quest3'				=> $LNG['tut_m2_quest3'],
		'tut_m2_quest4'				=> $LNG['tut_m2_quest4'],
		'tut_m2_quest5'				=> $LNG['tut_m2_quest5'],
		'tut_m2_gain'				=> $LNG['tut_m2_gain'],
		'tut_m2_ready'				=> $LNG['tut_m2_ready'],
		'tut_m3_name'				=> $LNG['tut_m3_name'],
		'tut_m3_desc'				=> $LNG['tut_m3_desc'],
		'tut_m3_quest'				=> $LNG['tut_m3_quest'],
		'tut_m3_quest2'				=> $LNG['tut_m3_quest2'],
		'tut_m3_quest3'				=> $LNG['tut_m3_quest3'],
		'tut_m3_quest4'				=> $LNG['tut_m3_quest4'],
		'tut_m3_quest5'				=> $LNG['tut_m3_quest5'],
		'tut_m3_gain'				=> $LNG['tut_m3_gain'],
		'tut_m3_ready'				=> $LNG['tut_m3_ready'],
		'tut_m4_name'				=> $LNG['tut_m4_name'],
		'tut_m4_desc'				=> $LNG['tut_m4_desc'],
		'tut_m4_quest'				=> $LNG['tut_m4_quest'],
		'tut_m4_quest2'				=> $LNG['tut_m4_quest2'],
		'tut_m4_quest3'				=> $LNG['tut_m4_quest3'],
		'tut_m4_quest4'				=> $LNG['tut_m4_quest4'],
		'tut_m4_quest5'				=> $LNG['tut_m4_quest5'],
		'tut_m4_gain'				=> $LNG['tut_m4_gain'],
		'tut_m4_ready'				=> $LNG['tut_m4_ready'],
		'tut_m5_name'				=> $LNG['tut_m5_name'],
		'tut_m5_desc'				=> $LNG['tut_m5_desc'],
		'tut_m5_quest'				=> $LNG['tut_m5_quest'],
		'tut_m5_quest2'				=> $LNG['tut_m5_quest2'],
		'tut_m5_quest3'				=> $LNG['tut_m5_quest3'],
		'tut_m5_quest4'				=> $LNG['tut_m5_quest4'],
		'tut_m5_quest5'				=> $LNG['tut_m5_quest5'],
		'tut_m5_gain'				=> $LNG['tut_m5_gain'],
		'tut_m5_ready'				=> $LNG['tut_m5_ready'],
		'tut_m6_name'				=> $LNG['tut_m6_name'],
		'tut_m6_desc'				=> $LNG['tut_m6_desc'],
		'tut_m6_quest'				=> $LNG['tut_m6_quest'],
		'tut_m6_quest2'				=> $LNG['tut_m6_quest2'],
		'tut_m6_quest3'				=> $LNG['tut_m6_quest3'],
		'tut_m6_quest4'				=> $LNG['tut_m6_quest4'],
		'tut_m6_quest5'				=> $LNG['tut_m6_quest5'],
		'tut_m6_gain'				=> $LNG['tut_m6_gain'],
		'tut_m6_ready'				=> $LNG['tut_m6_ready'],
		'tut_m7_name'				=> $LNG['tut_m7_name'],
		'tut_m7_desc'				=> $LNG['tut_m7_desc'],
		'tut_m7_quest'				=> $LNG['tut_m7_quest'],
		'tut_m7_quest2'				=> $LNG['tut_m7_quest2'],
		'tut_m7_quest3'				=> $LNG['tut_m7_quest3'],
		'tut_m7_quest4'				=> $LNG['tut_m7_quest4'],
		'tut_m7_quest5'				=> $LNG['tut_m7_quest5'],
		'tut_m7_gain'				=> $LNG['tut_m7_gain'],
		'tut_m7_ready'				=> $LNG['tut_m7_ready'],
		'tut_m8_name'				=> $LNG['tut_m8_name'],
		'tut_m8_desc'				=> $LNG['tut_m8_desc'],
		'tut_m8_quest'				=> $LNG['tut_m8_quest'],
		'tut_m8_quest2'				=> $LNG['tut_m8_quest2'],
		'tut_m8_quest3'				=> $LNG['tut_m8_quest3'],
		'tut_m8_quest4'				=> $LNG['tut_m8_quest4'],
		'tut_m8_quest5'				=> $LNG['tut_m8_quest5'],
		'tut_m8_gain'				=> $LNG['tut_m8_gain'],
		'tut_m8_ready'				=> $LNG['tut_m8_ready'],
		'tut_m9_name'				=> $LNG['tut_m9_name'],
		'tut_m9_desc'				=> $LNG['tut_m9_desc'],
		'tut_m9_quest'				=> $LNG['tut_m9_quest'],
		'tut_m9_quest2'				=> $LNG['tut_m9_quest2'],
		'tut_m9_quest3'				=> $LNG['tut_m9_quest3'],
		'tut_m9_quest4'				=> $LNG['tut_m9_quest4'],
		'tut_m9_quest5'				=> $LNG['tut_m9_quest5'],
		'tut_m9_gain'				=> $LNG['tut_m9_gain'],
		'tut_m9_ready'				=> $LNG['tut_m9_ready'],
		'tut_compleat'				=> $LNG['tut_compleat'],

	));

    if($USER['started_tut'] == 0)

{

$this->display('inizio.tpl');

}

else if($USER['tut_m8'] == 1)

{

$this->redirectTo('game.php?page=tutorial&mode=m9');

}

else if($USER['tut_m7'] == 1)

{

$this->redirectTo('game.php?page=tutorial&mode=m8');

}

else if($USER['tut_m6'] == 1)

{

$this->redirectTo('game.php?page=tutorial&mode=m7');

}

else if($USER['tut_m5'] == 1)

{

$this->redirectTo('game.php?page=tutorial&mode=m6');

}

else if($USER['tut_m4'] == 1)

{

$this->redirectTo('game.php?page=tutorial&mode=m5');

}

else if($USER['tut_m3'] == 1)

{

$this->redirectTo('game.php?page=tutorial&mode=m4');

}

else if($USER['tut_m2'] == 1)

{

$this->redirectTo('game.php?page=tutorial&mode=m3');

}

else if($USER['tut_m1'] == 1)

{

$this->redirectTo('game.php?page=tutorial&mode=m2');

}

else

{

$this->redirectTo('game.php?page=tutorial&mode=m1');

}

	

	$mode		= HTTP::_GP('mode', '');	

	}	

function m1(){

	global $USER, $PLANET, $LNG, $reslist, $resource;

	

	if($USER['started_tut'] == 0)

	{

		$aendern=$GLOBALS['DATABASE']->query("UPDATE ".USERS." SET `started_tut`=started_tut+1 WHERE id=".$USER['id']."");

	}

	if($USER['tut_m2'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si2'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No2' => false,

				));	

	}

	if($USER['tut_m2'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No2'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si2' => false,

				));	

	}

	if($USER['tut_m3'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si3'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No3' => false,

				));	

	}

	if($USER['tut_m3'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No3'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si3' => false,

				));	

	}

	if($USER['tut_m4'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si4'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No4' => false,

				));	

	}

	if($USER['tut_m4'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No4'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si4'=> false,

				));	

	}

	if($USER['tut_m5'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si5'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No5'=> false,

				));	

	}

	if($USER['tut_m5'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No5'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si5'=> false,

				));	

	}

	if($USER['tut_m6'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si6'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No6'=> false,

				));	

	}

	if($USER['tut_m6'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No6'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si6'=>false,

				));	

	}

	if($USER['tut_m7'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si7'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No7'=>false,

				));	

	}

	if($USER['tut_m7'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No7'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si7'=>false,

				));	

	}

	if($USER['tut_m8'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si8'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No8'=>false,

				));	

	}

	if($USER['tut_m8'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No8'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si8'=>false,

				));	

	}

	if($USER['tut_m9'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si9'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No9'=>false,

				));	

	}

	if($USER['tut_m9'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No9'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si9'=>false,

				));	

	}

	if($USER['tut_m1'] >= 1){	

	$this->tplObj->assign_vars(array(

				'Si1'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'livello1'=> $LNG['tut_ready'],

				'No1'=>false,

				));



	{

	$this->tplObj->assign_vars(array(

	    		'Si_m1_1'=>false,

				'Si_m1_2'=>false,

				'Si_m1_3'=>false,

				'Si_m1_4'=>false,

				'No_m1_1'=>false,

				'No_m1_2'=>false,

				'No_m1_3'=>false,

				'No_m1_4'=>false,

				));	

	}			

				

	$this->display('mission_1.tpl');		

	}else{

	$this->tplObj->assign_vars(array(

				'No1'=>'<img src="styles/resource/images/roter-haken.png">',

				'livello1'=> $LNG['tut_not_ready'],

				'Si1'=>false,

				));	

		if($USER['tut_m1'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si1'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No1'=>false,

				));	

	}

	if($USER['tut_m2'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No2'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si2' => false,

				));	

	}

	if($USER['tut_m3'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si3'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No3' => false,

				));	

	}

	if($USER['tut_m3'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No3'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si3' => false,

				));	

	}

	if($USER['tut_m4'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si4'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No4' => false,

				));	

	}

	if($USER['tut_m4'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No4'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si4'=> false,

				));	

	}

	if($USER['tut_m5'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si5'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No5'=> false,

				));	

	}

	if($USER['tut_m5'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No5'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si5'=> false,

				));	

	}

	if($USER['tut_m6'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si6'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No6'=> false,

				));	

	}

	if($USER['tut_m6'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No6'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si6'=>false,

				));	

	}

	if($USER['tut_m7'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si7'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No7'=>false,

				));	

	}

	if($USER['tut_m7'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No7'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si7'=>false,

				));	

	}

	if($USER['tut_m8'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si8'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No8'=>false,

				));	

	}

	if($USER['tut_m8'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No8'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si8'=>false,

				));	

	}

	if($USER['tut_m9'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si9'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No9'=>false,

				));	

	}

	if($USER['tut_m9'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No9'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si9'=>false,

				));	

	}

	//Miniera di metallo

	if($PLANET['metal_mine'] >=4){

	$this->tplObj->assign_vars(array(

				'Si_m1_1'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No_m1_1'=>false,

				));

	}else{

	$this->tplObj->assign_vars(array(

				'No_m1_1'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si_m1_1'=>false,

				));

	}

	//Miniera di cristallo

	if($PLANET['crystal_mine'] >=2){

	$this->tplObj->assign_vars(array(

				'Si_m1_2'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No_m1_2'=>false,

				));

	}else{

	$this->tplObj->assign_vars(array(

				'No_m1_2'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si_m1_2'=>false,

				));

	}

	//Centrare solare

	if($PLANET['solar_plant'] >=4){

	$this->tplObj->assign_vars(array(

				'Si_m1_3'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No_m1_3'=>false,

				));

	}else{

	$this->tplObj->assign_vars(array(

				'No_m1_3'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si_m1_3'=>false,

				));

	}

			

	if($USER['tut_m1']==0){

	if($PLANET['metal_mine'] >=4 && $PLANET['crystal_mine'] >=2 && $PLANET['solar_plant'] >=4){

	$GLOBALS['DATABASE']->query("UPDATE ".USERS." SET `tut_m1`=tut_m1+1 WHERE id=".$USER['id']."");

	// $GLOBALS['DATABASE']->query("UPDATE ".USERS." SET `darkmatter`=darkmatter+2000 WHERE id=".$USER['id']."");

    $USER['darkmatter']	+= 2000;

	$this->printMessage(sprintf($LNG['tut_m1_ready']), "?page=tutorial&mode=m2", 3);

	exit;

	

	

	}

	}

		

	$this->display('mission_1.tpl');

	//Fine else

	}



}

	

//------------------------------------------------MISSSION 2-----------------------------------------------------------------

function m2(){

	global $USER, $PLANET, $LNG, $reslist, $resource;

	if($USER['tut_m2'] >= 1){	

	$this->tplObj->assign_vars(array(

				'Si2'=>'<img src="styles/resource/images/gruener-haken.png">',

				'livello2'=> $LNG['tut_ready'],

				'No2'=>false,

					));

			

		if($USER['tut_m1'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si1'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No1'=>false,

				));	

	}

	if($USER['tut_m1'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No1'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si1'=>false,

				));	

	}

	if($USER['tut_m3'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si3'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No3' => false,

				));	

	}

	if($USER['tut_m3'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No3'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si3' => false,

				));	

	}

	if($USER['tut_m4'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si4'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No4' => false,

				));	

	}

	if($USER['tut_m4'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No4'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si4'=> false,

				));	

	}

	if($USER['tut_m5'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si5'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No5'=> false,

				));	

	}

	if($USER['tut_m5'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No5'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si5'=> false,

				));	

	}

	if($USER['tut_m6'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si6'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No6'=> false,

				));	

	}

	if($USER['tut_m6'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No6'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si6'=>false,

				));	

	}

	if($USER['tut_m7'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si7'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No7'=>false,

				));	

	}

	if($USER['tut_m7'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No7'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si7'=>false,

				));	

	}

	if($USER['tut_m8'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si8'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No8'=>false,

				));	

	}

	if($USER['tut_m8'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No8'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si8'=>false,

				));	

	}

	if($USER['tut_m9'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si9'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No9'=>false,

				));	

	}

	if($USER['tut_m9'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No9'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si9'=>false,

			));	

	}

	

	{

	$this->tplObj->assign_vars(array(

	    		'Si_m2_1'=>false,

				'Si_m2_2'=>false,

				'Si_m2_3'=>false,

				'Si_m2_4'=>false,

				'No_m2_1'=>false,

				'No_m2_2'=>false,

				'No_m2_3'=>false,

				'No_m2_4'=>false,

				));	

	}

	$this->display('mission_2.tpl');	

	}else{

	$this->tplObj->assign_vars(array(

				'No2'=>'<img src="styles/resource/images/roter-haken.png">',

				'livello2'=> $LNG['tut_not_ready'],

				'Si2'=>false,

				));	

		if($USER['tut_m1'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si1'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No1'=>false,

				));	

	}

	if($USER['tut_m1'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No1'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si1'=>false,

				));	

	}

	if($USER['tut_m3'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si3'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No3' => false,

				));	

	}

	if($USER['tut_m3'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No3'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si3' => false,

				));	

	}

	if($USER['tut_m4'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si4'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No4' => false,

				));	

	}

	if($USER['tut_m4'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No4'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si4'=> false,

				));	

	}

	if($USER['tut_m5'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si5'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No5'=> false,

				));	

	}

	if($USER['tut_m5'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No5'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si5'=> false,

				));	

	}

	if($USER['tut_m6'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si6'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No6'=> false,

				));	

	}

	if($USER['tut_m6'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No6'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si6'=>false,

				));	

	}

	if($USER['tut_m7'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si7'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No7'=>false,

				));	

	}

	if($USER['tut_m7'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No7'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si7'=>false,

				));	

	}

	if($USER['tut_m8'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si8'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No8'=>false,

				));	

	}

	if($USER['tut_m8'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No8'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si8'=>false,

				));	

	}

	if($USER['tut_m9'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si9'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No9'=>false,

				));	

	}

	if($USER['tut_m9'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No9'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si9'=>false,

				));	

	}

	

	//Deuterio

	if($PLANET['deuterium_sintetizer'] >=2){

	$this->tplObj->assign_vars(array(

				'Si_m2_1'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No_m2_1'=>false,

				));	

	}else{

	$this->tplObj->assign_vars(array(

				'No_m2_1'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si_m2_1'=>false,

				));	

				}

				

	//Fabrica

	if($PLANET['robot_factory'] >=2){

	$this->tplObj->assign_vars(array(

				'Si_m2_2'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No_m2_2'=>false,

				));	

	}else{

	$this->tplObj->assign_vars(array(

				'No_m2_2'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si_m2_2'=>false,

				));	

	//Cantiere

	}if($PLANET['hangar'] >=1){

	$this->tplObj->assign_vars(array(

				'Si_m2_3'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No_m2_3'=>false,

				));	

	}else{

	$this->tplObj->assign_vars(array(

				'No_m2_3'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si_m2_3'=>false,

				));	

	//Missili

	}if($PLANET['misil_launcher'] >=10){

	$this->tplObj->assign_vars(array(

				'Si_m2_4'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No_m2_4'=>false,

				));	

	}else{

	$this->tplObj->assign_vars(array(

				'No_m2_4'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si_m2_4'=>false,

				));	

				}		

	

	

	if($USER['tut_m2']==0){

	if($PLANET['deuterium_sintetizer'] >=2 && $PLANET['robot_factory'] >=2 && $PLANET['hangar'] >=1&& $PLANET['misil_launcher'] >=10){

	$GLOBALS['DATABASE']->query("UPDATE ".USERS." SET `tut_m2`=tut_m2+1 WHERE id=".$USER['id']."");

	$USER['darkmatter']	+= 2000;

	$this->printMessage(sprintf($LNG['tut_m2_ready']), "?page=tutorial&mode=m3", 3);

	exit;

	}

	}

		

	$this->display('mission_2.tpl');

	}

	//finde difesa

	}

//--------------------------------------------MISSSION 3-----------------------------------------------------------------------	

function m3(){

	global $USER, $PLANET, $LNG, $reslist, $resource;

	if($USER['tut_m3'] >= 1){	

	$this->tplObj->assign_vars(array(

				'Si3'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'livello3'=> $LNG['tut_ready'],

				'No3'=>false,

				));	

		if($USER['tut_m1'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si1'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No1'=>false,

				));	

	}

	if($USER['tut_m1'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No1'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si1'=>false,

				));	

	}

	if($USER['tut_m2'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si2'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No2' => false,

				));	

	}

	if($USER['tut_m2'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No2'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si2' => false,

				));	

	}

	if($USER['tut_m4'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si4'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No4' => false,

				));	

	}

	if($USER['tut_m4'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No4'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si4'=> false,

				));	

	}

	if($USER['tut_m5'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si5'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No5'=> false,

				));	

	}

	if($USER['tut_m5'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No5'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si5'=> false,

				));	

	}

	if($USER['tut_m6'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si6'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No6'=> false,

				));	

	}

	if($USER['tut_m6'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No6'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si6'=>false,

				));	

	}

	if($USER['tut_m7'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si7'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No7'=>false,

				));	

	}

	if($USER['tut_m7'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No7'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si7'=>false,

				));	

	}

	if($USER['tut_m8'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si8'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No8'=>false,

				));	

	}

	if($USER['tut_m8'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No8'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si8'=>false,

				));	

	}

	if($USER['tut_m9'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si9'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No9'=>false,

				));	

	}

	if($USER['tut_m9'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No9'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si9'=>false,

				'Si_m3_1'=>false,

				'Si_m3_3'=>false,

				'Si_m3_4'=>false,

				'No_m3_1'=>false,

				'No_m3_3'=>false,

				'No_m3_4'=>false,

				));	

	}

	

	{

	$this->tplObj->assign_vars(array(

	    		'Si_m3_1'=>false,

				'Si_m3_3'=>false,

				'Si_m3_4'=>false,

				'No_m3_1'=>false,

				'No_m3_3'=>false,

				'No_m3_4'=>false,

				));	

	}

	$this->display('mission_3.tpl');		

	}else{

	$this->tplObj->assign_vars(array(

				'No3'=>'<img src="styles/resource/images/roter-haken.png">',

				'livello3'=> $LNG['tut_not_ready'],

				'Si3'=>false,

				));	

		if($USER['tut_m1'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si1'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No1'=>false,

				));	

	}

	if($USER['tut_m1'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No1'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si1'=>false,

				));	

	}

	if($USER['tut_m2'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si2'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No2' => false,

				));	

	}

	if($USER['tut_m2'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No2'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si2' => false,

				));	

	}

	if($USER['tut_m4'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si4'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No4' => false,

				));	

	}

	if($USER['tut_m4'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No4'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si4'=> false,

				));	

	}

	if($USER['tut_m5'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si5'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No5'=> false,

				));	

	}

	if($USER['tut_m5'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No5'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si5'=> false,

				));	

	}

	if($USER['tut_m6'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si6'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No6'=> false,

				));	

	}

	if($USER['tut_m6'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No6'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si6'=>false,

				));	

	}

	if($USER['tut_m7'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si7'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No7'=>false,

				));	

	}

	if($USER['tut_m7'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No7'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si7'=>false,

				));	

	}

	if($USER['tut_m8'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si8'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No8'=>false,

				));	

	}

	if($USER['tut_m8'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No8'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si8'=>false,

				));	

	}

	if($USER['tut_m9'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si9'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No9'=>false,

				));	

	}

	if($USER['tut_m9'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No9'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si9'=>false,

				));	

	}







	//Metallo

	if($PLANET['metal_mine'] >=10){

	$this->tplObj->assign_vars(array(

				'Si_m3_1'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No_m3_1'=>false,

				));	

	}else{

	$this->tplObj->assign_vars(array(

				'No_m3_1'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si_m3_1'=>false,

				));	

				}

				

	//Fabrica

	if($PLANET['crystal_mine'] >=8){

		$this->tplObj->assign_vars(array(

				'Si_m3_3'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No_m3_3'=>false,

				));	

	}else{

	$this->tplObj->assign_vars(array(

				'No_m3_3'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si_m3_3'=>false,

				));	

	}

		//Nakliye kucuk

	if($PLANET['deuterium_sintetizer'] >=5){

	$this->tplObj->assign_vars(array(

				'Si_m3_4'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No_m3_4'=>false,

				));	

	}else{

	$this->tplObj->assign_vars(array(

				'No_m3_4'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si_m3_4'=>false,

				));	

				}	

	

	if($USER['tut_m3']==0){

	if($PLANET['metal_mine'] >=10 && $PLANET['crystal_mine'] >=8 && $PLANET['deuterium_sintetizer'] >=5){

	$GLOBALS['DATABASE']->query("UPDATE ".USERS." SET `tut_m3`=tut_m3+1 WHERE id=".$USER['id']."");

	$USER['darkmatter']	+= 2000;

	$this->printMessage(sprintf($LNG['tut_m3_ready']), "?page=tutorial&mode=m4", 3);

	exit;

	}

	}

		

	$this->display("mission_3.tpl");

	}

	//finde difesa

	}

//-----------------------------------------------MISSSION 4----------------------------------------------------------------

function m4(){

	global $USER, $PLANET, $LNG, $reslist, $resource;

if($USER['tut_m4'] >= 1){

$this->tplObj->assign_vars(array(

'Si4'=>'<img src="styles/resource/images/gruener-haken.png" >',

'livello4'=> $LNG['tut_ready'],

'No4'=>false,

));

if($USER['tut_m1'] == 1)

{

$this->tplObj->assign_vars(array(

'Si1'=>'<img src="styles/resource/images/gruener-haken.png" >',

'No1'=>false,

));

}

if($USER['tut_m1'] == 0)

{

$this->tplObj->assign_vars(array(

'No1'=>'<img src="styles/resource/images/roter-haken.png" >',

'Si1'=>false,

));

}

if($USER['tut_m2'] == 1)

{

$this->tplObj->assign_vars(array(

'Si2'=>'<img src="styles/resource/images/gruener-haken.png" >',

'No2'=>false,

));

}

if($USER['tut_m2'] == 0)

{

$this->tplObj->assign_vars(array(

'No2'=>'<img src="styles/resource/images/roter-haken.png" >',

'Si2'=>false,

));

}

if($USER['tut_m3'] == 1)

{

$this->tplObj->assign_vars(array(

'Si3'=>'<img src="styles/resource/images/gruener-haken.png" >',

'No3'=>false,

));

}

if($USER['tut_m3'] == 0)

{

$this->tplObj->assign_vars(array(

'No3'=>'<img src="styles/resource/images/roter-haken.png" >',

'Si3'=>false,

));

}

if($USER['tut_m5'] == 1)

{

$this->tplObj->assign_vars(array(

'Si5'=>'<img src="styles/resource/images/gruener-haken.png" >',

'No5'=>false,

));

}

if($USER['tut_m5'] == 0)

{

$this->tplObj->assign_vars(array(

'No5'=>'<img src="styles/resource/images/roter-haken.png" >',

'Si5'=>false,

));

}

if($USER['tut_m6'] == 1)

{

$this->tplObj->assign_vars(array(

'Si6'=>'<img src="styles/resource/images/gruener-haken.png" >',

'No6'=>false,

));

}

if($USER['tut_m6'] == 0)

{

$this->tplObj->assign_vars(array(

'No6'=>'<img src="styles/resource/images/roter-haken.png" >',

'Si6'=>false,

));

}

if($USER['tut_m7'] == 1)

{

$this->tplObj->assign_vars(array(

'Si7'=>'<img src="styles/resource/images/gruener-haken.png" >',

'No7'=>false,

));

}

if($USER['tut_m7'] == 0)

{

$this->tplObj->assign_vars(array(

'No7'=>'<img src="styles/resource/images/roter-haken.png" >',

'Si7'=>false,

));

}

if($USER['tut_m8'] == 1)

{

$this->tplObj->assign_vars(array(

'Si8'=>'<img src="styles/resource/images/gruener-haken.png" >',

'No8'=>false,

));

}

if($USER['tut_m8'] == 0)

{

$this->tplObj->assign_vars(array(

'No8'=>'<img src="styles/resource/images/roter-haken.png" >',

'Si8'=>false,

));

}

if($USER['tut_m9'] == 1)

{

$this->tplObj->assign_vars(array(

'Si9'=>'<img src="styles/resource/images/gruener-haken.png" >',

'No9'=>false,

));

}

if($USER['tut_m9'] == 0)

{

$this->tplObj->assign_vars(array(

'No9'=>'<img src="styles/resource/images/roter-haken.png" >',

'Si9'=>false,



));

}



{

	$this->tplObj->assign_vars(array(

	'Si_m4_1'=>false,

	'Si_m4_2'=>false,

	'Si_m4_3'=>false,

	'Si_m4_4'=>false,

	'No_m4_1'=>false,

	'No_m4_2'=>false,

	'No_m4_3'=>false,

	'No_m4_4'=>false,

	));	

	}

$this->display('mission_4.tpl');

}else{

$this->tplObj->assign_vars(array(

'No4'=>'<img src="styles/resource/images/roter-haken.png">',

'livello4'=> $LNG['tut_not_ready'],

'Si4'=>false,

));

if($USER['tut_m1'] == 1)

{

$this->tplObj->assign_vars(array(

'Si1'=>'<img src="styles/resource/images/gruener-haken.png" >',

'No1'=>false,

));

}

if($USER['tut_m1'] == 0)

{

$this->tplObj->assign_vars(array(

'No1'=>'<img src="styles/resource/images/roter-haken.png" >',

'Si1'=>false,

));

}

if($USER['tut_m2'] == 1)

{

$this->tplObj->assign_vars(array(

'Si2'=>'<img src="styles/resource/images/gruener-haken.png" >',

'No2'=>false,

));

}

if($USER['tut_m2'] == 0)

{

$this->tplObj->assign_vars(array(

'No2'=>'<img src="styles/resource/images/roter-haken.png" >',

'Si2'=>false,

));

}

if($USER['tut_m3'] == 1)

{

$this->tplObj->assign_vars(array(

'Si3'=>'<img src="styles/resource/images/gruener-haken.png" >',

'No3'=>false,

));

}

if($USER['tut_m3'] == 0)

{

$this->tplObj->assign_vars(array(

'No3'=>'<img src="styles/resource/images/roter-haken.png" >',

'Si3'=>false,

));

}

if($USER['tut_m5'] == 1)

{

$this->tplObj->assign_vars(array(

'Si5'=>'<img src="styles/resource/images/gruener-haken.png" >',

'No5'=>false,

));

}

if($USER['tut_m5'] == 0)

{

$this->tplObj->assign_vars(array(

'No5'=>'<img src="styles/resource/images/roter-haken.png" >',

'Si5'=>false,

));

}

if($USER['tut_m6'] == 1)

{

$this->tplObj->assign_vars(array(

'Si6'=>'<img src="styles/resource/images/gruener-haken.png" >',

'No6'=>false,

));

}

if($USER['tut_m6'] == 0)

{

$this->tplObj->assign_vars(array(

'No6'=>'<img src="styles/resource/images/roter-haken.png" >',

'Si6'=>false,

));

}

if($USER['tut_m7'] == 1)

{

$this->tplObj->assign_vars(array(

'Si7'=>'<img src="styles/resource/images/gruener-haken.png" >',

'No7'=>false,

));

}

if($USER['tut_m7'] == 0)

{

$this->tplObj->assign_vars(array(

'No7'=>'<img src="styles/resource/images/roter-haken.png" >',

'Si7'=>false,

));

}

if($USER['tut_m8'] == 1)

{

$this->tplObj->assign_vars(array(

'Si8'=>'<img src="styles/resource/images/gruener-haken.png" >',

'No8'=>false,

));

}

if($USER['tut_m8'] == 0)

{

$this->tplObj->assign_vars(array(

'No8'=>'<img src="styles/resource/images/roter-haken.png" >',

'Si8'=>false,

));

}

if($USER['tut_m9'] == 1)

{

$this->tplObj->assign_vars(array(

'Si9'=>'<img src="styles/resource/images/gruener-haken.png" >',

'No9'=>false,

));

}

if($USER['tut_m9'] == 0)

{

$this->tplObj->assign_vars(array(

'No9'=>'<img src="styles/resource/images/roter-haken.png" >',

'Si9'=>false,

));

}

//Laboratorio

if($PLANET['laboratory'] >=1){

$this->tplObj->assign_vars(array(

'Si_m4_1'=>'<img src="styles/resource/images/gruener-haken.png" >',

'No_m4_1'=>false,

));

}else{

$this->tplObj->assign_vars(array(

'No_m4_1'=>'<img src="styles/resource/images/roter-haken.png" >',

'Si_m4_1'=>false,

));

}



//Carco

if($PLANET['hangar'] >=4){

$this->tplObj->assign_vars(array(

'Si_m4_2'=>'<img src="styles/resource/images/gruener-haken.png" >',

'No_m4_2'=>false,

));

}else{

$this->tplObj->assign_vars(array(

'No_m4_2'=>'<img src="styles/resource/images/roter-haken.png" >',

'Si_m4_2'=>false,

));

//Cantiere

}

if($USER['combustion_tech'] >=2){

$this->tplObj->assign_vars(array(

'Si_m4_3'=>'<img src="styles/resource/images/gruener-haken.png" >',

'No_m4_3'=>false,

));

}else{

$this->tplObj->assign_vars(array(

'No_m4_3'=>'<img src="styles/resource/images/roter-haken.png" >',

'Si_m4_3'=>false,

));

}



if($PLANET['small_ship_cargo'] >=5){

$this->tplObj->assign_vars(array(

'Si_m4_4'=>'<img src="styles/resource/images/gruener-haken.png" >',

'No_m4_4'=>false,

));

}else{

$this->tplObj->assign_vars(array(

'No_m4_4'=>'<img src="styles/resource/images/roter-haken.png" >',

'Si_m4_4'=>false,

));

}







if($USER['tut_m4']==0){

if($PLANET['laboratory'] >=1 && $PLANET['hangar'] >=4 && $USER['combustion_tech'] >=2 && $PLANET['small_ship_cargo'] >=5){

$GLOBALS['DATABASE']->query("UPDATE ".USERS." SET `tut_m4`=tut_m4+1 WHERE id=".$USER['id']."");

$USER['darkmatter']	+= 2000;

$this->printMessage(sprintf($LNG['tut_m4_ready']), "?page=tutorial&mode=m5", 3);

exit;

}

}



$this->display('mission_4.tpl');

}

}

//-------------------------------------------MISSSION 5----------------------------------------------------------------------

function m5(){

	global $USER, $PLANET, $LNG, $reslist, $resource;

   if($USER['tut_m5'] >=1){

   $this->tplObj->assign_vars(array(

				'Si5'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'livello5'=> $LNG['tut_ready'],

				'No5'=>false,

				));	

		if($USER['tut_m1'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si1'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No1'=>false,

				));	

	}

	if($USER['tut_m1'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No1'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si1'=>false,

				));	

	}

	if($USER['tut_m2'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si2'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No2' => false,

				));	

	}

	if($USER['tut_m2'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No2'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si2' => false,

				));	

	}

	if($USER['tut_m3'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si3'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No3' => false,

				));	

	}

	if($USER['tut_m3'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No3'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si3' => false,

				));	

	}

	if($USER['tut_m4'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si4'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No4' => false,

				));	

	}

	if($USER['tut_m4'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No4'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si4'=> false,

				));	

	}

	if($USER['tut_m6'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si6'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No6'=> false,

				));	

	}

	if($USER['tut_m6'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No6'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si6'=>false,

				));	

	}

	if($USER['tut_m7'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si7'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No7'=>false,

				));	

	}

	if($USER['tut_m7'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No7'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si7'=>false,

				));	

	}

	if($USER['tut_m8'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si8'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No8'=>false,

				));	

	}

	if($USER['tut_m8'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No8'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si8'=>false,

				));	

	}

	if($USER['tut_m9'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si9'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No9'=>false,

				));	

	}

	if($USER['tut_m9'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No9'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si9'=>false,

	

				));	

	}

	{

	$this->tplObj->assign_vars(array(	

				'Si_m5_1'=>false,

				'Si_m5_2'=>false,

				'Si_m5_3'=>false,

				'Si_m5_4'=>false,

				'No_m5_1'=>false,

				'No_m5_2'=>false,

				'No_m5_3'=>false,

				'No_m5_4'=>false,

				));	

	}				

				

	$this->display('mission_5.tpl');

	}else{

	$this->tplObj->assign_vars(array(

	  			'No5'=>'<img src="styles/resource/images/roter-haken.png">',

				'livello5'=> $LNG['tut_not_ready'],

				'Si5'=>false,

				));	

		if($USER['tut_m1'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si1'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No1'=>false,

				));	

	}

	if($USER['tut_m1'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No1'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si1'=>false,

				));	

	}

	if($USER['tut_m2'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si2'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No2' => false,

				));	

	}

	if($USER['tut_m2'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No2'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si2' => false,

				));	

	}

	if($USER['tut_m3'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si3'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No3' => false,

				));	

	}

	if($USER['tut_m3'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No3'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si3' => false,

				));	

	}

	if($USER['tut_m4'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si4'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No4' => false,

				));	

	}

	if($USER['tut_m4'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No4'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si4'=> false,

				));	

	}

	if($USER['tut_m6'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si6'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No6'=> false,

				));	

	}

	if($USER['tut_m6'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No6'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si6'=>false,

				));	

	}

	if($USER['tut_m7'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si7'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No7'=>false,

				));	

	}

	if($USER['tut_m7'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No7'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si7'=>false,

				));	

	}

	if($USER['tut_m8'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si8'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No8'=>false,

				));	

	}

	if($USER['tut_m8'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No8'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si8'=>false,

				));	

	}

	if($USER['tut_m9'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si9'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No9'=>false,

				));	

	}

	if($USER['tut_m9'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No9'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si9'=>false,

				));	

	}

//Alli-Mitglied

	if($USER['ally_id'] > 0){

	$this->tplObj->assign_vars(array(

				'Si_m5_1'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No_m5_1'=>false,

				));	

	}else{

	$this->tplObj->assign_vars(array(

				'No_m5_1'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si_m5_1'=>false,

				));	

	}

 	$query = $GLOBALS['DATABASE']->uniquequery("SELECT * FROM ".BUDDY." WHERE `sender` = '". $USER['id'] ."';");

	if($query>1){

	

	$this->tplObj->assign_vars(array(

				'Si_m5_2'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No_m5_2'=>false,

				));	

	}else{

	$this->tplObj->assign_vars(array(

				'No_m5_2'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si_m5_2'=>false,

				));	

	}	

	



if($USER['tut_m5']==0){

if($USER['ally_id'] > 0 && $query>1){

$GLOBALS['DATABASE']->query("UPDATE ".USERS." SET `tut_m5`=tut_m5+1 WHERE id=".$USER['id']."");

$USER['darkmatter']	+= 4000;

$this->printMessage(sprintf($LNG['tut_m5_ready']), "?page=tutorial&mode=m6", 3);

exit;

}

}

	$this->display('mission_5.tpl');

   }

   }

//------------------------------------------MISSSION 6--------------------------------------------------------------------

function m6(){

	global $USER, $PLANET, $LNG, $reslist, $resource;

   	if($USER['tut_m6'] == 1){

	$this->tplObj->assign_vars(array(

				'Si6'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'livello6'=> $LNG['tut_ready'],

				'No6'=>false,

				));	

		if($USER['tut_m1'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si1'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No1'=>false,

				));	

	}

	if($USER['tut_m1'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No1'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si1'=>false,

				));	

	}

	if($USER['tut_m2'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si2'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No2' => false,

				));	

	}

	if($USER['tut_m2'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No2'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si2' => false,

				));	

	}

	if($USER['tut_m3'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si3'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No3' => false,

				));	

	}

	if($USER['tut_m3'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No3'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si3' => false,

				));	

	}

	if($USER['tut_m4'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si4'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No4' => false,

				));	

	}

	if($USER['tut_m4'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No4'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si4'=> false,

				));	

	}

	if($USER['tut_m5'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si5'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No5'=> false,

				));	

	}

	if($USER['tut_m5'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No5'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si5'=> false,

				));	

	}

	if($USER['tut_m7'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si7'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No7'=>false,

				));	

	}

	if($USER['tut_m7'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No7'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si7'=>false,

				));	

	}

	if($USER['tut_m8'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si8'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No8'=>false,

				));	

	}

	if($USER['tut_m8'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No8'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si8'=>false,

				));	

	}

	if($USER['tut_m9'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si9'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No9'=>false,

				));	

	}

	if($USER['tut_m9'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No9'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si9'=>false,

				));	

	}

		{

	$this->tplObj->assign_vars(array(	

				'Si_m6_1'=>false,

				'Si_m6_2'=>false,

				'Si_m6_3'=>false,

				'No_m6_1'=>false,

				'No_m6_2'=>false,

				'No_m6_3'=>false,

				));	

	}		

	

	$this->display('mission_6.tpl');

	}else{

	$this->tplObj->assign_vars(array(

				'No6'=>'<img src="styles/resource/images/roter-haken.png">',

				'livello6'=> $LNG['tut_not_ready'],

				'Si6'=>false,

				));	

		if($USER['tut_m1'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si1'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No1'=>false,

				));	

	}

	if($USER['tut_m1'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No1'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si1'=>false,

				));	

	}

	if($USER['tut_m2'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si2'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No2' => false,

				));	

	}

	if($USER['tut_m2'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No2'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si2' => false,

				));	

	}

	if($USER['tut_m3'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si3'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No3' => false,

				));	

	}

	if($USER['tut_m3'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No3'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si3' => false,

				));	

	}

	if($USER['tut_m4'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si4'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No4' => false,

				));	

	}

	if($USER['tut_m4'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No4'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si4'=> false,

				));	

	}

	if($USER['tut_m5'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si5'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No5'=> false,

				));	

	}

	if($USER['tut_m5'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No5'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si5'=> false,

				));	

	}

	if($USER['tut_m7'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si7'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No7'=>false,

				));	

	}

	if($USER['tut_m7'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No7'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si7'=>false,

				));	

	}

	if($USER['tut_m8'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si8'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No8'=>false,

				));	

	}

	if($USER['tut_m8'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No8'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si8'=>false,

				));	

	}

	if($USER['tut_m9'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si9'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No9'=>false,

				));	

	}

	if($USER['tut_m9'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No9'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si9'=>false,

				));	

	}

//Lager

if($PLANET['deuterium_store'] >=1 && $PLANET['metal_store'] >=1 && $PLANET['crystal_store'] >=1 ){

$this->tplObj->assign_vars(array(

'Si_m6_1'=>'<img src="styles/resource/images/gruener-haken.png" >',

'No_m6_1'=>false,

));

}else{

$this->tplObj->assign_vars(array(

'No_m6_1'=>'<img src="styles/resource/images/roter-haken.png" >',

'Si_m6_1'=>false,

));

}



//Protection_Shield



if($PLANET['small_protection_shield'] >=1){

$this->tplObj->assign_vars(array(

'Si_m6_2'=>'<img src="styles/resource/images/gruener-haken.png" >',

'No_m6_2'=>false,

));

}else{

$this->tplObj->assign_vars(array(

'No_m6_2'=>'<img src="styles/resource/images/roter-haken.png" >',

'Si_m6_2'=>false,

));

}



if($PLANET['big_protection_shield'] >=1){

$this->tplObj->assign_vars(array(

'Si_m6_3'=>'<img src="styles/resource/images/gruener-haken.png" >',

'No_m6_3'=>false,

));

}else{

$this->tplObj->assign_vars(array(

'No_m6_3'=>'<img src="styles/resource/images/roter-haken.png" >',

'Si_m6_3'=>false,

));

}

if($USER['tut_m6']==0){

if($PLANET['deuterium_store'] >=1 && $PLANET['metal_store'] >=1 && $PLANET['crystal_store'] >=1 && $PLANET['small_protection_shield'] >=1 && $PLANET['big_protection_shield'] >=1){

$GLOBALS['DATABASE']->query("UPDATE ".USERS." SET `tut_m6`=tut_m6+1 WHERE id=".$USER['id']."");

$USER['darkmatter']	+= 4000;

$this->printMessage(sprintf($LNG['tut_m6_ready']), "?page=tutorial&mode=m7", 3);

exit;

}

}

$this->display('mission_6.tpl');

}

}

//--------------------------------------------------MISSSION 7--------------------------------------------------------------		

function m7(){

	global $USER, $PLANET, $LNG, $reslist, $resource;

   if($USER['tut_m7'] >= 1){	

	$this->tplObj->assign_vars(array(

				'Si7'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'livello7'=> $LNG['tut_ready'],

				'No7'=>false,

				));	

		if($USER['tut_m1'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si1'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No1'=>false,

				));	

	}

	if($USER['tut_m1'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No1'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si1'=>false,

				));	

	}

	if($USER['tut_m2'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si2'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No2' => false,

				));	

	}

	if($USER['tut_m2'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No2'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si2' => false,

				));	

	}

	if($USER['tut_m3'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si3'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No3' => false,

				));	

	}

	if($USER['tut_m3'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No3'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si3' => false,

				));	

	}

	if($USER['tut_m4'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si4'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No4' => false,

				));	

	}

	if($USER['tut_m4'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No4'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si4'=> false,

				));	

	}

	if($USER['tut_m5'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si5'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No5'=> false,

				));	

	}

	if($USER['tut_m5'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No5'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si5'=> false,

				));	

	}

	if($USER['tut_m6'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si6'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No6'=> false,

				));	

	}

	if($USER['tut_m6'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No6'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si6'=>false,

				));	

	}

	if($USER['tut_m8'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si8'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No8'=>false,

				));	

	}

	if($USER['tut_m8'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No8'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si8'=>false,

				));	

	}

	if($USER['tut_m9'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si9'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No9'=>false,

				));	

	}

	if($USER['tut_m9'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No9'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si9'=>false,

				));	

	}

	

	{

	$this->tplObj->assign_vars(array(

				'Si_m7_1'=>false,

				'Si_m7_2'=>false,

				'Si_m7_3'=>false,

				'No_m7_1'=>false,

				'No_m7_2'=>false,

				'No_m7_3'=>false,

				));	

	}			

	$this->display('mission_7.tpl');	

	}else{	

	$this->tplObj->assign_vars(array(

				'No7'=>'<img src="styles/resource/images/roter-haken.png">',

				'livello7'=> $LNG['tut_not_ready'],

				'Si7'=>false,

				));	

		if($USER['tut_m1'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si1'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No1'=>false,

				));	

	}

	if($USER['tut_m1'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No1'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si1'=>false,

				));	

	}

	if($USER['tut_m2'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si2'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No2' => false,

				));	

	}

	if($USER['tut_m2'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No2'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si2' => false,

				));	

	}

	if($USER['tut_m3'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si3'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No3' => false,

				));	

	}

	if($USER['tut_m3'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No3'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si3' => false,

				));	

	}

	if($USER['tut_m4'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si4'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No4' => false,

				));	

	}

	if($USER['tut_m4'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No4'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si4'=> false,

				));	

	}

	if($USER['tut_m5'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si5'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No5'=> false,

				));	

	}

	if($USER['tut_m5'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No5'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si5'=> false,

				));	

	}

	if($USER['tut_m6'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si6'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No6'=> false,

				));	

	}

	if($USER['tut_m6'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No6'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si6'=>false,

				));	

	}

	if($USER['tut_m8'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si8'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No8'=>false,

				));	

	}

	if($USER['tut_m8'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No8'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si8'=>false,

				));	

	}

	if($USER['tut_m9'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si9'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No9'=>false,

				));	

	}

	if($USER['tut_m9'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No9'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si9'=>false,

				));	

	}

//Spiosonde

if($PLANET['spy_sonde'] >=1){

$this->tplObj->assign_vars(array(

'Si_m7_1'=>'<img src="styles/resource/images/gruener-haken.png" >',

'No_m7_1'=>false,

));

}else{

$this->tplObj->assign_vars(array(

'No_m7_1'=>'<img src="styles/resource/images/roter-haken.png" >',

'Si_m7_1'=>false,

));

}



if($USER['spy_tech'] >=2){

$this->tplObj->assign_vars(array(

'Si_m7_3'=>'<img src="styles/resource/images/gruener-haken.png" >',

'No_m7_3'=>false,

));

}else{

$this->tplObj->assign_vars(array(

'No_m7_3'=>'<img src="styles/resource/images/roter-haken.png" >',

'Si_m7_3'=>false,

));

}





//Spy

	

	if($USER['tut_m7_2'] >=1){

	$this->tplObj->assign_vars(array(

				'Si_m7_2'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No_m7_2'=>false,

				));	

		}else{

	$this->tplObj->assign_vars(array(

				'No_m7_2'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si_m7_2'=>false,

				));	

}







if($USER['tut_m7']==0){

if($PLANET['spy_sonde'] >=1 && $USER['spy_tech'] >=2 && $USER['tut_m7_2'] >= 1){

$GLOBALS['DATABASE']->query("UPDATE ".USERS." SET `tut_m7`=tut_m7+1 WHERE id=".$USER['id']."");

$USER['darkmatter']	+= 4000;

$this->printMessage(sprintf($LNG['tut_m7_ready']), "?page=tutorial&mode=m8", 3);

exit;



}

}

		

	$this->display('mission_7.tpl');

}

}

   

//----------------------------------------------------MISSSION 8----------------------------------------------------------

function m8(){

	global $USER, $PLANET, $LNG, $reslist, $resource;

   if($USER['tut_m8'] >= 1){	

	$this->tplObj->assign_vars(array(

				'Si8'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'livello8'=> $LNG['tut_ready'],

				'No8'=>false,

				));	

		if($USER['tut_m1'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si1'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No1'=>false,

				));	

	}

	if($USER['tut_m1'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No1'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si1'=>false,

				));	

	}

	if($USER['tut_m2'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si2'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No2' => false,

				));	

	}

	if($USER['tut_m2'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No2'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si2' => false,

				));	

	}

	if($USER['tut_m3'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si3'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No3' => false,

				));	

	}

	if($USER['tut_m3'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No3'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si3' => false,

				));	

	}

	if($USER['tut_m4'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si4'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No4' => false,

				));	

	}

	if($USER['tut_m4'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No4'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si4'=> false,

				));	

	}

	if($USER['tut_m5'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si5'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No5'=> false,

				));	

	}

	if($USER['tut_m5'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No5'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si5'=> false,

				));	

	}

	if($USER['tut_m6'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si6'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No6'=> false,

				));	

	}

	if($USER['tut_m6'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No6'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si6'=>false,

				));	

	}

	if($USER['tut_m7'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si7'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No7'=>false,

				));	

	}

	if($USER['tut_m7'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No7'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si7'=>false,

				));	

	}

	if($USER['tut_m9'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si9'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No9'=>false,

				));	

	}

	if($USER['tut_m9'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No9'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si9'=>false,

				));	

	}

	{

	$this->tplObj->assign_vars(array(

				'Si_m8_1'=>false,

				'Si_m8_2'=>false,

				'Si_m8_3'=>false,

				'No_m8_1'=>false,

				'No_m8_2'=>false,

				'No_m8_3'=>false,

				));	

	}			

	$this->display('mission_8.tpl');		

	}else{

	$this->tplObj->assign_vars(array(

				'No8'=>'<img src="styles/resource/images/roter-haken.png">',

				'livello8'=> $LNG['tut_not_ready'],

				'Si8'=>false,

				));	

		if($USER['tut_m1'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si1'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No1'=>false,

				));	

	}

	if($USER['tut_m1'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No1'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si1'=>false,

				));	

	}

	if($USER['tut_m2'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si2'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No2' => false,

				));	

	}

	if($USER['tut_m2'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No2'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si2' => false,

				));	

	}

	if($USER['tut_m3'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si3'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No3' => false,

				));	

	}

	if($USER['tut_m3'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No3'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si3' => false,

				));	

	}

	if($USER['tut_m4'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si4'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No4' => false,

				));	

	}

	if($USER['tut_m4'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No4'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si4'=> false,

				));	

	}

	if($USER['tut_m5'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si5'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No5'=> false,

				));	

	}

	if($USER['tut_m5'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No5'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si5'=> false,

				));	

	}

	if($USER['tut_m6'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si6'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No6'=> false,

				));	

	}

	if($USER['tut_m6'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No6'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si6'=>false,

				));	

	}

	if($USER['tut_m7'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si7'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No7'=>false,

				));	

	}

	if($USER['tut_m7'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No7'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si7'=>false,

				));	

	}

	if($USER['tut_m9'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si9'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No9'=>false,

				));	

	}

	if($USER['tut_m9'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No9'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si9'=>false,

				));	

	}



if($PLANET['colonizer'] >=5){

$this->tplObj->assign_vars(array(

'Si_m8_1'=>'<img src="styles/resource/images/gruener-haken.png" >',

'No_m8_1'=>false,

));

}else{

$this->tplObj->assign_vars(array(

'No_m8_1'=>'<img src="styles/resource/images/roter-haken.png" >',

'Si_m8_1'=>false,

));

}



$query = $GLOBALS['DATABASE']->uniquequery("SELECT count(*) AS planet_count FROM ".PLANETS." WHERE `id_owner` = '". $USER['id'] ."';");

$planet_count = $query['planet_count'];

if($planet_count >=2){

$this->tplObj->assign_vars(array(

'Si_m8_2'=>'<img src="styles/resource/images/gruener-haken.png" >',

'No_m8_2'=>false,

));

}else{

$this->tplObj->assign_vars(array(

'No_m8_2'=>'<img src="styles/resource/images/roter-haken.png" >',

'Si_m8_2'=>false,

));

}



if($PLANET['big_ship_cargo'] >=10){

$this->tplObj->assign_vars(array(

'Si_m8_3'=>'<img src="styles/resource/images/gruener-haken.png" >',

'No_m8_3'=>false,

));

}else{

$this->tplObj->assign_vars(array(

'No_m8_3'=>'<img src="styles/resource/images/roter-haken.png" >',

'Si_m8_3'=>false,

));

}



if($USER['tut_m8']==0){

if($PLANET['colonizer'] >=5 && $planet_count >=2 && $PLANET['big_ship_cargo'] >=10){

$GLOBALS['DATABASE']->query("UPDATE ".USERS." SET `tut_m8`=tut_m8+1 WHERE id=".$USER['id']."");

$USER['darkmatter']	+= 4000;

$this->printMessage(sprintf($LNG['tut_m8_ready']), "?page=tutorial&mode=m9", 3);

exit;

		}

	}

	$this->display('mission_8.tpl');

	}

}

//------------------------------------------------------MISSSION 9----------------------------------------------------------	

function m9(){

	global $USER, $PLANET, $LNG, $reslist, $resource;

   if($USER['tut_m9']>=1){

	$this->tplObj->assign_vars(array(

				'Si9'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'livello9'=> $LNG['tut_ready'],

				'No9'=>false,

				));	

		if($USER['tut_m1'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si1'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No1'=>false,

				));	

	}

	if($USER['tut_m1'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No1'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si1'=>false,

				));	

	}

	if($USER['tut_m2'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si2'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No2' => false,

				));	

	}

	if($USER['tut_m2'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No2'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si2' => false,

				));	

	}

	if($USER['tut_m3'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si3'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No3' => false,

				));	

	}

	if($USER['tut_m3'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No3'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si3' => false,

				));	

	}

	if($USER['tut_m4'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si4'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No4' => false,

				));	

	}

	if($USER['tut_m4'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No4'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si4'=> false,

				));	

	}

	if($USER['tut_m5'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si5'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No5'=> false,

				));	

	}

	if($USER['tut_m5'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No5'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si5'=> false,

				));	

	}

	if($USER['tut_m6'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si6'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No6'=> false,

				));	

	}

	if($USER['tut_m6'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No6'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si6'=>false,

				));	

	}

	if($USER['tut_m7'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si7'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No7'=>false,

				));	

	}

	if($USER['tut_m7'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No7'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si7'=>false,

				));	

	}

	if($USER['tut_m8'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si8'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No8'=>false,

				));	

	}

	if($USER['tut_m8'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No8'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si8'=>false,

				'Si_m9_1'=>false,

				'Si_m9_2'=>false,

				'Si_m9_3'=>false,

				'Si_m9_4'=>false,

				'No_m9_1'=>false,

				'No_m9_2'=>false,

				'No_m9_3'=>false,

				'No_m9_4'=>false,

				));	

	}

	

	$this->tplObj->assign_vars(array(

				'Si_m9_1'=>false,

				'Si_m9_2'=>false,

				'Si_m9_3'=>false,

				'Si_m9_4'=>false,

				'No_m9_1'=>false,

				'No_m9_2'=>false,

				'No_m9_3'=>false,

				'No_m9_4'=>false,

				));	

	

	$this->display('mission_9.tpl');	

	}else{	

	$this->tplObj->assign_vars(array(

				'No9'=>'<img src="styles/resource/images/roter-haken.png">',

				'livello9'=> $LNG['tut_not_ready'],

				'Si9'=>false,

				));	

		if($USER['tut_m1'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si1'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No1'=>false,

				));	

	}

	if($USER['tut_m1'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No1'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si1'=>false,

				));	

	}

	if($USER['tut_m2'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si2'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No2' => false,

				));	

	}

	if($USER['tut_m2'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No2'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si2' => false,

				));	

	}

	if($USER['tut_m3'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si3'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No3' => false,

				));	

	}

	if($USER['tut_m3'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No3'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si3' => false,

				));	

	}

	if($USER['tut_m4'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si4'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No4' => false,

				));	

	}

	if($USER['tut_m4'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No4'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si4'=> false,

				));	

	}

	if($USER['tut_m5'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si5'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No5'=> false,

				));	

	}

	if($USER['tut_m5'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No5'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si5'=> false,

				));	

	}

	if($USER['tut_m6'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si6'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No6'=> false,

				));	

	}

	if($USER['tut_m6'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No6'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si6'=>false,

				));	

	}

	if($USER['tut_m7'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si7'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No7'=>false,

				));	

	}

	if($USER['tut_m7'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No7'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si7'=>false,

				));	

	}

	if($USER['tut_m8'] == 1)

	{

	$this->tplObj->assign_vars(array(

				'Si8'=>'<img src="styles/resource/images/gruener-haken.png" >',

				'No8'=>false,

				));	

	}

	if($USER['tut_m8'] == 0)

	{

	$this->tplObj->assign_vars(array(

				'No8'=>'<img src="styles/resource/images/roter-haken.png" >',

				'Si8'=>false,

				));	

	}





if($PLANET['recycler'] >=25){

$this->tplObj->assign_vars(array(

'Si_m9_1'=>'<img src="styles/resource/images/gruener-haken.png" >',

'No_m9_1'=>false,

));

}else{

$this->tplObj->assign_vars(array(

'No_m9_1'=>'<img src="styles/resource/images/roter-haken.png" >',

'Si_m9_1'=>false,

));

}



if($USER['tut_m9_2'] >=1){

$this->tplObj->assign_vars(array(

'Si_m9_2'=>'<img src="styles/resource/images/gruener-haken.png" >',

'No_m9_2'=>false,

));

}else{

$this->tplObj->assign_vars(array(

'No_m9_2'=>'<img src="styles/resource/images/roter-haken.png" >',

'Si_m9_2'=>false,

));

}





if($PLANET['battle_ship'] >=100){

$this->tplObj->assign_vars(array(

'Si_m9_3'=>'<img src="styles/resource/images/gruener-haken.png" >',

'No_m9_3'=>false,

));

}else{

$this->tplObj->assign_vars(array(

'No_m9_3'=>'<img src="styles/resource/images/roter-haken.png" >',

'Si_m9_3'=>false,

));

}





if($PLANET['energy']+$PLANET['energy_used'] >=2000){

$this->tplObj->assign_vars(array(

'Si_m9_4'=>'<img src="styles/resource/images/gruener-haken.png" >',

'No_m9_4'=>false,

));

}else{

$this->tplObj->assign_vars(array(

'No_m9_4'=>'<img src="styles/resource/images/roter-haken.png" >',

'Si_m9_4'=>false,

));

}



	

if($USER['tut_m9']==0){

if($PLANET['recycler'] >=25 && $USER['tut_m9_2'] >=1 && $PLANET['battle_ship'] >=100 && $PLANET['energy']+$PLANET['energy_used'] >=2000){

$GLOBALS['DATABASE']->query("UPDATE ".USERS." SET `tut_m9`=tut_m9+1 WHERE id=".$USER['id']."");

$USER['darkmatter']	+= 10000;

$this->printMessage(sprintf($LNG['tut_m9_ready']), "?page=tutorial&mode=m9", 3);

exit;



		}

	}



	$this->display('mission_9.tpl');

   }

}

   

//-----------------------------------------------------------------------------------------------------------------------------	

//Tutorial Startseite







}





?>