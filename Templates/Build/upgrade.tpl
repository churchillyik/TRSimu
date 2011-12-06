<?php
$bindicate = $building->canBuild($id, $village->resarray['f'.$id.'t']);
if ($bindicate == 1)
{
	echo "<p><span class=\"none\">已经升到最高级</span></p>";
}
else
{
	$uprequire = $building->resourceRequired($id, $village->resarray['f'.$id.'t']);
?>
<p id="contract">
	升到&nbsp;等级<?php echo $village->resarray['f'.$id] + 1; ?>&nbsp;<b>需要花费</b>：
	<br />
	<img class="r1" src="img/x.gif" alt="木材" title="木材" /><span class="little_res"><?php echo $uprequire['wood']; ?></span> | 
	<img class="r2" src="img/x.gif" alt="粘土" title="粘土" /><span class="little_res"><?php echo $uprequire['clay']; ?></span> | 
	<img class="r3" src="img/x.gif" alt="铁矿" title="铁矿" /><span class="little_res"><?php echo $uprequire['iron']; ?></span> | 
	<img class="r4" src="img/x.gif" alt="粮食" title="粮食" /><span class="little_res"><?php echo $uprequire['crop']; ?></span> | 
	<img class="r5" src="img/x.gif" alt="粮食消耗" title="粮食消耗" /><?php echo $uprequire['pop']; ?> | 
	<img class="clock" src="img/x.gif" alt="建造时间" title="建造时间" />

<?php
	echo $generator->getTimeFormat($uprequire['time']); 
	if ($session->userinfo['gold'] >= 3 && $building->getTypeLevel(17) >= 1)
	{
		echo "|<a href=\"build.php?gid=17&t=3&r1="
		.$uprequire['wood'].
		"&r2=".$uprequire['clay'].
		"&r3=".$uprequire['iron'].
		"&r4=".$uprequire['crop'].
		"\" title=\"与电脑商人交易\"><img class=\"npc\" src=\"img/x.gif\" alt=\"与电脑商人交易\" title=\"与电脑商人交易\" /></a>";
	}
?>
<br />
<?php
	if ($bindicate == 2) 
	{
		echo "<span class=\"none\">已经有建筑在建造当中</span>";
	}
	else if ($bindicate == 3) 
	{
		echo "<span class=\"none\">已经有建筑在建造当中（等待队列）</span>";
	}
	else if ($bindicate == 4) 
	{
		echo "<span class=\"none\">粮食产量不足，请升级粮田</span>";
	}
	else if($bindicate == 5) 
	{
		echo "<span class=\"none\">所需资源超过仓库容量，请先升级仓库</span>";
	}
	else if($bindicate == 6) 
	{
		echo "<span class=\"none\">所需资源超过粮仓容量，请先升级粮仓</span>";
	}
	else if($bindicate == 7) 
	{
		$neededtime = $building->calculateAvaliable($id, $village->resarray['f'.$id.'t']);
		echo "<span class=\"none\">到".$neededtime[0]." ".$neededtime[1]."才有足够的资源</span>";
	}
	else if ($bindicate == 8) 
	{
		if($id <= 18) 
		{
			echo "<a class=\"build\" href=\"dorf1.php?a=$id&c=$session->checker\">升级到等级";
		}
		else 
		{
			echo "<a class=\"build\" href=\"dorf2.php?a=$id&c=$session->checker\">升级到等级";
		}
		echo $village->resarray['f'.$id] + 1;
		echo "</a>";
	}
	else if ($bindicate == 9) 
	{
		if ($id <= 18) 
		{
			echo "<a class=\"build\" href=\"dorf1.php?a=$id&c=$session->checker\">升级到等级";
		}
		else 
		{
			echo "<a class=\"build\" href=\"dorf2.php?a=$id&c=$session->checker\">升级到等级";
		}
		echo $village->resarray['f'.$id] + 1;
		echo "</a><span class=\"none\">（等待队列）</span>";
	}
}
?>
</p>