{block name="title" prepend}{$LNG.lm_buildings}{/block}
{block name="content"}
<div id="planet" style="background:url({$dpath}img/pagination/merchant.gif) no-repeat; height:250px; width:654px;">
	<h2>{$LNG.lm_buildings} {$ov_planet}: {$planetname}</h2>
</div>
<div class="cs-left"></div>
<div class="cs-right"></div>
<div id="navcontainer">
	<ul id="navList">
	{foreach $BuildInfoList as $ID => $Element}
	<li>
		<a class="tooltip" data-tooltip-content="<table width='100%'><th colspan='5'>&vellip;&vellip;&vellip; {$LNG.tech.{$ID}} &vellip;&vellip;&vellip;</th><tr><td width='80'><img src='{$dpath}gebaeude/{$ID}.png' alt=''></td><td class='transparent left' style='width:90%;padding:10px'>{$LNG.shortDescription.{$ID}}</td><td colspan='2'>{foreach $Element.costRessources as $RessID => $RessAmount}<br /><span style='color:{if $Element.costOverflow[$RessID] == 0}green{else}red{/if}'>{$LNG.tech.{$RessID}}:</span><b><span class='alin {if $Element.costOverflow[$RessID] == 0}orange small{else}red small{/if}'>{$RessAmount|number}</span></b>{/foreach}</td><td>{$LNG.bd_remaining}<br />{foreach $Element.costOverflow as $ResType => $ResCount}{$LNG.tech.{$ResType}}: <span class='alin red small' style='font-weight:700'>{$ResCount|number}</span><br />{/foreach}</td></tr></table>" nohref="nohref" onclick="return Dialog.info({$ID})">
			<span style="width:70px;height:70px;background-image:url('{$dpath}gebaeude/{$ID}.png');background-size:70px 70px;display:block">
				{if $Element.level > 0}
				<span style="width:70px;height:70px;background-image:url('{$dpath}img/layout/build70.gif');background-repeat:no-repeat;display:block;position:relative;top:1px;left:1px">
					<span style="position:relative;top:55px;left:5px">{$Element.level}{if $Element.maxLevel != 255}/{$Element.maxLevel}{/if}</span>
					<span style="position:relative;top:55px;left:5px">
						<span><img class="tooltip" data-tooltip-content="<table><th>{$LNG.fgf_time}</th><tr><td>{$Element.elementTime|time}</td></tr></table>" src="{$dpath}img/pagination/time12.png" alt=""></span>
						{if !empty($Element.infoEnergy)}
						<span class="tooltip" data-tooltip-content="{$LNG.bd_next_level}">{$Element.infoEnergy}</span>
						{/if}
					</span>
				</span>
				{/if}
			</span>
		</a>

		{if $Element.maxLevel == $Element.levelToBuild}
			<span style="width:50px;position:relative;top:-30px;left:-3px" class="alin red small">{$LNG.bd_maxlevel}</span>
		{elseif ($isBusy.research && ($ID == 6 || $ID == 31)) || ($isBusy.shipyard && ($ID == 15 || $ID == 21))}
			<span style="width:50px;position:relative;top:-30px;left:-3px" class="alin red small">{$LNG.bd_working}</span>
		{else}
			{if $RoomIsOk}
			{if $CanBuildElement && $Element.buyable}
				<form action="game.php?page=buildings" method="post" class="build_form" id="build_form">
					<input type="hidden" name="cmd" value="insert" />
					<input type="hidden" name="building" value="{$ID}" />
					<div style="cursor:pointer;width:22px;position:relative;top:-71px;left:1px">
						<button class="tooltip" data-tooltip-content="{if $Element.level == 0}{$LNG.bd_build}{else}{$LNG.bd_build_next_level}{$Element.levelToBuild + 1}{/if}" type="submit">
							<img src="{$dpath}img/layout/up_lvl.png" width="22" height="14" alt="">
						</button>
					</div>
				</form>
				{else}
				<div style="width:22px;position:relative;top:-71px;left:1px;visibility:hidden">
					<img class="tooltip" data-tooltip-content="{if $Element.level == 0}{$LNG.bd_build}{else}{$LNG.bd_build_next_level}{$Element.levelToBuild + 1}{/if}" src="{$dpath}img/layout/up_lvl.png" width="22" height="14" alt="">
				</div>
				{/if}
			{else}
				<div class="alin red small" style="width:45px;position:relative;top:-68px;left:0px">
					{$LNG.bd_no_more_fields}
				</div>
			{/if}
			{/if}

			<span style="width:14px;position:relative;top:-87px;left:28px">
			{if $Element.level > 0}
				{if $ID == 43}
				<a href="#" onclick="return Dialog.info({$ID})">
					<img class="tooltip" data-tooltip-content="{$LNG.bd_jump_gate_action}" src="{$dpath}img/layout/jump.jpg" alt="">
				</a>
				{/if}
				{if ($ID == 44 && !$HaveMissiles) ||  $ID != 44}
				<a class="tooltip_sticky" data-tooltip-content="{* Start Destruction Popup *}<table style='width:100%'><tr><td>{$LNG.bd_price_for_destroy}<br />{$LNG.tech.{$ID}} <span style='color:green;font-weight:bold'>{$Element.level}</span><br />{foreach $Element.destroyRessources as $ResType => $ResCount}<br />{$LNG.tech.{$ResType}}</td></tr><tr><td><span class='alin {if $Element.destroyOverflow[$RessID] == 0}green{else}red{/if} small'>{$ResCount|number}</span>{/foreach}</td></tr><tr><td>{$LNG.bd_destroy_time}{$Element.destroyTime|time}<form action='game.php?page=buildings' method='post' class='build_form'><input type='hidden' name='cmd' value='destroy'><input type='hidden' name='building' value='{$ID}'><br /><button class='button red small' type='submit' class='build_submit onlist'>{$LNG.bd_dismantle}</button></form></td></tr></table>{* End Destruction Popup *}">
					<img src="{$dpath}img/layout/x.png" width="14px" height="14px" alt="">
				</a>
			{/if}
			</span>
			{else}
				<img src="{$dpath}img/dot.gif" width="1" height="1" alt="">
		{/if}
	</li>
	{/foreach}
	</ul>
</div>

{if !empty($Queue)}
<div id="buildlist" class="buildlist">
	<table style="width:180px;">
		{foreach $Queue as $List}
		{$ID = $List.element}
		<tr>
			<td style="vertical-align:top;" class="center">
			<img class="tooltip" data-tooltip-content="{$LNG.tech.{$ID}}" src="{$dpath}gebaeude/{$ID}.png" alt="" width="70" height="70"><br />
				{$List@iteration}.: 
				{if !($isBusy.research && ($ID == 6 || $ID == 31)) && !($isBusy.shipyard && ($ID == 15 || $ID == 21)) && $RoomIsOk && $CanBuildElement && $BuildInfoList[$ID].buyable}
				<form class="build_form" action="game.php?page=buildings" method="post">
					<input type="hidden" name="cmd" value="insert">
					<input type="hidden" name="building" value="{$ID}">
					<button type="submit" class="build_submit onlist">{$LNG.tech.{$ID}} {$List.level}{if $List.destroy} {$LNG.bd_dismantle}{/if}</button>
				</form>
				{else}{$LNG.tech.{$ID}} {$List.level} {if $List.destroy}{$LNG.bd_dismantle}{/if}{/if}
				{if $List@first}
				<br /><br /><div id="progressbar" data-time="{$List.resttime}"></div>
			</td>
		</tr>
		<tr>
			<td>
				<div id="time" class="alin green small" data-time="{$List.time}"><br /></div>
				<form action="game.php?page=buildings" method="post" class="build_form">
					<input type="hidden" name="cmd" value="cancel">
					<button type="submit" class="button red small onlist">{$LNG.bd_cancel}</button>
				</form>
				{else}
			</td>
		</tr>
		<tr>
			<td>
				<form action="game.php?page=buildings" method="post" class="build_form">
					<input type="hidden" name="cmd" value="remove">
					<input type="hidden" name="listid" value="{$List@iteration}">
					<button type="submit" class="button red small onlist">{$LNG.bd_cancel}</button>
				</form>
				{/if}
				<br /><span class="alin black small" data-time="{$List.endtime}" class="timer">{$List.display}</span>
			</td>
		</tr>
	{/foreach}
	</table>
</div>
{/if}
{/block}