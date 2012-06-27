<?php
include("GameEngine/Account.php");
include("Templates/time_start.tpl");
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title><?php echo SERVER_NAME; ?></title>
	<meta name="content-language" content="en" />
	<meta http-equiv="cache-control" content="max-age=0" />
	<meta http-equiv="imagetoolbar" content="no" />
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="mt-core.js?2389c" type="text/javascript"></script>
	<script src="mt-more.js?2389c" type="text/javascript"></script>
	<script src="unx.js?2389c" type="text/javascript"></script>
	<script src="new.js?2389c" type="text/javascript"></script>
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
	<div id="header"></div>
	<div id="mid">
		<?php include("Templates/menu.tpl"); ?>
		<div id="content"  class="logout">
			<h1>您已经登出！</h1>
			<img class="roman" src="img/x.gif" alt="">
			<p>感谢您的拜访</p>
			<p>如果还有其他人也使用这台电脑，为了安全原因请删除浏览器的cookie:
			<br />
			<a href="login.php?del_cookie">&raquo; 删除Cookies</a>
			</p>
		</div>

		<div id="side_info">
			<?php include("Templates/news.tpl");?>
		</div>
		
		<div class="clear"></div>
	</div>
	
	<div class="footer-stopper"></div>
	<div class="clear"></div>
	<?php include("Templates/footer.tpl"); ?>
	
	<div id="stime">
	<div id="ltime">
	<div id="ltimeWrap">
		载入时间：
		<b><?php echo round(($generator->pageLoadTimeEnd() - $pg_ld_start) * 1000); ?></b> 毫秒
		<br />
		服务器时间：<span id="tp1" class="b"><?php echo date('H:i:s'); ?></span>
	</div>
	</div>
	</div>
	<div id="ce"></div>
</body>
</html>