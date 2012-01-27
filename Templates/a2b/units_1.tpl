<h1>出兵</h1>

<form method="POST" name="snd" action="a2b.php">
	<input name="timestamp" value="1278280730" type="hidden">
	<input name="timestamp_checksum" value="597fa8" type="hidden">
	<input name="b" value="1" type="hidden">

	<table id="troops" cellpadding="1" cellspacing="1">
	<tbody>
	<tr>
		<td class="line-first column-first large">
			<img class="unit u1" src="img/x.gif" title="古罗马步兵" onclick="document.snd.t1.value=''; return false;" alt="古罗马步兵">
			<input class="text" <?php if ($village->unitarray['u1'] <= 0) { echo ' disabled="disabled"'; } ?> name="t1" value="" maxlength="6" type="text">
			<?php 
			if ($village->unitarray['u1'] > 0)
			{
				echo "<a href=\"#\" onclick=\"document.snd.t1.value=".$village->unitarray['u1']."; return false;\">(".$village->unitarray['u1'].")</a>";
			}
			else
			{ 
				echo  "<span class=\"none\">(0)</span>";
			}
			?>
		</td>
		
        <td class="line-first large">
			<img class="unit u4" src="img/x.gif" title="使节骑士" alt="使节骑士">
			<input class="text" <?php if ($village->unitarray['u4'] <= 0) { echo ' disabled="disabled"'; } ?> name="t4" value="" maxlength="6" type="text">
			<?php 
			if ($village->unitarray['u4'] > 0)
			{
				echo "<a href=\"#\" onclick=\"document.snd.t4.value=".$village->unitarray['u4']."; return false;\">(".$village->unitarray['u4'].")</a>";
			}
			else
			{ 
				echo  "<span class=\"none\">(0)</span>";
			}
			?>
		</td>
		
        <td class="line-first regular">
			<img class="unit u7" src="img/x.gif" title="冲撞车" alt="冲撞车">
			<input class="text" <?php if ($village->unitarray['u7'] <= 0) { echo ' disabled="disabled"'; } ?> name="t7" value="" maxlength="6" type="text">
			<?php 
			if ($village->unitarray['u7'] > 0)
			{
				echo "<a href=\"#\" onclick=\"document.snd.t7.value=".$village->unitarray['u7']."; return false;\">(".$village->unitarray['u7'].")</a>";
			}
			else
			{ 
				echo  "<span class=\"none\">(0)</span>";
			}
			?>
		</td>
		
        <td class="line-first column-last small">
			<img class="unit u9" src="img/x.gif" title="参议员" alt="参议员">
			<input class="text" <?php if ($village->unitarray['u9'] <= 0) { echo ' disabled="disabled"'; } ?> name="t9" value="" maxlength="6" type="text">
			<?php 
			if ($village->unitarray['u9'] > 0)
			{
				echo "<a href=\"#\" onclick=\"document.snd.t9.value=".$village->unitarray['u9']."; return false;\">(".$village->unitarray['u9'].")</a>";
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
			<img class="unit u2" src="img/x.gif" title="禁卫兵" alt="禁卫兵">
			<input class="text" <?php if ($village->unitarray['u2'] <= 0) { echo ' disabled="disabled"'; } ?> name="t2" value="" maxlength="6" type="text">
			<?php 
			if ($village->unitarray['u2'] > 0)
			{
				echo "<a href=\"#\" onclick=\"document.snd.t2.value=".$village->unitarray['u2']."; return false;\">(".$village->unitarray['u2'].")</a>";
			}
			else
			{ 
				echo  "<span class=\"none\">(0)</span>";
			}
			?>
		</td>
		
		<td class="large">
			<img class="unit u5" src="img/x.gif" title="帝国骑士" alt="帝国骑士">
			<input class="text" <?php if ($village->unitarray['u5'] <= 0) { echo ' disabled="disabled"'; } ?> name="t5" value="" maxlength="6" type="text">
			<?php 
			if ($village->unitarray['u5'] > 0)
			{
				echo "<a href=\"#\" onclick=\"document.snd.t5.value=".$village->unitarray['u5']."; return false;\">(".$village->unitarray['u5'].")</a>";
			}
			else
			{ 
				echo  "<span class=\"none\">(0)</span>";
			}
			?>
		</td>
		
		<td class="regular">
			<img class="unit u8" src="img/x.gif" title="火焰投石器" alt="火焰投石器">
			<input class="text" <?php if ($village->unitarray['u8'] <= 0) { echo ' disabled="disabled"'; } ?> name="t8" value="" maxlength="6" type="text">
			<?php 
			if ($village->unitarray['u8'] > 0)
			{
				echo "<a href=\"#\" onclick=\"document.snd.t8.value=".$village->unitarray['u8']."; return false;\">(".$village->unitarray['u8'].")</a>";
			}
			else
			{ 
				echo  "<span class=\"none\">(0)</span>";
			}
			?>
		</td>
		
		<td class="column-last small">
			<img class="unit u10" src="img/x.gif" title="拓荒者" alt="拓荒者">
			<input class="text" <?php if ($village->unitarray['u10'] <= 0) { echo ' disabled="disabled"'; } ?> name="t10" value="" maxlength="6" type="text">
			<?php 
			if ($village->unitarray['u10'] > 0)
			{
				echo "<a href=\"#\" onclick=\"document.snd.t10.value=".$village->unitarray['u10']."; return false;\">(".$village->unitarray['u10'].")</a>";
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
			<img class="unit u3" src="img/x.gif" title="帝国兵" alt="帝国兵">
			<input class="text" <?php if ($village->unitarray['u3'] <= 0) { echo ' disabled="disabled"'; } ?> name="t3" value="" maxlength="6" type="text">
			<?php 
			if ($village->unitarray['u3'] > 0)
			{
				echo "<a href=\"#\" onclick=\"document.snd.t3.value=".$village->unitarray['u3']."; return false;\">(".$village->unitarray['u3'].")</a>";
			}
			else
			{ 
				echo  "<span class=\"none\">(0)</span>";
			}
			?>
		</td>
		
		<td class="line-last large">
			<img class="unit u6" src="img/x.gif" title="将军骑士" alt="将军骑士">
			<input class="text" <?php if ($village->unitarray['u6'] <= 0) { echo ' disabled="disabled"'; } ?> name="t6" value="" maxlength="6" type="text">
			<?php 
			if ($village->unitarray['u6'] > 0)
			{
				echo "<a href=\"#\" onclick=\"document.snd.t6.value=".$village->unitarray['u6']."; return false;\">(".$village->unitarray['u6'].")</a>";
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