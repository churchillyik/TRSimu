<?php
$dataarray = explode(",", $message->readingNotice['data']);
?>
<table cellpadding="1" cellspacing="1" id="report_surround">
<thead>
<tr>
	<th>主题：</th>
	<th><?php echo $message->readingNotice['topic']; ?></th>
</tr>
<tr>
	<?php
	$date = $generator->procMtime($message->readingNotice['time']);
	?>
	<td class="sent">发送：</td>
	<td>于 <?php echo $date[0]."<span> at ".$date[1]; ?></span><span>时</span></td>
</tr>
</thead>
<tbody>
<tr><td colspan="2" class="empty"></td></tr>
<tr>
	<td colspan="2" class="report_content">
		<table cellpadding="1" cellspacing="1" id="reinforcement">
		<thead>
		<tr>
			<td class="role">发送人</td>
			<td colspan="10">
				<a href="spieler.php?uid=<?php echo $database->getUserField($dataarray[1], "id", 0); ?>">
				<?php echo ($dataarray[1] == 0)? "任务管理员" : $database->getUserField($dataarray[1], "username", 0); ?></a> 来自于村庄 
				<?php echo ($dataarray[0] == 0)? "长者之村" : "<a href='karte.php?d=".$dataarray[0]
																			."&amp;c=".$generator->getMapCheck($dataarray[0])."'>"
																			.$database->getVillageField($dataarray[0],name)."</a>"; ?>
			</td>
		</tr>
		</thead>
		<tbody class="units">
		<tr>
			<td>&nbsp;</td>
			<?php
			$start = $dataarray[2] == 1? 1 : (($dataarray[2] == 2)? 11 : (($dataarray[2] == 3)? 21 : 31));
			for ($i = $start; $i <= $start + 9; $i++)
			{
				echo "<td><img src=\"img/x.gif\" class=\"unit u$i\" title=\""
						.$technology->getUnitName($i)."\" alt=\""
						.$technology->getUnitName($i)."\" /></td>";
			}
			echo "</tr><tr><th>军队</th>";
			for ($i = 3; $i < 13; $i++)
			{
				$unitarray['u'.($i-3+$start).''] = $dataarray[$i];
				if ($dataarray[$i] == 0)
				{
					echo "<td class=\"none\">0</td>";
				}
				else
				{
					echo "<td>".$dataarray[$i]."</td>";
				}
			}
			?>
		</tr>
		</tbody>
		<tbody class="infos">
		<tr>
			<th>携带粮食</th>
			<td colspan="10">
				<?php echo $technology->getUpkeep($unitarray, $dataarray[2]); ?>
				<img src="img/x.gif" class="r4" title="粮食" alt="粮食" />每小时
			</td>
		</tr>
		</tbody>
		</table>
	</td>
</tr>
</tbody>
</table>