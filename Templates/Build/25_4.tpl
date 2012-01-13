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

	<table cellpadding="1" cellspacing="1" id="expansion">
	<thead>
	<tr>
		<th colspan="6"><a name="h2"></a>从该村开始建立一座新的村庄或者占领一座村庄</th>
	</tr>
	<tr>
		<td colspan="2">村庄</td>
		<td>玩家</td>
		<td>居民</td>
		<td>坐标</td>
		<td>日期</td>
	</tr>
	</thead>
	<tbody>
		<?php
		$slot1 = $database->getVillageField($village->wid, 'exp1');
		$slot2 = $database->getVillageField($village->wid, 'exp2');
		$slot3 = $database->getVillageField($village->wid, 'exp3');
		$data = $database->getProfileVillages($session->uid);

		if ($slot1 != 0)
		{
			$total = 1;
		}
		if ($slot2 != 0)
		{
			$total += 1;
		}
		if ($slot3 != 0)
		{
			$total += 1;
		}
		if ($total >= 1)
		{
			for($i = 1; $i <= $total; $i++)
			{
				$coor = $database->getCoor($data[$i]['wref']);
				$owner = $database->getVillageField($data[$i]['wref'], 'owner');
				$ownername = $database->getUserField($owner, 'username', 0);
				echo '
				<tr>
					<td class="ra">'.$i.'.</td>
					<td class="vil"><a href="karte.php?d='.$data[$i]['wref'].'&c='.$generator->getMapCheck($data[$i]['wref']).'">'.$data[$i]['name'].'</a></td>
					<td class="pla"><a href="spieler.php?uid='.$owner.'">'.$ownername.'</a></td>
					<td class="ha">'.$data[$i]['pop'].'</td>
					<td class="aligned_coords">
						<div class="cox">('.$coor['x'].'</div>
						<div class="pi">|</div>
						<div class="coy">'.$coor['y'].')</div>
					</td>
					<td class="dat">'.date('d-m-Y', $data[$i]['created']).'</td>
				</tr>';
			}
		}
		else
		{
			echo '<tr>
					<td colspan="6" class="none">这个村庄还没有兴建新的村落或者占领了其他村庄。</td>
				</tr>';
		}
		?>
	</tbody>
	</table>
</div>