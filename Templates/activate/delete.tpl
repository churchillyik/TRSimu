<div id="content" class="activate">
	<h1><img src="img/x.gif" class="anmelden" alt="游戏注册"></h1>
	<h6>收不到邮件？</h6>
	在登录Travian之前，您需要一个有效的电子邮箱，我们的激活码将会电邮到那里。但有一些异常情况，这封电邮可能无法收到。
	<p class="f10 e b">请排查以下情况：</p>
	<div class="f10">
		<ul>
			<li>电邮地址有输入错误</li>
			<li>该电子邮箱已满，需要清除部分邮件来腾出空间</li>
			<li>域名错误，例如：@aol.de是错误的，@aol.com才是正确的</li>
			<li>我们发过去的电子邮件被移动到了垃圾文件夹下</li>
		</ul>
		<br /><br />
		您可以取消上次的注册，然后用<u>另外一个电邮地址</u>来重新注册。这样注册码将会重新发送到您新的电子邮箱。
	</div>				
	<form action="activate.php" method="POST">
		<input type="hidden" name="id" value="<?php echo $_GET['id']; ?>" />
		<input type="hidden" name="ft" value="a3" />
		<table cellpadding="1" cellspacing="1">
			<tr class="top">
				<th>昵称</th>
				<td class="name">
					<?php
					$naam = $database->getActivateField($_GET['id'], "username", 0);
					echo $naam;
					?>
				</td>
			</tr>
			<tr class="btm">
				<th>密码</th>
				<td><input class="text" type="password" name="pw" maxlength="20" /></td>
			</tr>
		</table>
		<p class="btn">
			<input type="image" src="img/x.gif" class="dynamic_img" id="btn_delete" alt="删除" value="delete" name="delreports" />
		</p>
	</form>
</div>