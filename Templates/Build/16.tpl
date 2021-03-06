<div id="build" class="gid16">
	<a href="#" onClick="return Popup(16,4);" class="build_logo">
		<img class="g16" src="img/x.gif" alt="集结点" title="集结点" />
	</a>
	<h1>
		集结点
		<span class="level">等级 <?php echo $village->resarray['f'.$id]; ?></span>
	</h1>
	<p class="build_desc">
		集结点是村落士兵集合的地方。在集结点内你可以让你的军队对他人进行掠夺,普通攻击或是支援行动。
	</p>
	<div id="textmenu">
		<a href="build.php?id=<?php echo $id; ?>">总览</a> |
		<a href="a2b.php">出兵</a> |
		<a href="warsim.php">战斗模拟器</a>
	</div>
	
	<?php
	$units_type = $database->getMovement("34", $village->wid, 1);
	$units_incomming = count($units_type);
	for ($i = 0; $i < $units_incomming; $i++)
	{
		if ($units_type[$i]['attack_type'] == 1)
		{
			$units_incomming -= 1;
		}
	}
	if ($units_incomming >= 1)
	{
	?>
	<h4>到达的军队 （<?php echo $units_incomming; ?>）</h4>
	<?php 
	include("16_incomming.tpl"); 
	}
	?>
	<h4>在村庄和自己绿洲中的军队</h4>
	
	<table class="troop_details" cellpadding="1" cellspacing="1">
	<thead>
	<tr>
		<td class="role">
			<a href="karte.php?d=<?php echo $village->wid."&c=".$generator->getMapCheck($village->wid); ?>">
				<?php echo $village->vname; ?>
			</a>
		</td>
		<td colspan="10">
			<a href="spieler.php?uid=<?php echo $session->uid; ?>">自己的军队</a>
		</td>
	</tr>
	</thead>
	<tbody class="units">
		<?php include("16_".$session->tribe.".tpl"); 
		for ($i = 31; $i <= 40; $i++)
		{
			if ($village->unitarray['u'.$i] > 0)
			{
				include("16_4.tpl");
			}
		}
		?>
	</tbody>
	</table>
	<?php
	if (count($village->enforcetome) > 0)
	{
		foreach ($village->enforcetome as $enforce)
		{
			echo "<table class=\"troop_details\" cellpadding=\"1\" cellspacing=\"1\">
				<thead>
				<tr>
					<td class=\"role\">
						<a href=\"karte.php?d=".$enforce['from']."&c=".$generator->getMapCheck($enforce['from'])."\">".$database->getVillageField($enforce['from'], "name")."</a>
					</td>
					<td colspan=\"10\">";
			echo "<a href=\"spieler.php?uid=".$database->getVillageField($enforce['from'], "owner")."\">"
				.$database->getUserField($database->getVillageField($enforce['from'], "owner"), "username", 0)." 军队</a>";
			echo "</td>
				</tr>
				</thead>
				<tbody class=\"units\">";
			$tribe = $database->getUserField($database->getVillageField($enforce['from'], "owner"), "tribe", 0);
			$start = ($tribe == 1)? 1 : (($tribe == 2)? 11 : 21);
			echo "<tr>
				<th>&nbsp;</th>";
			for ($i = $start; $i <= ($start + 9); $i++)
			{
				echo "<td>
					<img src=\"img/x.gif\" class=\"unit u$i\" title=\"".$technology->getUnitName($i)."\" alt=\"".$technology->getUnitName($i)."\" />
					</td>";	
			}
			echo "</tr>
				<tr>
				<th>军队</th>";

			for ($i = $start; $i <= ($start + 9); $i++)
			{
				if ($enforce['u'.$i] == 0)
				{
					echo "<td class=\"none\">";
				}
				else
				{
					echo "<td>";
				}
				echo $enforce['u'.$i]."</td>";
			}
			echo "</tr>
			</tbody>
			<tbody class=\"infos\">
			<tr>
				<th>粮食消耗</th>
				<td colspan=\"10\">
					<div class='sup'>".$technology->getUpkeep($enforce, $tribe)."
						<img class=\"r4\" src=\"img/x.gif\" title=\"粮食\" alt=\"粮食\" /> 每小时
					</div>
					<div class='sback'>
						<a href='a2b.php?w=".$enforce['id']."'>退兵</a>
					</div>
				</td>
			</tr>";
			echo "
			</tbody>
			</table>";
		}
	}
	if (count($village->enforcetoyou) > 0)
	{
		echo "<h4>在其他村庄和绿洲中的军队</h4>";
		foreach ($village->enforcetoyou as $enforce)
		{
			echo "<table class=\"troop_details\" cellpadding=\"1\" cellspacing=\"1\">
				<thead>
				<tr>
					<td class=\"role\">
						<a href=\"karte.php?d=".$enforce['vref']."&c=".$generator->getMapCheck($enforce['vref'])."\">".$database->getVillageField($enforce['vref'],"name")."</a>
					</td>
					<td colspan=\"10\">";
			echo "<a href=\"spieler.php?uid=".$database->getVillageField($enforce['from'],"owner")."\">".$database->getUserField($database->getVillageField($enforce['from'], "owner"), "username", 0)." 军队</a>";
			echo "</td>
				</tr>
				</thead>
				<tbody class=\"units\">";
			$tribe = $database->getUserField($database->getVillageField($enforce['from'], "owner"), "tribe", 0);
			$start = ($tribe == 1)? 1 : (($tribe == 2)? 11 : 21);
			echo "<tr>
				<th>&nbsp;</th>";
			for ($i = $start; $i <= ($start + 9); $i++)
			{
				echo "<td>
					<img src=\"img/x.gif\" class=\"unit u$i\" title=\"".$technology->getUnitName($i)."\" alt=\"".$technology->getUnitName($i)."\" />
					</td>";	
			}
			echo "</tr>
				<tr>
					<th>军队</th>";
			for ($i = $start; $i <= ($start + 9); $i++)
			{
				if ($enforce['u'.$i] == 0)
				{
					echo "<td class=\"none\">";
				}
				else
				{
					echo "<td>";
				}
				echo $enforce['u'.$i]."</td>";
			}
			echo "</tr>
				</tbody>
				<tbody class=\"infos\">
				<tr>
					<th>粮食消耗</th>
					<td colspan=\"10\">
						<div class='sup'>".$technology->getUpkeep($enforce,$tribe)."
							<img class=\"r4\" src=\"img/x.gif\" title=\"粮食\" alt=\"粮食\" />每小时
						</div>
						<div class='sback'>
							<a href='a2b.php?r=".$enforce['id']."'>退兵</a>
						</div>
					</td>
				</tr>";
			echo "</tbody>
				</table>";
		}
	}
	?>
	<?php
	$units_type = $database->getMovement("3", $village->wid, 0);
	$units_incomming = count($units_type);
	for ($i = 0; $i < $units_incomming; $i++)
	{
		if ($units_type[$i]['vref'] != $village->wid)
		{
			$units_incomming -= 1;
		}
	}
	if ($units_incomming >= 1)
	{
		echo "<h4>在路上的军队</h4>";
		include("16_".$session->tribe."_walking.tpl");
	}
	include("upgrade.tpl");
	?>
</div>