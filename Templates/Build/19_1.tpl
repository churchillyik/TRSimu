<?php 
echo "<tr>
	<td class=\"desc\">
		<div class=\"tit\">
			<img class=\"unit u1\" src=\"img/x.gif\" alt=\"古罗马步兵\" title=\"古罗马步兵\" />
			<a href=\"#\" onClick=\"return Popup(1,1);\"> 古罗马步兵</a>
			<span class=\"info\">（现有：".$village->unitarray['u1']."）</span>
		</div>
		<div class=\"details\">
			<img class=\"r1\" src=\"img/x.gif\" alt=\"木材\" title=\"木材\" />120|
			<img class=\"r2\" src=\"img/x.gif\" alt=\"粘土\" title=\"粘土\" />100|
			<img class=\"r3\" src=\"img/x.gif\" alt=\"铁矿\" title=\"铁矿\" />150|
			<img class=\"r4\" src=\"img/x.gif\" alt=\"粮食\" title=\"粮食\" />30|
			<img class=\"r5\" src=\"img/x.gif\" alt=\"粮食消耗\" title=\"粮食消耗\" />1|
			<img class=\"clock\" src=\"img/x.gif\" alt=\"训练时间\" title=\"训练时间\" />";
echo $generator->getTimeFormat(round($u1['time'] * ($bid19[$village->resarray['f'.$id]]['attri'] / 100) / SPEED));
echo "</div>
	</td>
	<td class=\"val\">
		<input type=\"text\" class=\"text\" name=\"t1\" value=\"0\" maxlength=\"4\">
	</td>
	<td class=\"max\">
		<a href=\"#\" onClick=\"document.snd.t1.value=".$technology->maxUnit(1)."; return false;\">(".$technology->maxUnit(1).")</a>
	</td>
	</tr>";
if ($technology->getTech(2))
{
	echo "<tr>
	<td class=\"desc\">
		<div class=\"tit\">
			<img class=\"unit u2\" src=\"img/x.gif\" alt=\"禁卫兵\" title=\"禁卫兵\" />
			<a href=\"#\" onClick=\"return Popup(2,1);\"> 禁卫兵</a>
			<span class=\"info\">（现有：".$village->unitarray['u2']."）</span>
		</div>
		<div class=\"details\">
			<img class=\"r1\" src=\"img/x.gif\" alt=\"木材\" title=\"木材\" />100|
			<img class=\"r2\" src=\"img/x.gif\" alt=\"粘土\" title=\"粘土\" />130|
			<img class=\"r3\" src=\"img/x.gif\" alt=\"铁矿\" title=\"铁矿\" />160|
			<img class=\"r4\" src=\"img/x.gif\" alt=\"粮食\" title=\"粮食\" />70|
			<img class=\"r5\" src=\"img/x.gif\" alt=\"粮食消耗\" title=\"粮食消耗\" />1|
			<img class=\"clock\" src=\"img/x.gif\" alt=\"训练时间\" title=\"训练时间\" />";
	echo $generator->getTimeFormat(round($u1['time'] * ($bid19[$village->resarray['f'.$id]]['attri'] / 100) / SPEED));
	echo "</div>
	</td>
	<td class=\"val\">
		<input type=\"text\" class=\"text\" name=\"t2\" value=\"0\" maxlength=\"4\">
	</td>
	<td class=\"max\">
		<a href=\"#\" onClick=\"document.snd.t2.value=".$technology->maxUnit(2)."; return false;\">(".$technology->maxUnit(2).")</a>
	</td>
	</tr>";
}
if ($technology->getTech(3))
{
	echo "<tr>
	<td class=\"desc\">
		<div class=\"tit\">
			<img class=\"unit u3\" src=\"img/x.gif\" alt=\"帝国兵\" title=\"帝国兵\" />
			<a href=\"#\" onClick=\"return Popup(3,1);\"> 帝国兵</a>
			<span class=\"info\">（现有： ".$village->unitarray['u3']."）</span>
		</div>
		<div class=\"details\">
			<img class=\"r1\" src=\"img/x.gif\" alt=\"木材\" title=\"木材\" />150|
			<img class=\"r2\" src=\"img/x.gif\" alt=\"粘土\" title=\"粘土\" />160|
			<img class=\"r3\" src=\"img/x.gif\" alt=\"铁矿\" title=\"铁矿\" />210|
			<img class=\"r4\" src=\"img/x.gif\" alt=\"粮食\" title=\"粮食\" />80|
			<img class=\"r5\" src=\"img/x.gif\" alt=\"粮食消耗\" title=\"粮食消耗\" />1|
			<img class=\"clock\" src=\"img/x.gif\" alt=\"训练时间\" title=\"训练时间\" />";
	echo $generator->getTimeFormat(round($u3['time'] * ($bid19[$village->resarray['f'.$id]]['attri'] / 100) / SPEED));
	echo "</div>
	</td>
	<td class=\"val\">
		<input type=\"text\" class=\"text\" name=\"t3\" value=\"0\" maxlength=\"4\">
	</td>
	<td class=\"max\">
		<a href=\"#\" onClick=\"document.snd.t3.value=".$technology->maxUnit(3)."; return false;\">(".$technology->maxUnit(3).")</a>
	</td>
	</tr>";
}
?>