<h2>砖块厂</h2>
<table class="new_building" cellpadding="1" cellspacing="1">
<tbody>
<tr>
	<td class="desc">砖块厂是生产砖块的地方。每升一级能增加5%的砖块产量，总共有5级，即最多能增加25%的产量。</td>
	<td rowspan="3" class="bimg">
		<a href="#" onClick="return Popup(6,4);">
		<img class="building g6" src="img/x.gif" alt="砖块厂" title="砖块厂" /></a>
	</td>
</tr>
<tr>
	<?php
	$_GET['bid'] = 6;
	include("availupgrade.tpl");
	?>
</tr>
</tbody>
</table>