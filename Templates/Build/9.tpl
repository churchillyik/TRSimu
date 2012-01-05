<div id="build" class="gid9">
	<a href="#" onClick="return Popup(9,4);" class="build_logo">
		<img class="building g9" src="img/x.gif" alt="面包房" title="面包房" />
	</a>
	<h1>
		面包房
		<span class="level">等级 <?php echo $village->resarray['f'.$id]; ?></span>
	</h1>
	<p class="build_desc">
		面包房将磨坊生产的面粉烤成面包。与磨坊一起最高可提升50%的粮食产量。
	</p>

	<table cellpadding="1" cellspacing="1" id="build_value">
	<tr>
		<th>当前产量提升的百分比：</th>
		<td>
			<b><?php echo $bid9[$village->resarray['f'.$id]]['attri']; ?></b>%
		</td>
	</tr>
	<?php 
	if (!$building->isMax($village->resarray['f'.$id.'t'], $id))
	{
	?>
	<tr>
		<th>等级 <?php echo $village->resarray['f'.$id] + 1; ?> 产量提升的百分比：</th>
		<td>
			<b><?php echo $bid9[$village->resarray['f'.$id] + 1]['attri']; ?></b>%
		</td>
	</tr>
	<?php
	}
	?>
	</table>
	
	<?php include("upgrade.tpl"); ?>
</div>