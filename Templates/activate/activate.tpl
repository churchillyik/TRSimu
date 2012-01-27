<div id="content" class="signup">
<?php
if (isset($_GET['id']) && isset($_GET['q']))
{
	$act2 = $database->getActivateField($_GET['id'], "act2", 0);
	if ($act2 == $_GET['q'])
	{
		$show = '1';
		$naam = $database->getActivateField($_GET['id'], "username", 0);
		$email = $database->getActivateField($_GET['id'], "email", 0);
	}
}
if (isset($show))
{
?>
	<h1><img src="img/x.gif" class="anmelden" alt="游戏注册"></h1>
	<h5><img src="img/x.gif" class="img_u05" alt="游戏注册"/></h5>
	<p>
		您好 <?php echo $naam; ?>，
		<br/>
		<br/>
		您已经成功注册了Travian帐号。几分钟只会您将会收到一封带有登录信息的电子邮件。
		<br />
		<br />
		该电子邮件将会发送到以下地址：
		<span class="important"><?php echo $email; ?></span>
	</p>
	<p>您需要输入注册码或点击电子邮件中的激活链接来激活您的帐号。</p>
	<div id="activation">
		<form action="activate.php" method="post">
			<p class="important">注册码：</p>
			<input class="text" type="text" name="id" maxlength="10" />
			<p>
				<input type="image" value="ok" name="s1" src="img/x.gif" id="btn_send" class="dynamic_img" alt="发送"/>
				<input type="hidden" name="ft" value="a2" />
			</p>
		</form>
	</div>
	<div id="no_mail">
		<p>
			<a href="activate.php?id=<?php echo $_GET['id']; ?>&amp;c=<?php echo $generator->encodeStr($email, 5); ?>"><span class="important">收不到电子邮件？</span></a>
		</p>
		<p>
			有时候电子邮件会被移动到垃圾文件夹下，进一步的帮助信息请点击<a href="activate.php?id=<?php echo $_GET['id']; ?>&amp;c=<?php echo $generator->encodeStr($email, 5); ?>">这里</a>了解更多。
		</p>
	</div>
</div>
<?php
}
else
{
?>
	<p></p>
	<div id="activation">
		<form action="activate.php" method="post">
			<p class="important">注册码：</p>
			<input class="text" type="text" name="id" maxlength="10" />
			<p>
				<input type="image" value="ok" name="s1" src="img/x.gif" id="btn_send" class="dynamic_img" alt="发送"/>
				<input type="hidden" name="ft" value="a2" />
			</p>
		</form>
	</div>
</div>
<?php
}
?>