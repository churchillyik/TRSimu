<?php
echo "<tr>
	<td class=\"desc\">
		<div class=\"tit\">
			<img class=\"unit u11\" src=\"img/x.gif\" alt=\"棍棒兵\" title=\"棍棒兵\" />
			<a href=\"#\" onClick=\"return Popup(11,1);\"> 棍棒兵</a>
			<span class=\"info\">（现有：".$village->unitarray['u11']."）</span>
		</div>
		<div class=\"details\">
			<img class=\"r1\" src=\"img/x.gif\" alt=\"木材\" title=\"木材\" />95|
			<img class=\"r2\" src=\"img/x.gif\" alt=\"粘土\" title=\"粘土\" />75|
			<img class=\"r3\" src=\"img/x.gif\" alt=\"铁矿\" title=\"铁矿\" />40|
			<img class=\"r4\" src=\"img/x.gif\" alt=\"粮食\" title=\"粮食\" />40|
			<img class=\"r5\" src=\"img/x.gif\" alt=\"粮食消耗\" title=\"粮食消耗\" />1|
			<img class=\"clock\" src=\"img/x.gif\" alt=\"训练时间\" title=\"训练时间\" />";
echo $generator->getTimeFormat(round($u11['time'] * ($bid19[$village->resarray['f'.$id]]['attri'] / 100) / SPEED));
echo "</div>
	</td>
	<td class=\"val\">
		<input type=\"text\" class=\"text\" name=\"t11\" value=\"0\" maxlength=\"4\">
	</td>
	<td class=\"max\">
		<a href=\"#\" onClick=\"document.snd.t11.value=".$technology->maxUnit(11)."; return false;\">(".$technology->maxUnit(11).")</a>
	</td>
	</tr>";
if ($technology->getTech(12))
{
	echo "<tr>
	<td class=\"desc\">
		<div class=\"tit\">
			<img class=\"unit u12\" src=\"img/x.gif\" alt=\"矛兵\" title=\"矛兵\" />
			<a href=\"#\" onClick=\"return Popup(12,1);\"> 矛兵</a>
			<span class=\"info\">（现有：".$village->unitarray['u12']."）</span>
		</div>
		<div class=\"details\">
			<img class=\"r1\" src=\"img/x.gif\" alt=\"木材\" title=\"木材\" />145|
			<img class=\"r2\" src=\"img/x.gif\" alt=\"粘土\" title=\"粘土\" />70|
			<img class=\"r3\" src=\"img/x.gif\" alt=\"铁矿\" title=\"铁矿\" />85|
			<img class=\"r4\" src=\"img/x.gif\" alt=\"粮食\" title=\"粮食\" />40|
			<img class=\"r5\" src=\"img/x.gif\" alt=\"粮食消耗\" title=\"粮食消耗\" />1|
			<img class=\"clock\" src=\"img/x.gif\" alt=\"训练时间\" title=\"训练时间\" />";
	echo $generator->getTimeFormat(round($u12['time'] * ($bid19[$village->resarray['f'.$id]]['attri'] / 100) / SPEED));
	echo "</div>
	</td>
	<td class=\"val\">
		<input type=\"text\" class=\"text\" name=\"t12\" value=\"0\" maxlength=\"4\">
	</td>
	<td class=\"max\">
		<a href=\"#\" onClick=\"document.snd.t12.value=".$technology->maxUnit(12)."; return false;\">(".$technology->maxUnit(12).")</a>
	</td>
	</tr>";
}
if ($technology->getTech(13))
{
	echo "<tr>
	<td class=\"desc\">
		<div class=\"tit\">
			<img class=\"unit u13\" src=\"img/x.gif\" alt=\"斧头兵\" title=\"斧头兵\" />
			<a href=\"#\" onClick=\"return Popup(13,1);\"> 斧头兵</a>
			<span class=\"info\">（现有：".$village->unitarray['u13']."）</span>
		</div>
		<div class=\"details\">
			<img class=\"r1\" src=\"img/x.gif\" alt=\"木材\" title=\"木材\" />130|
			<img class=\"r2\" src=\"img/x.gif\" alt=\"粘土\" title=\"粘土\" />120|
			<img class=\"r3\" src=\"img/x.gif\" alt=\"铁矿\" title=\"铁矿\" />170|
			<img class=\"r4\" src=\"img/x.gif\" alt=\"粮食\" title=\"粮食\" />70|
			<img class=\"r5\" src=\"img/x.gif\" alt=\"粮食消耗\" title=\"粮食消耗\" />1|
			<img class=\"clock\" src=\"img/x.gif\" alt=\"训练时间\" title=\"训练时间\" />";
	echo $generator->getTimeFormat(round($u13['time'] * ($bid19[$village->resarray['f'.$id]]['attri'] / 100) / SPEED));
	echo "</div>
	</td>
	<td class=\"val\">
		<input type=\"text\" class=\"text\" name=\"t13\" value=\"0\" maxlength=\"4\">
	</td>
	<td class=\"max\">
		<a href=\"#\" onClick=\"document.snd.t13.value=".$technology->maxUnit(13)."; return false;\">(".$technology->maxUnit(13).")</a>
	</td>
	</tr>";
}
if ($technology->getTech(14))
{
	echo "<tr>
	<td class=\"desc\">
		<div class=\"tit\">
			<img class=\"unit u14\" src=\"img/x.gif\" alt=\"侦察兵\" title=\"侦察兵\" />
			<a href=\"#\" onClick=\"return Popup(14,1);\"> 侦察兵</a>
			<span class=\"info\">（现有：".$village->unitarray['u14']."）</span>
		</div>
		<div class=\"details\">
			<img class=\"r1\" src=\"img/x.gif\" alt=\"木材\" title=\"木材\" />160|
			<img class=\"r2\" src=\"img/x.gif\" alt=\"粘土\" title=\"粘土\" />100|
			<img class=\"r3\" src=\"img/x.gif\" alt=\"铁矿\" title=\"铁矿\" />50|
			<img class=\"r4\" src=\"img/x.gif\" alt=\"粮食\" title=\"粮食\" />50|
			<img class=\"r5\" src=\"img/x.gif\" alt=\"粮食消耗\" title=\"粮食消耗\" />1|
			<img class=\"clock\" src=\"img/x.gif\" alt=\"训练时间\" title=\"训练时间\" />";
	echo $generator->getTimeFormat(round($u14['time'] * ($bid19[$village->resarray['f'.$id]]['attri'] / 100) / SPEED));
	echo "</div>
	</td>
	<td class=\"val\">
		<input type=\"text\" class=\"text\" name=\"t14\" value=\"0\" maxlength=\"4\">
	</td>
	<td class=\"max\">
		<a href=\"#\" onClick=\"document.snd.t14.value=".$technology->maxUnit(14)."; return false;\">(".$technology->maxUnit(14).")</a>
	</td>
	</tr>";
}
?>