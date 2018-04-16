<!-- LEFTMENU -->
<div id="links">
	<ul id="menuTable" class="leftmenu">
		<li>
			<span class="menu_icon">
				{if isModuleAvailable($smarty.const.MODULE_RESSOURCE_LIST)}
				<a href="game.php?page=imperium" class="js_hideTipOnMobile tooltip" target="_self" title="{$LNG.lm_empire}">
					<div class="menuImage highlighted overview"></div>
				</a>
				{/if}
			</span>
			
			<a class="menubutton " href="game.php?page=overview" accesskey="" target="_self">
				<span class="textlabel">{$LNG.lm_overview}</span>
			</a>
		</li>

		<li>
			<span class="menu_icon">
			{if isModuleAvailable($smarty.const.MODULE_RESSOURCE_LIST)}
				<a href="game.php?page=resources" class="js_hideTipOnMobile tooltip" target="_self" title="{$LNG.lm_resources}">
					<div class="menuImage highlighted resources"></div>
				</a>
			{/if}
			</span>
			{if isModuleAvailable($smarty.const.MODULE_BUILDING)}
			<a class="menubutton " href="game.php?page=buildings" accesskey="" target="_self">
				<span class="textlabel">{$LNG.lm_buildings}</span>
			</a>
			{/if}
		</li>

		<li>
			<span class="menu_icon">
				{if isModuleAvailable($smarty.const.MODULE_TRADER)}
				<a href="game.php?page=trader" class="trader js_hideTipOnMobile tooltip" target="_self" title="{$LNG.lm_trader}">
					<div class="menuImage highlighted traderOverview"></div>
				</a>
				{/if}
			</span>
		{if isModuleAvailable($smarty.const.MODULE_FLEET_TRADER)}
			<a class="menubutton premiumHighligt " href="game.php?page=fleetDealer" accesskey="" target="_self"><!-- selected -->
				<span class="textlabel">{$LNG.lm_fleettrader}</span>
			</a>
		{/if}
		</li>

		{if isModuleAvailable($smarty.const.MODULE_TRADER)}
		<li>
			<span class="menu_icon">
				<a href="" class="inactive js_hideTipOnMobile tooltip" target="_self" title="">
					<div class="menuImage"></div>
				</a>
			</span>

			<a class="menubutton " href="game.php?page=fleetTable" accesskey="" target="_self">
				<span class="textlabel">{$LNG.lm_fleet}</span>
			</a>
		</li>
		{/if}

		<li>
			<span class="menu_icon">
				{if isModuleAvailable($smarty.const.MODULE_TECHTREE)}
				<a href="game.php?page=techtree" class="js_hideTipOnMobile tooltip" target="_self" title="{$LNG.lm_technology}">
					<div class="menuImage highlighted research"></div>
				</a>
				{/if}
			</span>
			{if isModuleAvailable($smarty.const.MODULE_RESEARCH)}
			<a class="menubutton " href="game.php?page=research" accesskey="" target="_self">
				<span class="textlabel">{$LNG.lm_research}</span>
			</a>
			{/if}
		</li>


		<li>
			<span class="menu_icon">
				{if isModuleAvailable($smarty.const.MODULE_SIMULATOR)}
				<a href="game.php?page=battleSimulator" class="js_hideTipOnMobile tooltip" target="_self" title="{$LNG.lm_battlesim}">
					<div class="menuImage highlighted shipyard"></div>
				</a>
				{/if}
			</span>
			{if isModuleAvailable($smarty.const.MODULE_SHIPYARD_FLEET)}
			<a class="menubutton " href="game.php?page=shipyard&amp;mode=fleet" accesskey="" target="_self">
				<span class="textlabel">{$LNG.lm_shipshard}</span>
			</a>
			{/if}
		</li>

		{if isModuleAvailable($smarty.const.MODULE_SHIPYARD_DEFENSIVE)}
		<li>
			<span class="menu_icon">
				<a href="" class="inactive" target="_self" title="">
					<div class="menuImage defense"></div>
				</a>
			</span>

			<a class="menubutton " href="game.php?page=shipyard&amp;mode=defense" accesskey="" target="_self">
				<span class="textlabel">{$LNG.lm_defenses}</span>
			</a>
		</li>
		{/if}

		<li>
			<span class="menu_icon">
				{if isModuleAvailable($smarty.const.MODULE_GALAXY)}
				<a href="game.php?page=galaxy" class="js_hideTipOnMobile tooltip" target="_self" title="{$LNG.lm_galaxy}">
					<div class="menuImage highlighted galaxy"></div>
				</a>
				{/if}
			</span>
			{if isModuleAvailable($smarty.const.MODULE_ALLIANCE)}
			<a class="menubutton " href="game.php?page=alliance" accesskey="" target="_self">
				<span class="textlabel">{$LNG.lm_alliance}</span>
			</a>
			{/if}
		</li>

		{if isModuleAvailable($smarty.const.MODULE_CHAT)}
		<li>
			<span class="menu_icon">
				<a href="" class="menuImage chat inactive" target="_self" title=""></a>
			</span>

			<a class="menubutton " href="game.php?page=chat" accesskey="" target="_self">
				<span class="textlabel">{$LNG.lm_chat}</span>
			</a>
		</li>{/if}

		{if isModuleAvailable($smarty.const.MODULE_OFFICIER) || isModuleAvailable($smarty.const.MODULE_DMEXTRAS)}
		<li>
			<span class="menu_icon">
				<a href="" class="menuImage premium highlighted inactive" target="_self" title=""></a>
			</span>

			<a class="menubutton premiumHighligt " href="game.php?page=officier" accesskey="" target="_self">
				<span class="textlabel">{$LNG.lm_officiers}</span>
			</a>
		</li>
		{/if}

		{if $authlevel > 0}
		<li>
			<a class="menubutton " href="./admin.php" style="color:lime;" accesskey="" target="_self">
				<span class="textlabel">{$LNG.lm_administration}</span>
			</a>
		</li>
		{/if}

	</ul>
	<div class="adviceWrapper">
		<div id="advice-bar">
					{if $closed}
					<div class="infobox">{$LNG.ov_closed}</div>
					{elseif $delete}
					<div class="infobox">{$delete}</div>
					{elseif $vacation}
					<div class="infobox">{$LNG.tn_vacation_mode} {$vacation}</div>
					{/if}
		</div>
	</div>
</div>
<!-- END LEFTMENU -->
