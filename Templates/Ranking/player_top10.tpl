<?php
$db_host = SQL_SERVER;
$db_user = SQL_USER;
$db_pass = SQL_PASS;
$db_name = SQL_DB;
$con = mysql_connect($db_host, $db_user, $db_pass);
if (!$con)
{
	die('无法连接：' . mysql_error());
}
mysql_select_db($db_name, $con);

//	攻击排行
$i = 1;
$my_rank = 0;
$result = mysql_query("SELECT * FROM ".TB_PREFIX."users ORDER BY ap DESC Limit 10");
$result2 = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE username = '".$session->username."' ORDER BY ap DESC Limit 1");
?>

<table cellpadding="1" cellspacing="1">
<thead>
	<tr>
		<th>十强龙虎榜
			<div id="submenu">
				<a title="前10名" href="statistiken.php?id=1"><img class="active btn_top10" src="img/x.gif" alt="前10名"></a>
				<a title="防御" href="statistiken.php?id=32"><img class="btn_def" src="img/x.gif" alt="防御"></a>
				<a title="攻击" href="statistiken.php?id=31"><img class="btn_off" src="img/x.gif" alt="攻击"></a>
			</div>
			<div id="submenu2">
				<a title="罗马" href="statistiken.php?id=11"><img class="btn_v1" src="img/x.gif" alt="攻击者"></a>
				<a title="条顿" href="statistiken.php?id=12"><img class="btn_v2" src="img/x.gif" alt="攻击者"></a>
				<a title="高卢" href="statistiken.php?id=13"><img class="btn_v3" src="img/x.gif" alt="攻击者"></a>
			</div>
		</th>
	</tr>
</thead>
</table>

<table cellpadding="1" cellspacing="1" id="top10_offs" class="top10 row_table_data">
<thead>
	<tr>
		<th onclick="return Popup(3,5)"><img src="img/x.gif" class="help" alt="说明" title="说明"></th>
		<th colspan="2">本周攻击排行</th>
	</tr>
	<tr>
		<td>排名</td>
		<td>玩家</td>
		<td>点数</td>
	</tr>
</thead>
<tbody>
	<?php
    while ($row = mysql_fetch_array($result))
    {
		if ($row['username'] == $session->username) 
		{
			echo "<tr class=\"own hl\">";
			$my_rank = $i;
		} 
		else 
		{
			echo "<tr>";
		}
		echo "<td class=\"ra fc\">".$i++.".&nbsp;</td>";
		echo "<td class=\"pla\"><a href='spieler.php?uid=".$row['id']."'>".$row['username']."</a></td>";
		echo "<td class=\"val lc\">".$row['ap']."</td>";
		echo "</tr>";
    }
	?>
	<tr>
		<td colspan="3" class="empty"></td>
	</tr>
	<?php
    while ($row = mysql_fetch_array($result2))
	{
		echo "<tr class=\"own hl\">";
		if ($my_rank == 0)
		{
			echo "<td class=\"ra fc\">?.&nbsp;</td>";
		}
		else
		{
			echo "<td class=\"ra fc\">".$my_rank.".&nbsp;</td>";
		}
		echo "<td class=\"pla\"><a href='spieler.php?uid=".$row['id']."'>".$row['username']."</a></td>";
		echo "<td class=\"val lc\">".$row['ap']."</td>";
		echo "</tr>";
	}
	?>
</tbody>
</table>

<?php
//	防御排行
$i = 1;
$my_rank = 0;
$result = mysql_query("SELECT * FROM ".TB_PREFIX."users ORDER BY dp DESC Limit 10");
$result2 = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE username = '".$session->username."' ORDER BY dp DESC Limit 1");
?>

<table cellpadding="1" cellspacing="1" id="top10_defs" class="top10 row_table_data">
<thead>
	<tr>
		<th onclick="return Popup(3,5)"><img src="img/x.gif" class="help" alt="说明" title="说明"></th>
		<th colspan="2">本周防御排行</th>
	</tr>
	<tr>
		<td>排名</td>
		<td>玩家</td>
		<td>点数</td>
	</tr>
</thead>
<tbody>
	<?php
	while ($row = mysql_fetch_array($result))
	{
		if ($row['username'] == $session->username)
		{
			echo "<tr class=\"own hl\">";
			$my_rank = $i;
		} 
		else 
		{ 
			echo "<tr>"; 
		}
		echo "<td class=\"ra fc\">".$i++.".&nbsp;</td>";
		echo "<td class=\"pla\"><a href='spieler.php?uid=".$row['id']."'>".$row['username']."</a></td>";
		echo "<td class=\"val lc\">".$row['dp']."</td>";
		echo "</tr>";
	}
	?>
	<tr>
		<td colspan="3" class="empty"></td>
	</tr>
	<?php
    while ($row = mysql_fetch_array($result2))
	{
		echo "<tr class=\"own hl\">";
		if ($my_rank == 0)
		{
			echo "<td class=\"ra fc\">?.&nbsp;</td>";
		}
		else
		{
			echo "<td class=\"ra fc\">".$my_rank.".&nbsp;</td>";
		}
		echo "<td class=\"pla\"><a href='spieler.php?uid=".$row['id']."'>".$row['username']."</a></td>";
		echo "<td class=\"val lc\">".$row['dp']."</td>";
		echo "</tr>";
	}
	?>
</tbody>
</table>

<?php
//	爬升排行
$i = 1;
$my_rank = 0;
$result = mysql_query("SELECT * FROM ".TB_PREFIX."users ORDER BY Rc DESC Limit 10");
$result2 = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE username = '".$session->username."' ORDER BY Rc DESC Limit 1");
?>

<div class="clear"></div>
<table cellpadding="1" cellspacing="1" id="top10_climbers" class="top10 row_table_data">
<thead>
	<tr>
		<th onclick="return Popup(3,5)"><img src="img/x.gif" class="help" alt="说明" title="说明"></th>
		<th colspan="2">本周排行爬升</th>
	</tr>
	<tr>
		<td>排名</td>
		<td>玩家</td>
		<td>爬升</td>
	</tr>
</thead>
<tbody>
<?php
while ($row = mysql_fetch_array($result))
{
	if ($row['username'] == $session->username)
	{
		echo "<tr class=\"own hl\">";
		$my_rank = $i;
	} 
	else 
	{ 
		echo "<tr>"; 
	}
	echo "<td class=\"ra fc\">".$i++.".&nbsp;</td>";
	echo "<td class=\"pla\"><a href='spieler.php?uid=".$row['id']."'>".$row['username']."</a></td>";
	echo "<td class=\"val lc\">".$row['Rc']."</td>";
	echo "</tr>";
}
?>
<tr>
	<td colspan="3" class="empty"></td>
</tr>
<?php
while ($row = mysql_fetch_array($result2))
{
	echo "<tr class=\"own hl\">";
	if ($my_rank == 0)
	{
		echo "<td class=\"ra fc\">?.&nbsp;</td>";
	}
	else
	{
		echo "<td class=\"ra fc\">".$my_rank.".&nbsp;</td>";
	}
	echo "<td class=\"pla\"><a href='spieler.php?uid=".$row['id']."'>".$row['username']."</a></td>";
	echo "<td class=\"val lc\">".$row['Rc']."</td>";
	echo "</tr>";
}
?>
</tbody>
</table>

<?php
//	掠夺排行
$i = 1;
$my_rank = 0;
$result = mysql_query("SELECT * FROM ".TB_PREFIX."users ORDER BY RR DESC Limit 10");
$result2 = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE username = '".$session->username."' ORDER BY RR DESC Limit 1");
?>

<table cellpadding="1" cellspacing="1" id="top10_raiders" class="top10 row_table_data">
<thead>
	<tr>
		<th onclick="return Popup(3,5)"><img src="img/x.gif" class="help" alt="说明" title="说明"></th>
		<th colspan="2">本周掠夺排行</th>
	</tr>
	<tr>
		<td>排名</td>
		<td>玩家</td>
		<td>资源</td>
	</tr>
</thead>
<tbody>
<?php
while ($row = mysql_fetch_array($result))
{
	if ($row['username'] == $session->username) 
	{
		echo "<tr class=\"own hl\">";
		$my_rank = $i;
	} 
	else 
	{ 
		echo "<tr>"; 
	}

	echo "<td class=\"ra fc\">".$i++.".&nbsp;</td>";
	echo "<td class=\"pla\"><a href='spieler.php?uid=".$row['id']."'>".$row['username']."</a></td>";
	echo "<td class=\"val lc\">".$row['RR']."</td>";
	echo "</tr>";
	
	//	echo "<td>".$i++.".&nbsp;</td>";
	//	echo "<td><a href='spieler.php?uid=".$row['id']."'>".$row['username']."</a></td>";
	//	echo "<td>".$row['RR']."</td>";
	//	echo "</tr>";
}
?>
<tr>
	<td colspan="3" class="empty"></td>
</tr>
<?php
while ($row = mysql_fetch_array($result2))
{
	echo "<tr class=\"own hl\">";
	if ($my_rank == 0)
	{
		echo "<td class=\"ra fc\">?.&nbsp;</td>";
	}
	else
	{
		echo "<td class=\"ra fc\">".$my_rank.".&nbsp;</td>";
	}
	echo "<td class=\"pla\"><a href='spieler.php?uid=".$row['id']."'>".$row['username']."</a></td>";
	echo "<td class=\"val lc\">".$row['RR']."</td>";
	echo "</tr>";
}
mysql_close($con);
?>
</tbody>
</table>