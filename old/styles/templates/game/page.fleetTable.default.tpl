{block name="title" prepend}{$LNG.lm_fleet}{/block}
{block name="content"}
<div id="planet" style="background:url({$dpath}img/pagination/fleetz.jpg) no-repeat; height:250px; width:654px;">
	<h2>{$LNG.fl_info_detail}: {$planetname}</h2>
</div>
<div class="cs-left"></div>
<div class="cs-right"></div>
<table style="width:670px;">
	<tr>
		<th colspan="9">
			<div class="transparent" style="text-align:left;float:left;">{$LNG.fl_fleets} {$activeFleetSlots} / {$maxFleetSlots}</div>
			<div class="transparent" style="text-align:right;float:right;">{$activeExpedition} / {$maxExpedition} {$LNG.fl_expeditions}</div>
		</th>
	</tr>
	<tr>
		<td>{$LNG.fl_number}</td>
		<td>{$LNG.fl_mission}</td>
		<td>{$LNG.fl_ammount}</td>
		<td>{$LNG.fl_beginning}</td>
		<td>{$LNG.fl_departure}</td>
		<td>{$LNG.fl_destiny}</td>
		<td>{$LNG.fl_arrival}</td>
		<td>{$LNG.fl_objective}</td>
		<td>{$LNG.fl_order}</td>
	</tr>
	{foreach name=FlyingFleets item=FlyingFleetRow from=$FlyingFleetList}
	<tr>
	<td>{$smarty.foreach.FlyingFleets.iteration}</td>
	<td>{$LNG.type_mission.{$FlyingFleetRow.mission}}
	{if $FlyingFleetRow.state == 1}
		<br><a title="{$LNG.fl_returning}">{$LNG.fl_r}</a>
	{else}
		<br><a title="{$LNG.fl_onway}">{$LNG.fl_a}</a>
	{/if}
	</td>
	<td><a class="tooltip_sticky" data-tooltip-content="<table width='100%'><tr><th colspan='2' style='text-align:center;'>{$LNG.fl_info_detail}</th></tr>{foreach $FlyingFleetRow.FleetList as $shipID => $shipCount}<tr><td class='transparent'>{$LNG.tech.{$shipID}}:</td><td class='transparent'>{$shipCount}</td></tr>{/foreach}</table>">{$FlyingFleetRow.amount}</a></td>
	<td><a href="game.php?page=galaxy&amp;galaxy={$FlyingFleetRow.startGalaxy}&amp;system={$FlyingFleetRow.startSystem}">[{$FlyingFleetRow.startGalaxy}:{$FlyingFleetRow.startSystem}:{$FlyingFleetRow.startPlanet}]</a></td>
	<td{if $FlyingFleetRow.state == 0} style="color:lime"{/if}>{$FlyingFleetRow.startTime}</td>
	<td><a href="game.php?page=galaxy&amp;galaxy={$FlyingFleetRow.endGalaxy}&amp;system={$FlyingFleetRow.endSystem}">[{$FlyingFleetRow.endGalaxy}:{$FlyingFleetRow.endSystem}:{$FlyingFleetRow.endPlanet}]</a></td>
	{if $FlyingFleetRow.mission == 4 && $FlyingFleetRow.state == 0}
	<td>-</td>
	{else}
	<td{if $FlyingFleetRow.state != 0} style="color:lime"{/if}>{$FlyingFleetRow.endTime}</td>
	{/if}
	<td id="fleettime_{$smarty.foreach.FlyingFleets.iteration}" class="fleets" data-fleet-end-time="{$FlyingFleetRow.returntime}" data-fleet-time="{$FlyingFleetRow.resttime}">{pretty_fly_time({$FlyingFleetRow.resttime})}</td>
	<td>
	{if !$isVacation && $FlyingFleetRow.state != 1}
		<form action="game.php?page=fleetTable&amp;action=sendfleetback" method="post">
		<input name="fleetID" value="{$FlyingFleetRow.id}" type="hidden">
		<input class="button red small tooltip" data-tooltip-content="{$LNG.fl_send_back}" value="{$LNG.fl_send_back}" type="submit">
		</form>
		{if $FlyingFleetRow.mission == 1}
		<form action="game.php?page=fleetTable&amp;action=acs" method="post">
		<input name="fleetID" value="{$FlyingFleetRow.id}" type="hidden">
		<input value="{$LNG.fl_acs}" type="submit">
		</form>
		{/if}
	{else}
	&nbsp;-&nbsp;
	{/if}
	</td>
	</tr>
	{foreachelse}
	<tr>
		<td>-</td>
		<td>-</td>
		<td>-</td>
		<td>-</td>
		<td>-</td>
		<td>-</td>
		<td>-</td>
		<td>-</td>
		<td>-</td>
	</tr>
	{/foreach}
	{if $maxFleetSlots == $activeFleetSlots}
	<tr><td colspan="9">{$LNG.fl_no_more_slots}</td></tr>
	{/if}
</table>
{if !empty($acsData)}
{include file="shared.fleetTable.acsTable.tpl"}
{/if}
<form action="?page=fleetStep1" method="post">
<input type="hidden" name="galaxy" value="{$targetGalaxy}">
<input type="hidden" name="system" value="{$targetSystem}">
<input type="hidden" name="planet" value="{$targetPlanet}">
<input type="hidden" name="type" value="{$targetType}">
<input type="hidden" name="target_mission" value="{$targetMission}">
<table class="table519">
	<tr>
		<th colspan="4">{$LNG.fl_new_mission_title}</th>
	</tr>
	<tr style="height:20px;">
		<td>{$LNG.fl_ship_type}</td>
		<td>{$LNG.fl_ship_available}</td>
		<td>-</td>
		<td>-</td>
	</tr>
	{foreach $FleetsOnPlanet as $FleetRow}
	<tr style="height:20px;">
		<td>{if $FleetRow.speed != 0} <span class="tooltip" data-tooltip-content="{$LNG.fl_speed_title} {$FleetRow.speed}">{$LNG.tech.{$FleetRow.id}}</span>{else}{$LNG.tech.{$FleetRow.id}}{/if}</td>
		<td id="ship{$FleetRow.id}_value">{$FleetRow.count|number}</td>
		{if $FleetRow.speed != 0}
		<td><a class="button black small" href="javascript:maxShip('ship{$FleetRow.id}');">{$LNG.fl_max}</a></td>
		<td><input name="ship{$FleetRow.id}" id="ship{$FleetRow.id}_input" size="10" value="0"></td>
		{else}
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		{/if}
	</tr>
	{/foreach}
	<tr style="height:20px;">
	{if count($FleetsOnPlanet) == 0}
	<td colspan="4">{$LNG.fl_no_ships}</td>
	{else}
	<td colspan="2"><a class="button black small" href="javascript:noShips();">{$LNG.fl_remove_all_ships}</a></td>
	<td colspan="2"><a class="button black small" href="javascript:maxShips();">{$LNG.fl_select_all_ships}</a></td>
	{/if}
	</tr>
	{if $maxFleetSlots != $activeFleetSlots}
	<tr style="height:20px;"><td colspan="4"><input class="button green" type="submit" value="{$LNG.fl_continue}"></td>
	{/if}
</table>	
</form>
<br>
<table style="min-width:519px;width:519px;">
	<tr><th colspan="3" style="text-align:center">{$LNG.fl_bonus}</th></tr>
	<tr><th style="width:33%;text-align:center">{$LNG.fl_bonus_attack}</th><th style="width:33%;text-align:center">{$LNG.fl_bonus_defensive}</th><th style="width:33%;text-align:center">{$LNG.fl_bonus_shield}</th></tr>
	<tr><td><img class="tooltip" data-tooltip-content="{$LNG.fl_bonus_attack} +{$bonusAttack} %" src="{$dpath}img/pagination/attack.png" alt="">+{$bonusAttack} %</td><td><img class="tooltip" data-tooltip-content="{$LNG.fl_bonus_defensive} +{$bonusDefensive} %" src="{$dpath}img/pagination/defence.png" alt="">+{$bonusDefensive} %</td><td><img class="tooltip" data-tooltip-content="{$LNG.fl_bonus_shield} +{$bonusShield} %" src="{$dpath}img/pagination/shield.png" alt="">+{$bonusShield} %</td></tr>
	<tr><th style="width:33%;text-align:center">{$LNG.tech.115}</th><th style="width:33%;text-align:center">{$LNG.tech.117}</th><th style="width:33%;text-align:center">{$LNG.tech.118}</th></tr>
	<tr><td><img class="tooltip" data-tooltip-content="{$LNG.tech.115} +{$bonusCombustion} %" src="{$dpath}img/pagination/combustion.png" alt="">+{$bonusCombustion} %</td><td><img class="tooltip" data-tooltip-content="{$LNG.tech.117} +{$bonusImpulse} %" src="{$dpath}img/pagination/impulse.png" alt="">+{$bonusImpulse} %</td><td><img class="tooltip" data-tooltip-content="{$LNG.tech.118} +{$bonusHyperspace} %" src="{$dpath}img/pagination/hiperspace.png" alt="">+{$bonusHyperspace} %</td></tr>
</table>
{/block}
{block name="script" append}<script src="scripts/game/fleetTable.js"></script>{/block}