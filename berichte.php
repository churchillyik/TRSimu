<?php
include("GameEngine/Village.php");
$start = $generator->pageLoadTimeStart();
$message->noticeType($_GET);
$message->procNotice($_POST);
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
	if($session->gpack == null || GP_ENABLE == false)
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
		<div id="content" class="reports">
			<h1>报告</h1>
			<div id="textmenu">
				<a href="berichte.php" 
				<?php if (!isset($_GET['t'])) { echo "class=\"selected \""; } ?>
				>全部</a> | 
				<a href="berichte.php?t=2" 
				<?php if (isset($_GET['t']) && $_GET['t'] == 2) { echo "class=\"selected \""; } ?>
				>交易</a> | 
				<a href="berichte.php?t=1" 
				<?php if (isset($_GET['t']) && $_GET['t'] == 1) { echo "class=\"selected \""; } ?>
				>增援</a> | 
				<a href="berichte.php?t=3" 
				<?php if (isset($_GET['t']) && $_GET['t'] == 3) { echo "class=\"selected \""; } ?>
				>攻击</a> | 
				<a href="berichte.php?t=4" 
				<?php if (isset($_GET['t']) && $_GET['t'] == 4) { echo "class=\"selected \""; } ?>
				>其他</a>
				<?php 
				if ($session->plus) 
				{
					echo "| <a href=\"berichte.php?t=5\"";
					if (isset($_GET['t']) && $_GET['t'] == 5) 
					{ 
						echo "class=\"selected \""; 
					} 
					echo ">记事本</a>";
				}
				?>
			</div>
			<?php 
			if (isset($_GET['id']))
			{
				//	打开某一条报告
				$type = ($message->readingNotice['ntype'] == 5)? 
						$message->readingNotice['archive'] : $message->readingNotice['ntype'];
				include("Templates/Notice/".$type.".tpl");
			}
			else 
			{
				//	报告列表
				include("Templates/Notice/all.tpl");
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