<form method="POST" name="snd" action="build.php">
	<input type="hidden" name="id" value="<?php echo $id; ?>" />
	<input type="hidden" name="ft" value="t1" />

	<table cellpadding="1" cellspacing="1" class="build_details">
	<thead>
	<tr>
		<td>训练</td>
		<td>数量</td>
		<td>最大</td>
	</tr>
	</thead>
	<tbody>
		<?php
		$i = 20;
		echo "<tr>
			<td class=\"desc\">
				<div class=\"tit\">
					<img class=\"unit u".$i."\" src=\"img/x.gif\" alt=\"".$technology->getUnitName($i)."\" title=\"".$technology->getUnitName($i)."\" />
					<a href=\"#\" onClick=\"return Popup(".$i.",1);\">".$technology->getUnitName($i)."</a>
					<span class=\"info\">（现有：".$village->unitarray['u'.$i]."）</span>
				</div>
				<div class=\"details\">
					<img class=\"r1\" src=\"img/x.gif\" alt=\"木材\" title=\"木材\" />".${'u'.$i}['wood']."|
					<img class=\"r2\" src=\"img/x.gif\" alt=\"粘土\" title=\"粘土\" />".${'u'.$i}['clay']."|
					<img class=\"r3\" src=\"img/x.gif\" alt=\"铁矿\" title=\"铁矿\" />".${'u'.$i}['iron']."|
					<img class=\"r4\" src=\"img/x.gif\" alt=\"粮食\" title=\"粮食\" />".${'u'.$i}['crop']."|
					<img class=\"clock\" src=\"img/x.gif\" alt=\"所需时间\" title=\"所需时间\" />
				</div>
			</td>";
		echo $generator->getTimeFormat(round(${'u'.$i}['time'] / SPEED));
		if ($session->userinfo['gold'] >= 3 && $building->getTypeLevel(17) > 1)
		{
			echo "|<a href=\"build.php?gid=17&t=3&r1=".${'r'.$i}['wood']."&r2=".${'r'.$i}['clay']."&r3=".${'r'.$i}['iron']."&r4=".${'r'.$i}['crop']."\" title=\"和电脑商人交易\"><img class=\"npc\" src=\"img/x.gif\" alt=\"和电脑商人交易\" title=\"和电脑商人交易\" /></a>";
		}
		echo "
			<td class=\"val\">
				<input type=\"text\" class=\"text\" name=\"t".$i."\" value=\"0\" maxlength=\"4\">
			</td>
			<td class=\"max\">
				<a href=\"#\" onClick=\"document.snd.t".$i.".value=".$technology->maxUnit($i)."; return false;\">(".$technology->maxUnit($i).")</a>
			</td>
			</tr>";
		?>
	</tbody>
	</table>
	
	<p>
		<input type="image" id="btn_train" class="dynamic_img" value="ok" name="s1" src="img/x.gif" alt="训练" />
	</p>

	<?php
	$trainlist = $technology->getTrainingList(20);
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
			echo "<tr>
				<td class=\"desc\">";
			echo "<img class=\"unit u".$train['unit']."\" src=\"img/x.gif\" alt=\"".$train['name']."\" title=\"".$train['name']."\" />".$train['amt']." ".$train['name']."
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
</form>