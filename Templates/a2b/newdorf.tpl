<?php
$founder = $database->getVillage($village->wid);
$newvillage = $database->getMInfo($_GET['id']);
$eigen = $database->getCoor($village->wid);
$from = array('x'=>$eigen['x'], 'y'=>$eigen['y']);
$to = array('x'=>$newvillage['x'], 'y'=>$newvillage['y']);
$time = $generator->procDistanceTime($from, $to, 300, 0);

echo '<pre>';
print_r($founder);
echo '</pre>';
?>

<h1>建立新村庄</h1>
<p>
	你的拓荒者即将出发了。
	<br> 
	在此之前，你需要保证你原来的村庄余有木材、粘土、铁矿和粮食各750单位，作为他们开拓新村庄的资本。
</p>
<form method="POST" action="build.php">
	<input type="hidden" name="a" value="new" />
	<input type="hidden" name="c" value="5" />
	<input type="hidden" name="s" value="<?php echo $_GET['id']; ?>" />
	<input type="hidden" name="id" value="39" />
	<input type="hidden" name="timestamp" value="<?php echo time() + $time ?>" />
	
	<table class="troop_details" cellpadding="1" cellspacing="1">
	<thead>
	<tr>
		<td class="role">
			<a href="karte.php?d=<?php echo $founder['0']; ?>&c=<?php echo $generator->getMapCheck($founder['0']); ?>"><?php echo $database->getUserField($session->uid,'username',0); ?></a>
		</td>
		<td colspan="10">
			<a href="karte.php?d=<?php echo $newvillage['id']; ?>&c=<?php echo $generator->getMapCheck($newvillage['0']) ?>">建立新村庄 (<?php echo $newvillage['x']; ?>|<?php echo $newvillage['y']; ?>)</a>
		</td>
	</tr>
	</thead>
	<tbody class="units">
	<tr>
		<th>&nbsp;</th>
		<td><img src="img/x.gif" class="unit u1" title="古罗马步兵" alt="古罗马步兵" /></td>
		<td><img src="img/x.gif" class="unit u2" title="禁卫兵" alt="禁卫兵" /></td>
		<td><img src="img/x.gif" class="unit u3" title="帝国兵" alt="帝国兵" /></td>
		<td><img src="img/x.gif" class="unit u4" title="使节骑士" alt="使节骑士" /></td>
		<td><img src="img/x.gif" class="unit u5" title="帝国骑士" alt="帝国骑士" /></td>
		<td><img src="img/x.gif" class="unit u6" title="将军骑士" alt="将军骑士" /></td>
		<td><img src="img/x.gif" class="unit u7" title="冲撞车" alt="冲撞车" /></td>
		<td><img src="img/x.gif" class="unit u8" title="火焰投石器" alt="火焰投石器" /></td>
		<td><img src="img/x.gif" class="unit u9" title="参议员" alt="参议员" /></td>
		<td><img src="img/x.gif" class="unit u10" title="拓荒者" alt="拓荒者" /></td>
	</tr>
	<tr>
		<th>军队</th>
		<td class="none">0</td>
		<td class="none">0</td>
		<td class="none">0</td>
		<td class="none">0</td>
		<td class="none">0</td>
		<td class="none">0</td>
		<td class="none">0</td>
		<td class="none">0</td>
		<td class="none">0</td>
		<td>3</td>
	</tr>
	</tbody>
	<tbody class="infos">
	<tr>
		<th>花费时间</th>
		<td colspan="10">
			<img class="clock" src="img/x.gif" alt="花费时间" title="花费时间" /> 
			<?php echo $generator->getTimeFormat($time); ?>
		</td>
	</tr>
	</tbody>
	<tbody class="infos">
	<tr>
		<th>资源</th>
		<td colspan="10">
			<img class="r1" src="img/x.gif" alt="木材" title="木材" />750 | 
			<img class="r2" src="img/x.gif" alt="粘土" title="粘土" />750 | 
			<img class="r3" src="img/x.gif" alt="铁矿" title="铁矿" />750 | 
			<img class="r4" src="img/x.gif" alt="粮食" title="粮食" />750
		</td>
	</tr>
	</tbody>
	</table>
	
	<p class="btn">
		<?php
		$mode = CP; 
		$total = count($database->getProfileVillages($session->uid)); 
		$need_cps = ${'cp'.$mode}[$total];
		$cps = $database->getUserField($session->uid, 'cp', 0);

		if ($cps >= $need_cps)
		{
		?>
			<input type="image" value="ok" name="s1" id="btn_ok" class="dynamic_img"  alt="OK" src="img/x.gif" />
		<?php
		}
		else
		{
			echo "$cps/$need_cps 文明度";
		}
		?>
	</p>
</form>