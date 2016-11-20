{block name="title" prepend}{$LNG.lm_officiers}{/block}
{block name="content"}
<div id="planet" style="background:url({$dpath}img/pagination/merchant.gif) no-repeat; height:250px; width:654px;">
	<h2>{$LNG.of_shop}: {$LNG.lm_officiers} / {$of_dm_trade}</h2>
</div>
<div class="cs-left"></div>
<div class="cs-right"></div>


<div id="navcontainer">
{if $officierList}
	<ul id="offList">
	{foreach $officierList as $ID => $Element}
	<li>
	<div style="width:77px;overflow:hidden;o-text-overflow:ellipsis;text-overflow:ellipsis">
			<a href="#" onclick="return Dialog.info({$ID})">
				<span class="tooltip" data-tooltip-content="<table><th colspan='5'>&vellip;&vellip;&vellip; {$LNG.tech.{$ID}} &vellip;&vellip;&vellip;<br />{$LNG.of_lvl}: ({$Element.level}/{$Element.maxLevel})</th><tr><td width='80'><img src='{$dpath}gebaeude/{$ID}.jpg' alt=''></td><td class='transparent left' style='width:90%;padding:10px'>{$LNG.shortDescription.{$ID}}</td><td colspan='2'>{foreach $Element.elementBonus as $BonusName => $Bonus}{if $Bonus[0] < 0}-{else}+{/if}{if $Bonus[1] == 0}{abs($Bonus[0] * 100)}%{else}{floatval($Bonus[0])}{/if} {$LNG.bonus.$BonusName}<br />{/foreach}<br />{foreach $Element.costRessources as $RessID => $RessAmount}{$LNG.tech.{$RessID}}: <b><span class='button {if $Element.costOverflow[$RessID] == 0}orange small{else}red small{/if}'>{$RessAmount|number}</span></b>{/foreach}</td></tr></table>"><img src="{$dpath}gebaeude/{$ID}.jpg" alt="" width="70" height="70"></span>
				<span style="position:relative;overflow:hidden;z-index:10;top:-12px;left:5px;width:70px;height:14px;background-image:url('{$dpath}img/layout/build14x70.gif');background-repeat:no-repeat;display:block">
					<span style="position:relative;top:0px;left:0px">
					
					{if $Element.maxLevel <= $Element.level}<span class="tooltip" data-tooltip-content="{$LNG.bd_maxlevel}" style="color:green">{$Element.level}</span>{elseif $Element.buyable}{$Element.level}{else}<span class="tooltip" data-tooltip-content="Dont meet the requirements" style="color:red">{$Element.level}</span>{/if}/{$Element.maxLevel}
					</span>
			 	</span>
			</a>
		<div style="position:relative;top:-15px;left:0px;width:77px;height:55px">
		<!--{$LNG.tech.{$ID}}-->

			{if $Element.maxLevel <= $Element.level}
			<!--<span class="button red small">{$LNG.bd_maxlevel}</span>-->
			{elseif $Element.buyable}
			<form action="game.php?page=officier" method="post" class="build_form">
				<input type="hidden" name="id" value="{$ID}">
					<button type="submit" class="button green small">{$LNG.of_recruit}</button>
			</form>
			{else}
			<span class="alin red small">{$LNG.of_recruit}</span>
			{/if}
		</div>
	</div>
	</li>
	{/foreach}

{if !empty($darkmatterList)}
	<table style="width:670px">
		<th colspan="2" style="text-align:center">{$of_dm_trade}</th>
	<tr>
	</tr>
	</table>
	{foreach $darkmatterList as $ID => $Element}
	<li>
	<div style="width:77px;overflow:hidden;text-overflow:ellipsis">
		<a href="#" onclick="return Dialog.info({$ID});">
			<img class="tooltip" data-tooltip-content="<table><th colspan='5'>&vellip;&vellip;&vellip; {$LNG.tech.{$ID}} &vellip;&vellip;&vellip;<br /></th><tr><td width='80'><img src='{$dpath}gebaeude/{$ID}.jpg' alt=''></td><td class='transparent left' style='width:90%;padding:10px'>{$LNG.shortDescription.{$ID}}</td><td colspan='2'>{foreach $Element.elementBonus as $BonusName => $Bonus}{if $Bonus@iteration % 3 === 1}<p>{/if}{if $Bonus[0] < 0}-{else}+{/if}{if $Bonus[1] == 0}{abs($Bonus[0] * 100)}%{else}{$Bonus[0]}{/if} {$LNG.bonus.$BonusName}{if $Bonus@iteration % 3 === 0 || $Bonus@last}</p>{else}&nbsp;{/if}{/foreach}<br />{foreach $Element.costRessources as $RessID => $RessAmount}{$LNG.tech.{$RessID}}: <b><span class='button {if $Element.costOverflow[$RessID] == 0}orange small{else}red small{/if}'>{$RessAmount|number}</span></b>{/foreach}<br />{$LNG.of_recruit} {$LNG.bd_destroy_time}: <span class='button orange small'>{$Element.time|time}</span></td></tr></table>" src="{$dpath}gebaeude/{$ID}.jpg" alt="" width="70" height="70">
		</a>
			{if $Element.timeLeft > 0}
			<!--{$LNG.of_still}<br />-->
			<span class="alin black small tooltip" data-tooltip-content="{$LNG.of_still}" id="time_{$ID}"> </span>
			<!--{$LNG.of_active}-->
			{if $Element.buyable}
			<form action="game.php?page=officier" method="post" class="build_form">
				<input type="hidden" name="id" value="{$ID}">
					<button type="submit" class="button green small tooltip" data-tooltip-content="{$LNG.tech.{$RessID}}: <span class='button {if $Element.costOverflow[$RessID] == 0}orange small{else}red small{/if}'>{$RessAmount|number}</span>">{$LNG.of_recruit}</button>
			</form>
			{/if}
			{elseif $Element.buyable}
			<form action="game.php?page=officier" method="post" class="build_form">
				<input type="hidden" name="id" value="{$ID}">
					<button type="submit" class="button green small tooltip" data-tooltip-content="{$LNG.tech.{$RessID}}: <span class='button {if $Element.costOverflow[$RessID] == 0}orange small{else}red small{/if}'>{$RessAmount|number}</span>">{$LNG.of_recruit}</button>
			</form>
			{else}
			<span class="alin red small tooltip" data-tooltip-content="{$LNG.tech.{$RessID}}: <span class='button {if $Element.costOverflow[$RessID] == 0}orange small{else}red small{/if}'>{$RessAmount|number}</span>">{$LNG.of_recruit}</span>
			{/if}
	</div>
	</li>
	{/foreach}
	</ul>
	{/if}
</div>
{/if}

{/block}