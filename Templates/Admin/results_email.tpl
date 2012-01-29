<?php
$result = $admin->search_email($_POST['s']);
?>

<table id="member">
<thead>
<tr>
	<th>搜索电子邮箱（<?php echo count($result);?>）</th>
</tr>
</thead>
</table>

<table id="profile">
<tr>
	<td class="b">用户ID</td>
	<td class="b">用户名</td>
	<td class="b">电子邮箱</td>
</tr>
<?php      
if ($result)
{
	for ($i = 0; $i <= count($result) - 1; $i++)
	{    
		echo '
		<tr>
			<td>'.$result[$i]["id"].'</td>
			<td><a href="?p=player&uid='.$result[$i]["id"].'">'.$database->getUserField($result[$i]["id"], 'username', 0).'</a></td>
			<td>'.$result[$i]["email"].'</td>
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