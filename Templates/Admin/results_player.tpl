<?php
$result = $admin->search_player($_POST['s']);
?>

<table id="member">
<thead>
<tr>
	<th>搜索用户（<?php echo count($result);?>）</th>
</tr>
</thead>
</table>

<table id="profile">    
<tr>
	<td class="b">用户ID</td>
	<td class="b">用户名</td>
	<td class="b">村庄数</td>
	<td class="b">人口数</td>
</tr>
<?php
if ($result)
{  
	for ($i = 0; $i <= count($result) - 1; $i++)
	{    
		$varray = $database->getProfileVillages($result[$i]["id"]);
		$totalpop = 0;
		foreach ($varray as $vil)
		{
			$totalpop += $vil['pop'];
		}
		echo '
		<tr>
			<td>'.$result[$i]["id"].'</td>
			<td><a href="?p=player&uid='.$result[$i]["id"].'">'.$result[$i]["username"].'</a></td>
			<td>'.count($varray).'</td>
			<td>'.$totalpop.'</td>
		</tr>';
	}
}
else
{
	echo '
	<tr>
		<td colspan="4">找不到匹配的数据</td>
	</tr>';
}
?>
</table>