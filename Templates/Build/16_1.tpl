<tr>
	<?php
	$tribe = 1;
	$start = ($tribe == 1)? 1 : (($tribe == 2)? 11 : 21);
	echo "<th>&nbsp;</th>";
	for ($i = $start; $i <= $start + 9; $i++)
	{
		echo "<td>
			<img src=\"img/x.gif\" class=\"unit u$i\" title=\"".$technology->getUnitName($i)."\" alt=\"".$technology->getUnitName($i)."\" />
			</td>";	
	}
?>
</tr>
<tr>
	<th>军队</th>
	<?php
	for ($i = 1; $i <= 10; $i++)
	{
		if ($village->unitarray['u'.$i] == 0)
		{
			echo "<td class=\"none\">";
		}
		else
		{
			echo "<td>";
		}
		echo $village->unitarray['u'.$i]."</td>";
	}
	?>
</tr>
</tbody>
<tbody class="infos">
<tr>
	<th>粮食消耗</th>
	<td colspan="10">
		<?php echo $technology->getUpkeep($village->unitarray,1); ?>
		<img class="r4" src="img/x.gif" title="粮食" alt="粮食" />每小时
	</td>
</tr>