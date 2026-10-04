{block name="title" prepend}{$LNG.lm_research}{/block}
{block name="content"}
<div id="researchOv" data-server-time="{$serverTimestamp}" data-server-received="{$serverRequestTimestamp}" data-server-sent="{$serverRenderTimestamp}">
<div class="construction-request-error" role="alert" hidden>{$LNG.op_error}. <a href="game.php?page=research">{$LNG.al_applyform_reload}</a></div>
	<div id="planetImg" style="background:url(styles/resource/images/game/external/5hfOacu.png) no-repeat; height:250px; width:654px;">
		<h2>{$LNG.lm_research} - {$planetname}</h2>
	</div>
        <div class="research-panel-viewport">
        <section id="research-details-panel" hidden aria-live="polite">
            <button type="button" class="building-panel-close" aria-label="{$LNG.bd_cancel}" title="{$LNG.bd_cancel}"></button>
            {foreach $ResearchList as $ID => $Element}
            <article class="building-panel-item" data-research="{$ID}" hidden>
                <img class="building-panel-image" src="{$dpath}buildings/{$ID}.png" alt="{$LNG.tech.{$ID}|escape:'html'}">
                <a class="building-panel-techtree" href="game.php?page=techtree" title="{$LNG.lm_technology}"><span aria-hidden="true"></span>{$LNG.lm_technology}</a>
                <div class="building-panel-body">
                    <h3>{$LNG.tech.{$ID}|escape:'html'} <small>{$LNG.bd_lvl} {$Element.level}</small></h3>
                    <div class="building-panel-production">
                        <div>{$LNG.fgf_time} <strong>{$Element.elementTime|time}</strong></div>

                    </div>
                    <div class="building-panel-requirements">
                        <div>{$LNG.bd_cost} {$LNG.bd_next_level} {$Element.levelToBuild + 1}</div>
                        <div class="building-panel-costs">
                        {foreach $Element.costResources as $RessID => $RessAmount}
                            <span title="{$LNG.tech.{$RessID}|escape:'html'}"><img src="{$dpath}images/{if $RessID == 901}metal{elseif $RessID == 902}crystal{elseif $RessID == 903}deuterium{else}darkmatter{/if}.gif" alt="{$LNG.tech.{$RessID}|escape:'html'}"><strong class="{if $Element.costOverflow[$RessID] == 0}affordable{else}unaffordable{/if}">{$RessAmount|number}</strong></span>
                        {/foreach}
                        </div>
                    </div>
                    <form action="game.php?page=research" method="post" class="building-panel-build">
                        <input type="hidden" name="cmd" value="insert"><input type="hidden" name="tech" value="{$ID}">
                        <button type="submit" {if $IsLabinBuild || $IsFullQueue || !$Element.buyable || $Element.levelToBuild >= $Element.maxLevel}disabled{/if}>{$LNG.bd_tech}</button>
                    </form>
                </div>
                <div class="building-panel-description"><span aria-hidden="true">?</span> {$LNG.shortDescription.{$ID}}</div>
            </article>
            {/foreach}
        </section>
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
				<li id="research" class="{if $Element.maxLevel == $Element.levelToBuild}off{elseif $IsLabinBuild || $IsFullQueue || !$Element.buyable}off{else}on{/if}{if !$Element.accessible || !$Element.buyable || $Element.levelToBuild >= $Element.maxLevel} research-unavailable{/if}">
							{if $Element.maxLevel == $Element.levelToBuild}
							<!--<span style="color:red;">{$LNG.bd_maxlevel}</span>-->
							{elseif $IsLabinBuild || $IsFullQueue || !$Element.buyable}
							<!--<span style="color:red;">{if $Element.level == 0}{$LNG.bd_tech}{else}{$LNG.bd_tech_next_level}{$Element.levelToBuild + 1}{/if}</span>-->
							{else}
								<form action="game.php?page=research" method="post" class="build_form">
									<input type="hidden" name="cmd" value="insert">
									<input type="hidden" name="tech" value="{$ID}">
									<button type="submit" class="RResearch build_submit tooltip thumbnail-tip" title="{$LNG.tech.{$ID}}: {$LNG.bd_lvl} {$Element.level|number}"></button>
								</form>
							{/if}
						<div class="research{$ID} tooltip thumbnail-tip" title="{$LNG.tech.{$ID}|escape:'html'} - {$LNG.bd_lvl|escape:'html'} {$Element.level|number}">
							<div class="researchimg">
								<a ref="{$ID}" id="details" href="#" class="detail_button js_hideTipOnMobile" onclick="return ResearchPanel.open({$ID}, this)" aria-controls="research-details-panel" aria-expanded="false">
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
{if !empty($Queue)}
{foreach $Queue as $List}
{$ID = $List.element}
<tr><td class="research-queue-entry">
{if isset($CQueue) && $CQueue.maxLevel != $CQueue.level && !$IsFullQueue && $CQueue.buyable}
<form class="build_form" action="game.php?page=research" method="post">
<input type="hidden" name="cmd" value="insert"><input type="hidden" name="tech" value="{$ID}">
<button type="submit" class="build_submit onlist"></button>
</form>
{else}
{if !empty($List.planet)} @ {$List.planet}{/if}
{/if}
<div class="research-queue-row">
<div class="research-construction-image {if !$List@first}queued{/if}">
<img src="{$dpath}buildings/{$ID}.png" width="{if $List@first}50{else}35{/if}" height="{if $List@first}50{else}35{/if}" class="tooltip" title="{$LNG.tech.{$ID}} {$List.level}" alt="">
{if $List@first}
<div id="progressbar" data-time="{$List.resttime}" data-endtime="{$List.endtime}"></div>
<div id="time" data-time="{$List.time}"></div>
{/if}
<form action="game.php?page=research" method="post" class="build_form research-queue-cancel">
<input type="hidden" name="cmd" value="{if $List@first}cancel{else}remove{/if}">
{if !$List@first}<input type="hidden" name="listid" value="{$List@iteration}">{/if}
<button type="submit" class="{if $List@first}RCancel{else}RCancell{/if} onlist tooltip" title="{$LNG.bd_cancel} · {$LNG.tech.{$ID}} {$List.level}"></button>
</form>
</div>
<span class="research-construction-name" title="{$List.level} · {$LNG.tech.{$ID}|escape:'html'}">{$List.level} · {$LNG.tech.{$ID}|escape:'html'}</span>
</div>
</td></tr>
{/foreach}
{else}
<tr><td class="idle" colspan="2"><a class="js_hideTipOnMobile tooltip" title="{$LNG.ov_research_tip}" href="game.php?page=research">{$LNG.ov_research}</a></td></tr>
{/if}
</tbody>
					</table>
				</div>
					<div class="footer"></div>
			</div>
<style type="text/css">
.RResearch{
    background: transparent url(styles/resource/images/game/external/qvplA7d.png) -170px -96px no-repeat;
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
	background: transparent url(styles/resource/images/game/external/qvplA7d.png) -170px -110px no-repeat;
}

a.fastResearch:hover{
	background: transparent url(styles/resource/images/game/external/qvplA7d.png) -170px -110px no-repeat;
}

.RCancel{
    background: transparent url(styles/resource/images/game/external/qvplA7d.png) -208px -71px no-repeat;
    z-index: 4;
}

.RCancel:hover {
    background: transparent url(styles/resource/images/game/external/qvplA7d.png) -208px -88px no-repeat;
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
    background: transparent url(styles/resource/images/game/external/qvplA7d.png) -208px -71px no-repeat;
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
    background: transparent url(styles/resource/images/game/external/qvplA7d.png) -208px -88px no-repeat;
}
.contentR {
    background: url(styles/resource/images/game/external/DqCtELw.gif) repeat-y;
    margin: 0 0 20px 0;
    min-height: 115px;
    padding: 1px 0 0;
    position: relative;
}
</style>
</div><!-- END researchOv -->
{/block}
