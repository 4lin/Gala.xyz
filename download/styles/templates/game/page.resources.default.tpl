{block name="title" prepend}{$LNG.lm_resources}{/block}
{block name="content"}
<div id="resourcesOv">
	<div id="planetImg" style="background:url(http://i.imgur.com/qRY8lIK.jpg) no-repeat; height:40px; width:654px;">
		<h2>{$header}</h2>
	</div>
	<div class="contentRS">
		<div class="headerRS">
			<a class="close_details close_resources" href="game.php?page=buildings"></a>
		</div>
		<div class="mainRS">
		<form action="?page=resources" method="POST" type="hidden" style="width:100%">
		<input type="hidden" name="mode" value="send">
			<table class="list listOfResourceSettingsPerPlanet" style="margin-top:0px;" cellspacing="0" cellpadding="0">
			<tbody>
				<tr>
					<td colspan="7" id="factor">
						<div class="secondcol">
							<div style="width:376px; margin: 0px auto;">
								<span class="factorkey">
								{$LNG.lm_resources}	100% 
								</span>
								<span class="factorbuton">
									<input class="btn_blue" value="{$LNG.rs_calculate}" type="submit">
								</span>
								<br class="clearfloat">
							</div>
						</div>
					</td>
				</tr>

				<tr>
					<th colspan="1"></th>
					<th>{$LNG.tech.901}</th>
					<th>{$LNG.tech.902}</th>
					<th>{$LNG.tech.903}</th>
					<th>{$LNG.tech.911}</th>
					<th>&nbsp;</th>
				</tr>

				<tr class="alt">
					<td colspan="1" class="label">{$LNG.rs_basic_income}</td>
					<td class="textRight">
						<span class="tooltip" title="{$basicProduction.901|number}">{$basicProduction.901|number}</span>
					</td>
					<td class="textRight">
						<span class="tooltip" title="{$basicProduction.902|number}">{$basicProduction.902|number}</span>
					</td>
					<td class="textRight">
						<span class="tooltip" title="{$basicProduction.903|number}">{$basicProduction.903|number}</span>
					</td>
					<td class="textRight">
						<span class="tooltip" title="{$basicProduction.911|number}">{$basicProduction.911|number}</span>
					</td>
				</tr>
				
				{foreach $productionList as $productionID => $productionRow}
				<tr class="{cycle values=' ,alt'}">
					<td class="label">{$LNG.tech.$productionID } ({if $productionID  > 200}{$LNG.rs_amount}{else}{$LNG.rs_lvl}{/if} {$productionRow.elementLevel})</td>
					<td>
						<span style="color:{if $productionRow.production.901 > 0}lime{elseif $productionRow.production.901 < 0}red{else}white{/if}">
							{$productionRow.production.901|number}
						</span>
					</td>
					<td>
						<span style="color:{if $productionRow.production.902 > 0}lime{elseif $productionRow.production.902 < 0}red{else}white{/if}">
							{$productionRow.production.902|number}
						</span>
					</td>
					<td>
						<span style="color:{if $productionRow.production.903 > 0}lime{elseif $productionRow.production.903 < 0}red{else}white{/if}">
							{$productionRow.production.903|number}
						</span>
					</td>
					<td>
						<span style="color:{if $productionRow.production.911 > 0}lime{elseif $productionRow.production.911 < 0}red{else}white{/if}">
							{$productionRow.production.911|number}
						</span>
					</td>
					<td>
						{html_options name="prod[{$productionID}]" options=$prodSelector style="display: none;" selected=$productionRow.prodLevel}
						<span class="dropdown currentlySelected" style="width: 67px;">
							<a class="undermark" options=$prodSelector selected=$productionRow.prodLevel name="prod[{$productionID}]" href="javascript:void(0);">
								{html_options selected=$productionRow.prodLevel}
							</a>
						</span>
					</td>
				</tr>
				{/foreach}

				<tr>
					<td class="label">{$LNG.rs_ress_bonus}</td>
					<td>
						<span style="color:{if $bonusProduction.901 > 0}lime{elseif $bonusProduction.901 < 0}red{else}white{/if}">
							{$bonusProduction.901|number}
						</span>
					</td>
					<td>
						<span style="color:{if $bonusProduction.902 > 0}lime{elseif $bonusProduction.902 < 0}red{else}white{/if}">
							{$bonusProduction.902|number}
						</span>
					</td>
					<td>
						<span style="color:{if $bonusProduction.903 > 0}lime{elseif $bonusProduction.903 < 0}red{else}white{/if}">
							{$bonusProduction.903|number}
						</span>
					</td>
					<td>
						<span style="color:{if $bonusProduction.911 > 0}lime{elseif $bonusProduction.911 < 0}red{else}white{/if}">
							{$bonusProduction.911|number}
						</span>
					</td>
				</tr>

					<tr class="alt">
						<td class="label">{$LNG.rs_storage_capacity}</td>
						<td><span style="color:lime;">{$storage.901}</span></td>
						<td><span style="color:lime;">{$storage.902}</span></td>
						<td><span style="color:lime;">{$storage.903}</span></td>
						<td>-</td>
					</tr>

					<tr>
						<td class="label">{$LNG.rs_sum}</td>
						<td>
							<span style="color:{if $totalProduction.901 > 0}lime{elseif $totalProduction.901 < 0}red{else}white{/if}">
								{$totalProduction.901|number}
							</span>
						</td>
						<td>
							<span style="color:{if $totalProduction.902 > 0}lime{elseif $totalProduction.902 < 0}red{else}white{/if}">
								{$totalProduction.902|number}
							</span>
						</td>
						<td>
							<span style="color:{if $totalProduction.903 > 0}lime{elseif $totalProduction.903 < 0}red{else}white{/if}">
								{$totalProduction.903|number}
							</span>
						</td>
						<td>
							<span style="color:{if $totalProduction.911 > 0}lime{elseif $totalProduction.911 < 0}red{else}white{/if}">
								{$totalProduction.911|number}
							</span>
						</td>
					</tr>

					<tr class="alt">
						<td class="label">{$LNG.rs_daily}</td>
						<td>
							<span style="color:{if $dailyProduction.901 > 0}lime{elseif $dailyProduction.901 < 0}red{else}white{/if}">
								{$dailyProduction.901|number}
							</span>
						</td>
						<td>
							<span style="color:{if $dailyProduction.902 > 0}lime{elseif $dailyProduction.902 < 0}red{else}white{/if}">
								{$dailyProduction.902|number}
							</span>
						</td>
						<td>
							<span style="color:{if $dailyProduction.903 > 0}lime{elseif $dailyProduction.903 < 0}red{else}white{/if}">
								{$dailyProduction.903|number}
							</span>
						</td>
						<td>
							<span style="color:{if $dailyProduction.911 > 0}lime{elseif $dailyProduction.911 < 0}red{else}white{/if}">
								{$dailyProduction.911|number}
							</span>
						</td>
					</tr>
					
					<tr>
						<td class="label">{$LNG.rs_weekly}</td>
						<td>
							<span style="color:{if $weeklyProduction.901 > 0}lime{elseif $weeklyProduction.901 < 0}red{else}white{/if}">
								{$weeklyProduction.901|number}
							</span>
						</td>
						<td>
							<span style="color:{if $weeklyProduction.902 > 0}lime{elseif $weeklyProduction.902 < 0}red{else}white{/if}">
								{$weeklyProduction.902|number}
							</span>
						</td>
						<td>
							<span style="color:{if $weeklyProduction.903 > 0}lime{elseif $weeklyProduction.903 < 0}red{else}white{/if}">
								{$weeklyProduction.903|number}
							</span>
						</td>
						<td>
							<span style="color:{if $weeklyProduction.911 > 0}lime{elseif $weeklyProduction.911 < 0}red{else}white{/if}">
								{$weeklyProduction.911|number}
							</span>
						</td>
					</tr>
			</tbody>
			</table>
		</form>
		</div><!--END mainRS-->
		<div class="footerRS"></div>
	</div><!--END contentRS-->
</div><!--END resourceOv-->
{/block}
{block name="script" append}
<script type="text/javascript">
    function initResourceSettings() {
        $('.mainRS tr:gt(0)').hover(function() {
            $(this).addClass('hover');
        }, function() {
            $(this).removeClass('hover');
        });
    }
    $(function(){
        initResourceSettings();
    });
</script>
{/block}