
<!-- START main.topnav -->
<div id="boxBG">
		<div style="position:absolute;top:40px;left:1100px" id="officers">
		<span></span>
		</div>
<div id="page">
 <a name="anchor"></a>
	<div id="info" class="header">
	 <div id="star"></div>
	 <div id="star1"></div>
	 <div id="star2"></div>
	 <div id="logotop"></div>
	  <div id="clearAdvice"></div>
		<a id="changelog_link" href="game.php?page=changelog" class="tooltip" data-tooltip-content="{$LNG.nt_notes} {$LNG.nt_version}" target="_self">{$LNG.nt_notes} {$LNG.nt_version}</a>
	  <div id="playerName">{$LNG.gl_player}: <span class="textBeefy">{$username}</span></div>
	  <div id="bar">
	   <ul>
		{if isModulAvalible($smarty.const.MODULE_BUDDYLIST)}<li><a href="game.php?page=buddyList" target="_self">{$LNG.lm_buddylist}</a></li>{/if}
		{if isModulAvalible($smarty.const.MODULE_NOTICE)}<li><a href="javascript:OpenPopup('?page=notes', 'notes', 720, 300);">{$LNG.lm_notes}</a></li>{/if}
		{if isModulAvalible($smarty.const.MODULE_STATISTICS)}<li><a href="game.php?page=statistics" target="_self">{$LNG.lm_statistics}</a></li>{/if}
		{if isModulAvalible($smarty.const.MODULE_SEARCH)}<li><a href="game.php?page=search" target="_self">{$LNG.lm_search}</a></li>{/if}
		<li><a href="game.php?page=settings" target="_self">{$LNG.lm_options}</a></li>
		{if isModulAvalible($smarty.const.MODULE_CHAT)}<li><a href="chat/" onclick="openWindow(this.href);this.blur();return false;">{$LNG.lm_chat}</a></li>{/if}
		{if isModulAvalible($smarty.const.MODULE_SIMULATOR)}<li><a href="game.php?page=battleSimulator" target="_self">{$LNG.lm_battlesim}</a></li>{/if}
		<li><a href="game.php?page=logout" target="_self"><font style="color:red;">{$LNG.lm_logout}</font></a></li>
	   </ul>
	  </div>
		<div id="clock" class="servertime">{$servertime}</div>
		 <!--<div id="planetSelect">
			<table>
				<tr>
					<td id="planetImage">
						<img src="{$dpath}planeten/small/s_{$image}.gif" alt=""> 
					</td>
					<td id="planetSelectorWrapper">
						<select id="planetSelector">
							{html_options options=$PlanetSelect selected=$current_pid}
						</select>
					</td>
				</tr>
			</table>
		 </div>-->
		 <div id="resTable">
						<table>
								<tr>
									{foreach $resourceTable as $resourceID => $resouceData}
									<td class=" tooltip" data-tooltip-content="{$LNG.tech.$resourceID}"><img src="{$dpath}images/{$resouceData.name}.gif" alt=""></td>
									{/foreach}
								</tr>
								{if $shortlyNumber}
								<tr>
									{foreach $resourceTable as $resourceID => $resouceData}
									{if !isset($resouceData.current)}
									{$resouceData.current = $resouceData.max + $resouceData.used}
									<td class="res_current tooltip" data-tooltip-content="{$resouceData.current|number}&nbsp;/&nbsp;{$resouceData.max|number}"><span{if $resouceData.current < 0} style="color:red"{/if}>{shortly_number($resouceData.current)}&nbsp;/&nbsp;{shortly_number($resouceData.max)}</span></td>
									{else}
									<td class="res_current tooltip" id="current_{$resouceData.name}" data-real="{$resouceData.current}" data-tooltip-content="{$resouceData.current|number}">{shortly_number($resouceData.current)}</td>
									{/if}
									{/foreach}
								</tr>
								<tr>
									{foreach $resourceTable as $resourceID => $resouceData}
									{if !isset($resouceData.current) || !isset($resouceData.max)}
									<td>&nbsp;</td>
									{else}
									<td class="res_max tooltip" id="max_{$resouceData.name}" data-real="{$resouceData.max}" data-tooltip-content="{$resouceData.max|number}">{shortly_number($resouceData.max)}</td>
									{/if}
									{/foreach}
								</tr>
								{else}
								<tr>
									{foreach $resourceTable as $resourceID => $resouceData}
									{if !isset($resouceData.current)}
									{$resouceData.current = $resouceData.max + $resouceData.used}
									<td class="res_current"><span{if $resouceData.current < 0} style="color:red"{/if}>{$resouceData.current|number}&nbsp;/&nbsp;{$resouceData.max|number}</span></td>
									{else}
									<td class="res_current" id="current_{$resouceData.name}" data-real="{$resouceData.current}">{$resouceData.current|number}</td>
									{/if}
									{/foreach}
								</tr>
								<tr>
									{foreach $resourceTable as $resourceID => $resouceData}
									{if !isset($resouceData.current) || !isset($resouceData.max)}
									<td>&nbsp;</td>
									{else}
									<td class="res_max" id="max_{$resouceData.name}" data-real="{$resouceData.current}">{$resouceData.max|number}</td>
									{/if}
									{/foreach}
								</tr>
								{/if}
						</table>
		 </div>
		 

		
		<div id="message-wrapper">
			<div>
				{if isModulAvalible($smarty.const.MODULE_MESSAGES)}
				{nocache}{if $new_message > 0}<a id="message_alert_box_default" href="game.php?page=messages" class="tooltip" data-tooltip-content="{$LNG.lm_messages}{nocache}{if $new_message > 0} ({$new_message}){/if}{/nocache}" target="_self">
				<span id="newmesnum">{$new_message}</span>
				</a>
				{/if}{/nocache}
				{nocache}{if $new_message < 1}
				<a id="message_alert_box_default_empty" href="game.php?page=messages" class="tooltip" data-tooltip-content="{$LNG.lm_messages}{nocache}{if $new_message < 1} ({$new_message}){/if}{/nocache}" target="_self">
				<img src="{$dpath}img/dot.gif" width="70" height="36" alt="">
				</a>
				{/if}{/nocache}
				{/if}
				<br class="clearfloat"></ br>
			</div>
		</div>

		<div id="helper">
		{if isModulAvalible($smarty.const.MODULE_TUTORIAL)}<a class="tooltip" data-tooltip-content="{$LNG.tut_go}" href="game.php?page=tutorial"><img src="{$dpath}img/dot.gif" width="27" height="27" alt=""></a>{/if}
		</div>
	</div>

<!-- END main.topnav -->
