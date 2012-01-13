<div id="build" class="gid24">
	<a href="#" onClick="return Popup(24,4);" class="build_logo">
		<img class="building g24" src="img/x.gif" alt="市政厅" title="市政厅" />
	</a>
	<h1>
	市政厅 
	<span class="level">等级 <?php echo $village->resarray['f'.$id]; ?></span>
	</h1>
	<p class="build_desc">
		在市政厅可以给举办各种活动，以此来增加文明度，等级越高，活动所需时间越短。
	</p>
	<?php 
	include("24_1.tpl");
	include("24_2.tpl");
	include("upgrade.tpl");
	?>
</div>