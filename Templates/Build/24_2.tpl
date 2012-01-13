<?php 
if (!isset($timer))
{
	$timer = 1;
}
$timeleft = $database->getVillageField($village->wid, 'celebration');
if ($timeleft > Time())
{
	echo '</br>';
	echo '<table cellpadding="0" cellspacing="0" id="building_contract">';
	echo '<tr><td>';
	echo '活动剩余时间还有：';
	echo "</td><td><span id=\"timer".$timer."\">";
	echo $generator->getTimeFormat($timeleft - time());
	echo "</span> 小时</td>";
	echo "<td>结束于 ".date('H:i', $timeleft)."</td></tr>";
	echo "</table>";
	$timer += 1;
}
?>