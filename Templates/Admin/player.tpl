<?php
$id = $_GET['uid'];
if (isset($id))
{
	$user = $database->getUserArray($id, 1);
	$varray = $database->getProfileVillages($id);
	if ($user)
	{
		$totalpop = 0;
		foreach($varray as $vil)
		{
			$totalpop += $vil['pop'];
		}
		$deletion = false;
		if ($deletion)
		{
?>  
<table id="member" cellpadding="1" cellspacing="1"><tr>	<td>
		该帐号删除还有 
		<span class="c2">79:56:11</span>
		<a href="?action=StopDel&uid=<?php echo $user['id'];?>" onClick="return del('stopDel', '<?php echo $user['username']; ?>');">
		<img src="img/x.gif" class="del"></a>
	</td></tr>
</table>
<?php
		}
?>
<br>
<table id="profile" cellpadding="1" cellspacing="1" >
<thead>
<tr>
	<th colspan="2">用户 <a href="admin.php?p=player&uid=<?php echo $user['id'];?>"><?php echo $user['username'];?></a> 的基本信息</th>
</tr>
<tr>
	<td>明细</td>
	<td>描述</td>
</tr>
</thead>
<tbody>
<tr>
	<td class="empty"></td><td class="empty"></td>
</tr>
<tr>
	<td class="details">
		<table cellpadding="0" cellspacing="0">
		<tr>
			<th>排名</th>
			<td><?php //echo $ranking->searchRank($displayarray['username'], "username"); ?></td>
		</tr>
		<tr>
			<th>种族</th>
			<td>
			<?php
				if ($user['tribe'] == 1)
				{
					echo "罗马";
				}
				else if ($user['tribe'] == 2)
				{
					echo "日耳曼";
				}
				else if ($user['tribe'] == 3)
				{
					echo "高卢";
				}
				else if ($user['tribe'] == 4)
				{
					echo "纳塔";
				}
				?>
			</td>
		</tr>
		<tr>
			<th>联盟</th>
			<td>
				<?php
				if ($user['alliance'] == 0)
				{
					echo "-";
				}
				else
				{
					echo "<a href=\"?p=alliance&aid=".$user['alliance']."\">".$database->getAllianceName($user['alliance'])."</a>";
				}
				?>
			</td>
		</tr>
		<tr>
			<th>村庄数</th>
			<td><?php echo count($varray);?></td>
		</tr>
		<tr>
			<th>人口</th>
			<td><?php echo $totalpop;?> <a href="?action=recountPopUsr&uid=<?php echo $user['id'];?>">刷新</a></td>
		</tr>
		<?php
		if (isset($user['birthday']) && $user['birthday'] != 0)
		{
			$age = date("Y") - substr($user['birthday'], 0, 4);
			echo "<tr><th>年龄</th><td>$age</td></tr>";
		}
		if (isset($user['gender']) && $user['gender'] != 0)
		{
			$gender = ($user['gender']== 1)? "男性" : "女性";
			echo "<tr><th>性别</th><td>".$gender."</td></tr>";
		}
		echo "<tr><th>地区</th><td><input disabled class=\"fm\" name=\"location\" value=\"".$user['location']."\"></td></tr>";
		echo "<tr><th><b>会员期限</b></th><td>".date('Y.m.d H:i', $user['plus'])."</td></tr>";
		echo "<tr><th>电子邮箱</th><td><input disabled class=\"fm\" name=\"email\" value=\"".$user['email']."\"></td></tr>";
		echo '<tr><td colspan="2" class="empty"></td></tr>';
		echo '<tr><td colspan="2"><a href="?p=editUser&uid='.$user['id'].'"><span class="rn2" >&raquo;</span> 修改用户信息</a></td></tr>';
		echo '<tr><td colspan="2"> <a href="?p=Newmessage&uid='.$user['id'].'">&raquo; 写信给用户</a></td></tr>';
		echo '<tr><td colspan="2"> <a class="rn3" href="?p=deletion&uid='.$user['id'].'">&raquo; 移除用户</a></td></tr>';
		echo '<tr><td colspan="2"> <a href="?p=ban&uid='.$user['id'].'">&raquo; 封号</a></td></tr>';
		echo '<tr><td colspan="2" class="desc2"><div class="desc2div"><center>'.nl2br($user['desc1']).'</center></div></td></tr>';
		?>      		</table>	</td>	<td class="desc1">		<center><?php echo nl2br($user['desc2']); ?></center>
	</td></tr></tbody>
</table>
<table id="member"> <thead><tr>	<th colspan="2">用户其他信息</th></tr></thead>    <tr>	<td>用户权限</td>	<td>
		<?php 		if ($user['access'] == 0)
		{			echo "已被封号";		}		else if ($user['access'] == 2)
		{			echo "普通游戏用户";		}		else if ($user['access'] == 8)
		{			echo "游戏客服";		}		else if ($user['access'] == 9)
		{			echo "游戏管理员";		}
		?>
	</td></tr><tr>	<td>剩余金币</td>	<td>
	<?php		if ($user['gold'] == 0)
		{			echo "该用户没有金币！";		}		else if ($user['access'] >= 0)
		{			echo "<img src='../img/admin/gold.gif' class='gold' alt='金币' title='该用户有 ".$user['gold']." 金币'/> ".$user['gold'];		}		?>
	</td></tr><tr><td></td><td></td></tr><tr>	<td>代管人1</td>	<td>
		<?php		if ($user['sit1'] >= 1)
		{			echo '<a href="admin.php?p=player&uid='.$user['sit1'].'">'.$database->getUserField($user['sit1'], "username", 0).'</a>';		} 		else if ($user['sit1'] == 0)
		{			echo '没有代管';		}		?>
	</td></tr><tr>	<td>代管人2</td>	<td>
		<?php		if ($user['sit2'] >= 1)
		{			echo '<a href="admin.php?p=player&uid='.$user['sit2'].'">'.$database->getUserField($user['sit2'], "username", 0).'</a>';		} 		else if ($user['sit2'] == 0)
		{			echo '没有代管';		}		?>
	</td></tr><tr><td></td><td></td></tr><tr>	<td>新手保护期限</td>	<td><?php echo date('Y.m.d H:i', $user['protect']); ?></td></tr><tr>	<td>文明度</td>	<td><?php echo $user['cp']; ?></td></tr><tr>	<td>上次活跃时间</td>	<td><?php echo date('Y.m.d H:i', $user['timestamp']); ?></tr></table>

<center><?php include ('punish.tpl'); ?></center>

<?php
		include('villages.tpl');
		include('add_village.tpl');
	}
	else
	{
		echo "找不到匹配数据<a href=\"javascript: history.go(-1)\">返回</a>";
	}
}
?>