<h2>磨坊</h2>
<table class="new_building" cellpadding="1" cellspacing="1">
<tbody>
<tr>
	<td class="desc">
		磨坊是生产面粉的地方。每升一级能增加5%的面粉产量，总共有5级，即最多能增加25%的产量。
	</td>
	<td rowspan="3" class="bimg">
		<a href="#" onClick="return Popup(8,4);">
			<img class="building g8" src="img/x.gif" alt="磨坊" title="磨坊" />
		</a>
	</td>
</tr>
<tr>
	<?php
	$_GET['bid'] = 8;
	include("availupgrade.tpl");
	?>
</tr>
</tbody>
</table>