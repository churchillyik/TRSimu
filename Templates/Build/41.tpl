<div id="build" class="gid41">
	<a href="#" onClick="return Popup(41,4);" class="build_logo">
		<img class="building g41" src="img/x.gif" alt="饮马槽" title="饮马槽" />
	</a>
	<h1>
		饮马槽 
		<span class="level">等级 <?php echo $village->resarray['f'.$id]; ?></span>
	</h1>
	<p class="build_desc">
		饮马槽可以减少骑兵的训练时间和粮食消耗。每升一级减少1%的骑兵训练时间。
	</p>

	<?php include("upgrade.tpl"); ?>
</div>