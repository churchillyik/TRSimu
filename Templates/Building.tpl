<table cellpadding="1" cellspacing="1" id="building_contract">
<thead>
<tr>
	<th colspan="4">
	<?php echo BUILDING_UPGRADING; ?>
	<?php
	if ($session->gold >= 2)
	{
	?> 
		<img class="clock" alt="花2金币立即完成" title="花2金币立即完成" src="img/x.gif"/>
		<a href="?buildingFinish=1" onclick="return confirm('要花2金币让该村庄所有建筑和研究立即完成吗？');" title="花2金币立即完成">立即完成</a>
	<?php
	}
	?>
	</th>
</tr>
</thead>

<tbody>
<?php 
if ($_GET['buildingFinish'] == 1 AND $session->gold >= 2)
{
	$gold=$database->getUserField($_SESSION['username'], 'gold', 'username');
	$gold -= 2;
	$database->updateUserField($_SESSION['username'], 'gold', $gold, 0);
}
if(!isset($timer))
{
	$timer = 1;
}
foreach ($building->buildArray as $jobs)
{
	echo "
	<tr>
		<td class=\"ico\">
			<a href=\"?d=".$jobs['id']."&a=0&c=$session->checker\">";
	
	echo "
			<img src=\"img/x.gif\" class=\"del\" title=\"取消\" alt=\"取消\" /></a>
		</td>
		<td>";
		
	echo $building->procResType($jobs['type'])."（等级 ".($village->resarray['f'.$jobs['field']] + 1)."）";
	/*
	if($jobs['loopcon'] == 1) 
	{
		echo " (waiting loop).";
	}
	*/
	echo "
		</td>
		<td>
			<span id=\"timer".$timer."\">";
	echo $generator->getTimeFormat($jobs['timestamp'] - time());
	echo "	
			</span> 小时
		</td>";
	echo "
		<td>完成于 ".date('H:i', $jobs['timestamp'])."</td>
	</tr>";
	$timer += 1;
}
?>
</tbody>
</table>

<script type="text/javascript">
	var bld = [{"stufe":1, "gid":"1", "aid":"3"}]
</script>