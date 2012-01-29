<style>
.del {width:12px; height:12px; background-image: url(img/admin/icon/del.gif);}
</style>

<form method="post" action="admin.php">
	<input name="action" type="hidden" value="addVillage">
	<input name="uid" type="hidden" value="<?php echo $user['id']; ?>">
	<table id="member" style="width: 225px;">
	<thead>
	<tr>
		<th colspan="2">增加村庄</th>
	</tr>
	</thead>
	<tr>
		<td colspan="2"><center>坐标 (<b>X</b>|<b>Y</b>)</center></td>
	</tr>
	<tr>
		<td>X：</td>
		<td><input name="x" class="fm" value="" type="input"></td>
	</tr>
	<tr>
		<td>Y：</td>
		<td><input name="y" class="fm" value="" type="input"></td>
	</tr>
	<tr>
		<td colspan="2"><center><input value="增加村庄" type="submit"></center></td>
	</tr>
	</table>
</form>