<?php
echo "<tr>
	<td class=\"desc\">
		<div class=\"tit\">
			<img class=\"unit u21\" src=\"img/x.gif\" alt=\"方阵兵\" title=\"方阵兵\" />
			<a href=\"#\" onClick=\"return Popup(21,1);\"> 方阵兵</a>
			<span class=\"info\">（现有：".$village->unitarray['u21']."）</span>
		</div>
		<div class=\"details\">
			<img class=\"r1\" src=\"img/x.gif\" alt=\"木材\" title=\"木材\" />100|
			<img class=\"r2\" src=\"img/x.gif\" alt=\"粘土\" title=\"粘土\" />130|
			<img class=\"r3\" src=\"img/x.gif\" alt=\"铁矿\" title=\"铁矿\" />55|
			<img class=\"r4\" src=\"img/x.gif\" alt=\"粮食\" title=\"粮食\" />30|
			<img class=\"r5\" src=\"img/x.gif\" alt=\"粮食消耗\" title=\"粮食消耗\" />1|
			<img class=\"clock\" src=\"img/x.gif\" alt=\"训练时间\" title=\"训练时间\" />";
echo $generator->getTimeFormat(round($u21['time'] * ($bid19[$village->resarray['f'.$id]]['attri'] / 100) / SPEED));
echo "</div>
	</td>
	<td class=\"val\">
		<input type=\"text\" class=\"text\" name=\"t21\" value=\"0\" maxlength=\"4\">
	</td>
	<td class=\"max\">
		<a href=\"#\" onClick=\"document.snd.t21.value=".$technology->maxUnit(21)."; return false;\">(".$technology->maxUnit(21).")</a>
	</td>
	</tr>";
if ($technology->getTech(22))
{
	echo "<tr>
	<td class=\"desc\">
	<div class=\"tit\">
		<img class=\"unit u22\" src=\"img/x.gif\" alt=\"剑士\" title=\"剑士\" />
		<a href=\"#\" onClick=\"return Popup(22,1);\"> 剑士</a>
		<span class=\"info\">（现有：".$village->unitarray['u22']."）</span>
	</div>
	<div class=\"details\">
		<img class=\"r1\" src=\"img/x.gif\" alt=\"木材\" title=\"木材\" />140|
		<img class=\"r2\" src=\"img/x.gif\" alt=\"粘土\" title=\"粘土\" />150|
		<img class=\"r3\" src=\"img/x.gif\" alt=\"铁矿\" title=\"铁矿\" />185|
		<img class=\"r4\" src=\"img/x.gif\" alt=\"粮食\" title=\"粮食\" />60|
		<img class=\"r5\" src=\"img/x.gif\" alt=\"粮食消耗\" title=\"粮食消耗\" />1|
		<img class=\"clock\" src=\"img/x.gif\" alt=\"训练时间\" title=\"训练时间\" />";
	echo $generator->getTimeFormat(round($u22['time'] * ($bid19[$village->resarray['f'.$id]]['attri'] / 100) / SPEED));
	echo "</div>
	</td>
	<td class=\"val\">
		<input type=\"text\" class=\"text\" name=\"t22\" value=\"0\" maxlength=\"4\">
	</td>
	<td class=\"max\">
		<a href=\"#\" onClick=\"document.snd.t22.value=".$technology->maxUnit(22)."; return false;\">(".$technology->maxUnit(22).")</a>
	</td>
	</tr>";
}
?>