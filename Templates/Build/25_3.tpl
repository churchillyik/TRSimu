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

	<?php include("25_menu.tpl"); ?>
	
	<p>
		通过参议员、执政官，还有首领的游说，可以令敌方村民的忠诚度降低。当忠诚度降至0的时候，就可以让敌方村民归顺于你。目前该村村民的忠诚度是
		<b><?php echo $database->getVillageField($village->wid, 'loyalty'); ?></b>%。
	</p>
</div>