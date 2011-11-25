<?php
include("GameEngine/Village.php");
$start = $generator->pageLoadTimeStart();
if (isset($_GET['newdid']))
{
	$_SESSION['wid'] = $_GET['newdid'];
	header("Location: ".$_SERVER['PHP_SELF']);
}
else
{
	$building->procBuild($_GET);
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
	<link href="gpack/travian_basic/lang/en/compact.css?e21d2" rel="stylesheet" type="text/css" />
	<link href="gpack/travian_basic/lang/en/lang.css?e21d2" rel="stylesheet" type="text/css" />
	
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
		<div id="content"  class="village1">
			<h1>
			<?php 
			echo $village->vname; 
			//	村庄忠诚度低于100的时候，提示当前忠诚度
			if ($village->loyalty != '100')
			{ 
				if($village->loyalty > '33')
				{ 
					$color = "gr";
				}
				else
				{ 
					$color = "re";
				} 
			?>
			<div id="loyality" class="<?php echo $color; ?>">忠诚度：<?php echo $village->loyalty; ?>%</div>
			<?php 
			} 
			?>
			</h1>
			
			<?php 
			//	资源田状况
			include("Templates/field.tpl");
			$timer = 1;
			?>
			
			<div id="map_details">
				<?php
				//	攻击或增援信息
				include("Templates/movement.tpl");
				//	资源产量
				include("Templates/production.tpl");
				//	军队
				include("Templates/troops.tpl");
				?>
			</div>
			
			<?php
			//	建造中的建筑
			if ($building->NewBuilding)
			{
				include("Templates/Building.tpl");
			}
			?>
		</div>
	</div>
	<div id="side_info">
		<?php
		//	任务
		include("Templates/quest.tpl");
		//	新闻盒
		include("Templates/news.tpl");
		//	各个村庄的链接
		include("Templates/multivillage.tpl");
		//	未知
		include("Templates/links.tpl");
		?>
	</div>
	<div class="clear"></div>
	<div class="footer-stopper"></div>
	<div class="clear"></div>
	<?php 
	//	页脚
	include("Templates/footer.tpl");
	//	资源和金币
	include("Templates/res.tpl");
	//	服务器时间
	include("Templates/time.tpl");
	?>

	<div id="ce"></div>
</div>
</body>
</html>