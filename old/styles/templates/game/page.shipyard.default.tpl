{block name="title" prepend}{if $mode == "defense"}{$LNG.lm_defenses}{else}{$LNG.lm_shipshard}{/if}{/block}
{block name="content"}
<div id="shipyardOv">
	{if $mode == "fleet"}
	<div id="planetImg" style="background:url(http://i.imgur.com/k4BHWnE.png) no-repeat; height:250px; width:654px;">
		{else}
		<div id="planetImg" style="background:url(http://i.imgur.com/fnos6H6.png) no-repeat; height:250px; width:654px;">
			{/if}
		<h2>{if $mode == "defense"}{$LNG.lm_defenses}{else}{$LNG.lm_shipshard}{/if} - {$planetname}</h2>
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
					<div class="tech{$ID} interacTip" data-tooltip-content="
			<form action='game.php?page=shipyard&amp;mode={$mode}' method='post'>
			<table>
				<tr>
					<th colspan='3'>{$LNG.tech.{$ID}}</th>
				</tr>

				<tr>
					<td class='transparent left' style='width:100%;padding:10px;'>
						{$LNG.shortDescription.{$ID}}
						{foreach $Element.costResources as $RessID => $RessAmount}
						{$LNG.tech.{$RessID}}: <b><span style='color:{if $Element.costOverflow[$RessID] == 0}lime{else}red{/if}'>{$RessAmount|number}</span></b>
						{/foreach}
					</td>
				</tr>

				<tr>
					<td class='transparent' style='vertical-align:middle;width:100px'>
						{if $Element.AlreadyBuild}
						<span style='color:red'>{$LNG.bd_protection_shield_only_one}</span>
							{elseif $NotBuilding && $Element.buyable}
							<input type='text' name='fmenge[{$ID}]' id='input_{$ID}' size='{$maxlength}' maxlength='{$maxlength}' value='0' tabindex='{$smarty.foreach.FleetList.iteration}'>
							<input type='button' value='{$LNG.bd_max_ships}' onclick='$('#input_{$ID}').val('{$Element.maxBuildable}')'>
						{/if}
					</td>
				</tr>

				<tr>
					<td class='transparent left'>
						{$LNG.bd_remaining}<br>
						{foreach $Element.costOverflow as $ResType => $ResCount}
						{$LNG.tech.{$ResType}}: <span style='font-weight:700'>{$ResCount|number}</span><br>
						{/foreach}
						<br>
					</td>
					<td class='transparent right'>
						{$LNG.fgf_time}
					</td>
				</tr>

				<tr>		
					<td class='transparent left' style='width:68%'>
						{$LNG.bd_max_ships_long}:<br><span style='font-weight:700'>{$Element.maxBuildable|number}</span>
					</td>
					<td class='transparent right' style='white-space:nowrap;'>
						{$Element.elementTime|time}
					</td>
				</tr>
				
				{if $NotBuilding}
				<tr>
					<th colspan='3' style='text-align:center'><input type='submit' value='{$LNG.bd_build_ships}'></th>
				</tr>
				{/if}
			</table>
			</form>
						">
						<div class="shipyardimg">
							<a ref="{$ID}" id="details" class="detail_button js_hideTipOnMobile " href="#" onclick="return Dialog.info({$ID})">
									<span class="ecke">
										<span class="level">
											{if $Element.available != 0} {$Element.available|number}{/if}
											<span class="textlabel">
											</span>
										</span>
									</span>
							</a>
						</div>
							</div>
			<form action='game.php?page=shipyard&amp;mode={$mode}' method='post'>
			<table>
				<tr>
					<th style="width:auto;background:transparent;">
						{if $Element.AlreadyBuild}
						{$LNG.bd_max_ships}
							{elseif $NotBuilding && $Element.buyable}
							<input type='text' name='fmenge[{$ID}]' id='input_{$ID}' size='{$maxlength}' maxlength='{$maxlength}' value='0' tabindex='{$smarty.foreach.FleetList.iteration}'>
							<input type='button' value='{$LNG.bd_max_ships}' onclick='$('#input_{$ID}').val('{$Element.maxBuildable}')'>
							<input type='submit' class='button button2' value='BUILD'>
						{/if}
						</th>
				</tr>

			</table>
			</form>
				</li>
				{/foreach}
			</ul>
				<div class="footer"></div>
			<br class="clearfloat">
		</div><!-- END content -->
	</div><!-- END buttonz -->

			<div class="content-box-s">
				<div class="header">
    				<h3>{if $mode == "defense"}{$LNG.lm_defenses}{else}{$LNG.lm_shipshard}{/if}</h3>
    			</div>
				<div class="content">
					<table class="construction active" cellspacing="0" cellpadding="0">
						<tbody>
							<tr>
								<td class="idle transparent">
									{if !empty($BuildList)}
									<div id="bx" class="z"></div>
										<form action="game.php?page=shipyard&amp;mode={$mode}" method="post">
											<input type="hidden" name="action" value="delete">
												<table>
													<tr>
														<td>
															<div class="select">
															<select name="auftr[]" id="auftr" size="10" multiple>
																<option>&nbsp;</option>
															</select>
															</div>
															{$LNG.bd_cancel_warning}<br>
																<input type="submit" value="{$LNG.bd_cancel_send}">
														</td>
													</tr>
												</table>
										</form>
										
										<span id="timeleft"></span>
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
{/block}

{block name="script" append}
<script type="text/javascript">
data			= {$BuildList|json};
bd_operating	= '';
bd_available	= '';
</script>
{if !empty($BuildList)}
<script src="scripts/base/bcmath.js"></script>
<script src="scripts/game/shipyard.js"></script>
<script type="text/javascript">
$(function() {
    ShipyardInit();
});
</script>
{/if}
{/block}