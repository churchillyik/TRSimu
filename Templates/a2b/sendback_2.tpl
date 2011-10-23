<?php
$to = $database->getVillage($enforce['from']);
$fromcoor = $database->getCoor($enforce['from']);
$tocoor = $database->getCoor($enforce['vref']);

	$fromCor = array('x'=>$tocoor['x'], 'y'=>$tocoor['y']);
	$toCor = array('x'=>$fromcoor['x'], 'y'=>$fromcoor['y']);
?>

<h1>Send units back</h1>			

<form method="POST" name="snd" action="a2b.php">

			<table id="short_info" cellpadding="1" cellspacing="1">

				<tbody>

					<tr>

						<th>Destination:</th>

						<td><a href="karte.php?d=<?php echo $generator->getBaseID($fromcoor['x'],$fromcoor['y']); ?>&amp;c=<?php echo $generator->getMapCheck($generator->getBaseID($fromcoor['x'],$fromcoor['y'])); ?>"><?php echo $to['name']; ?> (<?php echo $fromcoor['x']; ?>|<?php echo $fromcoor['y']; ?>)</a></td>

					</tr>

					<tr>

						<th>Owner:</th>

						<td><a href="spieler.php?uid=<?php echo $to['owner']; ?>"><?php echo $database->getUserField($to['owner'],'username',0); ?></a></td>

					</tr>

				</tbody>

			</table>




<table class="troop_details" cellpadding="1" cellspacing="1">
	<thead>
		<tr>
		<td colspan="10">Send units back to <?php echo $to['name']; ?></td>
		</tr>
	</thead>
</table>

		<table id="troops" cellpadding="1" cellspacing="1">
	<tbody><tr>
		<td class="line-first column-first large"><img class="unit u11" src="img/x.gif" title="Clubswinger" alt="Clubswinger"> <input class="text" <?php if ($enforce['u11']<=0) {echo ' disabled="disabled"';}?> name="t1" value="<?php echo $enforce['u11']; ?>" maxlength="6" type="text">
		<?php 
       	echo"<span class=\"none\">(".$enforce['u11'].")</span></td>";

        ?>
		
        <td class="line-first large"><img class="unit u14" src="img/x.gif" title="Scout" alt="Scout"> <input class="text" <?php if ($enforce['u14']<=0) {echo ' disabled="disabled"';}?> name="t4" value="<?php echo $enforce['u14']; ?>" maxlength="6" type="text">
		<?php 
       	echo"<span class=\"none\">(".$enforce['u14'].")</span></td>";

        ?>
        <td class="line-first regular"><img class="unit u17" src="img/x.gif" title="Ram" alt="Ram"> <input class="text" <?php if ($enforce['u17']<=0) {echo ' disabled="disabled"';}?> name="t7" value="<?php echo $enforce['u17']; ?>" maxlength="6" type="text">
		<?php 
       	echo"<span class=\"none\">(".$enforce['u17'].")</span></td>";

        ?>

		
        <td class="line-first column-last small"><img class="unit u19" src="img/x.gif" title="Chief" alt="Chief"> <input class="text" <?php if ($enforce['u19']<=0) {echo ' disabled="disabled"';}?> name="t9" value="<?php echo $enforce['u19']; ?>" maxlength="6" type="text">
		<?php 
       	echo"<span class=\"none\">(".$enforce['u19'].")</span></td>";

        ?>
	</tr>
	<tr>
		<td class="column-first large"><img class="unit u12" src="img/x.gif" title="Spearman" alt="Spearman"> <input class="text" <?php if ($enforce['u12']<=0) {echo ' disabled="disabled"';}?> name="t2" value="<?php echo $enforce['u12']; ?>" maxlength="6" type="text">
		<?php 
       	echo"<span class=\"none\">(".$enforce['u12'].")</span></td>";

        ?>

		<td class="large"><img class="unit u15" src="img/x.gif" title="Paladin" alt="Paladin"> <input class="text" <?php if ($enforce['u15']<=0) {echo ' disabled="disabled"';}?> name="t5" value="<?php echo $enforce['u15']; ?>" maxlength="6" type="text">
		<?php 
       	echo"<span class=\"none\">(".$enforce['u15'].")</span></td>";

        ?>
		<td class="regular"><img class="unit u18" src="img/x.gif" title="Catapult" alt="Catapult"> <input class="text" <?php if ($enforce['u18']<=0) {echo ' disabled="disabled"';}?> name="t8" value="<?php echo $enforce['u18']; ?>" maxlength="6" type="text">
		<?php 
       	echo"<span class=\"none\">(".$enforce['u18'].")</span></td>";

        ?>
		<td class="column-last small"><img class="unit u20" src="img/x.gif" title="Settler" alt="Settler"> <input class="text" <?php if ($enforce['u20']<=0) {echo ' disabled="disabled"';}?> name="t10" value="<?php echo $enforce['u20']; ?>" maxlength="6" type="text">
		<?php 
       	echo"<span class=\"none\">(".$enforce['u20'].")</span></td>";

        ?>
	</tr>
	<tr>
		<td class="line-last column-first large"><img class="unit u13" src="img/x.gif" title="Axeman" alt="Axeman"> <input class="text" <?php if ($enforce['u13']<=0) {echo ' disabled="disabled"';}?> name="t3" value="<?php echo $enforce['u13']; ?>" maxlength="6" type="text">
		<?php 
       	echo"<span class=\"none\">(".$enforce['u13'].")</span></td>";

        ?>
		<td class="line-last large"><img class="unit u16" src="img/x.gif" title="Teutonic Knight" alt="Teutonic Knight"> <input class="text" <?php if ($enforce['u16']<=0) {echo ' disabled="disabled"';}?> name="t6" value="<?php echo $enforce['u16']; ?>" maxlength="6" type="text">
		<?php 
       	echo"<span class=\"none\">(".$enforce['u16'].")</span></td>";
        ?>
		<td class="line-last regular"></td>
			<td class="line-last column-last"></td>		</tr>
</tbody></table>

<table class="troop_details" cellpadding="1" cellspacing="1">
	<tbody class="infos">
		<tr>
			<th>Arrived:</th>

			<?php
			$att_tribe = 2;
			$start = ($att_tribe == 1)? 1 : (($att_tribe == 2)? 11: 21);
			$end = ($att_tribe == 1)? 10 : (($att_tribe == 2)? 20: 30);
			$unitspeeds = array(6,5,7,16,14,10,4,3,4,5,7,7,6,9,10,9,4,3,4,5,7,6,17,19,16,13,4,3,4,5);
			$speeds = array();
				//find slowest unit.
				for($i=$start;$i<=$end;$i++)
				{
					if (isset($enforce['u'.$i]))
					{ 
						if($enforce['u'.$i]!='' && $enforce['u'.$i]>0)
						{ 
							$speeds[] = $unitspeeds[$i-2];
						}
					}
				}
				$time = $generator->procDistanceTime($fromCor,$toCor,min($speeds),1);

			?>

			<td colspan="10">
			<div class="in">in <?php echo $generator->getTimeFormat($time); ?></div>
			<div class="at">at <span id="tp2"> <?php echo date("H:i:s",time()+$time)?></span><span> hours</span></div>
			</td>
		</tr>
	</tbody>
</table>


<input name="ckey" value="<?php echo $ckey; ?>" type="hidden"> 
<input name="id" value="39" type="hidden"> 
<input name="a" value="533374" type="hidden">
<input name="c" value="8" type="hidden">


<p class="btn"><input value="ok" name="s1" id="btn_ok" class="dynamic_img " src="img/x.gif" alt="OK" type="image" onclick="if (this.disabled==false) {document.getElementsByTagName('form')[0].submit();} this.disabled=true;" onLoad="this.disabled=false;"></p>

</form>

</div>