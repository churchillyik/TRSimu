<h2>竞技场</h2>
<table class="new_building" cellpadding="1" cellspacing="1">
<tbody>
<tr>
	<td class="desc">
		在竞技场可以训练士兵，增加他们的行军速度。竞技场等级越高，士兵速度越快。每升一级增加10%速度。效果只有在距离30格后生效。
	</td>
	<td rowspan="3" class="bimg">
		<a href="#" onClick="return Popup(14,4);">
			<img class="building g14" src="img/x.gif" alt="竞技场" title="竞技场" />
		</a>
	</td>
</tr>
<tr>
	<?php
	$_GET['bid'] = 14;
	include("availupgrade.tpl");
	?>
</tr>
</tbody>
</table>