<?php
include('menu.tpl');
?><!-- 仓库 -->
<table id="warehouse" cellpadding="1" cellspacing="1">
<thead><tr>
	<th colspan="7">仓库</th>
</tr>
<tr>
	<td>村庄</td>
	<td><img class="r1" src="img/x.gif" title="木材" alt="木材">木材</td>	<td><img class="r2" src="img/x.gif" title="粘土" alt="粘土">粘土</td>	<td><img class="r3" src="img/x.gif" title="铁矿" alt="铁矿">铁矿</td>	<td><img class="clock" src="img/x.gif" title="爆仓时间" alt="爆仓时间">爆仓时间</td>	<td><img class="r4" src="img/x.gif" title="粮食" alt="粮食">粮食</td>
	<td><img class="clock" src="img/x.gif" title="爆仓时间" alt="爆仓时间">爆仓时间</td>
</tr></thead><tbody>
<?php
$varray = $database->getProfileVillages($session->uid);  
$timer = 1;
foreach ($varray as $vil){
	$vid = $vil['wref'];
	$vdata = $database->getVillage($vid);	
	$wood = floor($vdata['wood']);
	$clay = floor($vdata['clay']);
	$iron = floor($vdata['iron']);
	$crop = floor($vdata['crop']);	
	$maxs = $vdata['maxstore'];
	$maxc = $vdata['maxcrop'];	
	$percentW = round($wood / ($maxs/100));
	$percentC = round($clay / ($maxs/100));
	$percentI = round($iron / ($maxs/100));
	$percentCr = round($crop / ($maxs/100));
	if ($vdata['capital'] == 1)	{		$class = 'hl';	}	else	{		$class = '';	}  	//	how much percent
	$cr = 95;
	if ($percentW >= $cr)	{		$critW = 'crit';	}	else	{		$critW = '';	}
	if ($percentC >= $cr)	{		$critC = 'crit';	}	else	{		$critC = '';	}
	if ($percentI >= $cr)	{		$critI = 'crit';	}	else	{		$critI = '';	}
	if ($percentCr >= $cr)	{		$critCR = 'crit';	}	else	{		$critCR = '';	}
	$timer1 = '3:06:5?';
	$timer2 = '0:32:2?';
	echo '	<tr class="'.$class.'">
		<td class="vil fc"><a href="dorf1.php?newdid='.$vid.'">'.$vdata['name'].'</a></td>
		<td class="lum '.$critW.'" title="'.$wood.'/'.$maxs.'">'.$percentW.'%</td> 
		<td class="clay '.$critC.'" title="'.$clay.'/'.$maxs.'">'.$percentC.'%</td>
		<td class="iron '.$critI.'" title="'.$iron.'/'.$maxs.'">'.$percentI.'%</td>
		<td class="max123"><span id="timer'.$timer.'">'.$timer1.'</span></td>';	$timer++;
	echo '
		<td class="crop '.$critCR.'" title="'.$crop.'/'.$maxc.'">'.$percentCr.'%</td>
		<td class="max4 lc"><span id="timer'.$timer.'">'.$timer2.'</span></td>
	</tr>';	$timer++;  }
?>
</tbody></table>