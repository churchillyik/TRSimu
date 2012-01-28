<?php
$active = $admin->getUserActive(); 
?>
<style>
.del {width:12px; height:12px; background-image: url(img/admin/icon/del.gif);} 
</style>

<table id="member">
<thead>
<tr>
	<th colspan="6">在线用户（<?php echo count($active);?>）</th>
</tr>
</thead>
<tr>
	<td>帐号名[权限]</td>
	<td>在线时间</td>
	<td>种族</td> 
	<td>人口</td> 
	<td>村庄数</td> 
	<td>金币数</td>  
</tr>
<?php 
if ($active)
{         
	for ($i = 0; $i <= count($active) - 1; $i++)
	{
		$uid = $database->getUserField($active[$i]['username'], 'id', 1);
		$varray = $database->getProfileVillages($uid);
		$totalpop = 0;
		foreach ($varray as $vil)
		{
			$totalpop += $vil['pop'];
		}
		echo '
		<tr>
			<td><a href="?p=player&uid='.$uid.'">'.$active[$i]['username'].' ['.$active[$i]['access'].']</a></td>
			<td>'.date("d.m.y H:i:s",$active[$i]['timestamp']).'</td>
			<td>'.$active[$i]['tribe'].'</td>
			<td>'.$totalpop.'</td>
			<td>'.count($varray).'</td>
			<td>'.$active[$i]['gold'].'</td>
		</tr>';
	}
}
else
{
	echo '<tr><td colspan="6" class="hab">当前没有在线用户</td></tr>';
}
?>
</table>