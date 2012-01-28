<?php
$tribe1 = mysql_query("SELECT SQL_CACHE * FROM ".TB_PREFIX."users WHERE tribe = 1");
$tribe2 = mysql_query("SELECT SQL_CACHE * FROM ".TB_PREFIX."users WHERE tribe = 2");
$tribe3 = mysql_query("SELECT SQL_CACHE * FROM ".TB_PREFIX."users WHERE tribe = 3");
$tribes = Array(mysql_num_rows($tribe1), mysql_num_rows($tribe2), mysql_num_rows($tribe3));
$users = mysql_num_rows(mysql_query("SELECT SQL_CACHE * FROM ".TB_PREFIX."users")) - 1;
?>

<br />
<br />

<table id="profile">
<thead>
<tr>
	<th colspan="2">用户信息</th>
</tr>
</thead>
<tbody>
<tr>
	<td>已注册用户数</td>
	<td>
		<?php echo $users; ?>
	</td>
</tr>
<tr>
	<td>活跃用户数</td>
	<td>
		<?php
		$result = mysql_query("SELECT SQL_CACHE * FROM ".TB_PREFIX."active");
		$num_rows = mysql_num_rows($result);
		echo $num_rows;
		?>
	</td>
</tr>
<tr>
	<td>当前在线用户数</td>
	<td>
		<?php
		$t = time();
		$result = mysql_query("SELECT SQL_CACHE * FROM ".TB_PREFIX."users WHERE ".$t." - timestamp < 300") or die(mysql_error());
		$num_rows = mysql_num_rows($result);
		echo $num_rows;
		?>
	</td>
</tr>
<tr>
	<td>已停封的用户数</td>
	<td>
		<?php
		$result = mysql_query("SELECT SQL_CACHE * FROM ".TB_PREFIX."users WHERE access = 0");
		$num_rows = mysql_num_rows($result);
		echo $num_rows;
		?>
	</td>
</tr>
<tr>
	<td>已开拓的村庄数</td>
	<td>
		<?php
		$result = mysql_query("SELECT SQL_CACHE * FROM ".TB_PREFIX."vdata");
		$num_rows = mysql_num_rows($result);
		echo $num_rows;
		?>
	</td>
</tr>
</tbody>
</table>

<br />

<table id="profile">
<thead>
<tr>
	<th colspan="3">玩家种族分布</th>
</tr>
	<td class="b">种族</td>
	<td class="b">已注册帐号数</td>
	<td class="b">比率</td>
</thead>
<tbody>
<tr>
	<td>罗马</td>
	<td><?php echo $tribes[0]; ?></td>
	<td>
		<?php
		$percents = 100 * $tribes[0] / $users;
		echo $percents = intval($percents);
		echo "%";
		?>
	</td>
</tr>
<tr>
	<td>日耳曼</td>
	<td><?php echo $tribes[1]; ?></td>
	<td>
		<?php
		$percents = 100 * $tribes[1] / $users;
		echo $percents = intval($percents);
		echo "%";
		?>
	</td>
</tr>
<tr>
	<td>高卢</td>
	<td><?php echo $tribes[2]; ?></td>
	<td>
		<?php
		$percents = 100 * $tribes[2] / $users;
		echo $percents = intval ($percents);
		echo "%";
		?>
	</td>
</tr>
</tbody>
</table>