<div id="build" class="gid23">
	<a href="#" onClick="return Popup(23,4);" class="build_logo">
		<img class="building g23" src="img/x.gif" alt="山洞" title="山洞" />
	</a>
	<h1>
		山洞 
		<span class="level">等级 <?php echo $village->resarray['f'.$id]; ?></span>
	</h1>
	<p class="build_desc">
		当有敌人来攻击时，山洞可以帮你隐藏部分资源以免被掠走。
	</p>

	<table cellpadding="1" cellspacing="1" id="build_value">
	<tr>
		<th>当前可隐藏的资源量：</th>
		<td>
			<b><?php echo $bid23[$village->resarray['f'.$id]]['attri']; ?></b> 单位
		</td>
	</tr>
	<tr>
		<?php 
        if (!$building->isMax($village->resarray['f'.$id.'t'], $id))
		{
        ?>
		<th>下一级（<?php echo $village->resarray['f'.$id] + 1; ?>级）可隐藏的资源量：</th>
		<td>
			<b><?php echo $bid23[$village->resarray['f'.$id] + 1]['attri']; ?></b> 单位
		</td>
        <?php
		}
		?>
	</tr>
	</table>
	
	<?php include("upgrade.tpl"); ?>
</div>