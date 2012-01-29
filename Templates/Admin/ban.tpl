<style>
.del {width:12px; height:12px; background-image: url(img/admin/icon/del.gif);}
</style>
<form action="" method="get">
	<input name="action" type="hidden" value="addBan">
	<table id="member" cellpadding="1" cellspacing="1">
	<thead>
	<tr>
		<th colspan="6">封号</th>
	</tr>
	</thead>
	<tr>
		<td>用户ID</td>
		<td><input type="text" class="fm" name="uid" value="<?php echo $_GET['uid']; ?>"></td>
	</tr>
	<tr>
		<td>封号原因</td>
		<td>
			<select name="reason" class="fm">
				<?php
				$arr = array('过度运输', '使用外挂', '攻击服务器', '刷bug', '不当命名', '多帐号', '谩骂他人');
				foreach ($arr as $r)				{
					echo '<option value="'.$r.'">'.$r.'</option>';
				}
				?>
			</select>
		</td>
	</tr>
	<tr>
		<td>封号时长</td>
		<td>
			<select name="time" class="fm">
				<?php
				$arr = array(1, 2, 5, 10, 12);
				foreach ($arr as $r)				{
					echo '<option value="'.($r * 3600).'">'.$r.' 小时</option>';
				}
				$arr2 = array(1, 2, 5, 10, 30, 50, 90);
				foreach($arr2 as $r)				{
					echo '<option value="'.($r * 3600 * 24).'">'.$r.' 天</option>';
				}
				echo '<option value="">永久</option>';
				?>
			</select>
		</td>
	</tr>
	<tr>
		<td colspan="2" class="on"><input type="submit" value="提交封号"></td>
	</tr>
	</table>
</form>
<?php
$bannedUsers = $admin->search_banned();
?>
<br>
<table id="member" cellpadding="1" cellspacing="1">
<thead>
<tr>
	<th colspan="6">封号列表</th>
</tr>
</thead><tbody>
<tr>
	<td><b>用户名</b></td>
	<td><b>封号时长</b></td>
	<td><b>封号原因</b></td>
	<td><b>解封</b></td>
</tr>
<?php
if ($bannedUsers){
	for ($i = 0; $i <= count($bannedUsers) - 1; $i++)	{
		if ($database->getUserField($bannedUsers[$i]['uid'], 'username', 0) == '')		{
			$name = $bannedUsers[$i]['name'];
			$link = "<span class=\"c b\">[".$name."]</span>";
		}		else		{
			$name = $database->getUserField($bannedUsers[$i]['uid'], 'username', 0);
			$link = '<a href="?p=player&uid='.$bannedUsers[$i]['uid'].'">'.$name.'<a/>';
		}		
		if ($bannedUsers[$i]['end'])		{			$end = date("Y.m.d H:i", $bannedUsers[$i]['end']);		}		else		{			$end = '*';		}
		echo '
		<tr>
			<td>'.$link.'</td>
			<td ><span class="f7">'.date("Y.m.d H:i", $bannedUsers[$i]['time']).' - '.$end.'</td>
			<td>'.$bannedUsers[$i]['reason'].'</td>
			<td class="on"><a href="?action=delBan&uid='.$bannedUsers[$i]['uid'].'&id='.$bannedUsers[$i]['id'].'" onClick="return del(\'unban\',\''.$name.'\')"><img src="../img/Admin/del.gif" class="del" title="取消封号" alt="取消封号"></img></a></td>
		</tr>';
	}
}else{
	echo '<tr><td colspan="6" class="on">尚无封号记录</td></tr>';
}
?>
</tbody>
</table>