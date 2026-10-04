{block name="title" prepend}{$LNG.lm_technology}{/block}
{block name="content"}
<div id="tech-tree-page">
<nav class="tech-tree-categories" role="tablist">
{foreach $TechTreeList as $elementID => $requireList}
{if !is_array($requireList)}<a role="tab" href="#tech-category-{$elementID}">{$LNG.tech.$requireList}</a>{/if}
{/foreach}
</nav>
{foreach $TechTreeList as $elementID => $requireList}
{if !is_array($requireList)}
{if $elementID != 0}</div>{/if}
<div class="tech-map-panel" id="tech-category-{$elementID}" role="tabpanel">
{else}
{assign var=ready value=true}
{foreach $requireList as $requireID => $NeedLevel}{if $NeedLevel.own < $NeedLevel.count}{assign var=ready value=false}{/if}{/foreach}
<article class="tech-map-network">
<svg class="tech-map-lines" aria-hidden="true"></svg>
<div class="tech-map-dependencies">
{foreach $requireList as $requireID => $NeedLevel}
<a class="tech-map-node tech-map-dependency {if $NeedLevel.own < $NeedLevel.count}requirement-missing{else}requirement-met{/if}" href="#" onclick="return Dialog.info({$requireID})">
<img src="{$dpath}buildings/{$requireID}.{if $requireID >=600 && $requireID <=699}jpg{else}png{/if}" alt="" width="40" height="40">
<span><strong>{$LNG.tech.$requireID}</strong><small>{$LNG.tt_lvl} {$NeedLevel.own|number} / {$NeedLevel.count|number}</small></span>
</a>
{/foreach}
</div>
<a class="tech-map-node tech-map-target {if $ready}requirement-met{else}requirement-missing{/if}" href="#" onclick="return Dialog.info({$elementID})">
<img src="{$dpath}buildings/{$elementID}.{if $elementID >=600 && $elementID <=699}jpg{else}png{/if}" alt="" width="48" height="48">
<span><strong>{$LNG.tech.$elementID}</strong><small>{$LNG.tt_lvl} {$TechLevels[$elementID]|number}</small></span>
</a>
</article>
{/if}
{/foreach}
</div>
</div>
{/block}
{block name="script" append}<script src="scripts/game/techtree-tabs.js?v=map-2"></script>{/block}
