<div id="build" class="gid34">
	<a href="#" onClick="return Popup(34,4);" class="build_logo">
		<img class="building g34" src="img/x.gif" alt="石匠铺" title="石匠铺" />
	</a>
	<h1>
		石匠铺 
		<span class="level">等级 <?php echo $village->resarray['f'.$id]; ?></span>
	</h1>
	<p class="build_desc">
		石匠铺里住着石匠。石匠是砍伐木材和石头的专家。石匠铺的等级越高，村庄里的建筑也就越稳固。
	</p>
	
	<table cellpadding="1" cellspacing="1" id="build_value">
	<tr>
		<th>建筑坚固度加成：</th>
		<td><b><?php echo $bid34[$village->resarray['f'.$id]]['attri']; ?></b>%</td>
	</tr>
	<tr>
		<?php 
		if (!$building->isMax($village->resarray['f'.$id.'t'], $id))
		{
		?>
			<th>下一级（等级 <?php echo $village->resarray['f'.$id] + 1; ?>）的建筑坚固度加成：</th>
			<td><b><?php echo $bid34[$village->resarray['f'.$id] + 1]['attri']; ?></b>%</td>
		<?php
		}
		?>
	</tr>
	</table>
	
	<?php include("upgrade.tpl"); ?>
</div>