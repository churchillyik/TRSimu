<div id="build" class="gid7">
	<a href="#" onClick="return Popup(7,4);" class="build_logo">
		<img class="building g7" src="img/x.gif" alt="铸造厂" title="铸造厂" />
	</a>
	<h1>
		铸造厂
		<span class="level">等级 <?php echo $village->resarray['f'.$id]; ?></span>
	</h1>
	<p class="build_desc">
		铸造厂是用来增加钢铁产量的。每升一级能增加5%的钢产量，总共有5级，即最多能增加25%的产量。
	</p>

	<table cellpadding="1" cellspacing="1" id="build_value">
	<tr>
		<th>当前产量提升的百分比：</th>
		<td>
			<b><?php echo $bid7[$village->resarray['f'.$id]]['attri']; ?></b>%
		</td>
	</tr>
	<?php 
	if (!$building->isMax($village->resarray['f'.$id.'t'], $id))
	{
	?>
	<tr>
		<th>等级 <?php echo $village->resarray['f'.$id] + 1; ?> 产量提升的百分比：</th>
		<td>
			<b><?php echo $bid7[$village->resarray['f'.$id] + 1]['attri']; ?></b>%
		</td>
	</tr>
	<?php
	}
	?>
	</table>
	
	<?php include("upgrade.tpl"); ?>
</div>