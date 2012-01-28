<form action="" method="post">
	<table id="member">
	<thead>
	<tr>
		<th colspan="3">搜索系统</th>
	</tr>
	</thead>
	<tr class="slr3">
		<td>
		<select name="p" size="1" class="slr3">
			<option value="player" <?php if ($_POST['p'] == 'player') { echo "selected=true"; } ?>>搜索用户</option>
			<option value="alliances" <?php if ($_POST['p'] == 'alliances') { echo "selected=true"; } ?>>搜索联盟</option>
			<option value="villages" <?php if ($_POST['p'] == 'villages') { echo "selected=true"; } ?>>搜索村庄</option>
			<option value="email" <?php if ($_POST['p'] == 'email') { echo "selected=true"; } ?>>搜索EMail</option>
			<option value="ip" <?php if ($_POST['p'] == 'ip') { echo "selected=true"; } ?>>搜索IP</option>
			<option value="deleted_players" <?php if ($_POST['p'] == 'deleted_players') { echo "selected=true"; } ?>>搜索删号用户</option>
		</select>
		</td>
		<td><input name="s" value="<?php echo $_POST['s'];?>"></td>
		<td><input class="slr3" type="submit" value="搜索"></td>
	</tr>
	</table>
</form>
<?php
if ($_GET['msg']){
	echo '<div style="margin-top: 50px;" class="b"><center>';
	if ($_GET['msg'] == 'ursdel')	{
		echo "该用户已被删除。";
	}
	echo '</center></div>';
}
?>