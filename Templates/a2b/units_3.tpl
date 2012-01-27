<h1>出兵</h1>

<form method="POST" name="snd" action="a2b.php">
	<input name="timestamp" value="1278280730" type="hidden">
	<input name="timestamp_checksum" value="597fa8" type="hidden">
	<input name="b" value="1" type="hidden">

	<table id="troops" cellpadding="1" cellspacing="1">
	<tbody>
	<tr>
		<td class="line-first column-first large">
			<img class="unit u21" src="img/x.gif" title="方阵兵" onclick="document.snd.t1.value=''; return false;" alt="方阵兵">
			<input class="text" <?php if ($village->unitarray['u21'] <= 0) { echo ' disabled="disabled"'; } ?> name="t1" value="" maxlength="6" type="text">
			<?php 
			if ($village->unitarray['u21'] > 0)
			{
				echo "<a href=\"#\" onclick=\"document.snd.t1.value=".$village->unitarray['u21']."; return false;\">(".$village->unitarray['u21'].")</a>";
			}
			else
			{ 
				echo  "<span class=\"none\">(0)</span>";
			}
			?>
		</td>
		
        <td class="line-first large">
			<img class="unit u24" src="img/x.gif" title="雷法师" alt="雷法师">
			<input class="text" <?php if ($village->unitarray['u24'] <= 0) { echo ' disabled="disabled"'; } ?> name="t4" value="" maxlength="6" type="text">
			<?php 
			if ($village->unitarray['u24'] > 0)
			{
				echo "<a href=\"#\" onclick=\"document.snd.t4.value=".$village->unitarray['u24']."; return false;\">(".$village->unitarray['u24'].")</a>";
			}
			else
			{ 
				echo  "<span class=\"none\">(0)</span>";
			}
			?>
		</td>
		
        <td class="line-first regular">
			<img class="unit u27" src="img/x.gif" title="冲撞车" alt="冲撞车">
			<input class="text" <?php if ($village->unitarray['u27'] <= 0) { echo ' disabled="disabled"'; } ?> name="t7" value="" maxlength="6" type="text">
			<?php 
			if ($village->unitarray['u27'] > 0)
			{
				echo "<a href=\"#\" onclick=\"document.snd.t7.value=".$village->unitarray['u27']."; return false;\">(".$village->unitarray['u27'].")</a>";
			}
			else
			{
				echo  "<span class=\"none\">(0)</span>";
			}
			?>
		</td>
		
        <td class="line-first column-last small">
			<img class="unit u29" src="img/x.gif" title="首领" alt="首领">
			<input class="text" <?php if ($village->unitarray['u29'] <= 0) { echo ' disabled="disabled"'; } ?> name="t9" value="" maxlength="6" type="text">
			<?php 
			if ($village->unitarray['u29'] > 0)
			{
				echo "<a href=\"#\" onclick=\"document.snd.t9.value=".$village->unitarray['u29']."; return false;\">(".$village->unitarray['u29'].")</a>";
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
			<img class="unit u22" src="img/x.gif" title="剑士" alt="剑士">
			<input class="text" <?php if ($village->unitarray['u22'] <= 0) { echo ' disabled="disabled"'; } ?> name="t2" value="" maxlength="6" type="text">
			<?php 
			if ($village->unitarray['u22'] > 0)
			{
				echo "<a href=\"#\" onclick=\"document.snd.t2.value=".$village->unitarray['u22']."; return false;\">(".$village->unitarray['u22'].")</a>";
			}
			else
			{ 
				echo  "<span class=\"none\">(0)</span>";
			}
			?>
		</td>

		<td class="large">
			<img class="unit u25" src="img/x.gif" title="德鲁伊骑兵" alt="德鲁伊骑兵">
			<input class="text" <?php if ($village->unitarray['u25'] <= 0) { echo ' disabled="disabled"'; } ?> name="t5" value="" maxlength="6" type="text">
			<?php 
			if ($village->unitarray['u25'] > 0)
			{
				echo "<a href=\"#\" onclick=\"document.snd.t5.value=".$village->unitarray['u25']."; return false;\">(".$village->unitarray['u25'].")</a>";
			}
			else
			{ 
				echo  "<span class=\"none\">(0)</span>";
			}
			?>
		</td>
		
		<td class="regular">
			<img class="unit u28" src="img/x.gif" title="投石器" alt="投石器">
			<input class="text" <?php if ($village->unitarray['u28'] <= 0) { echo ' disabled="disabled"'; } ?> name="t8" value="" maxlength="6" type="text">
			<?php 
			if ($village->unitarray['u28'] > 0)
			{
				echo "<a href=\"#\" onclick=\"document.snd.t8.value=".$village->unitarray['u28']."; return false;\">(".$village->unitarray['u28'].")</a>";
			}
			else
			{ 
				echo  "<span class=\"none\">(0)</span>";
			}
			?>
		</td>
		
		<td class="column-last small">
			<img class="unit u30" src="img/x.gif" title="拓荒者" alt="拓荒者">
			<input class="text" <?php if ($village->unitarray['u30'] <= 0) { echo ' disabled="disabled"'; } ?> name="t10" value="" maxlength="6" type="text">
			<?php 
			if ($village->unitarray['u30'] > 0)
			{
				echo "<a href=\"#\" onclick=\"document.snd.t10.value=".$village->unitarray['u30']."; return false;\">(".$village->unitarray['u30'].")</a>";
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
			<img class="unit u23" src="img/x.gif" title="探路者" alt="探路者">
			<input class="text" <?php if ($village->unitarray['u23'] <= 0) { echo ' disabled="disabled"'; } ?> name="t3" value="" maxlength="6" type="text">
			<?php 
			if ($village->unitarray['u23'] > 0)
			{
				echo "<a href=\"#\" onclick=\"document.snd.t3.value=".$village->unitarray['u23']."; return false;\">(".$village->unitarray['u23'].")</a>";
			}
			else
			{ 
				echo  "<span class=\"none\">(0)</span>";
			}
			?>
		</td>
		
		<td class="line-last large">
			<img class="unit u26" src="img/x.gif" title="海顿圣骑士" alt="海顿圣骑士">
			<input class="text" <?php if ($village->unitarray['u26'] <= 0) { echo ' disabled="disabled"'; } ?> name="t6" value="" maxlength="6" type="text">
			<?php 
			if ($village->unitarray['u26'] > 0)
			{
				echo "<a href=\"#\" onclick=\"document.snd.t6.value=".$village->unitarray['u26']."; return false;\">(".$village->unitarray['u26'].")</a>";
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