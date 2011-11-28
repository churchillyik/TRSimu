<?php
//	增援部队遭到攻击
$dataarray = explode(",", $message->readingNotice['data']);
?>
<table cellpadding="1" cellspacing="1" id="report_surround">
<thead>
	<tr>
		<th>主题：</th>
		<th><?php echo $message->readingNotice['topic']; ?></th>
	</tr>
	<tr>
		<?php $date = $generator->procMtime($message->readingNotice['time']); ?>
		<td class="sent">发送：</td>
		<td>于 <?php echo $date[0]."<span> at ".$date[1]; ?></span> <span>时</span></td>
	</tr>
</thead>
<tbody>
	<tr><td colspan="2" class="empty"></td></tr>
	<tr>
		<td colspan="2" class="report_content">
			<table cellpadding="1" cellspacing="1" class="defender">
			<thead>
			<tr>
			<td class="role">防御方</td>
			<td colspan="10">
				<a href="spieler.php?uid=<?php echo $database->getUserField($dataarray[0],"id",0); ?>">
				<?php echo $database->getUserField($dataarray[0],"username",0); ?></a> 在村庄中
				<a href="karte.php?d=<?php echo $dataarray[1]."&amp;c=".$generator->getMapCheck($dataarray[1]); ?>">
				<?php echo $database->getVillageField($dataarray[1],"name"); ?></a>
			</td>
			</tr>
			</thead>
			<tbody class="units">
			<tr>
				<td>&nbsp;</td>
				<?php
				$start = $dataarray[3] == 1? 1 : (($dataarray[3] == 2)? 11 : (($dataarray[3] == 3)? 21 : 31));
				for ($i = $start; $i <= $start + 9; $i++)
				{
					echo "<td><img src=\"img/x.gif\" class=\"unit u$i\" title=\""
					.$technology->getUnitName($i)."\" alt=\""
					.$technology->getUnitName($i)."\" /></td>";
				}
				echo "</tr><tr><th>军队</th>";
				for ($i = 4; $i <= 13; $i++)
				{
					if ($dataarray[$i] == 0)
					{
						echo "<td class=\"none\">0</td>";
					}
					else
					{
						echo "<td>".$dataarray[$i]."</td>";
					}
				}
				echo "<tr><th>损失</th>";
				for ($i = 14; $i <= 23; $i++)
				{
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
			</table>
		</td>
	</tr>
</tbody>
</table>