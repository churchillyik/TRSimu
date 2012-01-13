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
		如果你要扩张你的城邦，就需要文明度。这个数值会随着时间自动增加。建筑的等级越高增加的速度越快。
	</p>

	<table cellpadding="1" cellspacing="1" id="build_value">
	<tr>
		<th>这个村庄的生产力：</th>
		<td>
			<b><?php echo $database->getVillageField($village->wid, 'cp'); ?></b> 文明度/天
		</td>
	</tr>
	<tr>
		<th>所有村庄的生产力：</th>
		<td>
			<b><?php echo $database->getVSumField($session->uid, 'cp'); ?></b> 文明度/天
		</td>
	</tr>
	</table>
	
	<p>
		你的村庄现在一共有 <b><?php echo $database->getUserField($session->uid, 'cp',0); ?></b> 的文明度。如果你需要兴建或者占领一座村庄的话，你需要 
		<b>
		<?php 
		$mode = CP;
		$total = count($database->getProfileVillages($session->uid));
		echo ${'cp'.$mode}[$total];
		?>
		</b> 的文明度。
	</p>
</div>