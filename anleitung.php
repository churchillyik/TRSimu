<?php
include("GameEngine/Account.php");
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<title><?php echo SERVER_NAME; ?></title>
	<link REL="shortcut icon" HREF="favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="gpack/travian/main.css"/>
	<link rel="stylesheet" type="text/css" href="gpack/travian/flaggs.css"/>
	<meta name="content-language" content="en"/>
	<meta http-equiv="imagetoolbar" content="no"/>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="mt-core.js" type="text/javascript"></script>
	<script src="new.js" type="text/javascript"></script>
	<style type="text/css" media="screen"></style>
</head>

<body class="webkit contentPage">
<div class="wrapper"> 
	<div id="country_select"></div> 
	<div id="header"><h1>欢迎来到<?php echo SERVER_NAME; ?></h1></div>
	<div id="navigation">
		<a href="index.php" class="home"><img src="img/x.gif" alt="Travian"/></a>
		<table class="menu">
		<tr>
			<td><a href="#"><span>1分钟指南</span></a></td>
			<td><a href="anleitung.php"><span><?php echo MANUAL; ?></span></a></td>
			<td><a href="#" target="_blank"><span><?php echo FORUM; ?></span></a></td>
			<td><a href="anmelden.php"><span><?php echo REG; ?></span></a></td>
			<td><a href="login.php"><span><?php echo LOGIN; ?></span></a></td>
		</tr>
		</table>
	</div> 

	<div id="content">
		<div class="grit">
			<h1><?php echo MANUAL; ?></h1>
			<p class="submenu">
				<a href="anleitung.php">种族</a> | 
				<a href="anleitung.php?s=1">建筑</a> |
				<a href="anleitung.php?s=3">常见问题</a>
			</p>
			
			<?php
			if(!isset($_GET['s'])) 
			{
				$_GET['s'] = ""; 
			}
			if ($_GET['s'] == "") 
			{
				include("Templates/Anleitung/0.tpl");
			}
			if ($_GET['s'] == "1") 
			{
				include("Templates/Anleitung/1.tpl");
			}
			if ($_GET['s'] == "3") 
			{
				include("Templates/Anleitung/3.tpl");
			}
			if ($_GET['s'] == "4") 
			{
				include("Templates/Anleitung/4.tpl");
			}
			?>
			
		</div>
	</div>
	
	<div id="footer">
	<div class="container">
		<li class="copyright">&copy; 2010 - 2011 <?php echo TRAVIAN_COPYRIGHT; ?> </li>
	</div>
	</div>
	
	<div id="iframe_layer" class="overlay">
		<div class="mask closer"></div>
		<div class="overlay_content">
			<a href="index.php" class="closer"><img class="dynamic_img" alt="Close" src="img/un/x.gif" /></a>
			<h2>Anleitung</h2>
			<div id="frame_box"></div>
			<div class="footer"></div>
		</div>
	</div>

</div>

</body> 
</html> 