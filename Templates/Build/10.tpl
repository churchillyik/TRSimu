<div id="build" class="gid10">
	<a href="#" onClick="return Popup(10,4);" class="build_logo">
		<img class="building g10" src="img/x.gif" alt="仓库" title="仓库" />
	</a>
	<h1>
		仓库 
		<span class="level">等级 <?php echo $village->resarray['f'.$id]; ?></span>
	</h1>
	<p class="build_desc">
		仓库用来存放你村庄的资源，包括木材、泥土、铁块。仓库等级越高，他所能存放的资源也就越多，最高存量80000。
	</p>

	<table cellpadding="1" cellspacing="1" id="build_value">
	<tr>
		<th>当前存储容量：</th>
		<td>
			<b><?php echo $bid10[$village->resarray['f'.$id]]['attri']; ?></b> 单位资源
		</td>
	</tr>
	<?php 
    if (!$building->isMax($village->resarray['f'.$id.'t'], $id))
	{
	?>
	<tr>
		<th>等级 <?php echo $village->resarray['f'.$id] + 1; ?> 的存储容量：</th>
		<td>
			<b><?php echo $bid10[$village->resarray['f'.$id] + 1]['attri']; ?></b> 单位资源
		</td>
	</tr>
	<?php
	}
	?>
	</table>
	
	<?php include("upgrade.tpl"); ?>
</div>