<div id="build" class="gid14">
	<a href="#" onClick="return Popup(14,4);" class="build_logo">
		<img class="building g14" src="img/x.gif" alt="竞技场" title="竞技场" />
	</a>
	<h1>
		竞技场
		<span class="level">Level <?php echo $village->resarray['f'.$id]; ?></span>
	</h1>
	<p class="build_desc">
		在竞技场可以训练士兵，增加他们的行军速度。竞技场等级越高，士兵速度越快。每升一级增加10%速度。效果只有在距离30格后生效。
	</p>
	<table cellpadding="1" cellspacing="1" id="build_value">
	<tr>
		<th>当前行军速度提升：</th>
		<td><b><?php echo $bid14[$village->resarray['f'.$id]]['attri']; ?></b>%</td>
	</tr>
	
	<?php 
	if (!$building->isMax($village->resarray['f'.$id.'t'],$id))
	{
	?>
	<tr>
		<th>等级 <?php echo $village->resarray['f'.$id] + 1; ?> 的行军速度提升：</th>
		<td><b><?php echo $bid14[$village->resarray['f'.$id] + 1]['attri']; ?></b>%</td>
	</tr>
	<?php
	}
	?>
	</table>
	
	<?php include("upgrade.tpl"); ?>
</div>