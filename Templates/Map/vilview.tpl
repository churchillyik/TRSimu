<div id="content" class="map">
	<?php 
	$basearray = $database->getMInfo($_GET['d']);
	?>
	<h1>
		<?php
		echo !$basearray['occupied']? $basearray['fieldtype']? "无人绿洲" : "未占领的绿洲" : $basearray['name'];
		echo " (".$basearray['x']."|".$basearray['y'].")";
		?>
	</h1>
	<?php 
	if ($basearray['occupied'] && $basearray['capital'])
	{
		echo "<div id=\"dmain\">（主村）</div>";
	}
	?>
	<img src="img/x.gif" id="detailed_map" 
	class="<?php echo ($basearray['fieldtype'] == 0)? 'w'.$basearray['oasistype'] : 'f'.$basearray['fieldtype'] ?>" 
	alt="<?php 
		switch ($basearray['fieldtype'])
		{
		case 1:
			$tt =  "3-3-3-9";
			break;
		case 2:
			$tt =  "3-4-5-6";
			break;
		case 3:
			$tt =  "4-4-4-6";
			break;
		case 4:
			$tt =  "4-5-3-6";
			break;
		case 5:
			$tt =  "5-3-4-6";
			break;
		case 6:
			$tt =  "1-1-1-15";
			break;
		case 7:
			$tt =  "4-4-3-7";
			break;
		case 8:
			$tt =  "3-4-4-7";
			break;
		case 9:
			$tt =  "4-3-4-7";
			break;
		case 10:
			$tt =  "3-5-4-6";
			break;
		case 11:
			$tt =  "4-3-5-6";
			break;
		case 12:
			$tt =  "5-4-3-6";
			break;
		case 0:
			switch ($basearray['oasistype'])
			{
			case 1:
			case 2:
				$tt =  "每小时 +25%木材产量\" title=\"每小时 +25%木材产量";
				break;
			case 3:
				$tt =  "每小时 +25%木材产量以及 +25%粮食产量\" title=\"每小时 +25%木材产量以及 +25%粮食产量";
				break;
			case 4:
			case 5:
				$tt =  "每小时 +25%粘土产量\" title=\"每小时 +25%粘土产量";
				break;
			case 6:
				$tt =  "每小时 +25%粘土产量以及 +25%粮食产量\" title=\"每小时 +25%粘土产量以及 +25%粮食产量";
				break;
			case 7:
			case 8:
				$tt =  "每小时 +25%铁矿产量\" title=\"每小时 +25%铁矿产量";
				break;
			case 9:
				$tt =  "每小时 +25%铁矿产量以及 +25%粮食产量\" title=\"每小时 +25%铁矿产量以及 +25%粮食产量";
				break;
			case 10:
			case 11:
				$tt =  "每小时 +25%粮食产量\" title=\"每小时 +25%粮食产量";
				break;
			case 12:
				$tt =  "每小时 +50%粮食产量\" title=\"每小时 +50%粮食产量";
				break;
			}
			break;
		}
		echo $tt."\"";
		$landd = explode("-", $tt);
		?> />

	<div id="map_details">
		<?php
		if ($basearray['fieldtype'] == 0)
		{
		?>
		<table cellpadding="1" cellspacing="1" id="troop_info" class="tableNone">
		<thead>
		<tr>
			<th colspan="3">军队：</th>
		</tr>
		</thead>
		<tbody>
			<?php
			$unit = $database->getUnit($_GET['d']);
			$unarray = array(31=>"老鼠","蜘蛛","蛇","蝙蝠","野猪","狼","熊","鳄鱼","老虎","大象");
			$a = 0;
			for ($i = 31; $i <= 40; $i++)
			{
				if ($unit['u'.$i])
				{
					echo '<tr>';
					echo '<td class="ico"><img class="unit u'.$i.'" src="img/x.gif" alt="'.$unarray[$i].'" title="'.$unarray[$i].'" /></td>';
					echo '<td class="val">'.$unit['u'.$i].'</td>';
					echo '<td class="desc">'.$unarray[$i].'</td>';
					echo '</tr>';                    
				}
				else
				{
					$a = $a + 1;
				}                   
			}
			if ($a == 10)
			{
				echo '<tr><td>没有军队</td></tr>';
			}
			?>
		</tbody>
		</table>
		<?php
		}
		else if (!$basearray['occupied'])
		{
		?>
		<table cellpadding="1" cellspacing="1" id="distribution" class="tableNone">
		<thead>
		<tr>
			<th colspan="3">资源比例</th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td class="ico"><img class="r1" src="img/x.gif" alt="木材" title="木材" /></td>
			<td class="val"><?php echo $landd['0']; ?></td>
			<td class="desc">木材</td>
		</tr>
		<tr>
			<td class="ico"><img class="r2" src="img/x.gif" alt="粘土" title="粘土" /></td>
			<td class="val"><?php echo $landd['1']; ?></td>
			<td class="desc">粘土</td>
		</tr>
		<tr>
			<td class="ico"><img class="r3" src="img/x.gif" alt="铁矿" title="铁矿" /></td>
			<td class="val"><?php echo $landd['2']; ?></td>
			<td class="desc">铁矿</td>
		</tr>
		<tr>
			<td class="ico"><img class="r4" src="img/x.gif" alt="粮食" title="粮食" /></td>
			<td class="val"><?php echo $landd['3']; ?></td>
			<td class="desc">粮食</td>
		</tr>
		</tbody>
		</table>
		<?php
		}
		else
		{
		?>
		
		<table cellpadding="1" cellspacing="1" id="village_info" class="tableNone">
		<thead>
		<tr>
			<th colspan="2"><div><?php echo $basearray['name']; ?></div>&nbsp;(<?php echo $basearray['x']; ?>|<?php echo $basearray['y']; ?>)</th>
		</tr>
		</thead>
		<?php 
		$uinfo = $database->getUserArray($basearray['owner'],1);
		?>
		<tbody>
		<tr>
			<th>种族</th>
			<td>
			<?php 
			switch ($uinfo['tribe'])
			{
			case 1: 
				echo "罗马";
				break;
			case 2:
				echo "条顿";
				break;
			case 3:
				echo "高卢";
				break;
			} 
			?>
			</td>
		</tr>
		<tr>
			<th>联盟</th>
			<td><a href="allianz.php?aid=<?php echo $uinfo['alliance'] ?>"><?php echo $database->getUserAlliance($basearray['owner']) ?></a></td>
		</tr>
		<tr>
			<th>所有者</th>
			<td><a href="spieler.php?uid=<?php echo $basearray['owner']; ?>"><?php echo $database->getUserField($basearray['owner'],'username',0); ?></a></td>
		</tr>
		<tr>
			<th>人口</th>
			<td><?php echo $basearray['pop']; ?></td>
		</tr>
		</tbody>
		</table>
	 
		<table cellpadding="1" cellspacing="1" id="troop_info" class="tableNone rep">
		<thead><tr>
			<th>战报：</th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td>没有任何<br>战报讯息。</td>
		</tr>
		</tbody>
		</table>
		<?php 
		}
		?>
	</div>
	
	<table cellpadding="1" cellspacing="1" id="options" class="tableNone">
	<thead>
	<tr>
		<th>选项</th>
	</tr>
	</thead>
	<tbody>
	<tr>
		<td><a href="karte.php?z=<?php echo $_GET['d']; ?>">&raquo; 回到村庄所在位置</a></td>
	</tr>
    <?php 
	if (!$basearray['occupied'])
	{
    ?>
	<tr>
		<td class="none">
		<?php 
		$mode = CP; 
		$total = count($database->getProfileVillages($session->uid));
		$need_cps = ${'cp'.$mode}[$total];
		$cps = $database->getUserField($session->uid, 'cp', 0);
		if($cps >= $need_cps)
		{
			$enough_cp = true;
		}
		else 
		{
			$enough_cp = false;
		}
		$otext = ($basearray['occupied'] == 1)? "已占领的" : "未占领的"; 
		if ($village->unitarray['u'.$session->tribe.'0'] >= 3 AND $enough_cp)
		{
			$test = "<a href=\"a2b.php?id=".$_GET['d']."&amp;s=1\">&raquo; 建立一座新的村庄。</a>";
		}
		elseif ($village->unitarray['u'.$session->tribe.'0'] >= 3 AND !$enough_cp)
		{
			$test = "&raquo; 建立一座新的村庄。（".$cps."/".$need_cps."文明点数）";
		}
		else
		{
			$test = "&raquo; 建立一座新的村庄。（当前有".$village->unitarray['u'.$session->tribe.'0']."/3个拓荒者）";
		}
		echo ($basearray['fieldtype'] == 0)? 
			($village->resarray['f39'] == 0)? 
			($basearray['owner'] == $session->uid)?
			"<a href=\"build.php?id=39\">&raquo; 掠夺".$otext."绿洲（建造一个集结点）</a>" : 
			"&raquo; 掠夺".$otext."绿洲（建造一个集结点）" : 
			//"&raquo; 掠夺".$otext."绿洲（不可能）" :
			"<a href=\"a2b.php?z=".$_GET['d']."&o\">&raquo; 掠夺".$otext."绿洲</a>" :
			"$test"
		?>
	</tr>
	<?php
	} 
	else if ($basearray['occupied'] && $basearray['wref'] != $_SESSION['wid'])
	{
	?>
	<tr>
		<td class="none">
		<?php 
		$query1 = mysql_query('SELECT * FROM `' . TB_PREFIX . 'vdata` WHERE `wref` = ' . mysql_escape_string($_GET['d']));
		$data1 = mysql_fetch_assoc($query1);
		$query2 = mysql_query('SELECT * FROM `' . TB_PREFIX . 'users` WHERE `id` = ' . $data1['owner']);
		$data2 = mysql_fetch_assoc($query2);
		if ($data2['access'] == '0')
		{
			echo "&raquo; 出兵（该玩家已被冻结）";
		}
		else if ($data2['protect'] < time())
		{
			echo $village->resarray['f39']? "<a href=\"a2b.php?z=".$_GET['d']."\">&raquo; Send troops." : "&raquo; 出兵（建造一个集结点）";
		}
		else
		{
			echo "&raquo; 出兵（该玩家还在新手保护期）";
		}
		?>
		</td>
	</tr>
	<tr>
		<td class="none">
		<?php 
		echo $building->getTypeLevel(17)? 
			"<a href=\"build.php?z=".$_GET['d']."&id=" . $building->getTypeField(17) . "\">&raquo; 派出商人" : 
			"&raquo; 派出商人（建造市场）";
		?>
		</td>
	</tr>
	<?php 
	} 
	?>
	</tbody>
	</table>
</div>
