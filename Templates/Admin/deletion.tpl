<style>
.del {width:12px; height:12px; background-image: url(img/admin/icon/del.gif);} 
</style>  

<?php
if ($_GET['uid'])
{
	$user = $database->getUserArray($_GET['uid'], 1);
	$varray = $database->getProfileVillages($_GET['uid']);
	if ($user)
	{
		$totalpop = 0;
		foreach ($varray as $vil)
		{
			$totalpop += $vil['pop'];
		}
?>
<form action="" method="post">
	<input type="hidden" name="action" value="DelPlayer">
	<input type="hidden" name="uid" value="<?php echo $user['id']; ?>">
<table id="member">
<thead>
<tr>
	<th colspan="4">移除用户</th>
</tr>
</thead>
<tr>
	<td>名字：</td>
	<td><a href="?p=player&uid=<?php echo $user['id'];?>"><?php echo $user['username'];?></a></td>
	<td>金币：</td>
	<td><?php echo $user['gold'];?></td>
</tr>
<tr>
	<td>排名：</td>
	<td>???.</td>
	<td>人口：</td>
	<td><?php echo $totalpop;?></td>
</tr>
<tr>
	<td>村庄：</td>
	<td>
		<?php
		$result = mysql_query("SELECT SQL_CACHE * FROM ".TB_PREFIX."vdata WHERE owner = ".$user['id']."");
		$num_rows = mysql_num_rows($result);
		echo $num_rows;
		?>
	</td>
	<td>会员期限：</td>
	<td>
		<?php 
			$plus = date('Y.m.d H:i', $user['plus']);
			echo $plus;
		?>
	</td>
</tr>
<tr>
	<td>联盟</td>
	<td><?php echo $database->getAllianceName($user['alliance']); ?></td>
	<td>状态：</td>
	<td>-</td>
</tr>
<tr>
	<td colspan="4" class="empty"></td>
</tr>
<tr>
	<td>密码：</td>
	<td><input type="text" name="pass"></td>
	<td colspan="2"><input type="submit" class="c5" value="移除用户"></td>
</tr>  
</table>

<br /><br />
<font color="Red"><b>先移除该用户的所有村庄，再移除用户！</font></b>
<br /><br />

<?php
	include('villages.tpl');
	}
}  
?>