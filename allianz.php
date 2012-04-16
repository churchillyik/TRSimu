<?php
include("GameEngine/Village.php");
include("GameEngine/Chat.php");
include("Templates/time_start.tpl");
$alliance->procAlliance($_GET);
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
		<?php
		include("Templates/menu.tpl");
		if (isset($_GET['s']) && $_GET['s']== 2)
		{
			echo '<div id="content" class="forum">';
		}
		else
		{
			echo '<div id="content" class="alliance">';
		}

		if (isset($_GET['s']))
		{
			switch ($_GET['s'])
			{
				case 2:
					include("Templates/Alliance/forum.tpl");
					break;
				case 3:
					include("Templates/Alliance/attacks.tpl");
					break;
				case 4:
					include("Templates/Alliance/news.tpl");
					break;
				case 5:		
					include("Templates/Alliance/option.tpl");
					break;
				case 6:
					include("Templates/Alliance/chat.tpl");
					break;
				case 1:
				default:
					include("Templates/Alliance/overview.tpl");
					break;
			}
		}
		elseif (isset($_POST['o']))
		{
			switch ($_POST['o'])
			{
				case 1:
					if (isset($_POST['s'])==5 && isset($_POST['a_user']))
					{
						$alliance->procAlliForm($_POST);
						include("Templates/Alliance/changepos.tpl");
					}
					else
					{
						include("Templates/Alliance/assignpos.tpl");
					}
					break;
					
				case 2:
					if (isset($_POST['s']) == 5 && isset($_POST['a']) == 2)
					{
						$alliance->procAlliForm($_POST);
						include("Templates/Alliance/kick.tpl");
					}
					else
					{
						include("Templates/Alliance/kick.tpl");
					}
					break;
					
				case 3:
					if (isset($_POST['s'])==5 && isset($_POST['a']) == 3)
					{
						$alliance->procAlliForm($_POST);
						include("Templates/Alliance/allidesc.tpl");
					}
					else
					{
						include("Templates/Alliance/allidesc.tpl");
					}
					break;
					
				case 4:
					if (isset($_POST['s'])==5 && isset($_POST['a']) == 4)
					{
						$alliance->procAlliForm($_POST);
						include("Templates/Alliance/invite.tpl");
					}
					else
					{
						include("Templates/Alliance/invite.tpl");
					}
					break;
					
				case 5:
					include("Templates/Alliance/linkforum.tpl");
					break;
					
				case 6:
					include("Templates/Alliance/chgdiplo.tpl");
					break;
					
				case 11:
					if (isset($_POST['s']) == 5 && isset($_POST['a']) == 11)
					{
						$alliance->procAlliForm($_POST);
						include("Templates/Alliance/quitalli.tpl");
					}
					else
					{
						include("Templates/Alliance/quitalli.tpl");
					}
					break;
					

				case 100:
					if (isset($_POST['s']) == 5 && isset($_POST['a']) == 100)
					{
						$alliance->procAlliForm($_POST);
						include("Templates/Alliance/changename.tpl");
					}
					else
					{
						include("Templates/Alliance/changename.tpl");
					}
					break;
				
				default:
					include("Templates/Alliance/option.tpl");
					break;
			}
		}
		else
		{
			include("Templates/Alliance/overview.tpl");
		}
		?>
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