<div id="build" class="gid35">
	<a href="#" onClick="return Popup(35,4);" class="build_logo">
		<img class="building g35" src="img/x.gif" alt="酿酒厂" title="酿酒厂" />
	</a>
	<h1>
		酿酒厂 
		<span class="level">等级 <?php echo $village->resarray['f'.$id]; ?></span>
	</h1>
	<p class="build_desc">
		酿酒厂是给你的村民们酿制鲜醇美酒的地方。在酒节的时候，士兵的战斗力会增加(每级1%)，但是首领的说服力会下降到原来的一般，你的投石车只能随机攻打目标。酿酒厂只能建造在主村中。
	</p>

	<table cellpadding="1" cellspacing="1" id="build_value">
	<tr>
		<th>攻击加成：</th>
		<td><b><?php echo $bid35[$village->resarray['f'.$id]]['attri']; ?></b>%</td>
	</tr>
	<tr>
		<?php 
		if (!$building->isMax($village->resarray['f'.$id.'t'], $id))
		{
		?>
			<th>下一级（等级 <?php echo $village->resarray['f'.$id] + 1; ?>）的攻击加成：</th>
			<td><b><?php echo $bid35[$village->resarray['f'.$id] + 1]['attri']; ?></b>%</td>
		<?php
		}
		?>
	</tr>
	</table>
	
	<?php include("upgrade.tpl"); ?>
</div>