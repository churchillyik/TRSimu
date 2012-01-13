<div id="build" class="gid27">
	<a href="#" onClick="return Popup(27,4);" class="build_logo">
		<img class="building g27" src="img/x.gif" alt="宝库" title="宝库" />
	</a>
	<h1>
	宝库 
	<span class="level">等级 <?php echo $village->resarray['f'.$id]; ?></span>
	</h1>
	<p class="build_desc">
		你国家的财富都藏匿在宝库中，每一个宝库都可以收藏一个宝物。此外，被占领的神器在24小时之后才能发挥作用。
	</p>
	
	<?php include("upgrade.tpl"); ?>
</div>