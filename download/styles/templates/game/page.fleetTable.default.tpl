{block name="title" prepend}{$LNG.lm_fleet}{/block}
{block name="content"}
<link rel="stylesheet" href="styles/resource/css/game/fleetTable.css?v={$REV}-fleet1">
<table style="width:760px;">
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
	<td>{$LNG["type_mission_{$FlyingFleetRow.mission}"]}
	{if $FlyingFleetRow.state == 1}
		<br><a title="{$LNG.fl_returning}">{$LNG.fl_r}</a>
	{else}
		<br><a title="{$LNG.fl_onway}">{$LNG.fl_a}</a>
	{/if}
	</td>
	<td><a class="tooltip_sticky" data-tooltip-content="{capture name=gameTooltip7}<table width='100%'><tr><th colspan='2' style='text-align:center;'>{$LNG.fl_info_detail}</th></tr>{foreach $FlyingFleetRow.FleetList as $shipID => $shipCount}<tr><td class='transparent'>{$LNG.tech.{$shipID}}:</td><td class='transparent'>{$shipCount}</td></tr>{/foreach}</table>{/capture}{$smarty.capture.gameTooltip7|escape:'html'}">{$FlyingFleetRow.amount}</a></td>
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
		<input value="{$LNG.fl_send_back}" type="submit">
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
<section class="fleet-selector" aria-labelledby="fleet-selection-title">
 <h2 id="fleet-selection-title">{$LNG.fl_new_mission_title}</h2>
 <div class="fleet-ship-grid">
 {foreach $FleetsOnPlanet as $FleetRow}
 <div class="fleet-ship{if $FleetRow.speed == 0} fleet-ship-stationary{/if}">
  <span class="fleet-ship-icon tooltip" tabindex="0" title="{$LNG.tech.{$FleetRow.id}|escape:'html'}{if $FleetRow.speed != 0} — {$LNG.fl_speed_title|escape:'html'} {$FleetRow.speed}{/if}">
   <img src="{$dpath}buildings/buildlist/{$FleetRow.id}.png" width="40" height="40" alt="{$LNG.tech.{$FleetRow.id}|escape:'html'}">
  </span>
  <span class="fleet-ship-stock" title="{$LNG.fl_ship_available|escape:'html'}"><span class="fleet-sr-only">{$LNG.fl_ship_available}: </span><span id="ship{$FleetRow.id}_value">{$FleetRow.count|number}</span></span>
  {if $FleetRow.speed != 0}
  <input class="fleet-ship-count" name="ship{$FleetRow.id}" id="ship{$FleetRow.id}_input" value="0" inputmode="numeric" autocomplete="off" aria-label="{$LNG.tech.{$FleetRow.id}|escape:'html'} — {$LNG.fl_ammount|escape:'html'}">
  <button class="fleet-max" type="button" onclick="maxShip('ship{$FleetRow.id}');" aria-label="{$LNG.fl_max|escape:'html'} — {$LNG.tech.{$FleetRow.id}|escape:'html'}">{$LNG.fl_max}</button>
  {/if}
 </div>
 {foreachelse}
 <p class="fleet-empty">{$LNG.fl_no_ships}</p>
 {/foreach}
 </div>
 <div class="fleet-selection-actions">
 {if count($FleetsOnPlanet) != 0}
  <button type="button" onclick="noShips();">{$LNG.fl_remove_all_ships}</button>
  <button type="button" onclick="maxShips();">{$LNG.fl_select_all_ships}</button>
 {/if}
 {if $maxFleetSlots != $activeFleetSlots}
  <button class="fleet-continue" type="submit">{$LNG.fl_continue} <span aria-hidden="true">→</span></button>
 {/if}
 </div>
</section>	
</form>
<br>
<table style="min-width:519px;width:519px;">
	<tr><th colspan="3">{$LNG.fl_bonus}</th></tr>
	<tr><th style="width:33%">{$LNG.fl_bonus_attack}</th><th style="width:33%">{$LNG.fl_bonus_defensive}</th><th style="width:33%">{$LNG.fl_bonus_shield}</th></tr>
	<tr><td>+{$bonusAttack} %</td><td>+{$bonusDefensive} %</td><td>+{$bonusShield} %</td></tr>
	<tr><th style="width:33%">{$LNG.tech.115}</th><th style="width:33%">{$LNG.tech.117}</th><th style="width:33%">{$LNG.tech.118}</th></tr>
	<tr><td>+{$bonusCombustion} %</td><td>+{$bonusImpulse} %</td><td>+{$bonusHyperspace} %</td></tr>
</table>
{/block}
{block name="script" append}<script src="scripts/game/fleetTable.js"></script>{/block}