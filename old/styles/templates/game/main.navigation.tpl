
<!-- START main.navigation -->
<div id="links">
	<ul id="menuTable">
		<li>
			<span class="menu_icon">
				{if isModulAvalible($smarty.const.MODULE_IMPERIUM)}
				<a class="Imperium" href="game.php?page=imperium" target="_self">
				</a>
				{/if}
			</span>
				<a class="menubutton " href="game.php?page=overview" target="_self">
					<span class="textlabel">{$LNG.lm_overview}</span>
				</a>
		</li>
		<li>
			<span class="menu_icon">
				{if isModulAvalible($smarty.const.MODULE_RESSOURCE_LIST)}
				<a class="Resources" href="game.php?page=resources" target="_self">
				</a>
				{/if}
			</span>
				{if isModulAvalible($smarty.const.MODULE_BUILDING)}
				<a class="menubutton " href="game.php?page=buildings" target="_self">
					<span class="textlabel">{$LNG.lm_buildings}</span>
				</a>
				{/if}
		</li>
		<li>
			<span class="menu_icon">
				{if isModulAvalible($smarty.const.MODULE_FLEET_TRADER)}
				<a class="FleetTrader" href="game.php?page=fleetDealer" target="_self">
				</a>
				{/if}
			</span>
				{if isModulAvalible($smarty.const.MODULE_TRADER)}
				<a class="menubutton " href="game.php?page=trader" target="_self">
					<span class="textlabel"><font style="color:yellow">{$LNG.lm_trader}</font></span>
				</a>
				{/if}
		</li>
		<li>
			<span class="menu_icon">
				{if isModulAvalible($smarty.const.MODULE_TECHTREE)}
				<a class="Research" href="game.php?page=techtree" target="_self">
				</a>
				{/if}
			</span>
				{if isModulAvalible($smarty.const.MODULE_RESEARCH)}
				<a class="menubutton " href="game.php?page=research" target="_self">
					<span class="textlabel">{$LNG.lm_research}</span>
				</a>
				{/if}
		</li>
		<li>
			<span class="menu_icon">
				{if isModulAvalible($smarty.const.MODULE_SHIPYARD_FLEET)}
				<a class="FleetMissions" href="game.php?page=fleetTable" target="_self">
				</a>
				{/if}
			</span>
				{if isModulAvalible($smarty.const.MODULE_FLEET_TABLE)}
				<a class="menubutton " href="game.php?page=shipyard&amp;mode=fleet" target="_self">
					<span class="textlabel">{$LNG.lm_shipshard}</span>
				</a>
				{/if}
		</li>
				{if isModulAvalible($smarty.const.MODULE_SHIPYARD_DEFENSIVE)}
		<li>
			<span class="menu_icon">
				<img src="{$dpath}img/navigation/navi_ikon_defense_a.gif" height="29" width="38" />
			</span>
				<a class="menubutton " href="game.php?page=shipyard&amp;mode=defense" target="_self">
					<span class="textlabel">{$LNG.lm_defenses}</span>
				</a>
		</li>
				{/if}
				{if isModulAvalible($smarty.const.MODULE_GALAXY)}
		<li>
			<span class="menu_icon">
				<img src="{$dpath}img/navigation/navi_ikon_galaxy_a.gif" height="29" width="38" />
			</span>
				<a class="menubutton " href="game.php?page=galaxy" target="_self">
					<span class="textlabel">{$LNG.lm_galaxy}</span>
				</a>
		</li>
				{/if}
    			{if isModulAvalible($smarty.const.MODULE_ALLIANCE)}
    	<li>
			<span class="menu_icon">
				<img src="{$dpath}img/navigation/navi_ikon_alliance_a.gif" height="29" width="38" />
			</span>
				<a class="menubutton " href="game.php?page=alliance" target="_self">
					<span class="textlabel">{$LNG.lm_alliance}</span>
				</a>
		</li>
				{/if}
    			{if isModulAvalible($smarty.const.MODULE_OFFICIER) || isModulAvalible($smarty.const.MODULE_DMEXTRAS)}<li>
			<span class="menu_icon">
				<img src="{$dpath}img/navigation/navi_ikon_premium_a.gif" height="29" width="38" />
			</span>
				<a class="menubutton premiumHighligt" href="game.php?page=officier" target="_self">
					<span class="textlabel"><font style="color:yellow">{$LNG.of_shop}</font></span>
				</a>
		</li>
				{/if}

				{if $authlevel > 0}
		<li>
			<span class="menu_icon">
				<img src="{$dpath}img/navigation/navi_ikon_premium_a.gif" height="29" width="38" />
			</span>
				<a class="menubutton premiumHighligt" href="./admin.php" style="color:lime" target="_self">
					<span class="textlabel">{$LNG.lm_administration}</span>
				</a>
		</li>
				{/if}
	</ul>
		{if !$vmode}
		<script type="text/javascript">
		var viewShortlyNumber	= {$shortlyNumber|json}
		var vacation			= {$vmode};
		{foreach $resourceTable as $resourceID => $resouceData}
		{if isset($resouceData.production)}
		resourceTicker({
			available: {$resouceData.current|json},
			limit: [0, {$resouceData.max|json}],
			production: {$resouceData.production|json},
			valueElem: "current_{$resouceData.name}"
		}, true);
		{/if}
		{/foreach}
		</script>
		{/if}
		
		{if $closed}
		<div class="infobox tooltip" data-tooltip-content="{$LNG.ov_closed}"><img src="{$dpath}img/navigation/alert.gif" alt=""></div>
		{elseif $delete}
		<div class="infobox tooltip" data-tooltip-content="{$delete}"><img src="{$dpath}img/navigation/alert.gif" alt=""></div>
		{elseif $vacation}
		<div class="infobox tooltip" data-tooltip-content="{$LNG.tn_vacation_mode}<br />{$vacation}"><img src="{$dpath}img/navigation/alert.gif" alt=""></div>
	{/if}

</div>
<!-- END main.navigation -->
