<?php
$result = $admin->search_village($_POST['s']);
?>

<table id="member">
<thead>
<tr>
	<th>搜索村庄（<?php echo count($result);?>）</th>
</tr>
</thead>
</table>

<table id="profile">    
<tr>
	<td class="b">村庄ID</td>
	<td class="b">村庄名</td>
	<td class="b">村庄所有人</td>         
	<td class="b">村庄人口</td>
	<td class="b">移除</td>
</tr>
<?php      
if ($result)
{  
	for ($i = 0; $i <= count($result) - 1; $i++)
	{    
		echo '
		<tr>
			<td>'.$result[$i]["wref"].'</td>
			<td><a href="?p=village&did='.$result[$i]["wref"].'">'.$result[$i]["name"].'</a></td>
			<td><a href="?p=player&uid='.$result[$i]["owner"].'">'.$database->getUserField($result[$i]["owner"],'username',0).'</a></td>
			<td>'.$result[$i]["pop"].'</td>
			<td><a href="?action=delVil&did='.$result[$i]['wref'].'" onClick="return del(\'did\','.$result[$i]['wref'].');"><img src="../img/Admin/del.gif" class="del"></td>
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