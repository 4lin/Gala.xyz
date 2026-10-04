{block name="title" prepend}{if $mode == "defense"}{$LNG.lm_defenses}{else}{$LNG.lm_shipshard}{/if}{/block}
{block name="content"}
<div id="shipyardOv" data-mode="{$mode}" data-build-list="{$BuildList|json|escape:'html'}"{if $mode == 'defense'} class="defense-view"{/if}>
<div class="construction-request-error" role="alert" hidden>{$LNG.op_error}. <a href="game.php?page=shipyard&amp;mode={$mode}">{$LNG.al_applyform_reload}</a></div>
	{if $mode == "fleet"}
	<div id="planetImg" style="background:url(styles/resource/images/game/external/k4BHWnE.png) no-repeat; height:250px; width:654px;">
		{else}
		<div id="planetImg" style="background:url(styles/resource/images/game/external/fnos6H6.png) no-repeat; height:250px; width:654px;">
			{/if}
		<h2>{if $mode == "defense"}{$LNG.lm_defenses}{else}{$LNG.lm_shipshard}{/if} - {$planetname}</h2>
	</div>
    <div class="shipyard-panel-viewport">
        <section id="shipyard-details-panel" hidden aria-live="polite">
            <button type="button" class="building-panel-close" aria-label="{$LNG.bd_cancel}" title="{$LNG.bd_cancel}"></button>
            {foreach $elementList as $ID => $Element}
            <article class="building-panel-item" data-element="{$ID}" hidden>
                <img class="building-panel-image" src="{$dpath}buildings/{$ID}.png" alt="{$LNG.tech.{$ID}|escape:'html'}">
                <a class="building-panel-techtree" href="game.php?page=techtree" title="{$LNG.lm_technology}"><span aria-hidden="true"></span>{$LNG.lm_technology}</a>
                <form class="building-panel-body shipyard-panel-form" action="game.php?page=shipyard&amp;mode={$mode}" method="post" data-max="{$Element.maxBuildable}">
                    <h3>{$LNG.tech.{$ID}|escape:'html'} <small>{$LNG.bd_panel_number}: {$Element.available|number}</small></h3>
                    <div class="building-panel-production">{$LNG.fgf_time} <strong>{$Element.elementTime|time}</strong></div>
                    <div class="shipyard-panel-quantity">
                        <label for="panel-quantity-{$ID}">{$LNG.bd_panel_number}:</label>
                        <div class="shipyard-panel-quantity-controls">
                            <input id="panel-quantity-{$ID}" type="text" inputmode="numeric" pattern="[0-9]+" name="fmenge[{$ID}]" maxlength="{$maxlength}" value="1" autocomplete="off" required {if $Element.AlreadyBuild || !$NotBuilding || !$Element.buyable || $Element.maxBuildable < 1}disabled{/if}>
                            <button type="button" class="shipyard-panel-max" {if $Element.AlreadyBuild || !$NotBuilding || !$Element.buyable || $Element.maxBuildable < 1}disabled{/if}>[{$LNG.bd_max_ships|upper}: {$Element.maxBuildable|number}]</button>
                        </div>
                    </div>
                    <div class="building-panel-requirements">
                        <div>{$LNG.bd_panel_unit_cost}:</div>
                        <div class="building-panel-costs">
                        {foreach $Element.costResources as $RessID => $RessAmount}
                            <span title="{$LNG.tech.{$RessID}|escape:'html'}"><img src="{$dpath}images/{if $RessID == 901}metal{elseif $RessID == 902}crystal{elseif $RessID == 903}deuterium{else}darkmatter{/if}.gif" alt="{$LNG.tech.{$RessID}|escape:'html'}"><strong class="{if $Element.costOverflow[$RessID] == 0}affordable{else}unaffordable{/if}">{$RessAmount|number}</strong></span>
                        {/foreach}
                        </div>
                    </div>
                    <div class="building-panel-build"><button type="submit" {if $Element.AlreadyBuild || !$NotBuilding || !$Element.buyable || $Element.maxBuildable < 1}disabled{/if}>{$LNG.bd_build}</button></div>
                    {if $Element.AlreadyBuild}<div class="shipyard-panel-limit">{$LNG.bd_protection_shield_only_one}</div>{/if}
                </form>
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
        				{if $mode == "defense"}{$LNG.lm_defenses}{else}{$LNG.lm_shipshard}{/if}
			        </h2>
         		</div>
		<div class="content"> 
			<ul id="shipyard">
				{foreach $elementList as $ID => $Element}
				<li id="shipyard" class="{if $Element.AlreadyBuild}off{elseif $NotBuilding && $Element.buyable}on{else}off{/if}">
					<div class="tech{$ID} interacTip" data-tooltip-content="{capture name=gameTooltip17}
                        <table class='shipyard-hover-summary'>
                            <tr><th>{$LNG.tech.{$ID}}</th></tr>
                            <tr><td>{$LNG.shortDescription.{$ID}}</td></tr>
                            <tr><td>{$LNG.bd_panel_unit_cost}: {foreach $Element.costResources as $RessID => $RessAmount}{$LNG.tech.{$RessID}}: <strong style='color:{if $Element.costOverflow[$RessID] == 0}lime{else}red{/if};'>{$RessAmount|number}</strong> {/foreach}</td></tr>
                            <tr><td>{$LNG.fgf_time} {$Element.elementTime|time}</td></tr>
                        </table>
                        {/capture}{$smarty.capture.gameTooltip17|escape:'html'}">
						<div class="shipyardimg">
							<a ref="{$ID}" id="details" class="detail_button js_hideTipOnMobile {if $mode == 'defense'}defense-detail{/if}" href="#" onclick="return ShipyardPanel.open({$ID}, this)" aria-controls="shipyard-details-panel" aria-expanded="false">
									<span class="ecke">
										<span class="level">
											{$Element.available|number}
											<span class="textlabel">
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

			<div class="content-box-s defense-construction-box">
				<div class="header">
    				<h3>{if $mode == "defense"}{$LNG.lm_defenses}{else}{$LNG.lm_shipshard}{/if}</h3>
    			</div>
				<div class="content">
					<table class="construction active" cellspacing="0" cellpadding="0">
						<tbody>
							<tr>
								<td class="idle transparent">
									{if !empty($BuildList)}
									<div id="defense-current-build" class="production-current-build" data-image-root="{$dpath}buildings/">
                                        <div class="defense-current-image"><img src="{$dpath}buildings/{$BuildList.Queue[0][3]}.png" alt="{$BuildList.Queue[0][0]|escape:'html'}"><div class="defense-current-progress"></div><span class="defense-current-time"></span>
<form id="fleet-current-cancel" class="fleet-current-cancel" action="game.php?page=shipyard&amp;mode={$mode}" method="post">
<input type="hidden" name="action" value="delete"><input type="hidden" name="auftr[]" value="0">
<button type="button" aria-label="{$LNG.bd_cancel}" title="{$LNG.bd_cancel}" onclick="document.getElementById('fleet-cancel-confirm').showModal()"></button>
</form></div>
                                        <strong class="defense-current-name" title="{$BuildList.Queue[0][0]|escape:'html'}">{if $mode == 'fleet'}<span>{$BuildList.Queue[0][1]|number}</span> {/if}{$BuildList.Queue[0][0]|escape:'html'}</strong>

                                    </div>
                                    <div id="bx" class="z" hidden></div>
                                    <select id="auftr" hidden aria-hidden="true"><option></option></select>
                                    <span id="timeleft" hidden></span>
										{else}
										{if $mode == "fleet"}{$LNG.ov_hangar}{else}{$LNG.ov_defenses}{/if}
									{/if}
								</td>
							</tr>
						</tbody>
					</table>
				</div>
					<div class="footer"></div>
			</div>
</div><!-- END shipyardOv -->
<dialog id="fleet-cancel-confirm" class="fleet-cancel-confirm" aria-labelledby="fleet-cancel-heading">
<h3 id="fleet-cancel-heading">{$LNG.bd_cancel_send}?</h3>{if $mode == 'defense'}<p>{$LNG.bd_defense_cancel_warning|escape:'html'}</p>{/if}
<div><button type="button" onclick="document.getElementById('fleet-cancel-confirm').close()">{$LNG.gl_no}</button><button type="submit" form="fleet-current-cancel" onclick="document.getElementById('fleet-cancel-confirm').close()">{$LNG.gl_yes}</button></div>
</dialog>

{/block}

{block name="script" append}
<link rel="stylesheet" href="styles/resource/css/ingame/shipyard-panel.css?v=17">
<script src="scripts/game/shipyard-panel.js?v=9"></script>
<script type="text/javascript">
data			= {$BuildList|json};
bd_operating	= '';
bd_available	= '';
</script>
<script src="scripts/game/construction-ajax.js?v=2"></script>
{/block}
