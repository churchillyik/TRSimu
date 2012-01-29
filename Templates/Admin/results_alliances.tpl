<?php
$result = $admin->search_alliance($_POST['s']);
?>

<table id="member">
<thead>
<tr>
	<th>搜索联盟（<?php echo count($result);?>）</th>
</tr>
</thead>
</table>

<table id="profile">    
<tr>
	<td class="b">联盟ID</td>
	<td class="b">联盟名</td>
	<td class="b">联盟标签</td>
	<td class="b">盟主</td>
</tr>
<?php
if ($result)
{  
	for ($i = 0; $i <= count($result) - 1; $i++)
	{
		echo '
		<tr>
			<td>'.$result[$i]["id"].'</td>
			<td><a href="?p=alliance&aid='.$result[$i]["id"].'">'.$result[$i]["name"].'</a></td>
			<td><a href="?p=alliance&aid='.$result[$i]["id"].'">'.$result[$i]["tag"].'</a></td>
			<td><a href="?p=player&uid='.$result[$i]["id"].'">'.$database->getUserField($result[$i]["leader"], 'username', 0).'</a></td>
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