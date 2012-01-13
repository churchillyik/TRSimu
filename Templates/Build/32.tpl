<div id="build" class="gid32">
	<a href="#" onClick="return Popup(32,4);" class="build_logo">
		<img class="building g32" src="img/x.gif" alt="日耳曼城墙" title="日耳曼城墙" />
	</a>
	<h1>
		日耳曼城墙 
		<span class="level">等级 <?php echo $village->resarray['f'.$id]; ?></span>
	</h1>
	<p class="build_desc">
		为村落提供防御力，保护村民抵挡外来的攻击。城墙等级越高，越能够有效地防御入侵的敌方部队。
	</p>

	<table cellpadding="1" cellspacing="1" id="build_value">
	<tr>
		<th>防御加成：</th>
		<td><b><?php echo $bid32[$village->resarray['f'.$id]]['attri']; ?></b>%</td>
	</tr>
	<tr>
		<?php 
		if (!$building->isMax($village->resarray['f'.$id.'t'], $id))
		{
		?>
			<th>下一级（等级 <?php echo $village->resarray['f'.$id] + 1; ?>）的防御加成：</th>
			<td><b><?php echo $bid32[$village->resarray['f'.$id] + 1]['attri']; ?></b>%</td>
		<?php
		}
		?>
	</tr>
	</table>
	
	<?php include("upgrade.tpl"); ?>
</div>