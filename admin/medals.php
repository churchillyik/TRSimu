<?php
include("GameEngine/Account.php");

mysql_connect(SQL_SERVER, SQL_USER, SQL_PASS);
mysql_select_db(SQL_DB);

if (mysql_num_rows(mysql_query("SELECT id FROM ".TB_PREFIX."users WHERE access = 9 AND id = ".$session->uid)) != '1') die("Hacking attemp!");

		//bepaal welke week we zitten
		$q = "SELECT * FROM ".TB_PREFIX."medal order by week DESC LIMIT 0, 1";
		$result = mysql_query($q);
		if(mysql_num_rows($result)) {
			$row=mysql_fetch_assoc($result);
			$week=($row['week']+1);
		} else {
			$week='1';
		}
	
	//we mogen de lintjes weggeven
	if(isset($_GET['giveout'])){
	

	//Aanvallers v/d Week
    $result = mysql_query("SELECT * FROM ".TB_PREFIX."users ORDER BY ap DESC Limit 10");
    $i=0; 	while($row = mysql_fetch_array($result)){
	$i++;	$img="t2_".($i)."";
	$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '1', '".($i)."', '".$week."', '".$row['ap']."', '".$img."')";
	$resul=mysql_query($quer);	  
	}

	//Verdediger v/d Week
    $result = mysql_query("SELECT * FROM ".TB_PREFIX."users ORDER BY dp DESC Limit 10");
    $i=0; 	while($row = mysql_fetch_array($result)){
	$i++;	$img="t3_".($i)."";
	$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '2', '".($i)."', '".$week."', '".$row['dp']."', '".$img."')";
	$resul=mysql_query($quer);	  
	}	
	
	//Klimmers v/d Week
    /*$result = mysql_query("SELECT * FROM ".TB_PREFIX."users ORDER BY Rc DESC Limit 10");
    $i=0; 	while($row = mysql_fetch_array($result)){
	$i++;	$img="t1_".($i)."";
	$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '3', '".($i)."', '".$week."', '".$row['Rc']."', '".$img."')";
	$resul=mysql_query($quer);	  
	}	*/

	//Overvallers v/d Week
    $result = mysql_query("SELECT * FROM ".TB_PREFIX."users ORDER BY RR DESC Limit 10");
    $i=0; 	while($row = mysql_fetch_array($result)){
	$i++;	$img="t4_".($i)."";
	$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '4', '".($i)."', '".$week."', '".$row['RR']."', '".$img."')";
	$resul=mysql_query($quer);	  
	}	
	
	//deel de bonus voor aanval+defence top 10 uit
	//Pak de top10 aanvallers
    $result = mysql_query("SELECT * FROM ".TB_PREFIX."users ORDER BY ap DESC Limit 10");
    while($row = mysql_fetch_array($result)){
	
		 //Pak de top10 verdedigers
		$result2 = mysql_query("SELECT * FROM ".TB_PREFIX."users ORDER BY dp DESC Limit 10");
		while($row2 = mysql_fetch_array($result2)){
			if($row['id']==$row2['id']){
			
			$query3="SELECT count(*) FROM ".TB_PREFIX."medal WHERE userid='".$row['id']."' AND categorie = 5";
			$result3=mysql_query($query3);
	 		$row3=mysql_fetch_row($result3);
		
				//kijk welke kleur het lintje moet hebben
				if($row3[0]<='2'){
					$img="t22".$row3[0]."_1";
						switch ($row3[0]) {
							case "0":
								$tekst="";
								break;
							case "1":
								$tekst="twice ";
								break;
							case "2":
								$tekst="three times ";
								break;
						}
					$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '5', '0', '".$week."', '".$tekst."', '".$img."')";
					$resul=mysql_query($quer);
				}
			}
		}	
	}
	
	//je staat voor 3e / 5e / 10e keer in de top 10 aanvallers 
	//Pak de top10 aanvallers
    $result = mysql_query("SELECT * FROM ".TB_PREFIX."users ORDER BY ap DESC Limit 10");
    while($row = mysql_fetch_array($result)){ 
	
			$query1="SELECT count(*) FROM ".TB_PREFIX."medal WHERE userid='".$row['id']."' AND categorie = 1 AND plaats<=3";
			$result1=mysql_query($query1);
	 		$row1=mysql_fetch_row($result1);
 
		
		//2x in gestaan, dit is 3e dus lintje (brons)
		if($row1[0]=='3'){	
			$img="t120_1";
			$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '6', '0', '".$week."', 'drie', '".$img."')";
			$resul=mysql_query($quer);
		}
		//4x in gestaan, dit is 5e dus lintje (zilver)
		if($row1[0]=='5'){	
			$img="t121_1";
			$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '6', '0', '".$week."', 'vijf', '".$img."')";
			$resul=mysql_query($quer);
		}		
		//9x in gestaan, dit is 10e dus lintje (goud)
		if($row1[0]=='10'){	
			$img="t122_1";
			$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '6', '0', '".$week."', 'tien', '".$img."')";
			$resul=mysql_query($quer);
		}
		
	}
	
	//je staat voor 3e / 5e / 10e keer in de top 10 verdedigers 
	//Pak de top10 verdedigers
    $result = mysql_query("SELECT * FROM ".TB_PREFIX."users ORDER BY dp DESC Limit 10");
    while($row = mysql_fetch_array($result)){ 
	
			$query1="SELECT count(*) FROM ".TB_PREFIX."medal WHERE userid='".$row['id']."' AND categorie = 2 AND plaats<=3";
			$result1=mysql_query($query1);
	 		$row1=mysql_fetch_row($result1);
 
		
		//2x in gestaan, dit is 3e dus lintje (brons)
		if($row1[0]=='3'){	
			$img="t140_1";
			$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '7', '0', '".$week."', 'drie', '".$img."')";
			$resul=mysql_query($quer);
		}
		//4x in gestaan, dit is 5e dus lintje (zilver)
		if($row1[0]=='5'){	
			$img="t141_1";
			$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '7', '0', '".$week."', 'vijf', '".$img."')";
			$resul=mysql_query($quer);
		}		
		//9x in gestaan, dit is 10e dus lintje (goud)
		if($row1[0]=='10'){	
			$img="t142_1";
			$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '7', '0', '".$week."', 'tien', '".$img."')";
			$resul=mysql_query($quer);
		}
		
	}	

	//je staat voor 3e / 5e / 10e keer in de top 10 klimmers 
	//Pak de top10 klimmers
    /*$result = mysql_query("SELECT * FROM ".TB_PREFIX."users ORDER BY Rc DESC Limit 10");
    while($row = mysql_fetch_array($result)){ 
	
			$query1="SELECT count(*) FROM ".TB_PREFIX."medal WHERE userid='".$row['id']."' AND categorie = 3 AND plaats<=3";
			$result1=mysql_query($query1);
	 		$row1=mysql_fetch_row($result1);
 
		
		//2x in gestaan, dit is 3e dus lintje (brons)
		if($row1[0]=='3'){	
			$img="t100_1";
			$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '8', '0', '".$week."', 'drie', '".$img."')";
			$resul=mysql_query($quer);
		}
		//4x in gestaan, dit is 5e dus lintje (zilver)
		if($row1[0]=='5'){	
			$img="t101_1";
			$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '8', '0', '".$week."', 'vijf', '".$img."')";
			$resul=mysql_query($quer);
		}		
		//9x in gestaan, dit is 10e dus lintje (goud)
		if($row1[0]=='10'){	
			$img="t102_1";
			$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '8', '0', '".$week."', 'tien', '".$img."')";
			$resul=mysql_query($quer);
		}
	}	*/

	//je staat voor 3e / 5e / 10e keer in de top 10 overvallers 
	//Pak de top10 overvallers
    $result = mysql_query("SELECT * FROM ".TB_PREFIX."users ORDER BY RR DESC Limit 10");
    while($row = mysql_fetch_array($result)){ 
	
			$query1="SELECT count(*) FROM ".TB_PREFIX."medal WHERE userid='".$row['id']."' AND categorie = 4 AND plaats<=3";
			$result1=mysql_query($query1);
	 		$row1=mysql_fetch_row($result1);
 
		
		//2x in gestaan, dit is 3e dus lintje (brons)
		if($row1[0]=='3'){	
			$img="t160_1";
			$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '9', '0', '".$week."', 'drie', '".$img."')";
			$resul=mysql_query($quer);
		}
		//4x in gestaan, dit is 5e dus lintje (zilver)
		if($row1[0]=='5'){	
			$img="t161_1";
			$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '9', '0', '".$week."', 'vijf', '".$img."')";
			$resul=mysql_query($quer);
		}		
		//9x in gestaan, dit is 10e dus lintje (goud)
		if($row1[0]=='10'){	
			$img="t162_1";
			$quer="insert into ".TB_PREFIX."medal(userid, categorie, plaats, week, points, img) values('".$row['id']."', '9', '0', '".$week."', 'tien', '".$img."')";
			$resul=mysql_query($quer);
		}
	}
	
	//Zet alle waardens weer op 0
	 $query="SELECT * FROM ".TB_PREFIX."users ORDER BY id+0 DESC";
	 $result=mysql_query($query);
	 for ($i=0; $row=mysql_fetch_row($result); $i++){
	 mysql_query("UPDATE ".TB_PREFIX."users SET ap=0, dp=0, RR=0 WHERE id = ".$row[0]."");
	}
	
	}

?>
    
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title><?php echo SERVER_NAME ?></title>
    <link REL="shortcut icon" HREF="favicon.ico"/>
	<meta http-equiv="cache-control" content="max-age=0" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<meta http-equiv="imagetoolbar" content="no" />
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />

	<script src="mt-full.js?0ac36" type="text/javascript"></script>
	<script src="unx.js?0ac36" type="text/javascript"></script>
	<script src="new.js?0ac36" type="text/javascript"></script>
	<link href="gpack/travian_basic/lang/en/lang.css?f4b7c" rel="stylesheet" type="text/css" />
	<link href="gpack/travian_basic/lang/en/compact.css?f4b7c" rel="stylesheet" type="text/css" />
	<?php
	if($session->gpack == null || GP_ENABLE == false) {
	echo "
	<link href='".GP_LOCATE."travian.css?e21d2' rel='stylesheet' type='text/css' />
	<link href='".GP_LOCATE."lang/en/lang.css?e21d2' rel='stylesheet' type='text/css' />";
	} else {
	echo "
	<link href='".$session->gpack."travian.css?e21d2' rel='stylesheet' type='text/css' />
	<link href='".$session->gpack."lang/en/lang.css?e21d2' rel='stylesheet' type='text/css' />";
	}
	?>
	<script type="text/javascript">

		window.addEvent('domready', start);
	</script>
</head> 
<body class="v35 ie ie8">
<div class="wrapper">
<img style="filter:chroma();" src="img/x.gif" id="msfilter" alt="" />
<div id="dynamic_header">
	</div>
<?php include("Templates/header.tpl"); ?>
<div id="mid">
<?php include("Templates/menu.tpl"); ?>

<div id="content"  class="login">
<?php
if(isset($_GET['giveout'])){?>
<h1><br/>Top 10 Medals</h1><br />
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
} else{ ?><h1><br/>Top 10 Medals</h1><br />
Click <a href="?giveout">here</a>, to give the medals away for <b>week <?php echo $week; ?></b>!<br/>WARNING: Loading next page can take some time!
<?php } ?></div>
<div id="side_info" class="outgame">
</div>

<div class="clear"></div>
			</div>

			<div class="footer-stopper outgame"></div>
            <div class="clear"></div>
            
<?php include("Templates/footer.tpl"); ?>
<div id="ce"></div>
</body>
</html>
<?php mysql_close(); ?>
