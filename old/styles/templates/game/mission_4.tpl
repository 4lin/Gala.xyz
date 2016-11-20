{block name="title" prepend}{$LNG.tut_welcome}{/block}
{block name="content"}
  <div id="planet" class="shortHeader">
   <h2>{$LNG.tut_m4_name} - {$Si4}{$No4}</h2>
  </div>

  <div class="boxWrapper">
   <div class="tutHeader">
	<div id="tutList">
		<ul>
			<li><a id="tutorialBack" href="game.php?page=tutorial&mode=m1">{$Si1}{$No1}</a></li>
			<li><a id="tutorialBack" href="game.php?page=tutorial&mode=m2">{$Si2}{$No2}</a></li>
			<li><a id="tutorialBack" href="game.php?page=tutorial&mode=m3">{$Si3}{$No3}</a></li>
			<li><a id="tutorialBack" href="game.php?page=tutorial&mode=m4">{$Si4}{$No4}</a></li>
			<li><a id="tutorialBack" href="game.php?page=tutorial&mode=m5">{$Si5}{$No5}</a></li>
			<li><a id="tutorialBack" href="game.php?page=tutorial&mode=m6">{$Si6}{$No6}</a></li>
			<li><a id="tutorialBack" href="game.php?page=tutorial&mode=m7">{$Si7}{$No7}</a></li>
			<li><a id="tutorialBack" href="game.php?page=tutorial&mode=m8">{$Si8}{$No8}</a></li>
			<li><a id="tutorialBack" href="game.php?page=tutorial&mode=m9">{$Si9}{$No9}</a></li>
		</ul>
	</div>
   </div>

<table width="100%">
	<tr>
		<td class="k" colspan="3">
			<img src="{$dpath}gebaeude/202.png" class="pic" alt="">
		</td>
		<td class="k" colspan="7">
			<p>{$LNG.tut_m4_desc}</p>
		</td>
	</tr>
	<tr>
		<td class="k" colspan="10">
			<h3 style="text-align:left">{$LNG.tut_objects}:</h3>
				<ul id="aufgabe_liste" style="text-align:left">
					<li class="aufzaehlungszeichen">{$LNG.tut_m4_quest} {$Si_m4_1}{$No_m4_1}{$Si4}</li>
					<li class="aufzaehlungszeichen">{$LNG.tut_m4_quest2} {$Si_m4_2}{$No_m4_2}{$Si4}</li>
					<li class="aufzaehlungszeichen">{$LNG.tut_m4_quest3} {$Si_m4_3}{$No_m4_3}{$Si4}</li>
					<li class="aufzaehlungszeichen">{$LNG.tut_m4_quest4} {$Si_m4_4}{$No_m4_4}{$Si4}</li>
				</ul>
				<div style="color:orange;">{$LNG.tut_m4_gain}</div>
		</td>
	</tr>
	{if $Si4}
	<tr>
		<td colspan=9>
			<a href ="game.php?page=tutorial&mode=m5">
			<input class="btn_blue" type="submit" value="{$LNG.tut_go_to} {$LNG.tut_m5}" onclick="window.location = 'game.php?page=tutorial&mode=m5'"/>
			</a>
		</td>
	</tr>
	{/if}
	<tr>
	</tr>	
</table>
</div>
{/block}