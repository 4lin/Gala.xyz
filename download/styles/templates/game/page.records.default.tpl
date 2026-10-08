{block name="title" prepend}{$LNG.lm_records}{/block}
{block name="content"}
<div id="records-page">
 <p class="records-updated">{$LNG.rec_last_update_on}: {$update}</p>
 {foreach $recordCategories as $categoryID => $category}
 <details class="records-category" name="records-category"{if $categoryID == 'buildings'} open{/if}>
  <summary>{$category.title|escape:'html'}</summary>
  <table>
   <thead><tr>
    <th scope="col">{$category.title|escape:'html'}</th>
    <th scope="col">{$LNG.rec_players}</th>
    <th scope="col">{$category.label|escape:'html'}</th>
   </tr></thead>
   <tbody>
   {foreach $category.items as $elementID => $elementRow}
   <tr>
    <td>{$LNG.tech.{$elementID}|escape:'html'}</td>
    {if !empty($elementRow)}
    <td>{foreach $elementRow as $user}<a href="#" onclick="return Dialog.Playercard({$user.userID});">{$user.username|escape:'html'}</a>{if !$user@last}<br>{/if}{/foreach}</td>
    <td>{$elementRow[0].level|number}</td>
    {else}
    <td>-</td><td>-</td>
    {/if}
   </tr>
   {/foreach}
   </tbody>
  </table>
 </details>
 {/foreach}
</div>
{/block}