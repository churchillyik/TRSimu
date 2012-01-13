<table class="troop_details" cellpadding="1" cellspacing="1">
<thead>
<tr>
	<td class="role"><a href="karte.php?d=<?php echo $village->wid."&c=".$generator->getMapCheck($village->wid); ?>">自然界</a></td>
	<td colspan="10"><a href="spieler.php?uid=0">自然界的军队</a></td>
</tr>
</thead>
<tbody class="units">
<tr>
	<th>&nbsp;</th>
	<td><img src="img/x.gif" class="unit u31" title="老鼠" alt="老鼠" /></td>
	<td><img src="img/x.gif" class="unit u32" title="蜘蛛" alt="蜘蛛" /></td>
	<td><img src="img/x.gif" class="unit u33" title="蛇" alt="蛇" /></td>
	<td><img src="img/x.gif" class="unit u34" title="蝙蝠" alt="蝙蝠" /></td>
	<td><img src="img/x.gif" class="unit u35" title="野猪" alt="野猪" /></td>
	<td><img src="img/x.gif" class="unit u36" title="狼" alt="狼" /></td>
	<td><img src="img/x.gif" class="unit u37" title="熊" alt="熊" /></td>
	<td><img src="img/x.gif" class="unit u38" title="鳄鱼" alt="鳄鱼" /></td>
	<td><img src="img/x.gif" class="unit u39" title="老虎" alt="老虎" /></td>
	<td><img src="img/x.gif" class="unit u40" title="大象" alt="大象" /></td>
</tr>
<tr>
	<th>军队</th>
	<?php
	for ($i = 31; $i <= 40; $i++)
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
		<?php echo $technology->getUpkeep($village->unitarray, 4); ?>
		<img class="r4" src="img/x.gif" title="粮食" alt="粮食" />每小时
	</td>
</tr>