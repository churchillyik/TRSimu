<div id="build" class="gid28">
	<a href="#" onClick="return Popup(28,4);" class="build_logo">
		<img class="building g28" src="img/x.gif" alt="交易所" title="交易所" />
	</a>
	<h1>
	交易所 
	<span class="level">等级 <?php echo $village->resarray['f'.$id]; ?></span>
	</h1>
	<p class="build_desc">
		在交易所内，你可以为你的商人提供更好的马匹， 令他们改善交易的效率。交易所等级越高， 商人的运载量便越大。
	</p>

	<table cellpadding="1" cellspacing="1" id="build_value">
	<tr>
		<th>当前运载量：</th>
		<td><b><?php echo $bid28[$village->resarray['f'.$id]]['attri']; ?></b>%</td>
	</tr>
	<tr>
		<?php 
		if (!$building->isMax($village->resarray['f'.$id.'t'], $id))
		{
		?>
			<th>下一级（等级 <?php echo $village->resarray['f'.$id] + 1; ?>）的运载量：</th>
			<td><b><?php echo $bid28[$village->resarray['f'.$id] + 1]['attri']; ?></b>%</td>
		<?php
		}
		?>
	</tr>
	</table>
	
	<?php include("upgrade.tpl"); ?>
</div>