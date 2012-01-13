<?php
$trainlist = $database->getTraining($village->wid);
if (count($trainlist) > 0)
{
	$timer = 2 * count($trainlist);
	echo "<table cellpadding=\"1\" cellspacing=\"1\" class=\"under_progress\">
	<thead>
	<tr>
		<td>训练中的单位</td>
		<td>所需时间</td>
		<td>结束于</td>
	</tr>
	</thead>
	<tbody>";
	foreach ($trainlist as $train)
	{
		echo "
		<tr>
			<td class=\"desc\">";
		echo "<img class=\"unit u".$train['unit']."\" src=\"img/x.gif\" alt=\"".$technology->getUnitName($train['unit'])."\" title=\"".$technology->getUnitName($train['unit'])."\" />".$train['amt']." ".$technology->getUnitName($train['unit'])."
			</td>
			<td class=\"dur\">
				<span id=timer".$timer.">".$generator->getTimeFormat($train['commence'] + $train['eachtime'] * $train['amt'] - time())."</span>
			</td>
			<td class=\"fin\">";
		$timer -= 1;
		$time = $generator->procMTime($train['commence'] + 1 * $train['amt']);
		echo "于 <span>";
		if ($time[0] != "today")
		{
			echo $time[0]." ";
		}
		echo $time[1]."</span>
			</td>
		</tr>
		<tr class=\"next\">
			<td colspan=\"3\">
				下一个单位将在
				<span id=timer".$timer.">".$generator->getTimeFormat($train['commence'] + $train['eachtime'] - time())."</span>
				完成
			</td>
		</tr>";
	}
	echo "</tbody>
		</table>";
}
?>