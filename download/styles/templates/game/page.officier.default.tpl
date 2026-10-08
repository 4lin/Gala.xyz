{block name="title" prepend}{$LNG.lm_officiers}{/block}
{block name="content"}
<div id="officer-page" class="officer-page officer-compact">
 <div id="officer-view-switch" class="officer-view-switch">
  <button id="officer-view-toggle" type="button" data-compact-label="{$LNG.of_view_compact|escape:'html'}" data-detailed-label="{$LNG.of_view_detailed|escape:'html'}" aria-label="{$LNG.of_view_detailed|escape:'html'}" title="{$LNG.of_view_detailed|escape:'html'}">
   <span class="officer-view-icon officer-icon-grid" aria-hidden="true"><i></i><i></i><i></i><i></i></span>
   <span class="officer-view-icon officer-icon-list" aria-hidden="true"><i></i><i></i><i></i><i></i></span>
  </button>
 </div>
 {if !empty($darkmatterList)}
 <h2>{$of_dm_trade}</h2>
 <div class="officer-grid">
 {foreach $darkmatterList as $ID => $Element}
 {include file="officer.card.tpl" timed=true}
 {/foreach}
 </div>
 {/if}
 {if $officierList}
 <h2 class="officer-section-title">{$LNG.of_offi}</h2>
 <div class="officer-grid">
 {foreach $officierList as $ID => $Element}
 {include file="officer.card.tpl" timed=false}
 {/foreach}
 </div>
 {/if}
</div>
{/block}
{block name="script"}
<script src="scripts/game/officier.js"></script>
{/block}

