<div id="build" class="gid11">
	<a href="#" onClick="return Popup(11,4);" class="build_logo">
		<img class="building g11" src="img/x.gif" alt="粮仓" title="粮仓" />
	</a>
	<h1>
		粮仓 
		<span class="level">等级 <?php echo $village->resarray['f'.$id]; ?></span>
	</h1>
	<p class="build_desc">
		粮仓用来存放你所生产的粮食。粮仓的等级越高，它可以存放的粮食便会越多。当粮仓到达最高等级20的时候，若还有需要，可以再加建一间新的粮仓。
	</p>

	<table cellpadding="1" cellspacing="1" id="build_value">
	<tr>
		<th>当前存储容量：</th>
		<td>
			<b><?php echo $bid11[$village->resarray['f'.$id]]['attri']; ?></b> 单位资源
		</td>
	</tr>
	<?php 
	if (!$building->isMax($village->resarray['f'.$id.'t'], $id))
	{
	?>
	<tr>
		<th>等级 <?php echo $village->resarray['f'.$id] + 1; ?> 的存储容量：</th>
		<td>
			<b><?php echo $bid11[$village->resarray['f'.$id] + 1]['attri']; ?></b> 单位资源
		</td>
	</tr>
	<?php
	}
	?>
	</table>
	
	<?php include("upgrade.tpl"); ?>
</div>