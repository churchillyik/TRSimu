<?php
$to = $database->getVillage($enforce['from']);
$fromcoor = $database->getCoor($enforce['from']);
$tocoor = $database->getCoor($enforce['vref']);

$fromCor = array('x'=>$tocoor['x'], 'y'=>$tocoor['y']);
$toCor = array('x'=>$fromcoor['x'], 'y'=>$fromcoor['y']);
?>

<h1>遣回军队</h1>

<form method="POST" name="snd" action="a2b.php">
	<table id="short_info" cellpadding="1" cellspacing="1">
	<tbody>
	<tr>
		<th>目标：</th>
		<td>
			<a href="karte.php?d=<?php echo $generator->getBaseID($fromcoor['x'], $fromcoor['y']); ?>&amp;c=<?php echo $generator->getMapCheck($generator->getBaseID($fromcoor['x'], $fromcoor['y'])); ?>">
			<?php echo $to['name']; ?> (<?php echo $fromcoor['x']; ?>|<?php echo $fromcoor['y']; ?>)
			</a>
		</td>
	</tr>
	<tr>
		<th>玩家：</th>
		<td>
			<a href="spieler.php?uid=<?php echo $to['owner']; ?>">
			<?php echo $database->getUserField($to['owner'], 'username', 0); ?>
			</a>
		</td>
	</tr>
	</tbody>
	</table>

	<table class="troop_details" cellpadding="1" cellspacing="1">
	<thead>
	<tr>
		<td colspan="10">遣回 <?php echo $to['name']; ?> 的军队</td>
	</tr>
	</thead>
	</table>
	
	<table id="troops" cellpadding="1" cellspacing="1">
	<tbody>
	<tr>
		<td class="line-first column-first large">
			<img class="unit u1" src="img/x.gif" title="古罗马步兵" alt="古罗马步兵">
			<input class="text" <?php if ($enforce['u1'] <= 0) { echo ' disabled="disabled"'; } ?> name="t1" value="<?php echo $enforce['u1']; ?>" maxlength="6" type="text">
			<?php echo "<span class=\"none\">(".$enforce['u1'].")</span>"; ?>
		</td>
		
        <td class="line-first large">
			<img class="unit u4" src="img/x.gif" title="使节骑士" alt="使节骑士">
			<input class="text" <?php if ($enforce['u4'] <= 0) { echo ' disabled="disabled"'; } ?> name="t4" value="<?php echo $enforce['u4']; ?>" maxlength="6" type="text">
			<?php echo"<span class=\"none\">(".$enforce['u4'].")</span>"; ?>
		</td>
		
        <td class="line-first regular">
			<img class="unit u7" src="img/x.gif" title="冲撞车" alt="冲撞车">
			<input class="text" <?php if ($enforce['u7'] <= 0) { echo ' disabled="disabled"'; } ?> name="t7" value="<?php echo $enforce['u7']; ?>" maxlength="6" type="text">
			<?php echo"<span class=\"none\">(".$enforce['u7'].")</span>"; ?>
		</td>
		
        <td class="line-first column-last small">
			<img class="unit u9" src="img/x.gif" title="参议员" alt="参议员">
			<input class="text" <?php if ($enforce['u9'] <= 0) { echo ' disabled="disabled"'; } ?> name="t9" value="<?php echo $enforce['u9']; ?>" maxlength="6" type="text">
			<?php echo"<span class=\"none\">(".$enforce['u9'].")</span>"; ?>
		</td>
	</tr>
	<tr>
		<td class="column-first large">
			<img class="unit u2" src="img/x.gif" title="禁卫兵" alt="禁卫兵">
			<input class="text" <?php if ($enforce['u2'] <= 0) { echo ' disabled="disabled"'; } ?> name="t2" value="<?php echo $enforce['u2']; ?>" maxlength="6" type="text">
			<?php echo"<span class=\"none\">(".$enforce['u2'].")</span>"; ?>
		</td>

		<td class="large">
			<img class="unit u5" src="img/x.gif" title="帝国骑士" alt="帝国骑士">
			<input class="text" <?php if ($enforce['u5'] <= 0) { echo ' disabled="disabled"'; } ?> name="t5" value="<?php echo $enforce['u5']; ?>" maxlength="6" type="text">
			<?php echo"<span class=\"none\">(".$enforce['u5'].")</span>"; ?>
		</td>
		
		<td class="regular">
			<img class="unit u8" src="img/x.gif" title="火焰投石器" alt="火焰投石器">
			<input class="text" <?php if ($enforce['u8'] <= 0) { echo ' disabled="disabled"'; } ?> name="t8" value="<?php echo $enforce['u8']; ?>" maxlength="6" type="text">
			<?php echo"<span class=\"none\">(".$enforce['u8'].")</span>"; ?>
		</td>
		
		<td class="column-last small">
			<img class="unit u10" src="img/x.gif" title="拓荒者" alt="拓荒者">
			<input class="text" <?php if ($enforce['u10'] <= 0) { echo ' disabled="disabled"'; } ?> name="t10" value="<?php echo $enforce['u10']; ?>" maxlength="6" type="text">
			<?php echo"<span class=\"none\">(".$enforce['u10'].")</span>"; ?>
		</td>
	</tr>
	<tr>
		<td class="line-last column-first large">
			<img class="unit u3" src="img/x.gif" title="帝国兵" alt="帝国兵">
			<input class="text" <?php if ($enforce['u3'] <= 0) { echo ' disabled="disabled"'; } ?> name="t3" value="<?php echo $enforce['u3']; ?>" maxlength="6" type="text">
			<?php echo"<span class=\"none\">(".$enforce['u3'].")</span>"; ?>
		</td>
		
		<td class="line-last large">
			<img class="unit u6" src="img/x.gif" title="将军骑士" alt="将军骑士">
			<input class="text" <?php if ($enforce['u6'] <= 0) { echo ' disabled="disabled"'; } ?> name="t6" value="<?php echo $enforce['u6']; ?>" maxlength="6" type="text">
			<?php echo"<span class=\"none\">(".$enforce['u6'].")</span>"; ?>
		</td>
		
		<td class="line-last regular"></td>
		<td class="line-last column-last"></td>
	</tr>
	</tbody>
	</table>

	<table class="troop_details" cellpadding="1" cellspacing="1">
	<tbody class="infos">
	<tr>
		<th>抵达目标：</th>
		<?php
		$att_tribe = 1;
		$start = ($att_tribe == 1)? 1 : (($att_tribe == 2)? 11 : 21);
		$end = ($att_tribe == 1)? 10 : (($att_tribe == 2)? 20 : 30);
		$unitspeeds = array(6, 5, 7, 16, 14, 10, 4, 3, 4, 5, 7, 7, 6, 9, 10, 9, 4, 3, 4, 5, 7, 6, 17, 19, 16, 13, 4, 3, 4, 5);
		$speeds = array();
		//	找到最慢的单位
		for($i = $start; $i <= $end; $i++)
		{
			if (isset($enforce['u'.$i]))
			{ 
				if($enforce['u'.$i] != '' && $enforce['u'.$i] > 0)
				{ 
					$speeds[] = $unitspeeds[$i - 2];
				}
			}
		}
		$time = $generator->procDistanceTime($fromCor, $toCor, min($speeds), 1);
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

	<input name="ckey" value="<?php echo $ckey; ?>" type="hidden"> 
	<input name="id" value="39" type="hidden"> 
	<input name="a" value="533374" type="hidden">
	<input name="c" value="8" type="hidden">
	
	<p class="btn">
		<input value="ok" name="s1" id="btn_ok" class="dynamic_img " src="img/x.gif" alt="确定" type="image" onclick="if (this.disabled == false) { document.getElementsByTagName('form')[0].submit(); } this.disabled = true;" onLoad="this.disabled = false;">
	</p>
</form>