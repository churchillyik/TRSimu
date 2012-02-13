<?php
include("GameEngine/Village.php");
include("Templates/time_start.tpl");
$battle->procSim($_POST);
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
		<div id="content" class="warsim">
			<h1>战斗模拟器</h1>
			<form action="warsim.php" method="post">
				<?php 
				if (isset($_POST['result']))
				{
					$target = isset($_POST['target'])? $_POST['target'] : array();
					$tribe = isset($_POST['mytribe'])? $_POST['mytribe'] : $session->tribe;
					include("Templates/Simulator/res_a".$tribe.".tpl");
					foreach($target as $tar)
					{
						include("Templates/Simulator/res_d".$tar.".tpl");
					}
					echo "<p>攻击类型：<b>";
					echo $form->getValue('ktyp') == 0? "普通" : "掠夺";
					echo "</b></p>";
					if (isset($_POST['result'][3]) && isset($_POST['result'][4]))
					{
						if ($_POST['result'][4] > $_POST['result'][3])
						{
							echo "<p>建筑摧毁</p>";
						}
						elseif ($_POST['result'][4] == 0)
						{
							echo "<p>建筑未摧毁</p>";
						}
						else
						{
							//$demolish = $_POST['result'][4] / $_POST['result'][3];
							//$Katalife = round($_POST['result'][4] - ($_POST['result'][4] * $_POST['result'][1]));
							//$totallvl = round($form->getValue('kata') - $form->getValue('kata') * $demolish);
							$totallvl = round(sqrt(pow($form->getValue('kata') + 0.5, 2) - $_POST['result'][4] * 8));
							echo "<p>建筑的损坏程度：从等级 <b>".$form->getValue('kata')."</b> 到等级 <b>".$totallvl."</b></p>";
						}
					}
				}
				$target = isset($_POST['target'])? $_POST['target'] : array();
				$tribe = isset($_POST['mytribe'])? $_POST['mytribe'] : $session->tribe;
				if (count($target) > 0)
				{
					include("Templates/Simulator/att_".$tribe.".tpl");
					echo "
					<table id=\"defender\" class=\"fill_in\" cellpadding=\"1\" cellspacing=\"1\">
					<thead>
					<tr>
						<th>防御方 <span class=\"small\"></span></th>
					</tr>
					</thead>";
					foreach ($target as $tar)
					{
						include("Templates/Simulator/def_".$tar.".tpl");
					}
					include("Templates/Simulator/def_end.tpl");
					echo "<div class=\"clear\"></div>";
				}
				?>
				
				<table id="select" cellpadding="1" cellspacing="1">
				<thead>
				<tr>
					<td>攻击方</td>
					<td>防御方</td>
					<td>攻击类型</td>
				</tr>
				</thead>
				<tbody>
				<tr>
				<td>
					<label><input class="radio" type="radio" name="a1_v" value="1" <?php if ($tribe == 1) { echo "checked"; } ?>> 罗马</label><br/>
					<label><input class="radio" type="radio" name="a1_v" value="2" <?php if ($tribe == 2) { echo "checked"; } ?>> 日耳曼</label><br/>
					<label><input class="radio" type="radio" name="a1_v" value="3" <?php if ($tribe == 3) { echo "checked"; } ?>> 高卢</label>
				</td>
				<td>
					<label><input class="check" type="checkbox" name="a2_v1" value="1" <?php if (in_array(1, $target)) { echo "checked"; } ?>> 罗马</label>
					<br/>
					<label><input class="check" type="checkbox" name="a2_v2" value="1" <?php if (in_array(2, $target)) { echo "checked"; } ?>> 日耳曼</label>
					<br/>
					<label><input class="check" type="checkbox" name="a2_v3" value="1" <?php if (in_array(3, $target)) { echo "checked"; } ?>> 高卢</label>
					<br/>
					<label><input class="check" type="checkbox" name="a2_v4" value="1" <?php if (in_array(4, $target)) { echo "checked"; } ?>> 自然</label>
				</td>
				<td>
					<label><input class="radio" type="radio" name="ktyp" value="0" <?php if ($form->getValue('ktyp') == 0 || $form->getValue('ktyp') == "") { echo "checked"; } ?>> 普通</label>
					<br/>
					<label><input class="radio" type="radio" name="ktyp" value="1" <?php if ($form->getValue('ktyp') == 1) { echo "checked"; } ?>> 掠夺</label>
					<br/>
					<label><input type="hidden" name="uid" value="<?php echo $session->uid; ?>"></label>
				</td>
				</tr>
				</tbody>
				</table>

				<p class="btn">
					<input type="image" value="ok" name="s1" id="btn_ok" class="dynamic_img" src="img/x.gif" alt="确定" />
				</p>
			</form>
		</div>
		<div id="side_info">
			<?php
			include("Templates/quest.tpl");
			include("Templates/news.tpl");
			include("Templates/multivillage.tpl");
			include("Templates/links.tpl");
			?>
		</div>
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