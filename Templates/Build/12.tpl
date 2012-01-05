<div id="build" class="gid12">
	<a href="#" onClick="return Popup(12,4);" class="build_logo">
		<img class="building g12" src="img/x.gif" alt="铁匠铺" title="铁匠铺" />
	</a>
	<h1>
		铁匠铺
		<span class="level">等级 <?php echo $village->resarray['f'.$id]; ?></span>
	</h1>
	<p class="build_desc">
		铁匠铺是用来制造及改良你部队武器的地方，藉以增加部队的攻击力。铁匠铺等级越高，能升级的攻击力就越高。
	</p>
	<?php
	include("12_".$session->tribe.".tpl");
	include("upgrade.tpl");
	?>
</div>