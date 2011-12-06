<?php
$bid = $_GET['bid'];
unset($_GET['bid']);
$bindicator = $building->canBuild($id, $bid);
$uprequire = $building->resourceRequired($id, $bid);
?>
<tr>
	<td class="res">
		<img class="r1" src="img/x.gif" alt="木材" title="木材" /><?php echo $uprequire['wood']; ?> | 
		<img class="r2" src="img/x.gif" alt="粘土" title="粘土" /><?php echo $uprequire['clay']; ?> | 
		<img class="r3" src="img/x.gif" alt="铁矿" title="铁矿" /><?php echo $uprequire['iron']; ?> | 
		<img class="r4" src="img/x.gif" alt="粮食" title="粮食" /><?php echo $uprequire['crop']; ?> | 
		<img class="r5" src="img/x.gif" alt="粮食消耗" title="粮食消耗" /><?php echo $uprequire['pop']; ?> | 
		<img class="clock" src="img/x.gif" alt="建造时间" title="建造时间" />
		<?php 
		echo $generator->getTimeFormat($uprequire['time']);
		if ($session->userinfo['gold'] >= 3 && $building->getTypeLevel(17) >= 1)
		{
			echo "|<a href=\"build.php?gid=17&t=3&r1="
				.$uprequire['wood']."&r2="
				.$uprequire['clay']."&r3="
				.$uprequire['iron']."&r4="
				.$uprequire['crop']."\" title=\"与电脑商人交易\"><img class=\"npc\" src=\"img/x.gif\" alt=\"与电脑商人交易\" title=\"与电脑商人交易\" /></a>";
		}
		?>
	</td>
</tr>
<tr>
	<td class="link">
	<?php
	if ($bindicator == 2)
	{
		echo "<span class=\"none\">已经有建筑在建造当中</span>";
	}
	else if ($bindicator == 3)
	{
		echo "<span class=\"none\">已经有建筑在建造当中（等待队列）</span>";
	}
	else if ($bindicator == 4)
	{
		echo "<span class=\"none\">粮食产量不足，请升级粮田</span>";
	}
	else if ($bindicator == 5)
	{
		echo "<span class=\"none\">所需资源超过仓库容量，请先升级仓库</span>";
	}
	else if ($bindicator == 6)
	{
		echo "<span class=\"none\">所需资源超过粮仓容量，请先升级粮仓</span>";
	}
	else if ($bindicator == 7)
	{
		$neededtime = $building->calculateAvaliable($id, $bid);
		echo "<span class=\"none\">到 ".$neededtime[0]." ".$neededtime[1]." 才有足够的资源</span>";
	}
	else if ($bindicator == 8)
	{
		echo "<a class=\"build\" href=\"dorf2.php?a=$bid&id=$id&c=".$session->checker."\">修建该建筑</a>";
	}
	else if ($bindicator == 9)
	{
		echo "<a class=\"build\" href=\"dorf2.php?a=$bid&id=$id&c=".$session->checker."\">修建该建筑（等待队列）</a>";
	}
	?>	
</td>