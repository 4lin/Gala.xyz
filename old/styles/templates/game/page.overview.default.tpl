{block name="title" prepend}{$LNG.lm_overview}{/block}
{block name="script" append}{/block}
{block name="content"}
<div id="messages_collapsed" class="messpositionDiv">
			{foreach $fleets as $index => $fleet}
					<div id="OvfleetContent">
						<span style="text-align:center">
						<script type="text/javascript">
							function eventHeader(content) {
							   $("#"+content).toggle(1000);
							}
						</script>
						<a class="OvfleetButton" href="javascript:eventHeader('OvfleetEvents');" title="{$LNG.ov_events}"><img src="{$dpath}img/dot.gif" width="15" height="15" alt=""></a>
						</span>
					</div>
					<div id="OvfleetEvents" style="padding:5px 10px;background-color:#000">
					<span id="fleettime_{$index}" class="fleets" data-fleet-end-time="{$fleet.returntime}" data-fleet-time="{$fleet.resttime}">{pretty_fly_time({$fleet.resttime})}</span>
					<span>{$fleet.text}</span>
					</div>
			{foreachelse}<div id="eventboxLoading" style="text-align:center"><h2>{$LNG.ov_no_events}</h2></div>{/foreach}
</div>

<div id="planet" style="background-image:url({$dpath}planeten/{$planetimage}.jpg); height:300px; width:654px;">
	<h2>
		<a class="tooltip" data-tooltip-content="{$LNG.ov_planetmenu}" href="#" onclick="return Dialog.PlanetAction();">
			<p class="planetNameOverview">{$LNG.lm_overview} -</p>
					<span id="planetNameHeader">{$planetname}</span>
				<img class="hinted" src="{$dpath}img/navigation/icon-edit-a.gif" alt="" />
		</a>
	</h2>
	<div id="moon">{if $Moon}<a href="game.php?page=overview&amp;cp={$Moon.id}&amp;re=0" title="{$Moon.name}"><img src="{$dpath}planeten/mond.png" height="50" width="50" alt="{$Moon.name} ({$LNG.fcm_moon})"></a><br />{else}&nbsp;{/if}</div>
	{if $is_news}
	<div id="marqueeDiv">
	<div class="marquee">
		<p><a href="#">{$news}</a></p>
		<p><a href="#">Skin adaptation by alin :)</a></p>
	</div>
	</div>
	{/if}

		{*<script type="text/javascript" src="./scripts/base/overview/TimerHandler.js"></script>
		<script type="text/javascript" src="./scripts/base/overview/helpers.js"></script>
		<script type="text/javascript" src="./scripts/base/overview/countdown.js"></script>
		<script type="text/javascript" src="./scripts/base/overview/resourceTicker.js"></script>

		<script type="text/javascript">
			{literal}
			var textContent = new Array();

			textContent[0] = "{$LNG.ov_diameter}";
			textContent[1] = "{$planet_diameter} {$LNG.ov_distance_unit} (<a nohref='nohref' title='{$LNG.ov_developed_fields}'>{$planet_field_current}</a> / <a nohref='nohref' title='{$LNG.ov_max_developed_fields}'>{$planet_field_max}</a> {$LNG.ov_fields})";
			textContent[2] = "{$LNG.ov_temperature}";
			textContent[3] = "{$LNG.ov_aprox} {$planet_temp_min}{$LNG.ov_temp_unit} {$LNG.ov_to} {$planet_temp_max}{$LNG.ov_temp_unit}";
			textContent[4] = "{$LNG.ov_position}";
			textContent[5] = "<a href='game.php?page=galaxy&amp;galaxy={$galaxy}&amp;system={$system}'>[{$galaxy}:{$system}:{$planet}]</a>";
			textContent[6] = "{$LNG.ov_points}";
			textContent[7] = "{$rankInfo}";

			var textDestination = new Array();

			textDestination[0] = "diameterField";
			textDestination[1] = "diameterContentField";
			textDestination[2] = "temperatureField";
			textDestination[3] = "temperatureContentField";
			textDestination[4] = "positionField";
			textDestination[5] = "positionContentField";
			textDestination[6] = "scoreField";
			textDestination[7] = "scoreContentField";

			var currentIndex = 0;
			var currentChar = 0;
			var linetwo=0;
	
			function type()
			{
				var destination = document.getElementById(textDestination[currentIndex]);

				if (destination) {
					if (textContent[currentIndex].substr(currentChar,1)=="<" && linetwo!=1) {
						while(textContent[currentIndex].substr(currentChar,1)!=">" ) {
							currentChar++;
						}
					}

					if (linetwo==1){
						destination.innerHTML=textContent[currentIndex];
						currentChar=destination.innerHTML=textContent[currentIndex].length+1;
					}else {
						destination.innerHTML=textContent[currentIndex].substr(0,currentChar)+"_";
						currentChar++;
					}

					if(currentChar>textContent[currentIndex].length) {
						destination.innerHTML=textContent[currentIndex];

						currentIndex++;
						currentChar = 0;

						if(currentIndex<textContent.length) {
        			type();
						}
					} else {
						setTimeout("type()", 15);
					}
				}
			}

			function initType() {
    		type();
			}

			$(document).ready(function() {
				initType();
			});
			{/literal}
		</script>*}

	<div id="planetdata">
		<div id="planetDetails">
			<table cellpadding="0" cellspacing="0" width="100%">
				<tr>
 					<td class="desc" >
						<span id="diameterField">{$LNG.ov_diameter}</span>
					</td>
					<td class="data">
						<span id="diameterContentField">{$planet_diameter} {$LNG.ov_distance_unit} (<a class="tooltip" data-tooltip-content="{$LNG.ov_developed_fields}">{$planet_field_current}</a> / <a  class="tooltip" data-tooltip-content="{$LNG.ov_max_developed_fields}">{$planet_field_max}</a> {$LNG.ov_fields})</span>
					</td>
				</tr>
				<tr>
					<td class="desc">
						<span id="temperatureField">{$LNG.ov_temperature}</span>
					</td>
					<td class="data tooltip" data-tooltip-content="{$LNG.ov_temperature}">
						<span id="temperatureContentField">{$LNG.ov_aprox} {$planet_temp_min}{$LNG.ov_temp_unit} {$LNG.ov_to} {$planet_temp_max}{$LNG.ov_temp_unit}</span>
					</td>
				</tr>
				<tr>
					<td class="desc">
						<span id="positionField">{$LNG.ov_position}</span>
					</td>
					<td class="data tooltip" data-tooltip-content="{$LNG.ov_position} {$LNG.lm_galaxy}">
						<span id="positionContentField"><a href="game.php?page=galaxy&amp;galaxy={$galaxy}&amp;system={$system}">[{$galaxy}:{$system}:{$planet}]</a></span>
					</td>
				</tr>
				{if isModulAvalible(25)}
				<tr>
					<td class="desc">
						<span id="scoreField">{$LNG.ov_points}</span>
					</td>
					<td class="data tipsLocal" rel="#highscoreTT">
						<span id="scoreContentField">{$rankInfo}</span>
					</td>
				</tr>
				{/if}
			</table>
			<table cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td style="width:100px;white-space: nowrap;">{$LNG.ov_admins_online}</td>
					<td colspan="2">{foreach $AdminsOnline as $ID => $Name}{if !$Name@first}&nbsp;&bull;&nbsp;{/if}<a href="#" class="tooltip" data-tooltip-content="{$LNG.mg_send_new}" onclick="return Dialog.PM({$ID})">{$Name}</a>{foreachelse}{$LNG.ov_no_admins_online}{/foreach}</td>
				</tr>
				<tr>
					<td style="width:100px;white-space: nowrap;">{$LNG.ov_player_online}</td>
					<td colspan="2">{$user_info_online} / {$user_info_all}</td>
				</tr>
				{if !empty($chatOnline)}
				<tr>
					<td style="white-space: nowrap;">{$LNG.ov_chat_online}</td>
					<td colspan="2">{foreach $chatOnline as $Name}{if !$Name@first},&nbsp;{/if}<a href="?page=chat">{$Name}</a>{/foreach}</td>
				</tr>
				{/if}
				{if $teamspeakData !== false}
				<tr>
					<td>{$LNG.ov_teamspeak}</td>
					<td colspan="3">{if $teamspeakData.error}{$teamspeakData.error}{else}<a href="{$teamspeakData.url}">{$LNG.ov_teamspeak_connect}</a> &bull; {$LNG.ov_teamspeak_online}: {$teamspeakData.current}/{$teamspeakData.max}{/if}</td>
				</tr>
				{/if}
			</table>
		</div>

    </div>
</div>

<div class="c-left"></div>
<div class="c-right"></div>

			<div>
				<table width="100%">
				{if $ref_active}
				<tr>
					<th colspan="3">{$LNG.ov_reflink}</th>
				</tr>
				<tr>
					<td colspan="3"><input type="text" value="{$path}index.php?ref={$userid}" readonly="readonly" style="width:450px;"></td>
				</tr>
				{foreach $RefLinks as $RefID => $RefLink}
				<tr>
					<td colspan="2"><a href="#" onclick="return Dialog.Playercard({$RefID}, '{$RefLink.username}');">{$RefLink.username}</a></td>
					<td>{{$RefLink.points|number}} / {$ref_minpoints|number}</td>
				</tr>
				{foreachelse}
				<tr>
					<td colspan="3">{$LNG.ov_noreflink}</td>
				</tr>
				{/foreach}
				{/if}
				</table>
			</div>

<div class="content-box-s">
	<div class="header">
    	<h3>{$LNG.lm_buildings}</h3>
    </div>
		<div class="content">
			<table cellpadding="0" cellspacing="0" class="construction active">
				<tr>
					<td colspan="2" class="idle">
                    	<a class="tooltip" data-tooltip-content="{if $buildInfo.buildings}{$LNG.tech[$buildInfo.buildings['id']]} ({$buildInfo.buildings['level']}){else}{$LNG.ov_buildings}{/if}"
                    	   href="game.php?page=buildings">
                    	   {if $buildInfo.buildings}<img src="{$dpath}gebaeude/{$buildInfo.buildings['id']}.png" width="50" height="50" alt=""><br />{$LNG.tech[$buildInfo.buildings['id']]} ({$buildInfo.buildings['level']})<br /><div class="timer" data-time="{$buildInfo.buildings['timeleft']}">{$buildInfo.buildings['starttime']}</div>{else}{$LNG.ov_buildings}{/if}
						</a>
                    </td>
				</tr>

			</table>
		</div>
	<div class="footer"></div>
</div>

<div class="content-box-s">
	<div class="header"><h3>{$LNG.lm_research}</h3></div>
	<div class="content">
		<table cellpadding="0" cellspacing="0" class="construction active">
			<tr>
				<td colspan="2" class="idle">
                	<a class="tooltip" data-tooltip-content="{if $buildInfo.tech}{$LNG.tech[$buildInfo.tech['id']]} ({$buildInfo.tech['level']}){else}{$LNG.ov_research}{/if}"
						href="game.php?page=research">
						{if $buildInfo.tech}<img src="{$dpath}gebaeude/{$buildInfo.tech['id']}.png" width="50" height="50" alt=""><br />{$LNG.tech[$buildInfo.tech['id']]} ({$buildInfo.tech['level']})<br /><div class="timer" data-time="{$buildInfo.tech['timeleft']}">{$buildInfo.tech['starttime']}</div>{else}{$LNG.ov_research}{/if}
					</a>
                </td>
			</tr>

		</table>
	</div>
	<div class="footer"></div>
</div>

	<div class="content-box-s">
    	<div class="header"><h3>{$LNG.lm_shipshard}</h3></div>
        	<div class="content">
                <table cellspacing="0" cellpadding="0" class="construction active">
                <tbody>
                <tr>
                    <td colspan="2" class="idle">
                        <a class="tooltip" data-tooltip-content="{if $buildInfo.fleet}{$LNG.tech[$buildInfo.fleet['id']]} ({$buildInfo.fleet['level']}){else}{$LNG.ov_hangar}{/if}"
							href="game.php?page=shipyard&mode=fleet">
							{if $buildInfo.fleet}<img src="{$dpath}gebaeude/{$buildInfo.fleet['id']}.png" width="50" height="50" alt=""><br />{$LNG.tech[$buildInfo.fleet['id']]} ({$buildInfo.fleet['level']})<br /><div class="timer" data-time="{$buildInfo.fleet['timeleft']}">{$buildInfo.fleet['starttime']}</div>{else}{$LNG.ov_hangar}{/if}
						</a>
                    </td>
                </tr>
                </tbody>
                </table>
        	</div>
    		<div class="footer"></div>
	</div>
    <div class="clearfloat"></div>

</div>

	<div id="rechts">
		<div id="norm">
			<div id="myWorlds">

				<div id="countColonies">
					<p class="textCenter tipsStandard" title="">
						<span><!-- 7/7 (Las planetas actuales del numero max. posible) Para la siguente version --></span>{$LNG.fl_my_planets}
					</p>
				</div>

				<div id="planetList">
	    		<div class="smallplanet">
		{if $AllPlanets}
		<table style="width:100%;border-collapse:separate;border-spacing:3px 3px;">
			{foreach $AllPlanets as $PlanetRow}
			{if ($PlanetRow@iteration % $themeSettings.PLANET_ROWS_ON_OVERVIEW) === 1}<tr>{/if}
			<td>
			{$PlanetRow.build}
			<a class="planetlink" href="game.php?page=overview&amp;cp={$PlanetRow.id}">
			<img class="planetPic" src="{$dpath}planeten/small/s_{$PlanetRow.image}.gif" title="" alt=""><br /
			<span class="planet-name">[ {$PlanetRow.name} ]</span>
			<span class="planet-koords"></span>
			</a>
			</td>
			</tr>
			{if $PlanetRow@last && $PlanetRow@total > 1 && ($PlanetRow@iteration % $themeSettings.PLANET_ROWS_ON_OVERVIEW) !== 0}
			{$to = $themeSettings.PLANET_ROWS_ON_OVERVIEW - ($PlanetRow@iteration % $themeSettings.PLANET_ROWS_ON_OVERVIEW)}
			{for $foo=1 to $to}
			<td class="transparent">&nbsp;</td>
			{/for}
			{/if}
			{/foreach}
		</table>
		{else}&nbsp;{/if}
				</div>
				</div>
			</div>
		</div>
	</div>
{/block}