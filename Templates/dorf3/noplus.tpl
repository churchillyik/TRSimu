<div id="textmenu">
   <a href="dorf3.php" class="selected ">村庄总览</a> | 
   <span>资源</span> | 
   <span>仓库容量</span> | 
   <span>文明点</span> | 
   <span>军队</span>
</div>

<table cellpadding="1" cellspacing="1" id="overview">
<thead>
<tr>
	<th colspan="5">村庄总览</th>
</tr>
<tr>
	<td>村庄</td>
	<td>攻击</td>
	<td>建筑</td>
	<td>军队</td>
	<td>商人</td>
</tr>
</thead>

<tbody>
<?php
$varray = $database->getProfileVillages($session->uid);  
foreach ($varray as $vil)
{  
	$vid = $vil['wref'];
	$vdata = $database->getVillage($vid);
	if ($vdata['capital'] == 1)
	{
		$class = 'hl';
	}
	else
	{
		$class = '';
	}
	echo '
	<tr class="'.$class.'">
		<td class="vil fc"><a href="dorf1.php?newdid='.$vid.'">'.$vdata['name'].'</a></td>
		<td class="att"><span class="none">?</span></td>
		<td class="bui"><span class="none">?</span></td> 
		<td class="tro"><span class="none">?</span></td>
		<td class="tra lc"><a href="build.php?gid=17">?/?</a></td>
	</tr>';
}
?>
</tbody>
</table>