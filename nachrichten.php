<?php
include("GameEngine/Village.php");
include("Templates/time_start.tpl");
$message->procMessage($_POST);
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
	<meta name="X-UA-Compatible" content="IE=8" />
	<script src="mt-full.js?f4b7c" type="text/javascript"></script>
	<script src="unx.js?f4b7c" type="text/javascript"></script>
	<script src="new.js?f4b7c" type="text/javascript"></script>
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
		<div id="content" class="messages">
			<h1>讯息</h1>
			<?php 
			include("Templates/Message/menu.tpl");
			if (isset($_GET['id']) && !isset($_GET['t']))
			{
				$message->loadMessage($_GET['id']);
				include("Templates/Message/read.tpl");
			}
			else if (isset($_GET['t']))
			{
				switch ($_GET['t'])
				{
					case 1:
						if (isset($_GET['id']))
						{
							$id = $_GET['id'];
						}
						include("Templates/Message/write.tpl");
						break;
					case 2:
						include("Templates/Message/sent.tpl");
						break;
					case 3:
						if ($session->plus)
						{
							include("Templates/Message/archive.tpl");
						}
						break;
					case 4:
						if ($session->plus)
						{
							$message->loadNotes();
							include("Templates/Message/notes.tpl");
						}
						break;
					default:
						include("Templates/Message/inbox.tpl");
						break;
				}
			}
			else
			{
				include("Templates/Message/inbox.tpl");
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