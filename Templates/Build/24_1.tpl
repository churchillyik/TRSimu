<table cellpadding="1" cellspacing="1" class="build_details">
<thead>
<tr>
	<td>活动</td>
	<td>行为</td>
</tr>
</thead>
<tbody>
	<?php
	$level = $village->resarray['f'.$id];
	$inuse = $database->getVillageField($village->wid, 'celebration');
	$time = Time();
	echo "<tr>
		<td class=\"desc\">
			<div class=\"tit\">
				小型活动（500 文明点）
			</div>
			<div class=\"details\">
				<img class=\"r1\" src=\"img/x.gif\" alt=\"木材\" title=\"木材\" />6400|
				<img class=\"r2\" src=\"img/x.gif\" alt=\"粘土\" title=\"粘土\" />6650|
				<img class=\"r3\" src=\"img/x.gif\" alt=\"铁矿\" title=\"铁矿\" />5940|
				<img class=\"r4\" src=\"img/x.gif\" alt=\"粮食\" title=\"粮食\" />1340|
				<img class=\"clock\" src=\"img/x.gif\" alt=\"所需时间\" title=\"所需时间\" />";
	echo $generator->getTimeFormat(round($sc[$level]));
	if ($session->userinfo['gold'] >= 3 && $building->getTypeLevel(17) > 1)
	{
		echo "|<a href=\"build.php?gid=17&t=3&r1=6400&r2=6650&r3=5940&r4=1340\" title=\"和电脑商人交易\">
			<img class=\"npc\" src=\"img/x.gif\" alt=\"和电脑商人交易\" title=\"和电脑商人交易\" /></a>";
	}
	
	if ($inuse > $time)
	{
		echo "<td class=\"act\">
				<div class=\"none\">一个活动</br>正在举行中</div>
			</td>
			</tr>";
	}				
	else if (6400 > $village->awood || 
			6650 > $village->aclay || 
			5940 > $village->airon || 
			1340 > $village->acrop)
	{
		$time = $technology->calculateAvaliable($i);
		echo "<br><span class=\"none\">充足资源要等到 ".$time[0]." ".$time[1]."</span>
			</div>
		</td>";
		echo "
		<td class=\"act\">
			<div class=\"none\">资源<br>不足</div>
		</td>
		</tr>";
	}
	else
	{
		echo "</td>";
		echo "
		<td class=\"act\">
			<a class=\"research\" href=\"celebration.php?type=1&id=$id\">举行</a>
		</td>
		</tr>";
	}

	if ($level >= 10)
	{	
		$level = $village->resarray['f'.$id];
		echo "<tr>
		<td class=\"desc\">
			<div class=\"tit\">
				大型活动（2000 文明点）
			</div>
			<div class=\"details\">
				<img class=\"r1\" src=\"img/x.gif\" alt=\"木材\" title=\"木材\" />29700|
				<img class=\"r2\" src=\"img/x.gif\" alt=\"粘土\" title=\"粘土\" />33250|
				<img class=\"r3\" src=\"img/x.gif\" alt=\"铁矿\" title=\"铁矿\" />32000|
				<img class=\"r4\" src=\"img/x.gif\" alt=\"粮食\" title=\"粮食\" />6700|
				<img class=\"clock\" src=\"img/x.gif\" alt=\"所需时间\" title=\"所需时间\" />";
		echo $generator->getTimeFormat(round($gc[$level]));
		if ($session->userinfo['gold'] >= 3 && $building->getTypeLevel(17) > 1)
		{
			echo "|<a href=\"build.php?gid=17&t=3&r1=29700&r2=33250&r3=32000&r4=6700\" title=\"和电脑商人交易\">
				<img class=\"npc\" src=\"img/x.gif\" alt=\"和电脑商人交易\" title=\"和电脑商人交易\" /></a>";
		}
		if ($inuse > $time)
		{
			echo "
			<td class=\"act\">
				<div class=\"none\">一个活动</br>正在举行中</div>
			</td>
			</tr>";
		}
		else if (29700 > $village->awood || 
				33250 > $village->aclay || 
				32000 > $village->airon || 
				6700 > $village->acrop)
		{
			$time = $technology->calculateAvaliable($i);
			echo "<br><span class=\"none\">充足资源要等到 ".$time[0]." ".$time[1]."</span>
				</div>
			</td>";
			echo "
			<td class=\"act\">
				<div class=\"none\">资源<br>不足</div>
			</td>
			</tr>";
		}
		else
		{
			echo "</td>";
			echo "
			<td class=\"act\">
				<a class=\"research\" href=\"celebration.php?type=2&id=$id\">举行</a>
			</td>
			</tr>";
		}
	}
	?>
</tbody>
</table>