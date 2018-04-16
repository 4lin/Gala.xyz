<?php

class MissionCaseAsteroidHarvesting extends MissionFunctions
{
	function __construct($Fleet)
	{
		$this->_fleet	= $Fleet;
	}
	
	function TargetEvent()
	{	
		global $db, $pricelist, $LANG,$CONF, $UNI;
		
		$UsedPlanet 	= $GLOBALS['DATABASE']->getFirstCell("SELECT COUNT(*) FROM ".PLANETS." WHERE `id` = '".$this->_fleet['fleet_end_id']."';");
        $Target2			 = $GLOBALS['DATABASE']->uniquequery("SELECT id_owner, metal, crystal, deuterium,(metal + crystal + deuterium) as der_total FROM ".PLANETS." WHERE `id` = '".$this->_fleet['fleet_end_id']."';");        
                
        if(!$UsedPlanet)
		{
			
			$this->setState(FLEET_RETURN);
					$this->SaveFleet();

		}elseif($Target2['id_owner'] != 9999)
		{
			
			$this->setState(FLEET_RETURN);
					$this->SaveFleet();

		}
		else{
		$Target				 = $GLOBALS['DATABASE']->uniquequery("SELECT id_owner, metal, crystal, deuterium,(metal + crystal + deuterium) as der_total FROM ".PLANETS." WHERE `id` = '".$this->_fleet['fleet_end_id']."';");
		$FleetRecord         = explode(";", $this->_fleet['fleet_array']);
		$RecyclerCapacity    = 0;
		$OtherFleetCapacity  = 0;
                
                
		foreach ($FleetRecord as $Item => $Group)
		{
			if (empty($Group))
				continue;
				
			$Class        = explode (",", $Group);
			if ($Class[0] == 209 || $Class[0] == 219)
				$RecyclerCapacity   += $pricelist[$Class[0]]['capacity'] * $Class[1];
			else
				$OtherFleetCapacity += 0;
		}
		
		$temporary = array('metal' => $Target['metal'],'crystal' => $Target['crystal'],'deuterium' => $Target['deuterium']);
		
		$RecycledGoods	= array('metal' => 0, 'crystal' => 0, 'deuterium' => 0);
		$IncomingFleetGoods = $this->_fleet['fleet_resource_metal'] + $this->_fleet['fleet_resource_crystal'] + $this->_fleet['fleet_resource_deuterium'];
		if ($IncomingFleetGoods > $OtherFleetCapacity)
			$RecyclerCapacity -= ($IncomingFleetGoods - $OtherFleetCapacity);

		if ($Target['der_total'] <= $RecyclerCapacity) {
			$RecycledGoods['metal']   = $Target['metal'];
			$RecycledGoods['crystal'] = $Target['crystal'];
			$RecycledGoods['deuterium'] = $Target['deuterium'];
			$temporary['metal'] -= $Target['metal'];
			$temporary['crystal'] -= $Target['crystal'];
			$temporary['deuterium'] -= $Target['deuterium'];
			
		} elseif (($Target['metal'] > $RecyclerCapacity / 2) && ($Target['crystal'] > $RecyclerCapacity / 2)&& ($Target['deuterium'] > $RecyclerCapacity / 2)) {
			$RecycledGoods['metal']   = $RecyclerCapacity / 2;
			$RecycledGoods['crystal'] = $RecyclerCapacity / 2;
			$RecycledGoods['deuterium'] = $RecyclerCapacity / 2;
			
			$temporary['metal'] -= $RecyclerCapacity / 2;
			$temporary['crystal'] -= $RecyclerCapacity / 2;
			$temporary['deuterium'] -= $RecyclerCapacity / 2;
			
		} elseif ($Target['metal'] > $Target['crystal']) {
			$RecycledGoods['crystal'] = $Target['crystal'];
			$temporary['crystal'] -= $Target['crystal'];
			if ($Target['metal'] > ($RecyclerCapacity - $RecycledGoods['crystal'])){
				$RecycledGoods['metal'] = $RecyclerCapacity - $RecycledGoods['crystal'];
				$temporary['metal'] -= $RecyclerCapacity - $RecycledGoods['crystal'];}
			else{
				$RecycledGoods['metal'] = $Target['metal'];
				$temporary['metal'] -= $Target['metal'];
				}
		} else {
			$RecycledGoods['metal'] = $Target['metal'];
			$temporary['metal'] -= $Target['metal'];
			if ($Target['crystal'] > ($RecyclerCapacity - $RecycledGoods['metal'])){
				$RecycledGoods['crystal'] = $RecyclerCapacity - $RecycledGoods['metal'];
				$temporary['crystal'] -= $RecyclerCapacity - $RecycledGoods['metal'];
				}
			else{
				$RecycledGoods['crystal'] = $Target['crystal'];
				$temporary['crystal'] -= $Target['crystal'];
				}
		}		
		if($Target['id_owner'] = 9999 && empty($temporary['metal']) && empty($temporary['crystal']) && empty($temporary['deuterium'])){
			$GLOBALS['DATABASE']->query("DELETE from ".PLANETS." where `id` = '".$this->_fleet['fleet_end_id']."';");
			
		}else{
		$GLOBALS['DATABASE']->query("UPDATE ".PLANETS." SET `metal` = `metal` - ".$RecycledGoods['metal'].", `crystal` = `crystal` - ".$RecycledGoods['crystal'].", `deuterium` = `deuterium` - ".$RecycledGoods['deuterium']." WHERE `id` = '".$this->_fleet['fleet_end_id']."';");

                }
				
        if($RecycledGoods['metal'] < 0) { 
		$RecycledGoods['metal'] = 100000;
		}
		if($RecycledGoods['crystal'] < 0) { 
		$RecycledGoods['crystal'] = 100000;
		}
		if($RecycledGoods['deuterium'] < 0) { 
		$RecycledGoods['deuterium'] = 90000;
		}
        $GLOBALS['DATABASE']->query("UPDATE ".FLEETS." set `fleet_resource_metal` = `fleet_resource_metal` + ".$RecycledGoods['metal'].", `fleet_resource_crystal` = `fleet_resource_crystal` + ".$RecycledGoods['crystal'].", `fleet_resource_deuterium` = `fleet_resource_deuterium` + ".$RecycledGoods['deuterium']." where `fleet_id` = ".$this->_fleet['fleet_id']." ;");
		if($RecycledGoods['metal'] == $CONF['asteroid_metal'] && $RecycledGoods['crystal'] == $CONF['asteroid_crystal'] && $RecycledGoods['deuterium'] == $CONF['asteroid_deuterium']){
        $GLOBALS['DATABASE']->query("UPDATE ".USERS." SET `darkmatter` = `darkmatter` + 5000 where `id` = ".$this->_fleet['fleet_owner'].";");
		}
					
					
					
					
					
					
					
		$LNG		= $this->getLanguage(NULL, $this->_fleet['fleet_owner']);
		$Message 		= sprintf($LNG['sys_recy_asteroid_gotten'], pretty_number($RecycledGoods['metal']), $LNG['Metal'], pretty_number($RecycledGoods['crystal']), $LNG['Crystal'],pretty_number($RecycledGoods['deuterium']), $LNG['Deuterium']);
		SendSimpleMessage($this->_fleet['fleet_owner'], 0, $this->_fleet['fleet_start_time'], 5, $LNG['sys_mess_tower'], $LNG['sys_recy_report'], $Message);
		
		
		$this->setState(FLEET_RETURN);
		$this->SaveFleet();
	}
	}
	function EndStayEvent()
	{
		return;
	}
	
	function ReturnEvent()
	{
		global $LANG;
		$LNG				= $this->getLanguage(NULL, $this->_fleet['fleet_owner']);
	
		$Message         = sprintf( $LNG['sys_tran_mess_owner'], 'Asteroid' , GetStartAdressLink($this->_fleet, ''), pretty_number($this->_fleet['fleet_resource_metal']), $LNG['Metal'], pretty_number($this->_fleet['fleet_resource_crystal']), $LNG['Crystal'], pretty_number($this->_fleet['fleet_resource_deuterium']), $LNG['Deuterium'] );
		SendSimpleMessage($this->_fleet['fleet_owner'], 0, $this->_fleet['fleet_end_time'], 5, $LNG['sys_mess_tower'], $LNG['sys_mess_fleetback'], $Message);

		$this->RestoreFleet();
	}
}
