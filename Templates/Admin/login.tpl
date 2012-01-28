<div align="center">	<img src="../img/admin/admin.gif" width="468" height="60" border="0"></div>
<p>请输入管理员的帐号密码</p>
<form method="post" action="admin.php">
	<input type="hidden" name="action" value="login">
	<p class="old_p1">
		<table width="100%" cellspacing="1" cellpadding="0">
		<tr>			<td>				<label>用户名：</label>				<input class="fm fm110" type="text" name="name" value="<?php echo $_SESSION['username']?>" maxlength="15"> 				<span class="e f7"></span>
			</td>		</tr>
		<tr>			<td>				<label>密码：</label>
				<input class="fm fm110" type="password" name="pw" value="" maxlength="20">				<span class="e f7"></span>
			</td>		</tr>
		</table>	</p>
	<p align="center">		<input type="image" border="0" src="../img/admin/b/l1.gif" width="80" height="20" value="ok" name="s1" id="btn_ok" alt="确定">	</p>
</form>