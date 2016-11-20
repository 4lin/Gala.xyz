{block name="title" prepend}{if $mode == "defense"}{$LNG.lm_defenses}{else}{$LNG.lm_shipshard}{/if}{/block}
{block name="content"}
<div id="planet" style="background:url({$dpath}img/pagination/merchant.gif) no-repeat; height:250px; width:654px;">
	<h2>{if $mode == "defense"}{$LNG.lm_defenses}{else}{$LNG.lm_shipshard}{/if}</h2>
</div>
<div class="cs-left"></div>
<div class="cs-right"></div>
	{if !$NotBuilding}<table width="100%" id="infobox" style="border: 2px solid red; text-align:center;background:transparent"><tr><td>{$LNG.bd_building_shipyard}</td></tr></table><br />{else}
		<div id="shipscontainer">
			<ul id="shipsList">
				<form action="game.php?page=shipyard&amp;mode={$mode}" method="post">
				{foreach $elementList as $ID => $Element}
					<li>
						<a class="tooltip" data-tooltip-content="<table width='100%'><th colspan='5'>&vellip;&vellip;&vellip; {$LNG.tech.{$ID}} &vellip;&vellip;&vellip;</th><tr><td width='80px'><img src='{$dpath}gebaeude/{$ID}.png' alt=''></td><td class='transparent left' style='width:90%;padding:10px'>{$LNG.shortDescription.{$ID}}</td><td colspan='2'>{foreach $Element.costRessources as $RessID => $RessAmount}<br /><font style='color:{if $Element.costOverflow[$RessID] == 0}green{else}red{/if}'>{$LNG.tech.{$RessID}}:</font><b><span class='alin {if $Element.costOverflow[$RessID] == 0}orange small{else}red small{/if}'>{$RessAmount|number}</span></b>{/foreach}</td><td>{$LNG.bd_remaining}<br />{foreach $Element.costOverflow as $ResType => $ResCount}{$LNG.tech.{$ResType}}: <span class='alin red small' style='font-weight:700'>{$ResCount|number}</span><br />{/foreach}</td></tr></table>" nohref="nohref" onclick="return Dialog.info({$ID})">
							<span class="top" style="width:70px;height:70px;background-image:url('{$dpath}gebaeude/{$ID}.png');background-size:70px 70px;display:block">
								<span style="width:70px;height:70px;background-image:url('{$dpath}img/layout/build70.gif');background-repeat:no-repeat;display:block;position:relative;top:1px;left:1px">
								<span id="val_{$ID}" style="position:relative;top:55px;left:7px">{if $Element.available != 0} {$Element.available|number}{/if}</span>
								</span>
							</span>
						</a>
									<span style="position:relative;top:2px;left:auto">
										{if $Element.AlreadyBuild}
										<span style="position:relative;top:2px;left:auto">
											<img class="tooltip" data-tooltip-content="<span style='color:red'>{$LNG.bd_protection_shield_only_one}</span>" src="{$dpath}img/layout/x.png" alt="">
										</span>
										{elseif $NotBuilding && $Element.buyable}
										<input type="text" name="fmenge[{$ID}]" id="input_{$ID}" size="{$maxlength}" maxlength="{$maxlength}" value="0" tabindex="{$smarty.foreach.FleetList.iteration}"><br />
										<input class="button green medium" type="button" value="{$LNG.bd_max_ships}" onclick="$('#input_{$ID}').val('{$Element.maxBuildable}')">
										{/if}
									</span>
					</li>
					{/foreach}
					{if $NotBuilding}<span style="position:absolute;bottom:5px;left:280px"><input class="button green" type="submit" value="{$LNG.bd_build_ships}"></span>{/if}
				</form>
			</ul>
		</div>

<!--<form action="game.php?page=shipyard&amp;mode={$mode}" method="post">
<table style="width:670px">
	{foreach $elementList as $ID => $Element}
	<tr>
		<td rowspan="2" style="width:120px;">
			<a href="#" onclick="return Dialog.info({$ID})">
				<img src="{$dpath}gebaeude/{$ID}.png" alt="{$LNG.tech.{$ID}}" width="100" height="100">
			</a>
		</td>
		<th>
			<a href="#" onclick="return Dialog.info({$ID})">{$LNG.tech.{$ID}}</a><span id="val_{$ID}">{if $Element.available != 0} {$Element.available|number}{/if}</span>
		</th>
	</tr>
	<tr>
		<td>
			<table style="width:100%">
				<tr>
					<td class="transparent left" style="width:90%;padding:10px;"><p>{$LNG.shortDescription.{$ID}}</p><p>{foreach $Element.costRessources as $RessID => $RessAmount}
					{$LNG.tech.{$RessID}}: <b><span style="color:{if $Element.costOverflow[$RessID] == 0}lime{else}red{/if}">{$RessAmount|number}</span></b>
					{/foreach}</p></td>
					<td class="transparent" style="vertical-align:middle;width:100px">
					<p>{if $Element.AlreadyBuild}<span style="color:red">{$LNG.bd_protection_shield_only_one}</span>{elseif $NotBuilding && $Element.buyable}<input type="text" name="fmenge[{$ID}]" id="input_{$ID}" size="{$maxlength}" maxlength="{$maxlength}" value="0" tabindex="{$smarty.foreach.FleetList.iteration}"></p><p>
					<input class="button green" type="button" value="{$LNG.bd_max_ships}" onclick="$('#input_{$ID}').val('{$Element.maxBuildable}')"></p>
					{/if}
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="2" style="margin-bottom:10px;">  
			<table style="width:100%">
				<tr>
					<td class="transparent left">
						{$LNG.bd_remaining}<br />
						{foreach $Element.costOverflow as $ResType => $ResCount}
						{$LNG.tech.{$ResType}}: <span style="font-weight:700">{$ResCount|number}</span><br />
						{/foreach}
						<br />
					</td>
					<td class="transparent right">
						T
					</td>
				</tr>
				<tr>		
					<td class="transparent left" style="width:68%">
						{$LNG.bd_max_ships_long}:<br /><span style="font-weight:700">{$Element.maxBuildable|number}</span>
					</td>
					<td class="transparent right" style="white-space:nowrap;">
						{$Element.elementTime|time}
					</td>
				</tr>	
			</table>
		</td>
	</tr>
	{/foreach}
	{if $NotBuilding}<tr><th colspan="2" style="text-align:center"><input class="button green small" type="submit" value="{$LNG.bd_build_ships}"></th></tr>{/if}
</table>
</form>-->

{if !empty($BuildList)}
<div id="buildlist">
<table style="width:180px">
	<tr>
		<td class="transparent">
			<div id="bx" class="z"></div>
			<br />
			<form action="game.php?page=shipyard&amp;mode={$mode}" method="post">
			<input type="hidden" name="action" value="delete">
			<table>
			<tr>
				<th>&nbsp;</th>
			</tr>
			<tr>
				<td>
					<select name="auftr[]" id="auftr" size="10" multiple><option>&nbsp;</option></select>
					<br />{$LNG.bd_cancel_warning}
					<input class="button green medium" type="submit" value="{$LNG.bd_cancel_send}">
				</td>
			</tr>
			<tr>
				<th>&nbsp;</th>
			</tr>
			</table>
			</form>
			<span id="timeleft"></span>
		</td>
	</tr>
</table>
</div>
{/if}

<script type="text/javascript">
data			= {$BuildList|json};
bd_operating	= ' ';
bd_available	= ' ';
</script>

{/if}
{/block}