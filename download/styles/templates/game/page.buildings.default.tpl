{block name="title" prepend}{$LNG.lm_buildings}{/block}
{block name="content"}
		<div id="buildingsOv">
    		<div id="planetImg" style="background:url(http://i.imgur.com/MQxMmqn.jpg) no-repeat; height:300px; width:654px;">
				<div id="header_text">
            		<h2>{$LNG.lm_buildings} - {$planetname}</h2>
				</div>

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
									<li id="button{$ID}" class="{if $Element.maxLevel == $Element.levelToBuild}disabled{elseif ($isBusy.research && ($ID == 6 || $ID == 31)) || ($isBusy.shipyard && ($ID == 15 || $ID == 21))}off{else}{if $RoomIsOk}{if $CanBuildElement && $Element.buyable}on{else}off{/if}{/if}{/if} tooltip" data-tooltip-content="{* Start Destruction Popup *}<table style='width:300px'><tr><td>{$LNG.shortDescription.{$ID}}</td></tr><tr><td colspan='2'>{$LNG.bd_cost} {$LNG.bd_next_level}</td></tr>{foreach $Element.costResources as $RessID => $RessAmount}<tr><td> {$LNG.tech.{$RessID}}: <span style='color:{if $Element.costOverflow[$RessID] == 0}lime{else}red{/if};'>{$RessAmount|number}</span></td></tr>{/foreach}</table>{* End Destruction Popup *}">

										{if $RoomIsOk}
										{if $CanBuildElement && $Element.buyable}
										<form type="hidden" id="formbuild" name="formbuild" action="game.php?page=buildings" method="post" class="build_form">
											<input type="hidden" name="cmd" value="insert">
											<input type="hidden" name="building" value="{$ID}"/>
												<button type="submit" class="BBuild js_hideTipOnMobile build_submit tooltip" data-tooltip-content="<table><tr><td class='transparent center' collspan='2'>{if $Element.level == 0}{$LNG.bd_build} {$LNG.tech.{$ID}} {else}{$LNG.tech.{$ID}} {$LNG.bd_build_next_level} {$Element.levelToBuild + 1}{/if}</td></tr><tr><td class='transparent center' colspan='2'>{if !empty($Element.infoEnergy)}{$LNG.bd_next_level} {$Element.infoEnergy}{/if}</td></tr><tr><td class='transparent left'>{$LNG.bd_remaining}<br>{foreach $Element.costOverflow as $ResType => $ResCount}{$LNG.tech.{$ResType}}: <span style='font-weight:700;'>{$ResCount|number}</span><br>{/foreach}</td><td class='transparent right' style='white-space:nowrap;'>{$LNG.fgf_time}:<br>{$Element.elementTime|time}</td></tr></table>">
													<img src="http://i.imgur.com/pLBcsdw.png" width="22" height="14" alt="">
												</button>
										</form>
										{/if}
										{/if}
										<div class="supply{$ID}">
											<div class="buildingimg">
												<a id="details" class="detail_button js_hideTipOnMobile" ref="{$ID}" href="#" onclick="return Dialog.info({$ID})">
													<span class="ecke">
														<span class="level">
															<span class="textlabel">
	                                   							{if $Element.level > 0}{$Element.level}{if $Element.maxLevel != 255}/{$Element.maxLevel}{/if}{/if}
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
								<td class="first" colspan="4">
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
									<img src="{$dpath}buildings/{$ID}.png" width="65" height="65" id="blinkIN" class="tooltip" title="{$LNG.tech.{$ID}} {$List.level}" alt=""><br/>
									<div id="progressbar" data-time="{$List.resttime}"></div>

											<div style="position:absolute;top:8px;left:21px;text-align:center;width:62px;background-color:#000000b3;" id="time" data-time="{$List.time}"><br/></div>
												<form type="hidden" action="game.php?page=buildings" method="post" class="build_form">
													<input type="hidden" name="cmd" value="cancel">
														<button type="submit" class="BCancel onlist tooltip" title="{$LNG.bd_cancel} · {$LNG.tech.{$ID}} {$List.level}"></button>
												</form>
								</td>
							</tr>
									{else}

									<td style="width:35px;height:35px;">

										<img src="{$dpath}buildings/{$ID}.png" width="35" height="35" class="tooltip" title="{$LNG.tech.{$ID}} {$List.level}" alt="">
											<form action="game.php?page=buildings" method="post" class="build_form">
												<input type="hidden" name="cmd" value="remove">
												<input type="hidden" name="listid" value="{$List@iteration}">
													<button type="submit" class="BCancell onlist tooltip" title="{$LNG.bd_cancel} · {$LNG.tech.{$ID}} {$List.level}"></button>
											</form>

									</td>
									{/if}

									{/foreach}
									{else}
										<a class="js_hideTipOnMobile tooltip" title="{$LNG.ov_buildings_tip}" href="game.php?page=buildings">{$LNG.ov_buildings}</a></tr>
									{/if}

						</tbody>
					</table>
				</div>
					<div class="footer"></div>
			</div>

<style type="text/css">
.BBuild{
    background: transparent url(//i.imgur.com/qvplA7d.png) -170px -96px no-repeat;
	position: absolute;
    cursor: pointer;
    display: inline; text-align: left;
    width: 22px; height: 14px;
    top: -2px; left: -1px;
    z-index: 4;
}

.BBuild:hover{
	background: transparent url(//i.imgur.com/qvplA7d.png) -170px -110px no-repeat;
}

a.fastBuild:hover{
	background: transparent url(//i.imgur.com/qvplA7d.png) -170px -110px no-repeat;
}

.BCancel{
    background: transparent url(//i.imgur.com/qvplA7d.png) -208px -71px no-repeat;
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
    background: transparent url(//i.imgur.com/qvplA7d.png) -208px -88px no-repeat;
}
.BCancell{
    background: transparent url(//i.imgur.com/qvplA7d.png) -208px -71px no-repeat;
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
    background: transparent url(//i.imgur.com/qvplA7d.png) -208px -88px no-repeat;
}
.contentB {
    background: url(//i.imgur.com/DqCtELw.gif) repeat-y;
    margin: 0 0 20px 0;
    min-height: 115px;
    padding: 1px 0 0;
    position: relative;
}
</style>
</div><!--END buildingsOv-->
{/block}
