<?php
include(dirname(__FILE__)."/../../GameEngine/Account.php");

mysql_connect(SQL_SERVER, SQL_USER, SQL_PASS);
mysql_select_db(SQL_DB);

if (mysql_num_rows(mysql_query("SELECT id FROM ".TB_PREFIX."users WHERE access = ".MODERATOR." AND id = ".$session->uid)) != '1')
{
	die("Hacking attemp!");
}

$q = "SELECT * FROM ".TB_PREFIX."medal order by week DESC LIMIT 0, 1";
$result = mysql_query($q);
if (mysql_num_rows($result))
{
	$row = mysql_fetch_assoc($result);
	$week = $row['week'] + 1;
}
else
{
	$week = '1';
}

if (isset($_GET['giveout']))
{
    $result = mysql_query("SELECT * FROM ".TB_PREFIX."users ORDER BY ap DESC Limit 10");
    $i = 0;
	while ($row = mysql_fetch_array($result))
	{
		$i++;
		$img = "t2_".($i)."";
		$quer = "insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '1', '".($i)."', '".$week."', '".$row['ap']."', '".$img."')";
		$resul = mysql_query($quer);
	}
	
    $result = mysql_query("SELECT * FROM ".TB_PREFIX."users ORDER BY dp DESC Limit 10");
    $i = 0;
	while ($row = mysql_fetch_array($result))
	{
		$i++;
		$img = "t3_".($i)."";
		$quer = "insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '2', '".($i)."', '".$week."', '".$row['dp']."', '".$img."')";
		$resul = mysql_query($quer);
	}

    $result = mysql_query("SELECT * FROM ".TB_PREFIX."users ORDER BY RR DESC Limit 10");
    $i = 0;
	while ($row = mysql_fetch_array($result))
	{
		$i++;
		$img = "t4_".($i)."";
		$quer = "insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '4', '".($i)."', '".$week."', '".$row['RR']."', '".$img."')";
		$resul = mysql_query($quer);
	}	
	
    $result = mysql_query("SELECT * FROM ".TB_PREFIX."users ORDER BY ap DESC Limit 10");
    while ($row = mysql_fetch_array($result))
	{
		$result2 = mysql_query("SELECT * FROM ".TB_PREFIX."users ORDER BY dp DESC Limit 10");
		while ($row2 = mysql_fetch_array($result2))
		{
			if ($row['id'] == $row2['id'])
			{
				$query3 = "SELECT count(*) FROM ".TB_PREFIX."medal WHERE userid='".$row['id']."' AND categorie = 5";
				$result3 = mysql_query($query3);
				$row3 = mysql_fetch_row($result3);

				if ($row3[0] <= '2')
				{
					$img = "t22".$row3[0]."_1";
					switch ($row3[0])
					{
						case "0":
							$tekst = "";
							break;
						case "1":
							$tekst = "twice ";
							break;
						case "2":
							$tekst = "three times ";
							break;
					}
					$quer = "insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '5', '0', '".$week."', '".$tekst."', '".$img."')";
					$resul = mysql_query($quer);
				}
			}
		}
	}
	
    $result = mysql_query("SELECT * FROM ".TB_PREFIX."users ORDER BY ap DESC Limit 10");
    while ($row = mysql_fetch_array($result))
	{
		$query1 = "SELECT count(*) FROM ".TB_PREFIX."medal WHERE userid='".$row['id']."' AND categorie = 1 AND plaats<=3";
		$result1 = mysql_query($query1);
		$row1 = mysql_fetch_row($result1);

		if ($row1[0] == '3')
		{
			$img = "t120_1";
			$quer = "insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '6', '0', '".$week."', 'drie', '".$img."')";
			$resul = mysql_query($quer);
		}
		if ($row1[0] == '5')
		{	
			$img = "t121_1";
			$quer = "insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '6', '0', '".$week."', 'vijf', '".$img."')";
			$resul = mysql_query($quer);
		}
		if ($row1[0] == '10')
		{	
			$img = "t122_1";
			$quer = "insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '6', '0', '".$week."', 'tien', '".$img."')";
			$resul = mysql_query($quer);
		}
	}
	
    $result = mysql_query("SELECT * FROM ".TB_PREFIX."users ORDER BY dp DESC Limit 10");
    while ($row = mysql_fetch_array($result))
	{
		$query1 = "SELECT count(*) FROM ".TB_PREFIX."medal WHERE userid='".$row['id']."' AND categorie = 2 AND plaats <= 3";
		$result1 = mysql_query($query1);
		$row1 = mysql_fetch_row($result1);
		
		if ($row1[0] == '3')
		{	
			$img = "t140_1";
			$quer = "insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '7', '0', '".$week."', 'drie', '".$img."')";
			$resul = mysql_query($quer);
		}

		if ($row1[0] == '5')
		{
			$img = "t141_1";
			$quer = "insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '7', '0', '".$week."', 'vijf', '".$img."')";
			$resul = mysql_query($quer);
		}

		if ($row1[0] == '10')
		{
			$img = "t142_1";
			$quer = "insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '7', '0', '".$week."', 'tien', '".$img."')";
			$resul = mysql_query($quer);
		}
	}	

    $result = mysql_query("SELECT * FROM ".TB_PREFIX."users ORDER BY RR DESC Limit 10");
    while ($row = mysql_fetch_array($result))
	{
		$query1 = "SELECT count(*) FROM ".TB_PREFIX."medal WHERE userid='".$row['id']."' AND categorie = 4 AND plaats<=3";
		$result1 = mysql_query($query1);
		$row1 = mysql_fetch_row($result1);

		if ($row1[0] == '3')
		{	
			$img = "t160_1";
			$quer = "insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '9', '0', '".$week."', 'drie', '".$img."')";
			$resul = mysql_query($quer);
		}

		if ($row1[0] == '5')
		{	
			$img = "t161_1";
			$quer = "insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '9', '0', '".$week."', 'vijf', '".$img."')";
			$resul = mysql_query($quer);
		}		

		if ($row1[0] == '10')
		{	
			$img = "t162_1";
			$quer = "insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '9', '0', '".$week."', 'tien', '".$img."')";
			$resul = mysql_query($quer);
		}
	}
	
	$query = "SELECT * FROM ".TB_PREFIX."users ORDER BY id+0 DESC";
	$result = mysql_query($query);
	for ($i = 0; $row = mysql_fetch_row($result); $i++)
	{
		mysql_query("UPDATE ".TB_PREFIX."users SET ap=0, dp=0, RR=0 WHERE id = ".$row[0]."");
	}
}
?>

<?php
if (isset($_GET['giveout']))
{
?>
	<h1>Top 10 Medals</h1>
	<br />
	Done:<br />
	-Top 10 Attack<br />
	-Top 10 Defence<br />
	-Top 10 Robbers<br />
	-Bonus: Attack AND Defence<br />
	-Bonus: 3/5/10 times top 3 Attack<br />
	-Bonus: 3/5/10 times top 3 Defence<br />
	-Bonus: 3/5/10 times top 3 Robber<br />
	<br />
	Not Done:<br />
	-Top 10 Climbers<br />
	-Bonus: 3/5/10 times top 3 Climbers<br />
	-Bonus: 3/5/10 times in a row top 10 Attack<br />
	-Bonus: 3/5/10 times in a row top 10 Defence<br />
	-Bonus: 3/5/10 times in a row top 10 Climbers<br />
	-Bonus: 3/5/10 times in a row top 10 Robber<br />
<?php
}
else
{
?>
	<h1>Top 10 Medals</h1>
	<br />
	Click <a href="admin.php?p=medals&giveout">here</a>, to give the medals away for <b>week <?php echo $week; ?></b>!
	<br/>
	WARNING: Loading next page can take some time!
<?php
}
mysql_close();
?>
