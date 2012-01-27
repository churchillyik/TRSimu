<h1>出兵</h1>

<form method="POST" name="snd" action="a2b.php">
	<input name="timestamp" value="1278280730" type="hidden">
	<input name="timestamp_checksum" value="597fa8" type="hidden">
	<input name="b" value="1" type="hidden">

	<table id="troops" cellpadding="1" cellspacing="1">
	<tbody>
	<tr>
		<td class="line-first column-first large">
			<img class="unit u11" src="img/x.gif" title="棍棒兵" onclick="document.snd.t1.value=''; return false;" alt="棍棒兵">
			<input class="text" <?php if ($village->unitarray['u11'] <= 0) { echo ' disabled="disabled"'; } ?> name="t1" value="" maxlength="6" type="text">
			<?php 
			if ($village->unitarray['u11'] > 0)
			{
				echo "<a href=\"#\" onclick=\"document.snd.t1.value=".$village->unitarray['u11']."; return false;\">(".$village->unitarray['u11'].")</a>";
			}
			else
			{ 
				echo  "<span class=\"none\">(0)</span>";
			}
			?>
		</td>
		
        <td class="line-first large">
			<img class="unit u14" src="img/x.gif" title="侦察兵" alt="侦察兵">
			<input class="text" <?php if ($village->unitarray['u14'] <= 0) { echo ' disabled="disabled"'; } ?> name="t4" value="" maxlength="6" type="text">
			<?php 
			if ($village->unitarray['u14'] > 0)
			{
				echo "<a href=\"#\" onclick=\"document.snd.t4.value=".$village->unitarray['u14']."; return false;\">(".$village->unitarray['u14'].")</a>";
			}
			else
			{ 
				echo  "<span class=\"none\">(0)</span>";
			}
			?>
		</td>
		
        <td class="line-first regular">
			<img class="unit u17" src="img/x.gif" title="冲撞车" alt="冲撞车">
			<input class="text" <?php if ($village->unitarray['u17'] <= 0) { echo ' disabled="disabled"'; } ?> name="t7" value="" maxlength="6" type="text">
			<?php 
			if ($village->unitarray['u17'] > 0)
			{
				echo "<a href=\"#\" onclick=\"document.snd.t7.value=".$village->unitarray['u17']."; return false;\">(".$village->unitarray['u17'].")</a>";
			}
			else
			{ 
				echo  "<span class=\"none\">(0)</span>";
			}
			?>
		</td>
		
        <td class="line-first column-last small">
			<img class="unit u19" src="img/x.gif" title="执政官" alt="执政官">
			<input class="text" <?php if ($village->unitarray['u19'] <= 0) { echo ' disabled="disabled"'; } ?> name="t9" value="" maxlength="6" type="text">
			<?php 
			if ($village->unitarray['u19'] > 0)
			{
				echo "<a href=\"#\" onclick=\"document.snd.t9.value=".$village->unitarray['u19']."; return false;\">(".$village->unitarray['u19'].")</a>";
			}
			else
			{ 
				echo  "<span class=\"none\">(0)</span>";
			}
			?>
		</td>
	</tr>
	<tr>
		<td class="column-first large">
			<img class="unit u12" src="img/x.gif" title="矛兵" alt="矛兵">
			<input class="text" <?php if ($village->unitarray['u12'] <= 0) { echo ' disabled="disabled"'; } ?> name="t2" value="" maxlength="6" type="text">
			<?php 
			if ($village->unitarray['u12'] > 0)
			{
				echo "<a href=\"#\" onclick=\"document.snd.t2.value=".$village->unitarray['u12']."; return false;\">(".$village->unitarray['u12'].")</a>";
			}
			else
			{ 
				echo  "<span class=\"none\">(0)</span>";
			}
			?>
		</td>

		<td class="large">
			<img class="unit u15" src="img/x.gif" title="圣骑士" alt="圣骑士">
			<input class="text" <?php if ($village->unitarray['u15'] <= 0) { echo ' disabled="disabled"'; } ?> name="t5" value="" maxlength="6" type="text">
			<?php 
			if ($village->unitarray['u15'] > 0)
			{
				echo "<a href=\"#\" onclick=\"document.snd.t5.value=".$village->unitarray['u15']."; return false;\">(".$village->unitarray['u15'].")</a>";
			}
			else
			{ 
				echo  "<span class=\"none\">(0)</span>";
			}
			?>
		</td>
		
		<td class="regular">
			<img class="unit u18" src="img/x.gif" title="投石器" alt="投石器">
			<input class="text" <?php if ($village->unitarray['u18'] <= 0) { echo ' disabled="disabled"'; } ?> name="t8" value="" maxlength="6" type="text">
			<?php 
			if ($village->unitarray['u18']>0)
			{
				echo "<a href=\"#\" onclick=\"document.snd.t8.value=".$village->unitarray['u18']."; return false;\">(".$village->unitarray['u18'].")</a>";
			}
			else
			{ 
				echo  "<span class=\"none\">(0)</span>";
			}
			?>
		</td>
		
		<td class="column-last small">
			<img class="unit u20" src="img/x.gif" title="拓荒者" alt="拓荒者">
			<input class="text" <?php if ($village->unitarray['u20'] <= 0) { echo ' disabled="disabled"'; } ?> name="t10" value="" maxlength="6" type="text">
			<?php 
			if ($village->unitarray['u20'] > 0)
			{
				echo "<a href=\"#\" onclick=\"document.snd.t10.value=".$village->unitarray['u20']."; return false;\">(".$village->unitarray['u20'].")</a>";
			}
			else
			{ 
				echo  "<span class=\"none\">(0)</span>";
			}
        ?>
		</td>
	</tr>
	<tr>
		<td class="line-last column-first large">
			<img class="unit u13" src="img/x.gif" title="斧头兵" alt="斧头兵">
			<input class="text" <?php if ($village->unitarray['u13'] <= 0) { echo ' disabled="disabled"'; } ?> name="t3" value="" maxlength="6" type="text">
			<?php 
			if ($village->unitarray['u13'] > 0)
			{
				echo "<a href=\"#\" onclick=\"document.snd.t3.value=".$village->unitarray['u13']."; return false;\">(".$village->unitarray['u13'].")</a>";
			}
			else
			{ 
				echo  "<span class=\"none\">(0)</span>";
			}
			?>
		</td>
		
		<td class="line-last large">
			<img class="unit u16" src="img/x.gif" title="日耳曼骑士" alt="日耳曼骑士">
			<input class="text" <?php if ($village->unitarray['u16'] <= 0) { echo ' disabled="disabled"'; } ?> name="t6" value="" maxlength="6" type="text">
			<?php 
			if ($village->unitarray['u16'] > 0)
			{
				echo "<a href=\"#\" onclick=\"document.snd.t6.value=".$village->unitarray['u16']."; return false;\">(".$village->unitarray['u16'].")</a>";
			}
			else
			{ 
				echo  "<span class=\"none\">(0)</span>";
			}
			?>
		</td>
		
		<td class="line-last regular"></td>
		<td class="line-last column-last"></td>
	</tr>
	</tbody>
	</table>