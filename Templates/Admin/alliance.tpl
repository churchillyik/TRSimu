<?php 
if ($_GET['aid'])
{
	$alidata = $database->getAlliance($_GET['aid']);
	$aliusers = $database->getAllMember($_GET['aid']);
	if ($alidata and $aliusers)
	{
		foreach ($aliusers as $member)
		{
			$totalpop += $database->getVSumField($member['id'], "pop");
		}
?>  
<br>

<table id="profile" cellpadding="1" cellspacing="1">
<thead>
<tr>
	<th colspan="2">
		联盟 <a href="?p=alliance&aid=<?php echo $alidata['id'];?>"><?php echo $alidata['name'];?></a>
	</th>
</tr>
<tr>
	<td>明细</td>
	<td>描述</td>
</tr>
</thead>
<tbody>
<tr>
	<td class="empty"></td>
	<td class="empty"></td>
</tr>
<tr>
	<td class="details">
		<table cellpadding="0" cellspacing="0">
		<tbody>
		<tr>
			<th>标签</th>
			<td><?php echo $alidata['tag']; ?></td>
		</tr>
		<tr>
			<th>名称</th>
			<td><?php echo $alidata['name']; ?></td>
		</tr>
		<tr>
			<td colspan="2" class="empty"></td>
		</tr>
		<tr>
			<th>排行</th>
			<td>???</td>
		</tr>
		<tr>
			<th>人口总数</th>
			<td><?php echo $totalpop; ?></td>
		</tr>
		<tr>
			<th>成员数</th>
			<td><?php echo count($aliusers); ?></td>
		</tr>
		<tr>
			<td colspan="2" class="empty"></td>  
		</tr>
		<tr>
			<th>盟主</th>
			<td>
				<a href="?p=player&uid=<?php echo $alidata['leader']; ?>">
					<?php echo $database->getUserField($alidata['leader'], "username", 0); ?>
				</a>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<a href="?p=editAli&aid=<?php echo $alidata['id'];?>">» 编辑联盟</a>
		</td>
		</tr>
		<tr>
			<td colspan="2">
			<a href="?p=DelAli&aid=<?php echo $alidata['id'];?>">» 删除联盟</a>
		</td>
		</tr>
		<tr>
			<td colspan="2" class="emmty"></td>
		</tr>
		<tr>
			<td class="desc2" colspan="2">bb</td>
		</tr>
		</tbody>
		</table>
	</td>
	<td class="desc1">aa</td>
</tr>
</tbody>
</table>

<table id="member" cellpadding="1" cellspacing="1">
<thead>
<tr>
	<th>&nbsp;</th>
	<th>用户</th>
	<th>人口</th>
	<th>村庄</th>
	<th>&nbsp;</th>
</tr>
</thead>
<tbody>
<?php
foreach ($aliusers as $user)
{
	$rank++;
	$TotalUserPop = $database->getVSumField($user['id'], "pop");
	$TotalVillages = $database->getProfileVillages($user['id']);    

	echo "<tr>";
	echo "<td class=ra>".$rank.".</td>";
	echo "<td class=pla><a href=spieler.php?uid=".$user['id'].">".$user['username']."</a></td>"; 
	echo "<td class=hab>".$TotalUserPop."</td>"; 
	echo "<td class=vil>".count($TotalVillages)."</td>";

	if ($aid == $session->alliance)
	{	
		if ((time() - 600) < $user['timestamp'])
		{
			echo "<td class=on><img class=\"online1\" src=\"img/x.gif\" title=\"在线\" alt=\"在线\" /></td>";
		}
		elseif ((time() - 86400) < $user['timestamp'] && (time() - 600) > $user['timestamp'])
		{
			echo "<td class=on><img class=\"online2\" src=\"img/x.gif\" title=\"在线\" alt=\"在线\" /></td>";
		}
		elseif ((time() - 259200) < $user['timestamp'] && (time() - 86400) > $user['timestamp'])
		{
			echo "<td class=on><img class=\"online3\" src=\"img/x.gif\" title=\"在线\" alt=\"在线\" /></td>";
		}
		elseif ((time() - 604800) < $user['timestamp'] && (time() - 259200) > $user['timestamp'])
		{
			echo "<td class=on><img class=\"online4\" src=\"img/x.gif\" title=\"在线\" alt=\"在线\" /></td>";
		}
		else
		{
			echo "<td class=on><img class=\"online5\" src=\"img/x.gif\" title=\"在线\" alt=\"在线\" /></td>";
		}
	}

	echo "</tr>";
}
?>
</tbody>
</table>

<?php
	}
	else
	{
		echo "找不到该联盟...<a href=\"javascript: history.go(-1)\">返回</a>";
	}
}
?>