<?php
error_reporting(E_ALL);
include("GameEngine/Account.php");
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>掌联科技 <?php echo SERVER_NAME; ?></title>
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

<body class="webkit indexPage">
<div class="wrapper">
	<div id="country_select"></div>
	<div id="header"><h1><?php echo SERVER_NAME; ?></h1></div>
	<div id="navigation">
		<a href="index.php" class="home">
			<img src="img/x.gif" alt="<?php echo SERVER_NAME; ?>"/>
		</a>
		<table class="menu">
			<tr>
				<td><a href="tutorial.php"><span>1分钟指南</span></a></td>
				<td><a href="anleitung.php"><span><?php echo MANUAL; ?></span></a></td>
				<td><a href="#" target="_blank"><span><?php echo FORUM; ?></span></a></td>
				<td><a href="anmelden.php"><span><?php echo REG; ?></span></a></td>
				<td><a href="login.php"><span><?php echo LOGIN; ?></span></a></td>
			</tr>
		</table>
	</div>
	<div id="register_now">
		<a href="anmelden.php"><?php echo REG; ?></a>
		<span><?php echo PLAY_NOW; ?></span>
	</div>
	<div id="content">
		<div class="grit">
			<div class="infobox">
				<div id="what_is_travian">
					<h2><?php echo WHAT_IS; ?></h2>
					<p><?php echo WHAT_IS_ANSWER; ?></p>
					<p class="play_now"><a href="anmelden.php" class="signup_link"><?php echo CLICK_HERE; ?></a></p>
				</div>
				<div id="player_counter">
					<table>
					<tbody>
					<tr>
						<th><?php echo TOTAL_PLAYERS; ?></th>
						<td>
							<?php
							$users = mysql_num_rows(mysql_query("SELECT SQL_CACHE * FROM ".TB_PREFIX."users")) - 2;
							echo $users;
							?>
						</td>
					</tr>
					<tr>
						<th><?php echo ACTIVE_PLAYERS; ?></th>
						<td>0</td>
					</tr>
					<tr>
						<th><?php echo ONLINE_PLAYERS; ?></th>
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
				</div>
			</div>
			<div class="secondarybox">
				<div id="screenshots">
					<h2><?php echo SCREENSHOTS; ?></h2>
					<div id="screenshots_preview">
						<ul id="screenshot_list" style="position:absolute; left:0px; width: 686px;">
							<li ><a href="#"><img src="img/un/s/s1s.jpg" alt="Screenshot"/></a></li>
							<li ><a href="#"><img src="img/un/s/s2s.jpg" alt="Screenshot"/></a></li>
							<li ><a href="#"><img src="img/un/s/s4s.jpg" alt="Screenshot"/></a></li>
							<li ><a href="#"><img src="img/un/s/s3s.jpg" alt="Screenshot"/></a></li>
							<li ><a href="#"><img src="img/un/s/s5s.jpg" alt="Screenshot"/></a></li>
							<li ><a href="#"><img src="img/un/s/s7s.jpg" alt="Screenshot"/></a></li>
							<li ><a href="#"><img src="img/un/s/s8s.jpg" alt="Screenshot"/></a></li>
						</ul> 
					</div>
				</div>
				<div id="newsbox">
					<!--
					<h2><center>Donate for this script:</center></h2>
					<div class="news">
						<h4><center></center></h4>
						<p class="date"></p>
						<p><p>
						<center>
						<b>You are using TravianX for free at the moment.<br /> Lets keep it that way by donating small anmount!</b>
						<p><p>
						<form action="https://www.paypal.com/cgi-bin/webscr" method="post">
							<input type="hidden" name="cmd" value="_s-xclick">
							<input type="hidden" name="hosted_button_id" value="B2UG5JHKGMQUE">
							<input type="image" src="https://www.paypalobjects.com/en_US/GB/i/btn/btn_donateCC_LG.gif" border="0" 
							name="submit" alt="PayPal - The safer, easier way to pay online.">
							<img alt="" border="0" src="https://www.paypalobjects.com/nl_NL/i/scr/pixel.gif" width="1" height="1">
						</form>
						</center>
						<p><p>
					</div>
					-->
				</div>
			</div>
			<div class="clear"></div>
		</div>
		<div id="footer">
			<div class="container">
				<!--
				<a href="#" class="logo"><img src="img/x.gif" alt="<?php echo SERVER_NAME; ?> Games" class="logo_traviangames" /></a>
				-->
				<li class="copyright">&copy; 2010 - 2011 <?php echo TRAVIAN_COPYRIGHT; ?> </li>
			</div>
		</div>
	</div>
	<div id="login_layer" class="overlay">
		<div class="mask closer"></div>
		<div id="login_list" class="overlay_content">
			<h2>Choose your world</h2>
			<a href="index.php" class="closer"><img class="dynamic_img" alt="Close" src="img/un/x.gif" /></a>
			<div class="footer"></div>
		</div>
	</div>
	<div id="signup_layer" class="overlay">
	<div class="mask closer"></div>
	<div id="signup_list" class="overlay_content">
		<h2>Choose your world</h2>
		<a href="index.php" class="closer"><img class="dynamic_img" alt="Close" src="img/un/x.gif" /></a>
		<div class="footer"></div>
	</div>
	</div>
	<div id="iframe_layer" class="overlay">
	<div class="mask closer"></div>
	<div class="overlay_content">
		<a href="index.php" class="closer"><img class="dynamic_img" alt="Close" src="img/un/x.gif" /></a>
		<h2>Anleitung</h2>
		<div id="frame_box" ></div>
		<div class="footer"></div>
	</div>
	</div> 
	<div id="screenshot_layer" class="overlay">
	<div class="mask closer"></div>
	<div class="overlay_content">
		<h3><?php SCREENSHOTS; ?></h3>
		<a href="index.php" class="closer"><img class="dynamic_img" alt="Close" src="img/x.gif" /></a>
		<div class="screenshot_view">
			<h4 id="screen_hl"></h4>
			<img id="screen_view" src="img/x.gif" alt="Screenshot"/>
			<div id="screen_desc"></div>
		</div>
		<!--
		<a href="#prev" class="navi prev" onclick="galarie.showPrev();"><img class="dynamic_img" src="img/x.gif" alt="previous"/></a>
		<a href="#next" class="navi next" onclick="galarie.showNext();"><img class="dynamic_img" src="img/x.gif" alt="next"/></a>
		-->
		<div class="footer"></div>
	</div>
	</div>

<script type="text/javascript">
	var screenshots = [
	{
		'img':'img/en/s/s1.png',
		'hl':'Village centre',
		'desc':'This is how your village will look before you start to expand to form your empire.'
	},
	{
		'img':'img/en/s/s2.png',
		'hl':'Village overview',
		'desc':'Lumber, clay, iron and crop is needed to supply your village with food, building material and troops.'
	},
	{
		'img':'img/en/s/s4.png',
		'hl':'Surrounding territory',
		'desc':'Explore the map to meet new friends or encounter new enemies. Look for nearby oases to gather more resources, but watch out for wild animals there.'
	},
	{
		'img':'img/en/s/s3.png',
		'hl':'Building information',
		'desc':'There are lots of buildings to be built in your villages. Choose wisely or ask the Taskmaster for his opinion.'
	},
	{
		'img':'img/en/s/s5.png',
		'hl':'Battle report',
		'desc':'Do not forget to build up your own army. You will need it to protect yourself and of course for attacks to gather resources from opposing players.'
	},
	{
		'img':'img/en/s/s7.png',
		'hl':'Medals',
		'desc':'Gain honourable medals in several categories. The top 10 players and alliances of each week will gain such an achievement.'
	},
	{
		'img':'img/en/s/s8.png',
		'hl':'Tasks',
		'desc':'Do not miss the Taskmaster. He will guide you through the first steps of <?php echo SERVER_NAME; ?> and will help you with free resources. Just click on the image on the right side of the screen to activate him.'
	}
	];

	//var galarie = new Fx.Screenshots('screen_view', 'screen_hl', 'screen_desc', screenshots);
</script>

</body>
</html>