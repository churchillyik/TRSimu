<?php 
include("GameEngine/Village.php");
include("Templates/time_start.tpl");
if (isset($_GET['rank']))
{
	$_POST['rank'] == $_GET['rank'];
}
$ranking->procRankReq($_GET);
$ranking->procRank($_POST);
if (isset($_GET['newdid']))
{
	$_SESSION['wid'] = $_GET['newdid'];
	header("Location: ".$_SERVER['PHP_SELF']);
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
	<script src="mt-full.js?0faaa" type="text/javascript"></script>
	<script src="unx.js?0faaa" type="text/javascript"></script>
	<script src="new.js?0faaa" type="text/javascript"></script>
	<link href="gpack/travian_basic/lang/en/lang.css?f4b7c" rel="stylesheet" type="text/css" />
	<link href="gpack/travian_basic/lang/en/compact.css?f4b7c" rel="stylesheet" type="text/css" />
	
	<?php
	if ($session->gpack == null || GP_ENABLE == false)
	{
		echo "
		<link href='".GP_LOCATE."travian.css?e21d2' rel='stylesheet' type='text/css' />
		<link href='".GP_LOCATE."lang/en/lang.css?e21d2' rel='stylesheet' type='text/css' />";
	}
	else
	{
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
	<div id="dynamic_header"></div>
	<?php include("Templates/header.tpl"); ?>
	<div id="mid">
		<?php include("Templates/menu.tpl"); ?>
		<div id="content" class="statistics">
			<h1>统计</h1>           	
			<?php
			if ($session->access == ADMIN)
			{
				echo "<a href=\"medals.php\">更新前10名</a>";
			}
			?>
			<div id="textmenu">
				<a href="statistiken.php" 
				<?php 
				if (!isset($_GET['id']) || (isset($_GET['id']) && ($_GET['id'] == 1 || $_GET['id'] == 31 || $_GET['id'] == 32 || $_GET['id'] == 7)))
				{
					echo "class=\"selected \"";
				} ?>
				>玩家</a> | 
				<a href="statistiken.php?id=4" 
				<?php 
				if (isset($_GET['id']) && ($_GET['id'] == 4 || $_GET['id'] == 41 || $_GET['id'] == 42 || $_GET['id'] == 47))
				{
					echo "class=\"selected \"";
				}
				?>
				>联盟</a> | 
				<a href="statistiken.php?id=2" 
				<?php 
				if (isset($_GET['id']) && $_GET['id'] == 2)
				{
					echo "class=\"selected \"";
				} ?>
				>村庄</a> | 
				<a href="statistiken.php?id=8" 
				<?php 
				if (isset($_GET['id']) && $_GET['id'] == 8) 
				{ 
					echo "class=\"selected \""; 
				} 
				?>
				>英雄</a> | 
				<a href="statistiken.php?id=0" 
				<?php 
				if (isset($_GET['id']) && $_GET['id'] == 0) 
				{ 
					echo "class=\"selected \""; 
				} 
				?>
				>总览</a>
			</div>
			<?php
			if (isset($_GET['id'])) 
			{
				switch ($_GET['id']) 
				{
					case 31:
						//	玩家攻击排行
						include("Templates/Ranking/player_attack.tpl");
						break;
					case 32:
						//	玩家防御排行
						include("Templates/Ranking/player_defend.tpl");
						break;
					case 7:
						//	玩家各项前10
						include("Templates/Ranking/player_top10.tpl");
						break;
					case 2:
						//	村庄排行
						include("Templates/Ranking/villages.tpl");
						break;
					case 4:
						//	联盟排行
						include("Templates/Ranking/alliance.tpl");
						break;
					case 41:
						//	联盟攻击排行
						include("Templates/Ranking/alliance_attack.tpl");
						break;
					case 42:
						//	联盟防御排行
						include("Templates/Ranking/alliance_defend.tpl");
						break;
					case 8:
						//	英雄排行
						include("Templates/Ranking/heroes.tpl");
						break;
					case 0:
						//	总览
						include("Templates/Ranking/general.tpl");
						break;
					case 1:
					default:
						//	玩家排行
						include("Templates/Ranking/overview.tpl");
						break;
				}
			}
			else 
			{
				//	缺省跳到玩家排行
				include("Templates/Ranking/overview.tpl");
			}
			?>
		</div>
	</div>
	<div id="side_info">
		<?php
		include("Templates/quest.tpl");
		include("Templates/news.tpl");
		include("Templates/multivillage.tpl");
		include("Templates/links.tpl");
		?>
	</div>
	<div class="clear"></div>
	<div class="footer-stopper"></div>
	<div class="clear"></div>
	<?php 
	include("Templates/footer.tpl"); 
	include("Templates/res.tpl");
	include("Templates/time.tpl");
	?>
	
	<div id="ce"></div>
</div>
</body>
</html>
