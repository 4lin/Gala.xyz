{block name="title" prepend}{$LNG.lm_empire}{/block}
{block name="content"}
<div id="imperium-tabs" role="tablist">
<button type="button" role="tab" id="imperium-tab-empire" aria-controls="imperium-panel-empire" data-imperium-section="empire" aria-selected="true">{$LNG.lv_imperium_title}</button>
<button type="button" role="tab" id="imperium-tab-resources" aria-controls="imperium-panel-resources" data-imperium-section="resources" aria-selected="false">{$LNG.lv_resources}</button>
<button type="button" role="tab" id="imperium-tab-buildings" aria-controls="imperium-panel-buildings" data-imperium-section="buildings" aria-selected="false">{$LNG.lv_buildings}</button>
<button type="button" role="tab" id="imperium-tab-technology" aria-controls="imperium-panel-technology" data-imperium-section="technology" aria-selected="false">{$LNG.lv_technology}</button>
<button type="button" role="tab" id="imperium-tab-ships" aria-controls="imperium-panel-ships" data-imperium-section="ships" aria-selected="false">{$LNG.lv_ships}</button>
<button type="button" role="tab" id="imperium-tab-defenses" aria-controls="imperium-panel-defenses" data-imperium-section="defenses" aria-selected="false">{$LNG.lv_defenses}</button>
</div>
<table id="imperium-table">
	<tbody id="imperium-panel-empire" role="tabpanel" aria-labelledby="imperium-tab-empire">
		<tr>
			<th colspan="{$colspan}">{$LNG.lv_imperium_title}</th>
		</tr>
		<tr>
			<td style="width:48px">{$LNG.lv_planet}</td>
			<td style="width:48px;font-size: 50px;"></td>
			{foreach $planetList.image as $planetID => $image}
			<td style="width:100px"><a href="game.php?page=overview&amp;cp={$planetID}"><img width="48" height="48" border="0" src="{$dpath}planets/small/s_{$image}.gif"></a></td>
			{/foreach}
		</tr>
		<tr>
			<td>{$LNG.lv_name}</td>
			<td>{$LNG.lv_total}</td>
			{foreach $planetList.name as $name}
				<td>{$name}</td>
			{/foreach}
		</tr>
		<tr>
			<td>{$LNG.lv_coords}</td>
			<td>-</td>
			{foreach $planetList.coords as $coords}
				<td><a href="game.php?page=galaxy&amp;galaxy={$coords.galaxy}&amp;system={$coords.system}">[{$coords.galaxy}:{$coords.system}:{$coords.planet}]</a></td>
			{/foreach}
		</tr>
		<tr>
			<td>{$LNG.lv_fields}</td>
			<td>-</td>
			{foreach $planetList.field as $field}
				<td>{$field.current} / {$field.max}</td>
			{/foreach}
		</tr>
		</tbody>
<tbody id="imperium-panel-resources" role="tabpanel" aria-labelledby="imperium-tab-resources">
<tr>
			<th colspan="{$colspan}">
				<img src="styles/resource/images/game/external/araiTz7.gif" alt=""/>{$LNG.lv_resources}
			</th>
		</tr>
        <tr class="imperium-column-headings"><th></th><th>{$LNG.lv_total}</th>{foreach $planetList.name as $name}<th>{$name|escape:'html'}</th>{/foreach}</tr>

		
		{foreach $planetList.resource as $elementID => $resourceArray name=trloop}
		<tr>
			<td>{$LNG.tech.$elementID}</td>
			<td>{array_sum($resourceArray)|number}</td>
			{foreach $resourceArray as $planetID => $resource}
				<td>{$resource|number}</td>
			{/foreach}
		</tr>
		{/foreach}

		</tbody>
<tbody id="imperium-panel-buildings" role="tabpanel" aria-labelledby="imperium-tab-buildings">
<tr>
			<th colspan="{$colspan}">{$LNG.lv_buildings}</th>
		</tr>
        <tr class="imperium-column-headings"><th></th><th>{$LNG.lv_total}</th>{foreach $planetList.name as $name}<th>{$name|escape:'html'}</th>{/foreach}</tr>

		{foreach $planetList.build as $elementID => $buildArray}
		<tr>
			<td>{$LNG.tech.$elementID}</td>
			<td>{array_sum($buildArray)|number}</td>
			{foreach $buildArray as $planetID => $build}
				<td>{$build|number}</td>
			{/foreach}
		</tr>
		{/foreach}
		</tbody>
<tbody id="imperium-panel-technology" role="tabpanel" aria-labelledby="imperium-tab-technology">
<tr>
			<th colspan="{$colspan}">{$LNG.lv_technology}</th>
		</tr>
        <tr class="imperium-column-headings"><th></th><th>{$LNG.lv_total}</th>{foreach $planetList.name as $name}<th>{$name|escape:'html'}</th>{/foreach}</tr>

		{foreach $planetList.tech as $elementID => $tech}
		<tr>
			<td>{$LNG.tech.$elementID}</td>
			<td>{$tech|number}</td>
			{foreach $planetList.name as $name}
				<td>{$tech|number}</td>
			{/foreach}
		</tr>
		{/foreach}
		</tbody>
<tbody id="imperium-panel-ships" role="tabpanel" aria-labelledby="imperium-tab-ships">
<tr>
			<th colspan="{$colspan}">{$LNG.lv_ships}</th>
		</tr>
        <tr class="imperium-column-headings"><th></th><th>{$LNG.lv_total}</th>{foreach $planetList.name as $name}<th>{$name|escape:'html'}</th>{/foreach}</tr>

		{foreach $planetList.fleet as $elementID => $fleetArray}
		<tr>
			<td>{$LNG.tech.$elementID}</td>
			<td>{array_sum($fleetArray)|number}</td>
			{foreach $fleetArray as $planetID => $fleet}
				<td>{$fleet|number}</td>
			{/foreach}
		</tr>
		{/foreach}
		</tbody>
<tbody id="imperium-panel-defenses" role="tabpanel" aria-labelledby="imperium-tab-defenses">
<tr>
			<th colspan="{$colspan}">{$LNG.lv_defenses}</th>
		</tr>
        <tr class="imperium-column-headings"><th></th><th>{$LNG.lv_total}</th>{foreach $planetList.name as $name}<th>{$name|escape:'html'}</th>{/foreach}</tr>

		{foreach $planetList.defense as $elementID => $fleetArray}
		<tr>
			<td>{$LNG.tech.$elementID}</td>
			<td>{array_sum($fleetArray)|number}</td>
			{foreach $fleetArray as $planetID => $fleet}
				<td>{$fleet|number}</td>
			{/foreach}
		</tr>
		{/foreach}
	</tbody>
</table>
{/block}

{block name="script" append}<script src="scripts/game/imperium.js"></script>{/block}
