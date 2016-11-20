{block name="title" prepend}{$LNG.lm_fleettrader}{/block}
{block name="content"}
<div id="planet" style="background:url(./styles/theme/gow/img/pagination/merchant.gif) no-repeat; height:250px; width:654px;">
	<h2>{$LNG.ft_head} </h2>
</div>
<div class="cs-left"></div>
<div class="cs-right"></div>
<form action="game.php?page=fleetDealer" method="post">
	<input type="hidden" name="mode" value="send">
	<table style="width:670px;">
        <tr>
			<td>
				<div class="transparent" style="text-align:center;float:center">
						<img data-src="{$dpath}gebaeude/" id="img" alt="">
					<div class="styled-select">
						<select name="shipID" id="shipID" onchange="updateVars()">
							{foreach $shipIDs as $shipID}
							<option value="{$shipID}">{$LNG.tech.$shipID}</option>
							{/foreach}
						</select>
					</div>
					<div style="margin-top:20px;margin-left:auto">
					<!-- <h2 id="traderHead"></h2> -->
						<p>{$LNG.ft_count}: <input type="text" id="count" name="count" onkeyup="Total();"><button class="button big" onclick="MaxShips();return false;">{$LNG.ft_max}</button></p>
						<p><br />{$LNG.tech.901}: <span id="metal" class="button small orange" style="font-weight:800"></span> &bull; {$LNG.tech.902}: <span id="crystal" class="button small orange" style="font-weight:800;"></span> &bull; {$LNG.tech.903}: <span id="deuterium" class="button small orange" style="font-weight:800;"></span> &bull; {$LNG.tech.921}: <span id="darkmatter" class="button small orange" style="font-weight:800;"></span></p>
						<p>{$LNG.ft_total}: {$LNG.tech.901}: <span id="total_metal" class="button small green" style="font-weight:800;"></span> &bull; {$LNG.tech.902}: <span id="total_crystal" class="button small green" style="font-weight:800;"></span> &bull; {$LNG.tech.903} <span id="total_deuterium" class="button small green" style="font-weight:800;"></span> &bull; {$LNG.tech.921}: <span id="total_darkmatter" class="button small green" style="font-weight:800;"></span>
						<p><br /><input type="submit" class="button green" value="{$LNG.ft_absenden}"></p>
						<br /><p style="font-weight:bold;color:red">{$LNG.ft_charge}: {$Charge}%</p><br />
					</div>
				</div>
			</td>
		</tr>
	</table>
</form>
{/block}
{block name="script" append}
<script type="text/javascript">
var CostInfo = {$CostInfos|json};
var Charge = {$Charge};
</script>
{/block}