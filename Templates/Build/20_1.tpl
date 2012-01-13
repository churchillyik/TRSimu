<?php 
$success = 0;
for ($i = 4; $i <= 6; $i++)
{
	if ($technology->getTech($i))
	{
		echo "<tr>
			<td class=\"desc\">
				<div class=\"tit\">
					<img class=\"unit u$i\" src=\"img/x.gif\" alt=\"".$technology->getUnitName($i)."\" title=\"".$technology->getUnitName($i)."\" />
					<a href=\"#\" onClick=\"return Popup($i,1);\">".$technology->getUnitName($i)."</a>
					<span class=\"info\">（现有：".$village->unitarray['u'.$i]."）</span>
				</div>";
        echo "
				<div class=\"details\">
					<img class=\"r1\" src=\"img/x.gif\" alt=\"木头\" title=\"木头\" />".${'u'.$i}['wood']."|
					<img class=\"r2\" src=\"img/x.gif\" alt=\"粘土\" title=\"粘土\" />".${'u'.$i}['clay']."|
					<img class=\"r3\" src=\"img/x.gif\" alt=\"铁矿\" title=\"铁矿\" />".${'u'.$i}['iron']."|
					<img class=\"r4\" src=\"img/x.gif\" alt=\"粮食\" title=\"粮食\" />".${'u'.$i}['crop']."|
					<img class=\"r5\" src=\"img/x.gif\" alt=\"粮食消耗\" title=\"粮食消耗\" />".${'u'.$i}['pop']."|
					<img class=\"clock\" src=\"img/x.gif\" alt=\"训练时间\" title=\"训练时间\" />";
        echo $generator->getTimeFormat(round(${'u'.$i}['time'] * ($bid20[$village->resarray['f'.$id]]['attri'] / 100) / SPEED));
        echo "</div>
			</td>
			<td class=\"val\">
				<input type=\"text\" class=\"text\" name=\"t$i\" value=\"0\" maxlength=\"$i\">
			</td>
			<td class=\"max\">
				<a href=\"#\" onClick=\"document.snd.t$i.value=".$technology->maxUnit($i)."; return false;\">(".$technology->maxUnit($i).")</a>
			</td>
		</tr>";
		$success += 1;
    }
}
if ($success == 0)
{
	echo "<tr>
		<td colspan=\"3\">
			<div class=\"none\" align=\"center\">目前还不能生产任何单位，请先在研发所中研发。</div>
		</td>
		</tr>";
}
?>