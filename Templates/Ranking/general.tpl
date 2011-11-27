<?php
$tribe1 = mysql_query("SELECT SQL_CACHE * FROM ".TB_PREFIX."users WHERE tribe = 1");
$tribe2 = mysql_query("SELECT SQL_CACHE * FROM ".TB_PREFIX."users WHERE tribe = 2");
$tribe3 = mysql_query("SELECT SQL_CACHE * FROM ".TB_PREFIX."users WHERE tribe = 3");
$tribes = Array(mysql_num_rows($tribe1), mysql_num_rows($tribe2), mysql_num_rows($tribe3));
$users = mysql_num_rows(mysql_query("SELECT SQL_CACHE * FROM ".TB_PREFIX."users")) - 2;
?>

<table cellpadding="1" cellspacing="1" id="world_player" class="world">
<thead>
	<tr><th colspan="2">玩家</th></tr>
</thead>
<tbody>
<tr>
	<th>注册玩家</th>
	<td><?php echo $users; ?></td>
</tr>
<tr>
	<th>活跃玩家</th>
	<td>?</td>
</tr>
<tr>
	<th>在线玩家</th>
	<td>
		<?php
		$result = mysql_query("SELECT * FROM ".TB_PREFIX."online");
		$num_rows = mysql_num_rows($result);
		echo $num_rows;
		?>
	</td>
</tr>
</tbody>
</table>

<table cellpadding="1" cellspacing="1" id="world_tribes" class="world">
<thead>
	<tr>
		<th colspan="3">种族</th></tr>
	<tr>
	<td>种族</td>
	<td>已注册</td>
	<td>比重</td>
</tr>
</thead>
<tbody>
	<tr>
		<td>罗马</td>
		<td><?php echo $tribes[0]; ?></td>
        <td>
			<?php
			$percents = 100 * ($tribes[0] / $users);
			echo $percents = intval($percents);
			echo "%";
			?>
		</td>
	</tr>
	<tr>
		<td>条顿</td>
		<td><?php echo $tribes[1]; ?></td>
        <td>
			<?php
			$percents = 100 * ($tribes[1] / $users);
			echo $percents = intval ($percents);
			echo "%";
			?>
		</td>
	</tr>
	<tr>
		<td>高卢</td>
		<td>
		<?php echo $tribes[2];?></td>
		<td>
			<?php
			$percents = 100 * ($tribes[2] / $users);
			echo $percents = intval($percents);
			echo "%";
			?>
		</td>
	</tr>
</tbody>
</table>