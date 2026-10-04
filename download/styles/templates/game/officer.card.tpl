<article class="officer-card{if !$timed} officer-with-level{/if}">
 <div class="officer-portrait-column">
  <div class="officer-portrait tooltip" data-tooltip-content="{capture name=officerTooltip}<table class='research-tooltip-table'><tr><th>{$LNG.tech[$ID]|escape:'html'}{if !$timed} · {$LNG.of_lvl} {$Element.level}/{$Element.maxLevel}{/if}</th></tr><tr><td>{$LNG.shortDescription[$ID]|escape:'html'}</td></tr><tr><td>{foreach $Element.elementBonus as $BonusName => $Bonus}<div>{if $Bonus[0] < 0}-{else}+{/if}{if $Bonus[1] == 0}{abs($Bonus[0] * 100)}%{else}{floatval($Bonus[0])}{/if} {$LNG.bonus[$BonusName]|escape:'html'}</div>{/foreach}</td></tr><tr><td>{foreach $Element.costResources as $RessID => $RessAmount}<div>{$LNG.tech[$RessID]|escape:'html'}: {if $RessID == 921}<span style='color:{if $Element.costOverflow[$RessID] == 0}lime{else}red{/if}'>{$RessAmount|number}</span>{else}{$RessAmount|number}{/if}</div>{/foreach}</td></tr>{if $timed}<tr><td>{$LNG.in_dest_durati|escape:'html'}: {$Element.time|time}</td></tr>{/if}</table>{/capture}{$smarty.capture.officerTooltip|escape:'html'}">
   <a class="officer-portrait-link" href="#" onclick="return Dialog.info({$ID});"><img src="{$dpath}buildings/{$ID}.jpg" alt="{$LNG.tech[$ID]|escape:'html'}" width="{if $timed}72{else}100{/if}" height="{if $timed}72{else}100{/if}">{if !$timed}<span class="officer-level-overlay" title="{$LNG.of_lvl|escape:'html'} {$Element.level}"><span class="officer-level-number{if $Element.level >= $Element.maxLevel} officer-level-max{/if}">{$Element.level}/{$Element.maxLevel}</span></span>{/if}</a>
   {if $timed && $Element.timeLeft > 0}
   <span class="officer-image-time" title="{$LNG.of_active|escape:'html'}" id="time_{$ID}">{$Element.timeLeft|time}</span>
   {/if}
   {if !$timed}<span class="officer-name-overlay" title="{$LNG.tech[$ID]|escape:'html'}">{$LNG.tech[$ID]|escape:'html'}</span>{/if}

  </div>
  {if !$timed && $Element.maxLevel <= $Element.level}
  {elseif $Element.buyable}
  <form action="game.php?page=officier" method="post" class="build_form">
   <input type="hidden" name="id" value="{$ID}">
   <button type="submit" class="build_submit">{$LNG.of_recruit}</button>
  </form>
  {else}
  <span class="officer-unavailable">{$LNG.of_recruit}</span>
  {/if}
 </div>
 <div class="officer-card-content">
  <h3><a href="#" onclick="return Dialog.info({$ID});">{$LNG.tech[$ID]}</a></h3>
  {if !$timed}<div class="officer-level">{$LNG.of_lvl} {$Element.level}/{$Element.maxLevel}</div>{/if}
  <div class="officer-bonuses">
   {foreach $Element.elementBonus as $BonusName => $Bonus}
   <div>{if $Bonus[0] < 0}-{else}+{/if}{if $Bonus[1] == 0}{abs($Bonus[0] * 100)}%{else}{floatval($Bonus[0])}{/if} {$LNG.bonus[$BonusName]}</div>
   {/foreach}
  </div>
  <div class="officer-cost">
   {foreach $Element.costResources as $RessID => $RessAmount}
   <div>{$LNG.tech[$RessID]}: <b class="{if $Element.costOverflow[$RessID] == 0}officer-affordable{else}officer-unavailable{/if}">{$RessAmount|number}</b></div>
   {/foreach}
  </div>
  {if $timed}<div class="officer-duration">{$LNG.in_dest_durati}: {$Element.time|time}</div>{/if}
  <details class="officer-description"><summary>{$LNG.of_details}</summary><p>{$LNG.shortDescription[$ID]}</p></details>
 </div>
</article>
