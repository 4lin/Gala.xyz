{block name="title" prepend}{$LNG.lm_galaxy}{/block}
{block name="content"}
<div id="content" style="padding:0px">

  <table id="galaxytableHead" style="width:654px;padding:0px;margin:0px;" cellspacing="0" cellpadding="0" border="0">
		<thead>
			<tr id="galaxyheadbg">
				<td colspan="13">
					<div style="position:relative;height:55px;width:647px;">
						<form action="?page=galaxy" method="post" id="galaxy_form">
						<input type="hidden" id="auto" value="dr">
						<div id="galaxyscroll">
							<span>{$LNG.gl_galaxy}</span>
							<div class="GaxSelector">
								<span>
									<a href="javascript:void(0);" class="backGalaxy" name="galaxyLeft" onclick="galaxy_submit('galaxyLeft')">
										<img src="{$dpath}img/dot.gif" height="24" width="25" alt="">
									</a>
									<input type="text" name="galaxy" value="{$galaxy}" size="5" maxlength="3" tabindex="1">
									<a href="javascript:void(0);" class="forwardGalaxy" name="galaxyRight" onclick="galaxy_submit('galaxyRight')">
										<img src="{$dpath}img/dot.gif" height="24" width="25" alt="">
									</a>
								</span>
									<br class="clearfloat">
							</div>
						</div>
						<div id="solarscroll">
							<span>{$LNG.gl_solar_system}</span>
							<div class="SysSelector">
								<span>
									<a href="javascript:void(0);" class="backGalaxy" name="systemLeft" onclick="galaxy_submit('systemLeft')">
										<img src="{$dpath}img/dot.gif" height="24" width="25" alt="">
									</a>
									<input type="text" name="system" value="{$system}" size="5" maxlength="3" tabindex="2">
									<a href="javascript:void(0);" class="forwardGalaxy" name="systemRight" onclick="galaxy_submit('systemRight')">
										<img src="{$dpath}img/dot.gif" height="24" width="25" alt="">
									</a>
								<span>
									<br class="clearfloat">
							</div>
						</div>

						<div id="showbutton">
							<a href="javascript:void(0);" onclick="document.forms[0].submit();return false;">
								<span class="bleft"></span>
								<span class="text">{$LNG.gl_show}</span>
								<span class="bright"></span>
							</a>
						</div>
						</form>
						<div id="expeditionbutton">
							<a href="?page=fleetTable&amp;galaxy={$galaxy}&amp;system={$system}&amp;planet={$max_planets + 1}&amp;planettype=1&amp;target_mission=15">
								<span class="bleft"></span>
								<span class="text">{$LNG.gl_out_space}</span>
								<span class="bright"></span>
							</a>
						</div>

					</div>
				</td>
			</tr>




    <tr class="info info_header">
     <td style="background:none transparent;border:0" colspan="13">
      <span id="probes">
       <!--<span id="probeValue"></span>-->
       {$spyprobes|number} {$LNG.gl_avaible_spyprobes}
      </span>
      <span id="recycler">
       <!--<span id="recyclerValue"></span>-->
        {$recyclers|number} {$LNG.gl_avaible_recyclers}            
       </span>
      <span id="recycler">
       <!--<span id="recyclerValue"></span>-->
        {$grecyclers|number} {$LNG.gl_avaible_grecyclers}            
       </span>
       <span id="rockets">
        <!--<span id="missileValue"></span>-->
         {$currentmip|number} {$LNG.gl_avaible_missiles}            
        </span>
        <span id="slots">
         <span id="slotValue">
          <!--<span id="slotUsed"></span>-->
          {$maxfleetcount}/{$fleetmax}
         </span>
         {$LNG.gl_fleets}            
        </span>
       </td>
      </tr>

      <tr id="galaxyheadbg2" style="background-color:transparent;border:0px">
		<th style="text-align:left;width:14px;overflow:hidden;background-image:none" colspan="3">{$LNG.gl_pos}</th>
		<th style="text-align:left;width:74px;background-image:none">{$LNG.gl_planet}</th>
		<th style="text-align:left;width:161px;background-image:none">{$LNG.gl_name}</th>
		<th class="text_moon" style="width:48px;background-image:none" colspan="2">{$LNG.gl_moon}</th>
		<th style="width:34px;background-image:none">{$LNG.gl_debris}</th>
		<th style="width:151px;background-image:none">{$LNG.gl_player_estate}</th>
		<th style="text-align:center;width:106px;background-image:none">{$LNG.gl_alliance}</th>
		<th style="text-align:right;width:72px;background-image:none">{$LNG.gl_actions}</th>
		<th style="width:4px;background-image:none"></th>
      </tr>
		</thead>
   <tbody>
    {for $planet=1 to $max_planets}
	<tr class="row">
    {if !isset($GalaxyRows[$planet])}
		<td class="position">
			<a class="tooltip" data-tooltip-content="{$LNG['type_mission'][7]}" href="?page=fleetTable&amp;galaxy={$galaxy}&amp;system={$system}&amp;planet={$planet}&amp;planettype=1&amp;target_mission=7"><span style="font-weight:bold;color:green">{$planet}</span></a>
		</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    {elseif $GalaxyRows[$planet] === false}
		<td>
			{$planet}
		</td>
        <td></td>
        <td style="white-space: nowrap;">{$LNG.gl_planet_destroyed}</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    {else}
		<td class="position">
			<span style="color:red">{$planet}</span>
		</td>
        {$currentPlanet = $GalaxyRows[$planet]}
		<td class="microplanet1">
			<a class="tooltip_sticky" data-tooltip-content="<table style='width:220px'><tr><th colspan='2'>{$LNG.gl_planet} {$currentPlanet.planet.name} [{$galaxy}:{$system}:{$planet}]</th></tr><tr><td style='width:80px'><img src='{$dpath}planeten/small/s_{$currentPlanet.planet.image}.gif' height='35' width='35'></td><td>{if $currentPlanet.missions.6}<a href='javascript:doit(6,{$currentPlanet.planet.id});'>{$LNG.type_mission.6}</a><br><br>{/if}{if $currentPlanet.planet.phalanx}<a href='javascript:OpenPopup(&quot;?page=phalanx&amp;galaxy={$galaxy}&amp;system={$system}&amp;planet={$planet}&amp;planettype=1&quot;, &quot;&quot;, 640, 510);'>{$LNG.gl_phalanx}</a><br>{/if}{if $currentPlanet.missions.1}<a href='?page=fleetTable&amp;galaxy={$galaxy}&amp;system={$system}&amp;planet={$planet}&amp;planettype=1&amp;target_mission=1'>{$LNG.type_mission.1}</a><br>{/if}{if $currentPlanet.missions.5}<a href='?page=fleetTable&amp;galaxy={$galaxy}&amp;system={$system}&amp;planet={$planet}&amp;planettype=1&amp;target_mission=5'>{$LNG.type_mission.5}</a><br>{/if}{if $currentPlanet.missions.4}<a href='?page=fleetTable&amp;galaxy={$galaxy}&amp;system={$system}&amp;planet={$planet}&amp;planettype=1&amp;target_mission=4'>{$LNG.type_mission.4}</a><br>{/if}{if $currentPlanet.missions.3}<a href='?page=fleetTable&amp;galaxy={$galaxy}&amp;system={$system}&amp;planet={$planet}&amp;planettype=1&amp;target_mission=3'>{$LNG.type_mission.3}</a><br>{/if}{if $currentPlanet.missions.10}<a href='?page=galaxy&amp;action=sendMissle&amp;galaxy={$galaxy}&amp;system={$system}&amp;planet={$planet}'>{$LNG.type_mission.10}</a><br>{/if}</td></tr></table>">
				<img src="{$dpath}planeten/small/s_{$currentPlanet.planet.image}.gif" height="30" width="30" alt="">
			</a>
		</td>
		<td align="center" class="planetname1" style="white-space: nowrap;">{$currentPlanet.planet.name} {$currentPlanet.lastActivity}</td>
		<td class="moon" style="white-space: nowrap;">
			{if $currentPlanet.moon}
			<a class="tooltip_sticky" data-tooltip-content="<table style='width:240px'><tr><th colspan='2'>{$LNG.gl_moon} {$currentPlanet.moon.name} [{$galaxy}:{$system}:{$planet}]</th></tr><tr><td style='width:80px'><img src='{$dpath}planeten/mond.png' height='75' width='75'></td><td><table style='width:100%'><tr><th colspan='2'>{$LNG.gl_features}</th></tr><tr><td>{$LNG.gl_diameter}</td><td>{$currentPlanet.moon.diameter|number}</td></tr><tr><td>{$LNG.gl_temperature}</td><td>{$currentPlanet.moon.temp_min}</td></tr><tr><th colspan=2>{$LNG.gl_actions}</th></tr><tr><td colspan='2'>{if $currentPlanet.missions.1}<a href='?page=fleetTable&amp;galaxy={$galaxy}&amp;system={$system}&amp;planet={$planet}&amp;planettype=3&amp;target_mission=1'>{$LNG.type_mission.1}</a><br>{/if}{if $currentPlanet.missions.3}<a href='?page=fleetTable&amp;galaxy={$galaxy}&amp;system={$system}&amp;planet={$planet}&amp;planettype=3&amp;target_mission=3'>{$LNG.type_mission.3}</a>{/if}{if $currentPlanet.missions.3}<br><a href='?page=fleetTable&amp;galaxy={$galaxy}&amp;system={$system}&amp;planet={$planet}&amp;planettype=3&amp;target_mission=4'>{$LNG.type_mission.4}</a>{/if}{if $currentPlanet.missions.5}<br><a href='?page=fleetTable&amp;galaxy={$galaxy}&amp;system={$system}&amp;planet={$planet}&amp;planettype=3&amp;target_mission=5'>{$LNG.type_mission.5}</a>{/if}{if $currentPlanet.missions.6}<br><a href='javascript:doit(6,{$currentPlanet.moon.id});'>{$LNG.type_mission.6}</a>{/if}{if $currentPlanet.missions.9}<br><br><a href='?page=fleetTable&amp;galaxy={$galaxy}&amp;system={$system}&amp;planet={$planet}&amp;planettype=3&amp;target_mission=9'>{$LNG.type_mission.9}</a><br>{/if}{if $currentPlanet.missions.10}<a href='?page=galaxy&amp;action=sendMissle&amp;galaxy={$galaxy}&amp;system={$system}&amp;planet={$planet}&amp;type=3'>{$LNG.type_mission.10}</a><br>{/if}</td></tr></table></td></tr></table>">
				<img src="{$dpath}planeten/small/s_mond.png" height="32" width="32" alt="{$currentPlanet.moon.name}">
			</a>
			{/if}
		</td>
		<td class="spacer02" style="white-space: nowrap;">
		</td>
		<td class="debris" style="white-space: nowrap;">
        {if $currentPlanet.debris}
			<a class="tooltip_sticky" data-tooltip-content="<table style='width:240px'><tr><th colspan='2'>{$LNG.gl_debris_field} [{$galaxy}:{$system}:{$planet}]</th></tr><tr><td style='width:80px'><img src='{$dpath}planeten/debris.png' height='75' style='width:75'></td><td><table style='width:100%'><tr><th colspan='2'>{$LNG.gl_resources}:</th></tr><tr><td>{$LNG.tech.901}: </td><td>{$currentPlanet.debris.metal|number}</td></tr><tr><td>{$LNG.tech.902}: </td><td>{$currentPlanet.debris.crystal|number}</td></tr>{if $currentPlanet.missions.8}<tr><th colspan='2'>{$LNG.gl_actions}</th></tr><tr><td colspan='2'><a href='javascript:doit(8, {$currentPlanet.planet.id});'>{$LNG.type_mission.8}</a></td></tr>{/if}</table></td></tr></table>">
			<img src="{$dpath}planeten/debris.png" height="22" width="22" alt="">
			</a>
        {/if}
		</td>
		<td class="playername">
			<a class="tooltip_sticky" data-tooltip-content="<table style='width:240px'><tr><th colspan='2'>{$currentPlanet.user.playerrank}</th></tr><tr>{if !$currentPlanet.ownPlanet}{if $currentPlanet.user.isBuddy}<tr><td><a href='#' onclick='return Dialog.Buddy({$currentPlanet.user.id})'>{$LNG.gl_buddy_request}</a></td></tr>{/if}<tr><td><a href='#' onclick='return Dialog.Playercard({$currentPlanet.user.id});'>{$LNG.gl_playercard}</a></td></tr>{/if}<tr><td><a href='?page=statistics&amp;who=1&amp;start={$currentPlanet.user.rank}'>{$LNG.gl_see_on_stats}</a></td></tr></table>">
				<span class="{foreach $currentPlanet.user.class as $class}{if !$class@first} {/if}galaxy-username-{$class}{/foreach} galaxy-username">{$currentPlanet.user.username}</span>
				{if !empty($currentPlanet.user.class)}
				<span>(</span>{foreach $currentPlanet.user.class as $class}{if !$class@first}&nbsp;{/if}<span class="galaxy-short-{$class} galaxy-short">{$ShortStatus.$class}</span>{/foreach}<span>)</span>
				{/if}
			</a>
		</td>
		<td class="spacer03"></td>
		<td class="allytag" style="white-space: nowrap;">
			{if $currentPlanet.alliance}
			<a class="tooltip_sticky" data-tooltip-content="<table style='width:240px'><tr><th>{$LNG.gl_alliance} {$currentPlanet.alliance.name} {$currentPlanet.alliance.member}</th></tr><td><table><tr><td><a href='?page=alliance&amp;mode=info&amp;id={$currentPlanet.alliance.id}'>{$LNG.gl_alliance_page}</a></td></tr><tr><td><a href='?page=statistics&amp;start={$currentPlanet.alliance.rank}&amp;who=2'>{$LNG.gl_see_on_stats}</a></td></tr>{if $currentPlanet.alliance.web}<tr><td><a href='{$currentPlanet.alliance.web}' target='allyweb'>{$LNG.gl_alliance_web_page}</td></tr>{/if}</table></td></table>">
				<span class="{foreach $currentPlanet.alliance.class as $class}{if !$class@first} {/if}galaxy-alliance-{$class}{/foreach} galaxy-alliance">{$currentPlanet.alliance.tag}</span>
			</a>
			{else} {/if}
		</td>
		<td class="spacer04"></td>
		<td class="action" colspan="2" style="white-space: nowrap;">
			{if $currentPlanet.action}
				{if $currentPlanet.action.esp}
				<a href="javascript:doit(6,{$currentPlanet.planet.id},{$spyShips|json|escape:'html'})">
					<img src="{$dpath}img/e.gif" class="tooltip" data-tooltip-content="{$LNG.gl_spy}" alt="">
				</a>{/if}
				{if $currentPlanet.action.message}
				<a href="#" onclick="return Dialog.PM({$currentPlanet.user.id})">
					<img src="{$dpath}img/m.gif" class="tooltip" data-tooltip-content="{$LNG.write_message}" alt="">
				</a>{/if}
				{if $currentPlanet.action.buddy}
                <a href="#" onclick="return Dialog.Buddy({$currentPlanet.user.id})">
					<img src="{$dpath}img/b.gif" class="tooltip" data-tooltip-content="{$LNG.gl_buddy_request}" alt="">
				</a>{/if}
				{if $currentPlanet.action.missle}
				<a href="?page=galaxy&amp;action=sendMissle&amp;galaxy={$galaxy}&amp;system={$system}&amp;planet={$planet}&amp;type=1">
					<img src="{$dpath}img/r.gif" class="tooltip" data-tooltip-content="{$LNG.gl_missile_attack}" alt="">
				</a>{/if}
			{else} {/if}
			{if $currentPlanet.planet.phalanx}<a class="textForBlind" href="#" onclick="OpenPopup('?page=phalanx&amp;galaxy={$galaxy}&amp;system={$system}&amp;planet={$planet}&amp;planettype=1','',640,510);return false;"><span>{$LNG.gl_phalanx}</span></a>{/if}
		</td>
	{/if}
	</tr>
	{/for}

     </tbody>
     <tfoot>
		<!--{$LNG.gl_solar_system} {$galaxy}:{$system}-->
		<tr id="fleetstatusrow" class="info">
			<td colspan="13" style="background-color:transparent;border:0px">

			</td>
		</tr>
      <tr class="info">
       <td colspan="13" style="background-color:transparent;border:0px">
		<!--{$LNG.gl_solar_system} {$galaxy}:{$system}-->
        <span id="legend">
		 <a class="tooltip" data-tooltip-content="
<table style='width:240px'>
<tr><th colspan='2'>{$LNG.gl_legend}</td></tr>
<tr><td style='width:220px'>{$LNG.gl_strong_player}</td><td><span class='galaxy-short-strong'>{$LNG.gl_short_strong}</span></td></tr>
<tr><td style='width:220px'>{$LNG.gl_week_player}</td><td><span class='galaxy-short-noob'>{$LNG.gl_short_newbie}</span></td></tr>
<tr><td style='width:220px'>{$LNG.gl_vacation}</td><td><span class='galaxy-short-vacation'>{$LNG.gl_short_vacation}</span></td></tr>
<tr><td style='width:220px'>{$LNG.gl_banned}</td><td><span class='galaxy-short-banned'>{$LNG.gl_short_ban}</span></td></tr>
<tr><td style='width:220px'>{$LNG.gl_inactive_seven}</td><td><span class='galaxy-short-inactive'>{$LNG.gl_short_inactive}</span></td></tr>
<tr><td style='width:220px'>{$LNG.gl_inactive_twentyeight}</td><td><span class='galaxy-short-longinactive'>{$LNG.gl_short_long_inactive}</span></td></tr>
</table>"><span class="icon icon_info"></span></a>
        </span>
        <span id="colonized">({$planetcount})</span>
         <br class="clearfloat"></br>
       </td>
      </tr>
     </tfoot>
	</table>

	<script type="text/javascript">
		status_ok		= '{$LNG.gl_ajax_status_ok}';
		status_fail		= '{$LNG.gl_ajax_status_fail}';
		MaxFleetSetting = {$settings_fleetactions};
	</script>

	{if $action == 'sendMissle'}
    <form action="?page=fleetMissile" method="post">
	<input type="hidden" name="galaxy" value="{$galaxy}">
	<input type="hidden" name="system" value="{$system}">
	<input type="hidden" name="planet" value="{$planet}">
	<input type="hidden" name="type" value="{$type}">
	<table style="width:654px;position:relative;top:-40px;left:0px">
		<tr>
			<th colspan="2">{$LNG.gl_missil_launch} [{$galaxy}:{$system}:{$planet}]</th>
		</tr>
		<tr>
			<td>{$missile_count} <input type="text" name="SendMI" size="2" maxlength="7"></td>
			<td>{$LNG.gl_objective}: 
				{html_options name=Target options=$MissleSelector}
			</td>
		</tr>
		<tr>
			<th colspan="2" style="text-align:center"><input type="submit" value="{$LNG.gl_missil_launch_action}"></th>
		</tr>
	</table>
	</form>
    {/if}

</div>
{/block}
