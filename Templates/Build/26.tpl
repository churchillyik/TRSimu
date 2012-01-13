<?php
error_reporting(e_all);
if (time() - $_SESSION['time_p'] > 5)
{
	$_SESSION['time_p'] = '';
	$_SESSION['error_p'] = '';
}

if ($_POST AND $_GET['action'] == 'change_capital')
{
	$pass = mysql_escape_string($_POST['pass']);
	$query = mysql_query('SELECT * FROM `' . TB_PREFIX . 'users` WHERE `id` = ' . $session->uid);
	$data = mysql_fetch_assoc($query);
	if ($data['password'] == md5($pass))
	{
		$query1 = mysql_query('SELECT * FROM `' . TB_PREFIX . 'vdata` WHERE `owner` = ' . $session->uid . ' AND `capital` = 1');
		$data1 = mysql_fetch_assoc($query1);
		$query2 = mysql_query('SELECT * FROM `' . TB_PREFIX . 'fdata` WHERE `vref` = ' . $data1['wref']);
		$data2 = mysql_fetch_assoc($query2);
		if ($data2['vref'] != $village->wid)
		{
			for ($i = 1; $i <= 18; ++$i)
			{
				if ($data2['f' . $i] > 10)
				{
					$query2 = mysql_query('UPDATE `' . TB_PREFIX . 'fdata` SET `f' . $i . '` = 10 WHERE `vref` = ' . $data2['vref']) or die(mysql_error());
				}
			}

			for ($i = 19; $i <= 40; ++$i)
			{
				if ($data2['f' . $i . 't'] == 34)
				{
					$query3 = mysql_query('UPDATE `' . TB_PREFIX . 'fdata` SET `f' . $i . 't` = 0, `f' . $i . '` = 0 WHERE `vref` = ' . $data2['vref']) or die(mysql_error());
				}
			}

			$query3 = mysql_query('UPDATE `' . TB_PREFIX . 'vdata` SET `capital` = 0 WHERE `wref` = ' . $data1['wref']);
			$query4 = mysql_query('UPDATE `' . TB_PREFIX . 'vdata` SET `capital` = 1 WHERE `wref` = ' . $village->wid);
		}
		echo '<script language="javascript">location.href="build.php?id=' . $building->getTypeField(26) . '";</script>';
	}
	else
	{
		$error = '<br /><font color="red">密码错误</font><br />';
		$_SESSION['error_p'] = $error;
		$_SESSION['time_p'] = time();
		echo '<script language="javascript">location.href="build.php?id=' . $building->getTypeField(26) . '&confirm=yes";</script>';
	}
}
?>

<div id="build" class="gid26">
	<a href="#" onClick="return Popup(26, 4, 'gid');" class="build_logo">
		<img class="building g26" src="img/x.gif" alt="皇宫" title="皇宫" />
	</a>
	<h1>
		皇宫 
		<span class="level">等级 <?php echo $village->resarray['f'.$id]; ?></span>
	</h1>
	<p class="build_desc">
		皇宫里住着你城邦的国王。皇宫达到10级时候，你可以将它所在村庄变成主村。主村不能被征服。
	</p>

	<?php
	include("26_menu.tpl");
	if ($village->resarray['f'.$id] >= 10)
	{
		include ("26_train.tpl");
	}
	else
	{
		echo '<div class="c">当皇宫升级到等级10、15和20时，可以训练三名拓荒者/拓荒者/拓荒者或一名执政官/首领/参议员，用以开拓或征服一座新的村庄。</div>';
	}
	?>

	<?php
	$query = mysql_query('SELECT * FROM `' . TB_PREFIX . 'vdata` WHERE `owner` = ' . $session->uid . ' AND `capital` = 1');
	$data = mysql_fetch_assoc($query);
	if ($data['wref'] == $village->wid)
	{
	?>
	<p class="none">这里是你的主村</p>
	<?php 
	}
	else
	{
		if ($_GET['confirm'] == '')
		{
			echo '<p><a href="?id=' . $building->getTypeField(26) . '&confirm=yes">&raquo改变主村</a></p>';
		}
		else
		{
			echo '<p>
			真的要改变主村吗？<br /><b>注意，这是无法回退的操作！</b><br />为了安全起见，请输入本帐号的密码：
			<br />
			<form method="post" action="build.php?id=' . $building->getTypeField(26) . '&action=change_capital">
				' . $_SESSION['error_p'] . '密码：
				<input type="password" name="pass" /><br />
				<input type="image" id="btn_ok" class="dynamic_img" value="ok" name="s1" src="img/x.gif" alt="改变主村" />
			</form>
			</p>';
		}
	}

	include("upgrade.tpl");
	?>
</div>