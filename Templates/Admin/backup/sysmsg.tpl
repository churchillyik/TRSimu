<?php
$max_per_pass = 1000;
mysql_connect(SQL_SERVER, SQL_USER, SQL_PASS);
mysql_select_db(SQL_DB);
if (mysql_num_rows(mysql_query("SELECT id FROM ".TB_PREFIX."users WHERE access = 9 AND id = ".$session->uid)) != '1')
if (isset($_GET['del']))
	$query = "SELECT * FROM ".TB_PREFIX."users ORDER BY id + 0 DESC";
	$result = mysql_query($query) or die (mysql_error());
	for ($i = 0; $row = mysql_fetch_row($result); $i++)
	}
}
if ($_POST['submit'] == "Send")
{
	unset($_SESSION['m_message']);
	$_SESSION['m_message'] = $_POST['message'];
	$NextStep = true;
}
if (isset($_POST['confirm']))
{
	if ($_POST['confirm'] == 'No' )
	if ($_POST['confirm'] == 'Yes')
		if (file_exists("Templates/text.tpl"))
			$myFile = "Templates/text.tpl";
			$fh = fopen($myFile, 'w') or die("<br/><br/><br/>Can't open file: templates/text.tpl");
			$text = file_get_contents("Templates/text_format.tpl");
			$text = preg_replace("'%TEKST%'", $_SESSION['m_message'], $text);
			fwrite($fh, $text);
			$query = "SELECT * FROM ".TB_PREFIX."users ORDER BY id + 0 DESC";
			$result = mysql_query($query) or die (mysql_error());
			for ($i = 0; $row = mysql_fetch_row($result); $i++)
				$updateattquery = mysql_query("UPDATE ".TB_PREFIX."users SET ok = '1' WHERE id = '".$row[0]."'") or die(mysql_error());
			}
			$done = true;
		}
	}
?>
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
	if ($session->gpack == null || GP_ENABLE == false)
		echo "
		<link href='".GP_LOCATE."travian.css?e21d2' rel='stylesheet' type='text/css' />
		<link href='".GP_LOCATE."lang/en/lang.css?e21d2' rel='stylesheet' type='text/css' />";
	}
		echo "
		<link href='".$session->gpack."travian.css?e21d2' rel='stylesheet' type='text/css' />
		<link href='".$session->gpack."lang/en/lang.css?e21d2' rel='stylesheet' type='text/css' />";
	}
	?>
	<script type="text/javascript">
		window.addEvent('domready', start);
	</script>
</head> 
<div class="wrapper">
	<img style="filter:chroma();" src="img/x.gif" id="msfilter" alt="" />
	<div id="dynamic_header"></div>
	<?php include("Templates/header.tpl"); ?>
	<div id="mid">
		<?php include("Templates/menu.tpl"); ?>
		<div id="content" class="login">
		<?php
			<form method="POST" action="sysmsg.php" name="myform" id="myform">
				<table cellspacing="1" cellpadding="1" class="tbg" style="background-color:#C0C0C0; border: 0px solid #C0C0C0; font-size: 10pt;">
				<tbody>
				<tr>
					<td class="rbg" style="font-size: 10pt; text-align:center;">系统讯息</td>
				</tr>
				<tr>
					<td style="font-size: 10pt; text-align:center;">
						<textarea class="fm" name="message" cols="60" rows="23"></textarea>
				</tr>
				<tr>
					<td style="text-align:center;">All fields required</td>    
				</tr>
				<tr>
					<td style="text-align:center;"><input type="submit" value="Send" name="submit" /></td>
				</tr>
				</tbody>
				</table>
			</form>
			<a href="sysmsg.php?del">Delete old System Message</a>
		<?php
			<form method="POST" action="sysmsg.php">
				<table cellspacing="1" cellpadding="2" class="tbg">    
				<tbody>
				<tr>
					<td class="rbg" colspan="2">Confirmation</td>    
				</tr>
				<tr>
					<td style="text-align: left; width: 200px;">Do you really want to send System Message?</td>
					<td style="text-align: left;">
						<input type="submit" style="width: 240px;" class="fm" name="confirm" value="Yes">
						<input type="submit" style="width: 240px;" class="fm" name="confirm" value="No">
				</tr>
				</tbody>
				</table>
			</form>
			Example: (BBCode doesn't work over here!)
			<?php
			$txt = $_SESSION['m_message'];
			$txt = preg_replace("/\[b\]/is",'<b>', $txt);
			$txt = preg_replace("/\[\/b\]/is",'</b>', $txt);
			$txt = preg_replace("/\[i\]/is",'<i>', $txt);
			$txt = preg_replace("/\[\/i\]/is",'</i>', $txt);
			$txt = preg_replace("/\[u\]/is",'<u>', $txt);
			$txt = preg_replace("/\[\/u\]/is",'</u>', $txt);
			echo ($txt);
		}
			<b><?php echo MASS_ABORT; ?></b>
		<?php
			System Message was sent
		<?php
	</div>
	<div id="side_info" class="outgame"></div>
	<div class="footer-stopper outgame"></div>
	<div class="clear"></div>
	<?php include("Templates/footer.tpl"); ?>
	<div id="ce"></div>
</body>
</html>
<?php mysql_close(); ?>