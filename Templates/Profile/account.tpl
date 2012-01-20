<h1>玩家资料</h1>
<?php include("menu.tpl"); ?>

<form action="spieler.php" method="POST">
	<input type="hidden" name="ft" value="p3">
	<input type="hidden" name="uid" value="<?php echo $session->uid; ?>" />
	
	<table cellpadding="1" cellspacing="1" id="change_pass" class="account">
	<thead>
	<tr>
		<th colspan="2">修改密码</th>
	</tr>
	</thead>
	<tbody>
	<tr>
		<th>旧密码</th>
		<td><input class="text" type="password" name="pw1" maxlength="20" /></td>
	</tr>

	<tr>
		<th>新密码</th>
		<td><input class="text" type="password" name="pw2" maxlength="20" /></td>
	</tr>
	<tr>
		<th>确认</th>
		<td><input class="text" type="password" name="pw3" maxlength="20" /></td>
	</tr>
	</tbody>
	</table>

	<?php
	if ($form->getError("pw") != "")
	{
		echo "<span class=\"error\">".$form->getError('pw')."</span>";
	}
	?>
	
	<table cellpadding="1" cellspacing="1" id="change_mail" class="account">
	<thead>
	<tr>
        <th colspan="2">变更电子邮件地址</th>
    </tr>
	</thead>
    <tbody>
	<tr>
        <td class="note" colspan="2">
			请输入你之前使用的电子邮箱地址和将要使用的电子邮箱地址。稍后你将在两个电子邮箱中都能收到一封包含变更邮箱所需代码的邮件。
		</td>
	</tr>
    <tr>
        <th>旧的电子邮箱地址</th>
        <td><input class="text" type="text" name="email_alt" maxlength="50" /></td>
    </tr>
    <tr>

        <th>新的电子邮箱地址</th>
        <td><input class="text" type="text" name="email_neu" maxlength="50" /></td>
    </tr>
	</tbody>
	</table>
	
	<?php
	if ($form->getError("email") != "")
	{
		echo "<span class=\"error\">".$form->getError('email')."</span>";
	}
	?>
	
    <table cellpadding="1" cellspacing="1" id="sitter" class="account">
	<thead>
	<tr>
		<th colspan="2">账号代管</th>
	</tr>
	</thead>
	<tbody>
	<tr>
		<td class="note" colspan="2">代管人可以用你的用户名和他/她本人的账户密码登录对你的游戏帐号进行看管。你可以最多指定两个代管人。</td>
	</tr>
    <?php
    $count = 0;
    if ($session->userinfo['sit1'] != 0)
	{
		$count +=1;
	}
	if ($session->userinfo['sit2'] !=0)
	{
		$count += 1;
	}
    if ($count < 2)
	{
    ?>
	<tr>
		<th>代管者帐号</th>
		<td><input class="text" type="text" name="v1" maxlength="15"><span class="count">(<?php echo $count; ?>/2)</span></td>
	</tr>
	<?php
	}
	?>
	<tr>
		<td colspan="2" class="sitter">
		<?php
		if ($count == 0)
		{
			echo "<span class=\"none\">你尚未设置代管</span></td>";
		}
		if ($session->userinfo['sit1'] != 0)
		{
			echo "<div>";
			echo "<a href=\"spieler.php?s=3&e=3&id=".$session->userinfo['sit1']."&a=".$session->checker."&type=1\"><img class=\"del\" src=\"img/x.gif\" title=\"移除代管者\" alt=\"移除代管者\" /></a>";
			echo "<a href=\"spieler.php?uid=".$session->userinfo['sit1']."\">".$database->getUserField($session->userinfo['sit1'], "username", 0)."</a>";
			echo "</div>";
		}
		if ($session->userinfo['sit2'] != 0)
		{
			echo "<div>";
			echo "<a href=\"spieler.php?s=3&e=3&id=".$session->userinfo['sit2']."&a=".$session->checker."&type=2\"><img class=\"del\" src=\"img/x.gif\" title=\"移除代管者\" alt=\"移除代管者\" /></a>";
			echo "<a href=\"spieler.php?uid=".$session->userinfo['sit2']."\">".$database->getUserField($session->userinfo['sit2'],"username",0)."</a>";
			echo "</div>";
		}
		?>
	</tr>
	<tr>
		<td class="note" colspan="2">你现在是下列帐号的代管者，你可以点击红色的X按钮来取消对这些帐号的代管。</td>
	</tr>
	<tr>
		<td colspan="2" class="sitter">
			<?php 
			$sitee = $database->getSitee($session->uid);
			if (count($sitee) == 0)
			{
				echo "<span class=\"none\">你还不是任何帐号的代管者</span>";
			}
			else
			{
				foreach ($sitee as $sit)
				{
					echo "<div>";
					echo "<a href=\"spieler.php?s=3&e=2&id=".$sit['id']."&a=".$session->checker."\"><img class=\"del\" src=\"img/x.gif\" title=\"取消代管\" alt=\"取消代管\" /></a>";
					echo "<a href=\"spieler.php?uid=".$sit['id']."\">".$database->getUserField($sit['id'], "username", 0)."</a>";
					echo "</div>";
				}
			}
			?>
		</td>
	</tr>
	</table>
	
	<?php
	if ($form->getError("email") != "")
	{
		echo "<span class=\"error\">".$form->getError('email')."</span>";
	}
	?>
	
    <table cellpadding="1" cellspacing="1" id="del_acc" class="account">
	<thead>
	<tr>
		<th colspan="2">删除帐号</th>
	</tr>
	</thead>
	<tbody>
	<tr>
		<td class="note" colspan="2">
			你可以在这里删除你的帐号。从你开始执行删除命令后，需要3天时间你的账户才会被完全删除。在24小时之内你可以撤回你的删除命令。
		</td>
	</tr>
	<tr>
		<?php
		$timestamp = $database->isDeleting($session->uid);
		if ($timestamp)
		{
			echo "<td colspan=\"2\" class=\"count\">";
			if ($timestamp > time() + 48 * 3600)
			{
				echo "<a href=\"spieler.php?s=3&id=".$session->uid."&a=1&e=4\"><img
				class=\"del\" src=\"img/x.gif\" alt=\"取消删除帐号\"
				title=\"取消删除帐号\" /> </a>";
			}
			$time = $generator->getTimeFormat(($timestamp - time()));
			echo "帐号将会在 <span
			id=\"timer1\">".$time."</span> 后删除。</td>";
		}
		else
		{
		?>
		<th>删除帐号？</th>
        <td class="del_selection">
            <label><input class="radio" type="radio" name="del" value="1" /> 是</label>
            <label><input class="radio" type="radio" name="del" value="0" checked /> 否</label>
        </td>
    </tr>
    <tr>
        <th>请输入密码确认：</th>
        <td><input class="text" type="password" name="del_pw" maxlength="20" /></td>
        <?php 
        }
        ?>
    </tr>
	</tbody>
	</table>
	
    <?php
	if ($form->getError("del") != "")
	{
		echo "<span class=\"error\">".$form->getError("del")."</span>";
	}
	?>
	
    <p class="btn">
		<input type="image" value="" name="s1" id="btn_save" class="dynamic_img" src="img/x.gif" alt="保存" />
	</p>
</form>