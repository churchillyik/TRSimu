<?php
$eigen = $database->getCoor($village->wid);
$from = array('x'=>$eigen['x'], 'y'=>$eigen['y']);
$to = array('x'=>$coor['x'], 'y'=>$coor['y']);
$time = $generator->procDistanceTime($from, $to, 300, 0);
$ckey = $generator->generateRandStr(6);

if (!isset($process['t1']) || $process['t1'] == '')		{ $t1 = '0'; }	else { $t1 = $process['t1']; }
if (!isset($process['t2']) || $process['t2'] == '')		{ $t2 = '0'; }	else { $t2 = $process['t2']; } 
if (!isset($process['t3']) || $process['t3'] == '')		{ $t3 = '0'; }	else { $t3 = $process['t3']; } 
if (!isset($process['t4']) || $process['t4'] == '')		{ $t4 = '0'; }	else { $t4 = $process['t4']; } 
if (!isset($process['t5']) || $process['t5'] == '')		{ $t5 = '0'; }	else { $t5 = $process['t5']; } 
if (!isset($process['t6']) || $process['t6'] == '')		{ $t6 = '0'; }	else { $t6 = $process['t6']; } 
if (!isset($process['t7']) || $process['t7'] == '')		{ $t7 = '0'; }	else { $t7 = $process['t7']; } 
if (!isset($process['t8']) || $process['t8'] == '')		{ $t8 = '0'; }	else { $t8 = $process['t8']; } 
if (!isset($process['t9']) || $process['t9'] == '')		{ $t9 = '0'; }	else { $t9 = $process['t9']; } 
if (!isset($process['t10']) || $process['t10'] == '')	{ $t10 = '0'; }	else { $t10 = $process['t10']; } 
if (!isset($process['t11']) || $process['t11'] == '')	{ $t11 = '0'; }	else { $t11 = $process['t11']; } 

$id = $database->addA2b($ckey, time()
						, $process['0']
						, $t1, $t2, $t3, $t4, $t5, $t6, $t7, $t8, $t9, $t10, $t11
						, $process['c']);

if ($process['c'] == 2)
{
	$actionType = "增援";
}
elseif ($process['c'] == 3)
{
	$actionType = "攻击";
}
else
{
	$actionType = "掠夺";
}
?>

<h1><?php echo "对 ".$process[1]." 的".$actionType; ?></h1>			
<form method="post" action="a2b.php">
	<table id="short_info" cellpadding="1" cellspacing="1">
	<tbody>
	<tr>
		<th>目标村：</th>
		<td>
			<a href="karte.php?d=&amp;c="><?php echo $process[1]; ?> (<?php echo $coor['x']; ?>|<?php echo $coor['y']; ?>)</a>
		</td>
	</tr>
	<tr>
		<th>玩家：</th>
		<td>
			<a href="spieler.php?uid=<?php echo $process['2']; ?>"><?php echo $database->getUserField($process['2'], 'username', 0); ?></a>
		</td>
	</tr>
	</tbody>
	</table>

	<table class="troop_details" cellpadding="1" cellspacing="1">
	<thead>
	<tr>
		<td><?php echo $process[1]; ?></td>
		<td colspan="10"><?php echo "对 ".$process[1]." 的".$actionType; ?></td>
	</tr>
	</thead>
	<tbody class="units">
	<tr>
		<td></td>
		<td><img src="img/x.gif" class="unit u21" title="方阵兵" alt="方阵兵"></td>
		<td><img src="img/x.gif" class="unit u22" title="剑士" alt="剑士"></td>
		<td><img src="img/x.gif" class="unit u23" title="探路者" alt="探路者"></td>
		<td><img src="img/x.gif" class="unit u24" title="雷法师" alt="雷法师"></td>
		<td><img src="img/x.gif" class="unit u25" title="德鲁伊骑兵" alt="德鲁伊骑兵"></td>
		<td><img src="img/x.gif" class="unit u26" title="海顿圣骑士" alt="海顿圣骑士"></td>
		<td><img src="img/x.gif" class="unit u27" title="冲撞车" alt="冲撞车"></td>
		<td><img src="img/x.gif" class="unit u28" title="投石器" alt="投石器"></td>
		<td><img src="img/x.gif" class="unit u29" title="参议员" alt="参议员"></td>
		<td><img src="img/x.gif" class="unit u30" title="拓荒者" alt="拓荒者"></td>
	</tr>
	<tr>
		<th>军队</th>
		<td <?php if (!isset($process['t1']) || $process['t1'] == '') { echo "class=\"none\">0"; } else { echo ">".$process['t1'];} ?></td>
		<td <?php if (!isset($process['t2']) || $process['t2'] == '') { echo "class=\"none\">0"; } else { echo ">".$process['t2'];} ?></td>
		<td <?php if (!isset($process['t3']) || $process['t3'] == '') { echo "class=\"none\">0"; } else { echo ">".$process['t3'];} ?></td>
		<td <?php if (!isset($process['t4']) || $process['t4'] == '') { echo "class=\"none\">0"; } else { echo ">".$process['t4'];} ?></td>
		<td <?php if (!isset($process['t5']) || $process['t5'] == '') { echo "class=\"none\">0"; } else { echo ">".$process['t5'];} ?></td>
		<td <?php if (!isset($process['t6']) || $process['t6'] == '') { echo "class=\"none\">0"; } else { echo ">".$process['t6'];} ?></td>
		<td <?php if (!isset($process['t7']) || $process['t7'] == '') { echo "class=\"none\">0"; } else { echo ">".$process['t7'];} ?></td>
		<td <?php if (!isset($process['t8']) || $process['t8'] == '') { echo "class=\"none\">0"; } else { $kata='1'; echo ">".$process['t8'];} ?></td>
		<td <?php if (!isset($process['t9']) || $process['t9'] == '') { echo "class=\"none\">0"; } else { echo ">".$process['t9'];} ?></td>
		<td <?php if (!isset($process['t10']) || $process['t10'] == '') { echo "class=\"none\">0"; } else { echo ">".$process['t10'];} ?></td>
	</tr>
	</tbody>
	<tbody class="infos">
	<?php
	if (isset($kata) AND $process['c']!='2')
	{
	?>
	<tr>
		<th>攻击目标：</th>
		<td colspan="10">
			<?php
			if ($process['c'] == '3')
			{
				echo "投石器将攻击：随机目标";
			}
			elseif ($process['c']=='4')
			{
				echo "警告：投石器<b>只有</b>在普通攻击模式下才会摧毁建筑";
			}
			?>
		</td>
	</tr>
	<?php
	}
	?>
	<tr>
		<th>抵达目标：</th>
		<?php
		$att_tribe = 3;
		$start = ($att_tribe == 1)? 1 : (($att_tribe == 2)? 11 : 21);
		$end = ($att_tribe == 1)? 10 : (($att_tribe == 2)? 20 : 30);
		$unitspeeds = array(6, 5, 7, 16, 14, 10, 4, 3, 4, 5, 7, 7, 6, 9, 10, 9, 4, 3, 4, 5, 7, 6, 17, 19, 16, 13, 4, 3, 4, 5);
		$speeds = array();
		$scout = 1;
		//	找到最慢的单位
		for($i = 1; $i <= 10; $i++)
		{
			if (isset($process['t'.$i]))
			{
				if( $process['t'.$i] != '' && $process['t'.$i] > 0)
				{
					$speeds[] = $unitspeeds[$i - 2 + $start];
					if ($i != 3)
					{
						$scout = 0;
					}
				}
			}
		}
		if($scout)
		{
			$process['c'] = 1;
		}
		$time = $generator->procDistanceTime($from, $to, min($speeds), 1);
		?>
		
		<td colspan="10">
			<div class="in">
				需要 <?php echo $generator->getTimeFormat($time); ?>
			</div>
			<div class="at">
				于 <span id="tp2"><?php echo date("H:i:s", time() + $time)?></span>
			</div>
		</td>
	</tr>
	</tbody>
	</table>
	
	<input name="timestamp" value="<?php echo time(); ?>" type="hidden"> 
	<input name="timestamp_checksum" value="<?php echo $ckey; ?>" type="hidden"> 
	<input name="ckey" value="<?php echo $id; ?>" type="hidden"> 
	<input name="id" value="39" type="hidden"> 
	<input name="a" value="533374" type="hidden">
	<input name="c" value="3" type="hidden">
	<p class="btn">
		<input value="ok" name="s1" id="btn_ok" class="dynamic_img " src="img/x.gif" alt="确定" type="image" onclick="if (this.disabled == false) { document.getElementsByTagName('form')[0].submit(); } this.disabled = true;" onLoad="this.disabled = false;">
	</p>
</form>