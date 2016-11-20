{block name="title" prepend}{$LNG.lm_research}{/block}
{block name="content"}
<div id="planet" style="background:url({$dpath}img/pagination/merchant.gif) no-repeat; height:250px; width:654px;">
	<h2>{$LNG.lm_research}</h2>
</div>
<div class="cs-left"></div>
<div class="cs-right"></div>
{if $IsLabinBuild}<table style="width:100%;border:2px solid red;text-align:center;background:transparent" id="infobox"><tr><td>{$LNG.bd_building_lab}</td></tr></table>{else}
<div id="navcontainer">
		<ul id="navList">
			{foreach $ResearchList as $ID => $Element}
			<li>
				<a class="tooltip" data-tooltip-content="<table width='100%'><th colspan='5'>&vellip;&vellip;&vellip; {$LNG.tech.{$ID}} &vellip;&vellip;&vellip;</th><tr><td width='80px'><img src='{$dpath}gebaeude/{$ID}.png' alt=''></td><td class='transparent left' style='width:90%;padding:10px'>{$LNG.shortDescription.{$ID}}</td><td colspan='2'>{foreach $Element.costRessources as $RessID => $RessAmount}<br /><font style='color:{if $Element.costOverflow[$RessID] == 0}green{else}red{/if}'>{$LNG.tech.{$RessID}}:</font><b><span class='alin {if $Element.costOverflow[$RessID] == 0}orange small{else}red small{/if}'>{$RessAmount|number}</span></b>{/foreach}</td><td>{$LNG.bd_remaining}<br />{foreach $Element.costOverflow as $ResType => $ResCount}{$LNG.tech.{$ResType}}: <span class='alin red small' style='font-weight:700'>{$ResCount|number}</span><br />{/foreach}</td></tr></table>" nohref="nohref" onclick="return Dialog.info({$ID})">
					<span class="top" style="width:70px;height:70px;background-image:url('{$dpath}gebaeude/{$ID}.png');background-size:70px 70px;display:block">
					{if $Element.level != 0}
						<span style="width:70px;height:70px;background-image:url('{$dpath}img/layout/build70.gif');background-repeat:no-repeat;display:block;position:relative;top:1px;left:1px">
							<span style="position:relative;top:55px;left:5px">{$Element.level}{if $Element.maxLevel != 255}/{$Element.maxLevel}{/if}</span>
							<span style="position:relative;top:55px;left:5px">
								<img class="tooltip" data-tooltip-content="<table><th>{$LNG.fgf_time}</th><tr><td>{$Element.elementTime|time}</td></tr></table>" src="{$dpath}img/pagination/time12.png" alt="">
							</span>
						</span>
					{/if}
					</span>
				</a>

					{if $Element.maxLevel == $Element.levelToBuild}
						<span class="alin red small">{$LNG.bd_maxlevel}</span>
					{elseif $IsLabinBuild || $IsFullQueue || !$Element.buyable}
					<div style="width:22px;position:relative;top:-71px;left:1px;visibility:hidden">
						<img class="tooltip" data-tooltip-content="{if $Element.level == 0}{$LNG.bd_tech}{else}{$LNG.bd_tech_next_level}{$Element.levelToBuild + 1}" src="{$dpath}img/layout/up_lvl.png" width="22" height="14" alt="">
					</div>
					{/if}
					{else}
						<form action="game.php?page=research" method="post" class="build_form">
							<input type="hidden" name="cmd" value="insert">
							<input type="hidden" name="tech" value="{$ID}">
							<div style="cursor:pointer;width:22px;position:relative;top:-71px;left:1px">
							<button class="tooltip" data-tooltip-content="{if $Element.level == 0}{$LNG.bd_tech}{else}{$LNG.bd_tech_next_level}{$Element.levelToBuild + 1}{/if}" type="submit">
								<img src="{$dpath}img/layout/up_lvl.png" width="22" height="14" alt="">
							</button>
							</div>
						</form>
					{/if}
			</li>
			{/foreach}
		</ul>
</div>

{if !empty($Queue)}
<div id="buildlist" class="buildlist">
	<table style="width:180px">
		{foreach $Queue as $List}
		{$ID = $List.element}
		<tr>
			<td style="vertical-align:top;" class="center">
				{if isset($ResearchList[$List.element])}
				{$CQueue = $ResearchList[$List.element]}
				{/if}
				<img src="{$dpath}gebaeude/{$ID}.png" alt="" class="top" width="50" height="50"><br />
				{$List@iteration}.: 
				{if isset($CQueue) && $CQueue.maxLevel != $CQueue.level && !$IsFullQueue && $CQueue.buyable}
				<form action="game.php?page=research" method="post" class="build_form">
					<input type="hidden" name="cmd" value="insert">
					<input type="hidden" name="tech" value="{$ID}">
					<button type="submit" class="build_submit onlist">{$LNG.tech.{$ID}} {$List.level}{if !empty($List.planet)} @ {$List.planet}{/if}</button>
				</form>
				{else}
				{$LNG.tech.{$ID}} {$List.level}{if !empty($List.planet)} @ {$List.planet}{/if}
				{/if}
				{if $List@first}
				<br /><br /><div id="progressbar" data-time="{$List.resttime}"></div>
			</td>
		</tr>
		<tr>
			<td>
				<div id="time" data-time="{$List.time}"><br /></div>
				<form action="game.php?page=research" method="post" class="build_form">
					<input type="hidden" name="cmd" value="cancel">
					<button type="submit" class="button green small onlist">{$LNG.bd_cancel}</button>
				</form>
				{else}
			</td>
		</tr>
		<tr>
			<td>
				<form action="game.php?page=research" method="post" class="build_form">
					<input type="hidden" name="cmd" value="remove">
					<input type="hidden" name="listid" value="{$List@iteration}">
					<button type="submit" class="button green small onlist">{$LNG.bd_cancel}</button>
				</form>
				{/if}
				<br /><span class="button orange small" data-time="{$List.endtime}" class="timer">{$List.display}</span>
			</td>
		</tr>
	{/foreach}
	</table>
</div>
{/if}

{/if}
{/block}