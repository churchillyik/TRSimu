<?php
$result = $admin->search_ip($_POST['s']);
$newArray = array();   
function arr($arr, $el)
{
	global $newArray;
	for ($i = 0; $i <= count($arr) - 1; $i++)
	{
		if (in_array($el, $newArray))
		{
			return false;
		}
		else
		{           
			array_push($newArray, $el);
			return true;
		}
	}
}
?>

<table id="member">
<thead>
<tr>
	<th>搜索IP地址（<?php echo count($newArray);?>）</th>
</tr>
</thead>
</table>

<table id="profile">
<tr>
	<td class="b">IP地址</td>
	<td class="b">用户名</td>
</tr>
<?php
if ($result)
{
	for ($i = 0; $i <= count($result) - 1; $i++)
	{   
		if (arr($result, $result[$i]["ip"].$result[$i]["uid"]))
		{          
			echo '
			<tr>
				<td>'.$result[$i]["ip"].'</td>
				<td><a href="?p=player&uid='.$result[$i]["uid"].'">'.$database->getUserField($result[$i]["uid"], 'username', 0).'</a></td>
			</tr>';
		}
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