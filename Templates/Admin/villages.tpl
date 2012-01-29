<style>
.del {width:12px; height:12px; background-image: url(img/admin/icon/del.gif);}
</style>
<table id="member">
<thead>
<tr>
	<th>村庄</th>
</tr>
</thead>
</table>

<table id="profile">    
<tr>
	<td>村庄名称</td>
	<td>村庄人口</td>
	<td>村庄坐标</td>
	<td></td>
</tr>
<?php
for ($i = 0; $i <= count($varray) - 1; $i++)
{
	$coorproc = $database->getCoor($varray[$i]['wref']);
	if ($varray[$i]['capital'])
	{
		$capital = '<span class="c">（主村）</span>';
		$delLink = '<a href="#"><img src="../img/Admin/del_g.gif" class="del"></a>';
	}
	else
	{
		$capital = '';
		$delLink = '<a href="?action=delVil&did='.$varray[$i]['wref'].'" onClick="return del(\'did\','.$varray[$i]['wref'].');"><img src="../img/Admin/del.gif" class="del"></a>';
	}
	echo '
    <tr>
        <td><a href="?p=village&did='.$varray[$i]['wref'].'">'.$varray[$i]['name'].'</a> '.$capital.'</td>
        <td>'.$varray[$i]['pop'].' <a href="?action=recountPop&did='.$varray[$i]['wref'].'">（刷新）<a/></td>
        <td>('.$coorproc['x'].'|'.$coorproc['y'].')</td>
		<td>'.$delLink.' </td>
    </tr>';
}
?>
</table>