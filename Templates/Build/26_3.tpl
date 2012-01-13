<div id="build" class="gid26">
	<a href="#" onClick="return Popup(26, 4, 'gid');" class="build_logo">
		<img class="building g26" src="img/x.gif" alt="皇宫" title="皇宫" />
	</a>
	<h1>
		皇宫 
		<span class="level">等级 <?php echo $village->resarray['f'.$id]; ?></span>
	</h1>
	<p class="build_desc">
		皇宫里住着你城邦的国王。皇宫达到10级时候，你可以将它所在村庄变成主村。主村不能被征服。
	</p>

	<?php include("26_menu.tpl"); ?>

	<p>
		通过参议员、执政官，还有首领的游说，可以令敌方村民的忠诚度降低。当忠诚度降至0的时候，就可以让敌方村民归顺于你。目前该村村民的忠诚度是 
		<b><?php echo $database->getVillageField($village->wid, 'loyalty'); ?></b>%。
	</p>
</div>