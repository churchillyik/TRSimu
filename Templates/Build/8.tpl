<div id="build" class="gid8">
	<a href="#" onClick="return Popup(8,4);" class="build_logo">
		<img class="building g8" src="img/x.gif" alt="磨坊" title="磨坊" />
	</a>
	<h1>
		磨坊
		<span class="level">等级 <?php echo $village->resarray['f'.$id]; ?></span>
	</h1>
	<p class="build_desc">
		磨坊是生产面粉的地方。每升一级能增加5%的面粉产量，总共有5级，即最多能增加25%的产量。
	</p>

	<table cellpadding="1" cellspacing="1" id="build_value">
	<tr>
		<th>当前产量提升的百分比：</th>
		<td>
			<b><?php echo $bid8[$village->resarray['f'.$id]]['attri']; ?></b>%
		</td>
	</tr>
	<?php 
	if (!$building->isMax($village->resarray['f'.$id.'t'], $id))
	{
	?>
	<tr>
		<th>等级 <?php echo $village->resarray['f'.$id] + 1; ?> 产量提升的百分比：</th>
		<td>
			<b><?php echo $bid8[$village->resarray['f'.$id] + 1]['attri']; ?></b>%
		</td>
	</tr>
	<?php
	}
	?>
	</table>
	
	<?php include("upgrade.tpl"); ?>
</div>