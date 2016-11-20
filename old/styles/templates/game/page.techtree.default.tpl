{block name="title" prepend}{$LNG.lm_technology}{/block}
{block name="content"}
{literal}
<script>
$('.accordion td ').eq(2).addClass('active'); $('.accordion span').eq(2).show(); $(".accordion td").click(function(){ $(this).next("span").slideToggle("slow") .siblings("span:visible").slideUp("slow"); $(this).toggleClass("active"); $(this).siblings("td").removeClass("active"); });
</script>
{/literal}
<table class="accordion" style="min-width:670px;width:670px;">
{foreach $TechTreeList as $elementID => $requireList}
{if !is_array($requireList)}

<tr>
	<th colspan="2">{$LNG.tech.$requireList}</th>
	<th>{$LNG.tt_requirements}</th>
</tr>

{else}
<tr>
	<td><span><a href="#" class="main" onclick="return Dialog.info({$elementID})"><img src="{$dpath}gebaeude/techtree/{$elementID}.{if $elementID >=600 && $elementID <= 699}jpg{else}png{/if}" width="25" height="25"></a></span></td>
	<td><span><a href="#" class="main" onclick="return Dialog.info({$elementID})">{$LNG.tech.$elementID}</a></span></td>
	<td><span>
	{if $requireList}
		{foreach $requireList as $requireID => $NeedLevel}
			<a href="#" onclick="return Dialog.info({$elementID})"><span style="color:{if $NeedLevel.own < $NeedLevel.count}red{else}lime{/if};">{$LNG.tech.$requireID} ({$LNG.tt_lvl} {min($NeedLevel.count, $NeedLevel.own)}/{$NeedLevel.count})</span></a>{if !$NeedLevel@last}<br>{/if}
		{/foreach}
	{/if}
	</span></td>
</tr>
{/if}
{/foreach}
</table>
{*<script>
$('#toggle').click(function(event){
    
    // find where the click originated from
    var trigger = event.target;
    
    // if it has a class of "sh"
    // THEN toggle the next row
    if(trigger.className == 'sh')
    {
        // toggle away
        $(trigger).closest('tr').next('.htr').toggle();
    }
});
</script>
<table id="toggle"><tr><td><img alt="Show/Hide" src="{$dpath}img/techtree/plus.png" class="sh">text</td></tr>
<tr class="htr"><td>content show</td></tr>
</table>

=======================

<link rel="stylesheet" href="styles/resource/css/ingame/accordionmenu.css" />
<script src="scripts/game/accordionmenu.js" type="text/javascript"></script>
<div id="acdnmenu" style="width:670px;height:390px;"><ul><li id="v_hm"><li></li></ul></li></ul></div>


=====================

                        <div id="acdnmenu" style="width:208px;height:390px;">
                            <ul>
                                <li style="display:none;"><a href="/">Home</a></li>
                                <li id="v_hm">Horizontal Menus
                                    <ul>
                                        <li><a href="/tooltip-menu">Tooltip Menu</a></li>
                                        <li><a href="/drop-down-menu">Drop Down Menu</a></li>
                                        <li><a href="/horizontal/tab-menu">Tab Menu</a></li>
                                        <li><a href="/horizontal/css-menu">CSS Menu</a></li>
                                        <li><a href="/horizontal/drop-down-menu">CSS Drop Down Menu</a></li>
                                    </ul>
                                </li>
                                <li id="v_vm">Vertical Menus
                                    <ul>
                                        <li><a href="/vertical/accordion-menu">Accordion Menu</a></li>
                                        <li><a href="/vertical/accordion-menu-css">Accordion Menu CSS</a></li>
                                        <li><a href="/vertical/vertical-menu">Vertical Menu</a></li>
                                    </ul>
                                </li>
                                <li id="v_sm">Single-Level Menus
                                    <ul>
                                        <li><a href="/horizontal/css-menus">CSS Menus</a></li>
                                        <li><a href="/horizontal/javascript-menu">Javascript Menus</a></li>
                                    </ul>
                                </li>
                                <li id="v_tt">Tooltip
                                    <ul>
                                        <li><a href="/tooltip/css-tooltip">CSS Tooltip</a></li>
                                        <li><a href="/tooltip/css3-tooltip">CSS3 Tooltip</a></li>
                                        <li><a href="/tooltip/javascript-tooltip">Javascript Tooltip</a></li>
                                    </ul>
                                </li>
                                <li id="v_is">Image Sliders
                                    <ul>
                                        <li><a href="/javascript-image-slider">Javascript Image Slider</a>
                                        </li>
                                        <li>Zoom Slider
                                            <ul>
                                                <li><a href="/zoom-slider">Demo 1</a></li>
                                                <li><a href="/slideshow/zoom-slider-demo2">Demo 2</a></li>
                                            </ul>
                                        </li>
                                        <li>Thumbnail Slider
                                            <ul>
                                                <li><a href="/jquery-slider">jQuery Slider</a></li>
                                                <li><a href="/slider/jquery-slideshow">jQuery Slideshow</a></li>
                                                <li><a href="/slider/content-slider">Content Slider</a></li>
                                                <li><a href="/slider/slider-with-tooltip">Slider with Tooltip</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li>Tabs
                                    <ul>
                                        <li><a href="/tabbed-content">Tabbed Content</a></li>
                                        <li><a href="/jquery-tabs">McTabs - jQuery Tabs</a></li>
                                        <li><a href="/tabs/ajax-tabs">McTabs - Ajax</a></li>
                                    </ul>
                                </li>
                                <li><a href="/color-picker">Color Picker</a></li>
                            </ul>
                        </div>


=======================


<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/dark-hive/jquery-ui.css" />
<script>
$(function() {
$( "#accordion" ).accordion();
});
</script>
<div id="accordion">
<h3>aaa</h3>
<div><p></p></div>
</div>*}
{/block}