<div id="build" class="gid22">
	<a href="#" onClick="return Popup(22,4);" class="build_logo">
		<img class="building g22" src="img/x.gif" alt="研发所" title="研发所" />
	</a>
	<h1>
		研发所 
		<span class="level">等级 <?php echo $village->resarray['f'.$id]; ?></span>
	</h1>
	<p class="build_desc">
		研发所是用来研究新的兵种。研发所等级越高，越高级的兵种就可以被开发。兵种研发完成后，才可以在该村庄内生产该兵种。
	</p>
	<?php
	include("22_".$session->tribe.".tpl");
	include("upgrade.tpl");
	?>
</div>