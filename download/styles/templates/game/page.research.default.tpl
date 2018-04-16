{block name="title" prepend}{$LNG.lm_research}{/block}
{block name="content"}
<div id="researchOv">
	<div id="planetImg" style="background:url(http://i.imgur.com/5hfOacu.png) no-repeat; height:250px; width:654px;">
		<h2>{$LNG.lm_research} - {$planetname}</h2>
	</div>
	<div class="c-leftM"></div>
	<div class="c-rightM"></div>

	<div id="buttonz">
        		<div class="header"> 
        			<h2>
        				{$LNG.lm_research}
			        </h2>
         		</div>
		<div class="content"> 
			<ul id="research">
				{foreach $ResearchList as $ID => $Element}
				<li id="research" class="{if $Element.maxLevel == $Element.levelToBuild}off{elseif $IsLabinBuild || $IsFullQueue || !$Element.buyable}off{else}on{/if}">
							{if $Element.maxLevel == $Element.levelToBuild}
							<!--<span style="color:red;">{$LNG.bd_maxlevel}</span>-->
							{elseif $IsLabinBuild || $IsFullQueue || !$Element.buyable}
							<!--<span style="color:red;">{if $Element.level == 0}{$LNG.bd_tech}{else}{$LNG.bd_tech_next_level}{$Element.levelToBuild + 1}{/if}</span>-->
							{else}
								<form action="game.php?page=research" method="post" class="build_form">
									<input type="hidden" name="cmd" value="insert">
									<input type="hidden" name="tech" value="{$ID}">
									<button type="submit" class="RResearch build_submit tooltip" title="{$LNG.tech.{$ID}}: {if $Element.level != 0} {$LNG.bd_build_next_level} {$Element.level + 1}{if $Element.maxLevel != 255}/{$Element.maxLevel}{/if}{/if}"></button>
								</form>
							{/if}
						<div class="research{$ID} tooltip" data-tooltip-content="
						<table style='width:300px;margin:1%;'>
							<tr>
								<th colspan='3'>{$LNG.tech.{$ID}} {if $Element.level != 0} {$LNG.bd_lvl} {$Element.level}{if $Element.maxLevel != 255}/{$Element.maxLevel}{/if}{/if}</th>
							</tr>
							<tr>
								<td>	
									{$LNG.shortDescription.{$ID}}
								</td>
							</tr>

							<tr>
								<th colspan='3'>{if $Element.level == 0}{$LNG.bd_tech}{else}{$LNG.bd_tech_next_level}{$Element.levelToBuild + 1}{/if}</th>
							</tr>
							<tr>
								<td style='font-weight:Bold;color:Green;'>
									{$LNG.fgf_time} {$Element.elementTime|time}
								</td>
							</tr>
						</table>">
							<div class="researchimg">
								<a ref="{$ID}" id="details" href="#" class="detail_button js_hideTipOnMobile" onclick="return Dialog.info({$ID})">
									<span class="ecke">
										<span class="level">
											<span class="textlabel">
												{if $Element.level != 0} {$Element.level}{if $Element.maxLevel != 255}/{$Element.maxLevel}{/if}{/if}
											</span>
										</span>
									</span>
								</a>
							</div>
						</div>
				</li>
				{/foreach}
			</ul>
				<div class="footer"></div>
			<br class="clearfloat">
		</div><!-- END content -->
	</div><!-- END buttonz -->

			<div class="content-box-s">
				<div class="header">
    				<h3>{$LNG.lm_research}</h3>
    			</div>
				<div class="content">
					<table class="construction active" cellspacing="0" cellpadding="0">
						<tbody>
							<tr>
								<td class="idle" colspan="2">
									{if !empty($Queue)}
									{foreach $Queue as $List}
									{$ID = $List.element}
									<tr>
										<td style="width:100%;vertical-align:top;" class="left">
											{if isset($CQueue) && $CQueue.maxLevel != $CQueue.level && !$IsFullQueue && $CQueue.buyable}
											<form class="build_form" action="game.php?page=research" method="post">
												<input type="hidden" name="cmd" value="insert">
												<input type="hidden" name="tech" value="{$ID}">
													<button type="submit" class="build_submit onlist"></button>
											</form>
											{else}
											{if !empty($List.planet)} @ {$List.planet}{/if}
											{/if}
											{if $List@first}
											<img src="{$dpath}buildings/{$ID}.png" width="50" height="50" id="blinkIN" class="tooltip" title="{$LNG.tech.{$ID}} {$List.level}" alt="">
											<div id="progressbar" data-time="{$List.resttime}"></div>
										</td>
									</tr>

									<tr>
										<td>
											<div id="time" data-time="{$List.time}"><br></div>
												<form action="game.php?page=research" method="post" class="build_form">
													<input type="hidden" name="cmd" value="cancel">
														<button type="submit" class="RCancel onlist tooltip" title="{$LNG.bd_cancel} · {$LNG.tech.{$ID}} {$List.level}"></button>
												</form>
											{else}
										</td>
									</tr>

									<tr>
										<td>
											<img src="{$dpath}buildings/{$ID}.png" width="25" height="25" id="blinkIN" class="tooltip" title="{$LNG.tech.{$ID}} {$List.level}" alt="">
												<form action="game.php?page=research" method="post" class="build_form">
													<input type="hidden" name="cmd" value="remove">
													<input type="hidden" name="listid" value="{$List@iteration}">
													<button type="submit" class="RCancell build_submit onlist tooltip" title="{$LNG.bd_cancel} · {$LNG.tech.{$ID}} {$List.level}"></button>
												</form>
											{/if}
										</td>
									</tr>
									{/foreach}
									{else}
									<a class="js_hideTipOnMobile tooltip" title="{$LNG.ov_research_tip}" href="game.php?page=research">{$LNG.ov_research}</a>
									{/if}
								</td>
							</tr>
						</tbody>
					</table>
				</div>
					<div class="footer"></div>
			</div>
<style type="text/css">
.RResearch{
    background: transparent url(//i.imgur.com/qvplA7d.png) -170px -96px no-repeat;
    cursor: pointer;
    display: inline;
    height: 14px;
    left: -2px;
    position: absolute;
    text-align: left;
    top: -2px;
    width: 22px;
    z-index: 4;
}

.RResearch:hover{
	background: transparent url(//i.imgur.com/qvplA7d.png) -170px -110px no-repeat;
}

a.fastResearch:hover{
	background: transparent url(//i.imgur.com/qvplA7d.png) -170px -110px no-repeat;
}

.RCancel{
    background: transparent url(//i.imgur.com/qvplA7d.png) -208px -71px no-repeat;
    z-index: 4;
}

.RCancel:hover {
    background: transparent url(//i.imgur.com/qvplA7d.png) -208px -88px no-repeat;
}

.RCancel{
	height: 17px;
    width: 17px;
    cursor: pointer;
    display: inline;
    position: relative;
	top: -67px;
    left: 35px;
}

.RCancell{
    background: transparent url(//i.imgur.com/qvplA7d.png) -208px -71px no-repeat;
    cursor: pointer;
    display: inline;
    height: 17px;
    left: -5px;
    position: relative;
    text-align: left;
    top: -3px;
    width: 17px;
    z-index: 4;
}
.RCancell:hover {
    background: transparent url(//i.imgur.com/qvplA7d.png) -208px -88px no-repeat;
}
.contentR {
    background: url(//i.imgur.com/DqCtELw.gif) repeat-y;
    margin: 0 0 20px 0;
    min-height: 115px;
    padding: 1px 0 0;
    position: relative;
}
</style>
</div><!-- END researchOv -->
{/block}

{block name="script" append}
    {if !empty($Queue)}
        <script src="scripts/game/research.js"></script>
    {/if}
{/block}
