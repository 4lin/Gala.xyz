{block name="title" prepend}{$LNG.lm_buildings}{/block}
{block name="content"}
		<div id="buildingsOv">
        <div id="building-request-error" class="construction-request-error" role="alert" hidden>{$LNG.op_error}. <a href="game.php?page=buildings">{$LNG.al_applyform_reload}</a></div>
    		<div id="planetImg" style="background:url(styles/resource/images/game/external/MQxMmqn.jpg) no-repeat; height:300px; width:654px;">
				<div id="header_text">
            		<h2>{$LNG.lm_buildings} - {$planetname}</h2>
				</div>

    		</div>
        <div class="building-panel-viewport">
        <section id="building-details-panel" hidden aria-live="polite">
            <button type="button" class="building-panel-close" aria-label="{$LNG.bd_cancel}" title="{$LNG.bd_cancel}"></button>
            {foreach $BuildInfoList as $ID => $Element}
            <article class="building-panel-item" data-building="{$ID}" hidden>
                <img class="building-panel-image" src="{$dpath}buildings/{$ID}.png" alt="{$LNG.tech.{$ID}|escape:'html'}">
                <a class="building-panel-techtree" href="game.php?page=techtree" title="{$LNG.lm_technology}"><span aria-hidden="true"></span>{$LNG.lm_technology}</a>
                <div class="building-panel-body">
                    <h3>{$LNG.tech.{$ID}|escape:'html'} <small>{$LNG.bd_lvl} {$Element.level}</small></h3>
                    <div class="building-panel-production">
                        <div>{$LNG.fgf_time} <strong>{$Element.elementTime|time}</strong></div>
                        {if $Element.currentEnergy !== null}<div>{$LNG.tech.911}: <strong>{$Element.currentEnergy|number}</strong> <strong class="{if $Element.energyDifference >= 0}affordable{else}unaffordable{/if}">({if $Element.energyDifference >= 0}+{/if}{$Element.energyDifference|number})</strong></div>{/if}
                    </div>
                    {if $Element.level > 0 && $CanBuildElement}
                    <form class="building-panel-demolish" action="game.php?page=buildings" method="post">
                        <input type="hidden" name="cmd" value="destroy"><input type="hidden" name="building" value="{$ID}">
                        <button type="submit" title="{$LNG.bd_price_for_destroy} {foreach $Element.destroyResources as $RessID => $RessAmount}{$LNG.tech.{$RessID}}: {$RessAmount|number} {/foreach} — {$Element.destroyTime|time}"><span aria-hidden="true"></span>{$LNG.bd_dismantle}</button>
                    </form>
                    {/if}
                    <div class="building-panel-requirements">
                        <div>{$LNG.bd_cost} {$LNG.bd_next_level} {$Element.levelToBuild + 1}</div>
                        <div class="building-panel-costs">
                        {foreach $Element.costResources as $RessID => $RessAmount}
                            <span title="{$LNG.tech.{$RessID}|escape:'html'}"><img src="{$dpath}images/{if $RessID == 901}metal{elseif $RessID == 902}crystal{elseif $RessID == 903}deuterium{else}darkmatter{/if}.gif" alt="{$LNG.tech.{$RessID}|escape:'html'}"><strong class="{if $Element.costOverflow[$RessID] == 0}affordable{else}unaffordable{/if}">{$RessAmount|number}</strong></span>
                        {/foreach}
                        </div>
                    </div>
                    <form action="game.php?page=buildings" method="post" class="building-panel-build">
                        <input type="hidden" name="cmd" value="insert"><input type="hidden" name="building" value="{$ID}">
                        <button type="submit" {if !$RoomIsOk || !$CanBuildElement || !$Element.buyable || $Element.levelToBuild >= $Element.maxLevel || ($isBusy.research && ($ID == 6 || $ID == 31)) || ($isBusy.shipyard && ($ID == 15 || $ID == 21))}disabled{/if}>{if $Element.level == 0}{$LNG.bd_build}{else}{$LNG.bd_improve}{/if}</button>
                    </form>
                </div>
                <div class="building-panel-description"><span aria-hidden="true">?</span> {$LNG.shortDescription.{$ID}}</div>
            </article>
            {/foreach}
        </section>
        </div>
    		<div class="c-left"></div>
    		<div class="c-right"></div>

    		<div id="buttonz">
        		<div class="header"> 
        			<h2>
        				{$LNG.lm_buildings}
			        </h2>
         		</div>
				<div class="content"> 
					<ul id="building">
									{foreach $BuildInfoList as $ID => $Element}
									<li id="button{$ID}" class="{if $Element.maxLevel == $Element.levelToBuild}disabled{elseif ($isBusy.research && ($ID == 6 || $ID == 31)) || ($isBusy.shipyard && ($ID == 15 || $ID == 21))}off{else}{if $RoomIsOk}{if $CanBuildElement && $Element.buyable}on{else}off{/if}{/if}{/if} tooltip" data-tooltip-content="{capture name=gameTooltip5}{* Start Destruction Popup *}<table style='width:300px'><tr><td>{$LNG.shortDescription.{$ID}}</td></tr><tr><td colspan='2'>{$LNG.bd_cost} {$LNG.bd_next_level}</td></tr>{foreach $Element.costResources as $RessID => $RessAmount}<tr><td> {$LNG.tech.{$RessID}}: <span style='color:{if $Element.costOverflow[$RessID] == 0}lime{else}red{/if};'>{$RessAmount|number}</span></td></tr>{/foreach}</table>{* End Destruction Popup *}{/capture}{$smarty.capture.gameTooltip5|escape:'html'}">

										<div class="supply{$ID}">
											<div class="buildingimg">
												<a id="details" class="detail_button js_hideTipOnMobile" ref="{$ID}" href="#" onclick="return BuildingsPanel.open({$ID}, this)" aria-controls="building-details-panel" aria-expanded="false">
													<span class="ecke">
														<span class="level">
															<span class="textlabel">
	                                   							{$Element.level}{if $Element.maxLevel != 255}/{$Element.maxLevel}{/if}
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
				</div>
			</div><!-- buttonz -->

			<div class="content-box-s">
				<div class="header">
    				<h3>{$LNG.lm_buildings}</h3>
    			</div>
				<div class="content">
					<table class="construction active" cellspacing="0" cellpadding="0">
						<tbody>
							<tr class="">
								{if !empty($Queue)}
								<td class="first construction-entry" colspan="4">
								{else}
								<td class="idle" colspan="2">
								{/if}
									{if !empty($Queue)}
									{foreach $Queue as $List}
									{$ID = $List.element}

											{if !($isBusy.research && ($ID == 6 || $ID == 31)) && !($isBusy.shipyard && ($ID == 15 || $ID == 21)) && $RoomIsOk && $CanBuildElement && $BuildInfoList[$ID].buyable}

									{else}

									{/if}
									{if $List@first}
									<div class="construction-image">
									<img src="{$dpath}buildings/{$ID}.png" width="65" height="65" id="blinkIN" class="tooltip" title="{$LNG.tech.{$ID}} {$List.level}" alt="">
									<div id="progressbar" data-time="{$List.resttime}"></div>

											<div id="time" data-time="{$List.time}"></div>
									</div>
									<span class="construction-name">{$LNG.tech.{$ID}|escape:'html'}</span>
												<form action="game.php?page=buildings" method="post" class="build_form">
													<input type="hidden" name="cmd" value="cancel">
														<button type="submit" class="BCancel onlist tooltip" title="{$LNG.bd_cancel} · {$LNG.tech.{$ID}} {$List.level}"></button>
												</form>
								</td>
							</tr>
									{else}

									<tr><td class="construction-entry queued" style="width:35px;height:35px;">

										<img src="{$dpath}buildings/{$ID}.png" width="35" height="35" class="tooltip" title="{$LNG.tech.{$ID}} {$List.level}" alt="">
										<span class="construction-name">{$LNG.tech.{$ID}|escape:'html'} <span class="construction-target-level">{$List.level}</span></span>
											<form action="game.php?page=buildings" method="post" class="build_form">
												<input type="hidden" name="cmd" value="remove">
												<input type="hidden" name="listid" value="{$List@iteration}">
													<button type="submit" class="BCancell onlist tooltip" title="{$LNG.bd_cancel} · {$LNG.tech.{$ID}} {$List.level}"></button>
											</form>

									</td></tr>
									{/if}

									{/foreach}
									{else}
										<a class="js_hideTipOnMobile tooltip" title="{$LNG.ov_buildings_tip}" href="game.php?page=buildings">{$LNG.ov_buildings}</a></td></tr>
									{/if}

						</tbody>
					</table>
				</div>
					<div class="footer"></div>
			</div>

<style type="text/css">
.BBuild{
    background: transparent url(styles/resource/images/game/external/qvplA7d.png) -170px -96px no-repeat;
	position: absolute;
    cursor: pointer;
    display: inline; text-align: left;
    width: 22px; height: 14px;
    top: -2px; left: -1px;
    z-index: 4;
}

.BBuild:hover{
	background: transparent url(styles/resource/images/game/external/qvplA7d.png) -170px -110px no-repeat;
}

a.fastBuild:hover{
	background: transparent url(styles/resource/images/game/external/qvplA7d.png) -170px -110px no-repeat;
}

.BCancel{
    background: transparent url(styles/resource/images/game/external/qvplA7d.png) -208px -71px no-repeat;
    z-index: 4;
}

.BCancel{
	height: 17px;
    width: 17px;
    cursor: pointer;
    display: inline;
    position: relative;
	top: -16px;
    left: 50px;
}

.BCancel:hover {
    background: transparent url(styles/resource/images/game/external/qvplA7d.png) -208px -88px no-repeat;
}
.BCancell{
    background: transparent url(styles/resource/images/game/external/qvplA7d.png) -208px -71px no-repeat;
    cursor: pointer;
    display: inline;
    height: 17px;
    left: -15px;
    position: relative;
    text-align: left;
    top: 20px;
    width: 17px;
    z-index: 4;
}
.BCancell:hover {
    background: transparent url(styles/resource/images/game/external/qvplA7d.png) -208px -88px no-repeat;
}
.contentB {
    background: url(styles/resource/images/game/external/DqCtELw.gif) repeat-y;
    margin: 0 0 20px 0;
    min-height: 115px;
    padding: 1px 0 0;
    position: relative;
}
</style>
</div><!--END buildingsOv-->
{/block}

{block name="script" append}
<script src="scripts/game/buildings-panel.js?v=4"></script>
<script src="scripts/game/construction-ajax.js?v=2"></script>
{/block}
