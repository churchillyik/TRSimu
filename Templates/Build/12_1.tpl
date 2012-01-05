<table cellpadding="1" cellspacing="1" class="build_details">
<thead>
<tr>
	<td>铁匠铺</td>
	<td>升级</td>
</tr>
</thead>
<tbody>
<tr>
	<?php
	$i = 1;
	echo "<tr><td class=\"desc\">
		<div class=\"tit\">
			<img class=\"unit u".$i."\" src=\"img/x.gif\" alt=\"".$technology->getUnitName($i)."\" title=\"".$technology->getUnitName($i)."\" />
			<a href=\"#\" onClick=\"return Popup(".$i.",1);\">".$technology->getUnitName($i)."</a>
		</div>
		<div class=\"details\">
			<img class=\"r1\" src=\"img/x.gif\" alt=\"木材\" title=\"木材\" />".${'bs'.$i}['wood']."|
			<img class=\"r2\" src=\"img/x.gif\" alt=\"粘土\" title=\"粘土\" />".${'bs'.$i}['clay']."|
			<img class=\"r3\" src=\"img/x.gif\" alt=\"铁矿\" title=\"铁矿\" />".${'bs'.$i}['iron']."|
			<img class=\"r4\" src=\"img/x.gif\" alt=\"粮食\" title=\"粮食\" />".${'bs'.$i}['crop']."|
			<img class=\"clock\" src=\"img/x.gif\" alt=\"建造时间\" title=\"建造时间\" />";
	echo $generator->getTimeFormat(round(${'bs'.$i}['time'] / SPEED));
	if ($session->userinfo['gold'] >= 3 && $building->getTypeLevel(17) > 1)
	{
		echo "|
		<a href=\"build.php?gid=17&t=3&r1=".${'bs'.$i}['wood']."&r2=".${'bs'.$i}['clay']."&r3=".${'bs'.$i}['iron']."&r4=".${'bs'.$i}['crop']."\" title=\"与电脑商人交易\">
		<img class=\"npc\" src=\"img/x.gif\" alt=\"与电脑商人交易\" title=\"与电脑商人交易\" /></a>";
	}
	if (${'bs'.$i}['wood'] > $village->maxstore
		|| ${'bs'.$i}['clay'] > $village->maxstore
		|| ${'bs'.$i}['iron'] > $village->maxstore)
	{
		echo "<br>
			<span class=\"none\">所需资源超过仓库容量，请先升级仓库</span>
			</div>
			</td>";
		echo "
			<td class=\"act\">
				<div class=\"none\">升级<br>仓库</div>
			</td>
			</tr>";
	}
	else if (${'bs'.$i}['crop'] > $village->maxcrop)
	{
		echo "<br>
			<span class=\"none\">所需资源超过粮仓容量，请先升级粮仓</span>
			</div></td>";
		echo "<td class=\"act\">
				<div class=\"none\">升级<br>粮仓</div>
			</td>
			</tr>";
	}
	else if (${'bs'.$i}['wood'] > $village->awood 
			|| ${'bs'.$i}['clay'] > $village->aclay 
			|| ${'bs'.$i}['iron'] > $village->airon 
			|| ${'bs'.$i}['crop'] > $village->acrop)
	{
		$time = $technology->calculateAvaliable($i);
		echo "<br>
			<span class=\"none\">到".$time[0]." ".$time[1]."才有足够的资源</span>
			</div>
			</td>";
		echo "<td class=\"act\">
				<div class=\"none\">资源<br>不足</div>
			</td>
			</tr>";
	}
	else
	{
		echo "</td>";
		echo "<td class=\"act\">
		<a class=\"research\" href=\"build.php?id=$id&amp;a=$i&amp;c=".$session->mchecker."\">研发</a>
		</td>
		</tr>";
	}

	for ($i = 2; $i <= 6; $i++)
	{
		if ($technology->getTech($i))
		{
			echo "<tr><td class=\"desc\">
				<div class=\"tit\">
					<img class=\"unit u".$i."\" src=\"img/x.gif\" alt=\"".$technology->getUnitName($i)."\" title=\"".$technology->getUnitName($i)."\" />
					<a href=\"#\" onClick=\"return Popup(".$i.",1);\">".$technology->getUnitName($i)."</a>
				</div>
				<div class=\"details\">
					<img class=\"r1\" src=\"img/x.gif\" alt=\"木材\" title=\"木材\" />".${'bs'.$i}['wood']."|
					<img class=\"r2\" src=\"img/x.gif\" alt=\"粘土\" title=\"粘土\" />".${'bs'.$i}['clay']."|
					<img class=\"r3\" src=\"img/x.gif\" alt=\"铁矿\" title=\"铁矿\" />".${'bs'.$i}['iron']."|
					<img class=\"r4\" src=\"img/x.gif\" alt=\"粮食\" title=\"粮食\" />".${'bs'.$i}['crop']."|
					<img class=\"clock\" src=\"img/x.gif\" alt=\"建造时间\" title=\"建造时间\" />";
			echo $generator->getTimeFormat(round(${'bs'.$i}['time'] / SPEED));
			if ($session->userinfo['gold'] >= 3 && $building->getTypeLevel(17) > 1)
			{
				echo "|
				<a href=\"build.php?gid=17&t=3&r1=".${'bs'.$i}['wood']."&r2=".${'bs'.$i}['clay']."&r3=".${'bs'.$i}['iron']."&r4=".${'bs'.$i}['crop']."\" title=\"与电脑商人交易\">
				<img class=\"npc\" src=\"img/x.gif\" alt=\"与电脑商人交易\" title=\"与电脑商人交易\" /></a>";
			}
			if (${'bs'.$i}['wood'] > $village->maxstore 
				|| ${'bs'.$i}['clay'] > $village->maxstore 
				|| ${'bs'.$i}['iron'] > $village->maxstore)
			{
				echo "<br>
					<span class=\"none\">所需资源超过仓库容量，请先升级仓库</span>
					</div></td>";
				echo "<td class=\"act\">
					<div class=\"none\">升级<br>仓库</div>
					</td></tr>";
			}
			else if (${'bs'.$i}['crop'] > $village->maxcrop)
			{
				echo "<br>
					<span class=\"none\">所需资源超过粮仓容量，请先升级粮仓</span>
					</div>
					</td>";
				echo "<td class=\"act\">
					<div class=\"none\">升级<br>粮仓</div>
					</td>
					</tr>";
			}
			else if (${'bs'.$i}['wood'] > $village->awood 
				|| ${'bs'.$i}['clay'] > $village->aclay 
				|| ${'bs'.$i}['iron'] > $village->airon 
				|| ${'bs'.$i}['crop'] > $village->acrop)
			{
				$time = $technology->calculateAvaliable($i);
				echo "<br>
					<span class=\"none\">到".$time[0]." ".$time[1]."才有足够的资源</span>
					</div>
					</td>";
				echo "<td class=\"act\">
					<div class=\"none\">资源<br>不足</div>
					</td>
					</tr>";
			}
			else
			{
				echo "</td>";
				echo "<td class=\"act\">
					<a class=\"research\" href=\"build.php?id=$id&amp;a=$i&amp;c=".$session->mchecker."\">研发</a>
					</td>
					</tr>";
			}
		}
	}
	?>
</tbody>
</table>