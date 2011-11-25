<?php
include('menu.tpl');
?><!-- 村庄总览 -->
<table id="overview" cellpadding="1" cellspacing="1">
<thead><tr>
	<th colspan="5">村庄总览</th>
</tr>
<tr>
	<td>村庄</td>	<td>攻击</td>	<td>建筑</td>	<td>军队</td>	<td>商人</td>
</tr></thead><tbody>
<?php
$varray = $database->getProfileVillages($session->uid);  
foreach ($varray as $vil){  
	$vid = $vil['wref'];	$vdata = $database->getVillage($vid);	$building = $database->getJobs($vid);  	$unit = $database->getTraining($vid); 	$movement = '';  	$att = '战斗还有bug..';	/*
    foreach ($movement as $a)	{		$att .= '<a href="build.php?newdid='.$vid.'&id=39"><img class="att1" src="img/x.gif" title="attack" alt="attack"></a>';
    }	*/
    foreach ($building as $b)	{		$bui .= '<a href="dorf2.php?newdid='.$vid.'"><img class="bau" src="img/x.gif" title="'.$b['type'].'" alt="'.$b['type'].'"></a>';
    } 
    foreach($unit as $c)	{
		$tro .= '<a href="build.php?newdid='.$vid.'&gid=19"><img class="unit u'.$c['unit'].'" src="img/x.gif" alt="'.$c['amt'].'x name unit"></a>';
    }          	if ($vdata['capital'] == 1)	{		$class = 'hl';	}	else	{		$class = '';	}
    echo '
    <tr class="'.$class.'">		<td class="vil fc"><a href="dorf1.php?newdid='.$vid.'">'.$vdata['name'].'</a></td>		<td class="att">'.$att.'</td>		<td class="bui">'.$bui.'</td>		<td class="tro">'.$tro.'</td>  		<td class="tra lc"><a href="build.php?gid=17">?/?</a></td>	</tr>';
}
?>
</tbody></table>