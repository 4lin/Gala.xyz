{block name="title" prepend}{$LNG.lm_overview}{/block}
{block name="script" append}{/block}
{block name="content"}
<div id="overviewOv">
	<div id="planetImg" style="background-image:url({$dpath}planets/{$planetimage}.jpg);">
        <div id="detailWrapper">
                        <div id="header_text">
                            <h2>
                                <a href="#" onclick="return Dialog.PlanetAction();">
                                    <p class="planetNameOverview">
                                        {$LNG.lm_overview} - 
                                    </p>
                                        <span id="planetNameHeader">
                                            {$planetname}
                                        </span>
                                            <span class="edit tooltip" title="{$LNG.ov_planetmenu}"></span>
                                </a>
                            </h2>
                            
                            <div id="moon" style="position: absolute;left: 30px;">
                                {if $Moon}
                                    <a href="game.php?page=overview&amp;cp={$Moon.id}&amp;re=0" class="tooltip" title="{$Moon.name}">
                                        <img class="fade" src="styles/resource/images/game/external/lMgUNke.png" height="80" width="80" alt="{$Moon.name} ({$LNG.fcm_moon})">
                                    </a><br />
                                    {else}&nbsp;
                                {/if}
                            </div>
                                

                        </div>
                            <div id="detail" class="detail_screen">
                                <div id="techDetailLoading"></div>
                            </div>

                        <div id="planetdata">
                            <div class="overlay">
                                <div id="planetDetails">
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td class="desc" >
                                                <span id="diameterField">{$LNG.ov_diameter}</span>
                                            </td>

                                            <td class="data">
                                                <span id="diameterContentField">{$planet_diameter} {$LNG.ov_distance_unit} (<a class="tooltip" title="{$LNG.ov_developed_fields}">{$planet_field_current}</a> / <a class="tooltip" title="{$LNG.ov_max_developed_fields}">{$planet_field_max}</a> {$LNG.ov_fields})</span>
                                            </td>
                                        </tr>
                                
                                        <tr>
                                            <td class="desc">
                                                <span id="temperatureField">{$LNG.ov_temperature}</span>
                                            </td>
                                    
                                            <td class="data">
                                                <span id="temperatureContentField">{$LNG.ov_aprox} {$planet_temp_min}{$LNG.ov_temp_unit} {$LNG.ov_to} {$planet_temp_max}{$LNG.ov_temp_unit}</span>
                                            </td>
                                        </tr>
                                
                                        <tr>
                                            <td class="desc">
                                                <span id="positionField">{$LNG.ov_position}</span>
                                            </td>
                                    
                                            <td class="data">
                                                <span id="positionContentField"><a href="game.php?page=galaxy&amp;galaxy={$galaxy}&amp;system={$system}">[{$galaxy}:{$system}:{$planet}]</a></span>
                                            </td>
                                        </tr>
                                        {if isModuleAvailable(25)}
                                        <tr>
                                            <td class="desc">
                                                <span id="scoreField">{$LNG.ov_points}</span>
                                            </td>
                                    
                                            <td class="data">
                                                <span id="scoreContentField">{$rankInfo}</span>
                                            </td>
                                        </tr>
                                        {/if}

                                        {if !empty($chatOnline)}
                                        <tr>
                                            <td style="desc">
                                                <span id="chatContentField">
                                                    {$LNG.ov_chat_online}
                                                </span>
                                            </td>
                                            
                                            <td class="data">
                                                <span id="chatContentField">
                                                    {foreach $chatOnline as $Name}{if !$Name@first}|&nbsp;{/if}<a href="?page=chat">{$Name}</a>{/foreach}
                                                </span>
                                            </td>
                                        </tr>
                                        {/if}

                                        <tr>
                                            <td style="desc">
                                                <span id="adminField">
                                                    Admins:
                                                    {$LNG.ov_admins_online}
                                                </span>
                                            </td>
                                            
                                            <td class="data">
                                                <span id="adminContentField">
                                                    {foreach $AdminsOnline as $ID => $Name}{if !$Name@first}&nbsp;&bull;&nbsp;{/if}
                                                    <a href="#" class="tooltip" data-tooltip-content="{capture name=gameTooltip14}{$LNG.mg_send_new}{/capture}{$smarty.capture.gameTooltip14|escape:'html'}" onclick="return Dialog.PM({$ID})">{$Name}</a>
                                                    {foreachelse}None{$LNG.ov_no_admins_online}
                                                    {/foreach}
                                                </span>
                                            </td>
                                        </tr>
                                    
                                        {if $teamspeakData !== false}
                                        <tr>
                                            <td style="desc">
                                                <span id ="tSpeak">
                                                    {$LNG.ov_teamspeak}
                                                </span>
                                            </td>
                                            
                                            <td class="data">
                                                <span id="tSpeakContentField">
                                                    {if $teamspeakData.error}{$teamspeakData.error}{else}
                                                    <a href="{$teamspeakData.url}">{$LNG.ov_teamspeak_connect}</a> &bull; {$LNG.ov_teamspeak_online}: {$teamspeakData.current}/{$teamspeakData.max}
                                                    {/if}
                                                </span>
                                            </td>
                                        </tr>
                                        {/if}
                                        {if $is_news && !empty($news)}
                                        <tr class="overview-news-row"><td colspan="2">
                                            <div class="overview-news-ticker"><div class="overview-news-line">
                                                {if !empty($newsTitle)}<strong>{$newsTitle|escape}:</strong> {/if}<span>{$news}</span>
                                            </div></div>
                                        </td></tr>
                                        {/if}
                                    </table>
                                </div>
                            </div>
                        </div>
        </div><!--detailWrapper-->
    </div><!--planetImg-->

	<div class="c-left"></div>
	<div class="c-right"></div>

                <div id="overviewBottom">


    {if $ref_active}
    <table style="width:645px;">
        <tr>
            <th colspan="3">
                <label for="referral">{$LNG.ov_reflink} <a href="#" class="ref_info tooltip" 
data-tooltip-content="{capture name=gameTooltip15}<table>
        {foreach $RefLinks as $RefID => $RefLink}
        <tr>
            <td colspan='2'>
                <a href='#' onclick='return Dialog.Playercard({$RefID}, '{$RefLink.username}');'>{$RefLink.username}</a>
            </td>
            <td>{{$RefLink.points|number}} / {$ref_minpoints|number}

        {foreachelse}
        <tr>
            <td>
                {$LNG.ov_noreflink}
            </td>
        </tr>
        {/foreach}
                </table>{/capture}{$smarty.capture.gameTooltip15|escape:'html'}"></a></label>
            </th>
        </tr>
        <tr>
            <td colspan="2">
                <input id="referral" type="text" value="{$path}index.php?ref={$userid}" readonly="readonly" style="width:645px;" />
            </td>
        </tr>
    </table>
    {/if}

                    <div class="content-box-s">
                        <div class="header">
                          <h3>{$LNG.lm_buildings}</h3>
                        </div>  

                        <div class="content">
                         <table cellpadding="0" cellspacing="0" class="construction active">
                         <tbody>   
                            {if $buildInfo.buildings}
                            <tr><th colspan="4">{$LNG.tech[$buildInfo.buildings['id']]} ({$buildInfo.buildings['level']})</th></tr>
                            <tr class="data">
                               <td class="first" colspan="1">
                                <div class="overview-construction-image" data-duration="{$buildInfo.buildings['duration']}">
                                    <a class="js_hideTipOnMobile tooltip" title="{$LNG.tech[$buildInfo.buildings['id']]} ({$buildInfo.buildings['level']})" href="game.php?page=buildings">
                                        <img src="{$dpath}buildings/{$buildInfo.buildings['id']}.png" width="50" height="50" alt="">
                                    </a>
                                    <div class="overview-construction-fill" aria-hidden="true"></div>
                                    <div class="timer" data-time="{$buildInfo.buildings['timeleft']}">{$buildInfo.buildings['starttime']}</div>
                                </div>
                                </td>
                                <td class="desc ausbau">{$LNG.bd_build_next_level} {$buildInfo.buildings['level']}</td>
                            </tr>
                                {else}
                            <tr>
                                <td colspan="2" class="idle">
                                    <a class="js_hideTipOnMobile tooltip" title="{$LNG.ov_buildings_tip}" href="game.php?page=buildings">
                                        <span class="ov_txt">
                                            {$LNG.ov_buildings}
                                        </span>
                                    </a>
                                </td>
                            </tr>
                            {/if}
                         </tbody>
                         </table>
                        </div>
                        <div class="footer"></div>
                    </div>

                    <div class="content-box-s">
                        <div class="header">
                            <h3>{$LNG.lm_research}</h3>
                        </div>
                    
                        <div class="content">    
                            <table cellspacing="0" cellpadding="0" class="construction active">
                             <tbody>
                                {if $buildInfo.tech}
                                <tr><th>{$LNG.tech[$buildInfo.tech['id']]} ({$buildInfo.tech['level']})</th></tr>
                                <tr class="data">
                                    <td class="first" colspan="3">
                                        <div class="overview-research-row">
<div class="overview-construction-image" data-duration="{$buildInfo.tech['duration']}">
                                        <a class="js_hideTipOnMobile tooltip" title="Subiendo {$LNG.tech[$buildInfo.tech['id']]} al nivel {$buildInfo.tech['level']}" href="game.php?page=research">
                                            <img src="{$dpath}buildings/{$buildInfo.tech['id']}.png" width="50" height="50" alt="">
                                        </a>
                                            <div class="overview-construction-fill" aria-hidden="true"></div>
                                            <div class="timer" data-time="{$buildInfo.tech['timeleft']}">{$buildInfo.tech['starttime']}</div>
                                        </div>
<span class="overview-construction-description">{$LNG.bd_tech_next_level} {$buildInfo.tech['level']}</span>
                                        </div>
                                    </td>
                                </tr>
                                    {else}
                                <tr>
                                    <td colspan="2" class="idle">
                                        <a class="js_hideTipOnMobile tooltip" title="{$LNG.ov_research_tip}" href="game.php?page=research">
                                            <span class="ov_txt">
                                                {$LNG.ov_research}
                                            </span>
                                        </a>
                                    </td>
                                </tr>
                                {/if} 
                             </tbody>
                            </table>
                        </div>
                        <div class="footer"></div>
                    </div>
                
                    <div class="content-box-s">
                        <div class="header">
                            <h3>{$LNG.lm_shipshard}</h3>
                        </div>
                    
                        <div class="content">    
                            <table cellspacing="0" cellpadding="0" class="construction active">
                             <tbody>
                                {if $buildInfo.fleet}
                                <tr><th>{$LNG.tech[$buildInfo.fleet['id']]} ({$buildInfo.fleet['level']})</th></tr>
                                <tr class="data">
                                    <td class="first">
                                        <div class="overview-research-row overview-hangar-row">
                                            <div class="overview-construction-image" data-duration="{$buildInfo.fleet['time']}">
                                                <a class="js_hideTipOnMobile tooltip" title="{$LNG.tech[$buildInfo.fleet['id']]|escape:'html'} ({$buildInfo.fleet['level']})" href="game.php?page=shipyard">
                                                    <img src="{$dpath}buildings/{$buildInfo.fleet['id']}.png" width="50" height="50" alt="">
                                                </a>
                                                <div class="overview-construction-fill" aria-hidden="true"></div>
                                                <div class="timer" data-time="{$buildInfo.fleet['timeleft']}">{$buildInfo.fleet['starttime']}</div>
                                            </div>
                                            <span class="overview-construction-description">{$LNG.rs_amount} {$buildInfo.fleet['level']}</span>
                                        </div>
                                    </td>
                                </tr>
                                    {else}
                                <tr>
                                <td colspan="2" class="idle">
                                    <a class="js_hideTipOnMobile tooltip" title="{$LNG.ov_shipyard_tip}" href="game.php?page=shipyard">
                                        <span class="ov_txt">
                                            {$LNG.ov_shipyard}
                                        </span>
                                    </a>
                                </td>
                                </tr>
                                {/if}   
                             </tbody>
                            </table>
                        </div>
                        <div class="footer"></div>
                    </div>
                </div><!-- END overviewBottom -->


</div><!--END overviewOv-->
        <!-- RIGHTMENU -->
        <div class="overview-sidebar">
        <div id="rechts">
            <div id="norm">
                <div id="myWorlds">
                    <div id="myWorlds">
                        <div id="countColonies">
                            <p class="textCenter">
                                <span>{$LNG.fl_my_planets}</span>
                            </p>
                        </div>
                        
                        <div id="planetList">
                            <div class="smallplanet ">
                                {if $AllPlanets}
                                <table style="width:100%;border-collapse:separate;border-spacing:3px 3px;">
                                {foreach $AllPlanets as $PlanetRow}
                                {if ($PlanetRow@iteration % $themeSettings.PLANET_ROWS_ON_OVERVIEW) === 1}<tr>{/if}
                                    <td>
                                {$PlanetRow.build}
                                        <a class="planetlink js_hideTipOnMobile interacTip" title="{$PlanetRow.name}" href="game.php?page=overview&amp;cp={$PlanetRow.id}">
                                            <img class="planetPic js_replace2x" src="{$dpath}planets/small/s_{$PlanetRow.image}.gif" width="48" height ="48" alt=""><br />
                                                <p>[ {$PlanetRow.name} ]</p>
                                        </a>
                                    </td>
                                </tr>
                                {if $PlanetRow@last && $PlanetRow@total > 1 && ($PlanetRow@iteration % $themeSettings.PLANET_ROWS_ON_OVERVIEW) !== 0}
                                {$to = $themeSettings.PLANET_ROWS_ON_OVERVIEW - ($PlanetRow@iteration % $themeSettings.PLANET_ROWS_ON_OVERVIEW)}
                                {for $foo=1 to $to}
                                    <td class="transparent">&nbsp;</td>
                                {/for}
                                {/if}
                                {/foreach}
                                </table>
                                {else}&nbsp;
                                {/if}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div><!-- END rechts -->
        
        <div id="banner_skyscraper">
            <a class="tooltip" title="Oficial" href="game.php?page=officier" >
                <img src="styles/resource/images/game/external/sETgKTg.jpg" alt=""/>
            </a>
        </div><!-- END Banner -->
        </div><!-- overview-sidebar -->
        <!-- END RIGHTMENU -->

{/block}
{block name="script" append}
    <script src="scripts/game/overview.js"></script>
{/block}
