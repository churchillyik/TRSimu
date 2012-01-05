<div id="build" class="gid15">
	<a href="#" onClick="return Popup(15,4);" class="build_logo">
		<img class="building g15" src="img/x.gif" alt="中心大楼" title="中心大楼" />
	</a>
	<h1>
		中心大楼
		<span class="level">等级 <?php echo $village->resarray['f'.$id]; ?></span>
	</h1>
	<p class="build_desc">
		这是你村庄内总建筑师的住所。中心大楼的等级越高，其他建筑物及资源田的开发速度越快，最高可缩短50%所需时间。
	</p>
	<table cellpadding="1" cellspacing="1" id="build_value">
	<tr>
		<th>当前建造所需时间：</th>
		<td>
			<b><?php echo $bid15[$village->resarray['f'.$id]]['attri']; ?></b>%
		</td>
	</tr>
	<?php 
	if (!$building->isMax($village->resarray['f'.$id.'t'], $id))
	{
	?>
	<tr>
		<th>等级 <?php echo $village->resarray['f'.$id] + 1; ?> 建造所需时间：</th>
		<td>
			<b><?php echo $bid15[$village->resarray['f'.$id] + 1]['attri']; ?></b>%
		</td>
	</tr>
	<?php
	}
	?>
	</table>
	
	<?php 
	if ($village->resarray['f'.$id] >= 10)
	{
		include("Templates/Build/15_1.tpl");
	}
	include("upgrade.tpl");
	?>
</div>