<div id="netBar" style="display: block;">
	<div id="netContent" class="netNewsOut tooltip" title="Galaxyz Rev 0.01"><a href="https://github.com/4lin/Galaxyz-rev0.01/releases" class="netLogo" target="_blank"></a></div>
</div>

<div class="contentBoxBody">
            <noscript>
                <div id="messagecenter">
                    <div id="javamessagebox">
                        <span class="overmark">
                            <strong>Por favor, activa el JavaScript para poder continuar con el juego.</strong>
                        </span>
                    </div>
                </div>
            </noscript>
            <div id="ie_message">
                <p><img src="http://i.imgur.com/YRenhXr.gif" height="16" width="16" />El navegador usado actualmente es antiguo y puede causar errores en la pantalla de esta página web. Por favor, actualiza tu navegador a la versión más nueva: <a href="http://www.microsoft.com/upgrade/">Internet Explorer</a> o <a href="http://www.mozilla-europe.org/de/firefox/">Mozilla Firefox</a></p>
            </div>
            <script type="text/javascript">isIE = false;</script>
            <!--[IF IE]>
                <script type="text/javascript">
                    isIE = true;
                </script>
            <![endif]-->
	<div id="boxBG">
	<div id="box">
		<div id="info" class="header normal">
			<div id="ovBlock">
				<div id="bar">
					<ul>
						<li id="playerName">admin</li>
						{if isModuleAvailable($smarty.const.MODULE_MESSAGES)}<li><a href="game.php?page=messages">{$LNG.lm_messages}{nocache}{if $new_message > 0}<span id="newmes"> (<span id="newmesnum">{$new_message}</span>)</span>{/if}{/nocache}</a></li>{/if}
						{if isModuleAvailable($smarty.const.MODULE_STATISTICS)}<li><a href="game.php?page=statistics">{$LNG.lm_statistics}</a></li>{/if}
						{if isModuleAvailable($smarty.const.MODULE_BUDDYLIST)}<li><a href="game.php?page=buddyList">{$LNG.lm_buddylist}</a></li>{/if}
						{if isModuleAvailable($smarty.const.MODULE_SEARCH)}<li><a href="game.php?page=search">{$LNG.lm_search}</a></li>{/if}
						{if isModuleAvailable($smarty.const.MODULE_RECORDS)}<li><a href="game.php?page=records">{$LNG.lm_records}</a></li>{/if}
						{if isModuleAvailable($smarty.const.MODULE_BATTLEHALL)}<li><a href="game.php?page=battleHall">TOP</a></li>{/if}
						
						<li><a href="game.php?page=settings">{$LNG.lm_options}</a></li>
						{if isModuleAvailable($smarty.const.MODULE_SUPPORT)}<li><a href="game.php?page=ticket">{$LNG.lm_support}</a></li>{/if}
						
						<li><a href="game.php?page=logout">{$LNG.lm_logout}</a></li>
						
						<li>{$LNG.ov_server_time}: {$servertime}</li>
					</ul>
				</div>
      	
      			<div id="officers">
      	        	<a href="game.php?page=officier" class="{if isModuleAvailable(MODULE_OFFICIER)}img_commander{else}img_commander_inactive{/if} js_hideTipOnMobile tooltip" title="commander">
                  		<img src="http://i.imgur.com/pLBcsdw.png" width="30" height="30">
                	</a>
      				 
					<a href="game.php?page=officier" class="{if isModuleAvailable(MODULE_OFFICIER)}img_admiral{else}img_admiral_inactive{/if} js_hideTipOnMobile tooltip" title="admiral">
						<img src="http://i.imgur.com/pLBcsdw.png" width="30" height="30">
                	</a>

					<a href="game.php?page=officier" class="{if isModuleAvailable(MODULE_OFFICIER)}img_engineer{else}img_engineer_inactive{/if} js_hideTipOnMobile tooltip" title="engineer">
						<img src="http://i.imgur.com/pLBcsdw.png" width="30" height="30">
               		</a>

					<a href="game.php?page=officier" class="{if isModuleAvailable(MODULE_OFFICIER)}img_geologist{else}img_geologist_inactive{/if} js_hideTipOnMobile tooltip" title="geologist">
						<img src="http://i.imgur.com/pLBcsdw.png" width="30" height="30">
					</a>

					<a href="game.php?page=officier" class="{if isModuleAvailable(MODULE_OFFICIER)}img_technocrat{else}img_technocrat_inactive{/if} js_hideTipOnMobile tooltip" title="technocrat">
						<img src="http://i.imgur.com/pLBcsdw.png" width="30" height="30">
					</a>

				</div>

				<div id="page">
					<div id="header">
						<table id="headerTable">
						<tbody>
							<tr>
								<!--
								<td id="planetImage">
                       			<img src="{$dpath}planeten/small/s_{$image}.jpg" alt="">
								</td>
								<td id="planetSelectorWrapper">
                        		<label for="planetSelector"></label>
								<select id="planetSelector">
								{html_options options=$PlanetSelect selected=$current_pid}
								</select>
								</td>
								-->
								<td id="resourceWrapper">
									<table id="resourceTable">
										<tbody>
											<tr>
												{foreach $resourceTable as $resourceID => $resourceData}
												<td style="width:48px;height:32px;">
													<img src="{$dpath}images/{$resourceData.name}.gif" class="tooltip" data-tooltip-content="
													<table>
													<tr><th>{$LNG.tech.$resourceID}</th></tr>
													<tr>
													{if !isset($resourceData.current) || !isset($resourceData.max)}
													<td>&nbsp;</td>
													{else}
													<td class='res_max' id='max_{$resourceData.name}' data-real='{$resourceData.max}'>{shortly_number($resourceData.max)}</td>
													{/if}
													</tr>
													<tr>
													{if !isset($resourceData.current)}
													{$resourceData.current = $resourceData.max + $resourceData.used}
													<td class='res_current'><span{if $resourceData.current < 0} style='color:red;'{/if}>{shortly_number($resourceData.current)}&nbsp;/&nbsp;{shortly_number($resourceData.max)}</span></td>
													{else}
													<td class='res_current' id='current_{$resourceData.name}' data-real='{$resourceData.current}'>{shortly_number($resourceData.current)}</td>
													{/if}
													</tr>
													</table>
													" alt="">
												</td>
												{/foreach}
											</tr>

											{if $shortlyNumber}
											<tr>
												{foreach $resourceTable as $resourceID => $resourceData}
												{if !isset($resourceData.current)}
												{$resourceData.current = $resourceData.max + $resourceData.used}
												<td class="res_current tooltip" data-tooltip-content="{$resourceData.current|number}&nbsp;/&nbsp;{$resourceData.max|number}"><span{if $resourceData.current < 0} style="color:red"{/if}>{shortly_number($resourceData.current)}&nbsp;/&nbsp;{shortly_number($resourceData.max)}</span></td>
												{else}
												<td class="res_current tooltip" id="current_{$resourceData.name}" data-real="{$resourceData.current}" data-tooltip-content="{$resourceData.current|number}">{shortly_number($resourceData.current)}</td>
												{/if}
												{/foreach}
											</tr>
								
											<tr>
												{foreach $resourceTable as $resourceID => $resourceData}
												{if !isset($resourceData.current) || !isset($resourceData.max)}
												<td>&nbsp;</td>
												{else}
												<td class="res_max tooltip" id="max_{$resourceData.name}" data-real="{$resourceData.max}" data-tooltip-content="{$resourceData.max|number}">{shortly_number($resourceData.max)}</td>
												{/if}
												{/foreach}
											</tr>
											{else}
											<tr>
												{foreach $resourceTable as $resourceID => $resourceData}
												{if !isset($resourceData.current)}
												{$resourceData.current = $resourceData.max + $resourceData.used}
									
												<td class="res_current"><span{if $resourceData.current < 0} style="color:red"{/if}>{$resourceData.current|number}&nbsp;/&nbsp;{$resourceData.max|number}</span> </td>
												{else}
												<td class="res_current" id="current_{$resourceData.name}" data-real="{$resourceData.current}">{$resourceData.current|number}</td>
												{/if}
												{/foreach}
											</tr>

											{/if}
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
						</table>
		
						{if !$vmode}
							<script type="text/javascript">
								var viewShortlyNumber	= {$shortlyNumber|json};
								var vacation			= {$vmode};
        						$(function() {
									{foreach $resourceTable as $resourceID => $resourceData}
									{if isset($resourceData.production)}

            						resourceTicker({
                						available: {$resourceData.current|json},
                						limit: [0, {$resourceData.max|json}],
                						production: {$resourceData.production|json},
                						valueElem: "current_{$resourceData.name}"
            						}, true);
									{/if}
									{/foreach}
        						});
							</script>
        
        					<script src="scripts/game/topnav.js"></script>
        						{if $hasGate}<script src="scripts/game/gate.js"></script>{/if}
						{/if}
					</div><!-- header-->
				</div><!--page-->
			</div><!--ovBlock-->
		</div><!--info-->
