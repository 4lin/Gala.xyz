{block name="title" prepend}{$LNG.tut_welcome}{/block}
{block name="content"}
  <div id="planet" class="shortHeader">
   <h2>{$tut_welcome}</h2>
  </div>

  <div class="boxWrapper">
   <div class="tutHeader">

   </div>
	<table width="100%">
	<tbody>
		<tr>
			<td colspan="10" class="table519">
			<p>{$LNG.tut_welcom_desc}</p>
				<ul id="aufgabe_liste" style="text-align:left">
					<li class="aufzaehlungszeichen">{$LNG.tut_welcom_desc2}</li>
					<li class="aufzaehlungszeichen">{$LNG.tut_welcom_desc3}</li>
					<li class="aufzaehlungszeichen">{$LNG.tut_welcom_desc4}</li>
					<li class="aufzaehlungszeichen">{$LNG.tut_welcom_desc5}</li>
				</ul>
			</td>
		</tr>
		<tr>
			<td colspan="10">
				<span class="contentz"><input class="btn_blue" type="submit" value="{$LNG.tut_go}" onclick="window.location='?page=tutorial&mode=m1'"/></span>
			</td>
		</tr>
	</tbody>
	</table>

  </div>
{/block}