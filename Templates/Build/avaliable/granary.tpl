<h2>粮仓</h2>
<table class="new_building" cellpadding="1" cellspacing="1">
<tbody>
<tr>
	<td class="desc">
		粮仓用来存放你所生产的粮食。粮仓的等级越高，它可以存放的粮食便会越多。 当粮仓到达最高等级20的时候，若还有需要，可以再加建一间新的粮仓。
	</td>
	<td rowspan="3" class="bimg">
		<a href="#" onClick="return Popup(11,4);">
		<img class="building g11" src="img/x.gif" alt="粮仓" title="粮仓" /></a>
	</td>
</tr>
<tr>
	<?php
	$_GET['bid'] = 11;
	include("availupgrade.tpl");
	?>
</tr>
</tbody>
</table>