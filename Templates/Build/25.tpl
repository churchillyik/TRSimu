<div id="build" class="gid25">
	<h1>
		行宫 
		<span class="level">等级 <?php echo $village->resarray['f'.$id]; ?></span>
	</h1>
	<p class="build_desc">
		<a href="#" onClick="return Popup(25, 4, 'gid');" class="build_logo">
			<img class="building g25" src="img/x.gif" alt="行宫" title="行宫" />
		</a>
		行宫是一个比较小规模的皇宫，给国王或皇后出游时居住的。为村庄提供防御力，效果比皇宫小。当村庄内有行宫或皇宫，直至行宫或皇宫被投石器完全毀灭之前那座村庄都不能被敌军完全攻占。
	</p>

	<?php
	include("25_menu.tpl");
	if ($village->resarray['f'.$id] >= 10)
	{
		include("25_train.tpl");
	}
	else
	{
		echo '<div class="c">
			当行宫升级到等级10和20时，可以训练三名拓荒者/拓荒者/拓荒者或一名执政官/首领/参议员，用以开拓或征服一座新的村庄。
			</div>';
	}
	?>
	
	<p class="none">这是你的主村</p>

	<?php include("upgrade.tpl"); ?>
</div>