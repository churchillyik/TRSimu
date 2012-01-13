<div id="build" class="gid21">
	<a href="#" onClick="return Popup(21,4, 'gid');" class="build_logo">
		<img class="building g21" src="img/x.gif" alt="工场" title="工场" />
	</a>
	<h1>
		工场 
		<span class="level">等级 <?php echo $village->resarray['f'.$id]; ?></span>
	</h1>
	<p class="build_desc">
		工场是生产冲撞车和投石器的地方。工场等级越高，生产速度越快。
	</p>

	<form method="POST" name="snd" action="build.php">
		<input type="hidden" name="id" value="<?php echo $id; ?>" />
		<input type="hidden" name="ft" value="t1" />
		
		<table cellpadding="1" cellspacing="1" class="build_details">
		<thead>
		<tr>
			<td>兵种</td>
			<td>数量</td>
			<td>最多</td>
		</tr>
		</thead>
		<tbody>
			<?php 
			$success = 0;
			$start = ($session->tribe == 1)? 7 : (($session->tribe == 2)? 17 : 27);
			for ($i = $start; $i <= $start + 1; $i++)
			{
				if ($technology->getTech($i))
				{
					echo "<tr>
						<td class=\"desc\">
							<div class=\"tit\">
								<img class=\"unit u$i\" src=\"img/x.gif\" alt=\"".$technology->getUnitName($i)."\" title=\"".$technology->getUnitName($i)."\" />
								<a href=\"#\" onClick=\"return Popup($i,1);\">".$technology->getUnitName($i)."</a>
								<span class=\"info\">(Avaliable: ".$village->unitarray['u'.$i].")</span>
							</div>";
					echo "
							<div class=\"details\">
								<img class=\"r1\" src=\"img/x.gif\" alt=\"木材\" title=\"木材\" />".${'u'.$i}['wood']."|
								<img class=\"r2\" src=\"img/x.gif\" alt=\"粘土\" title=\"粘土\" />".${'u'.$i}['clay']."|
								<img class=\"r3\" src=\"img/x.gif\" alt=\"铁矿\" title=\"铁矿\" />".${'u'.$i}['iron']."|
								<img class=\"r4\" src=\"img/x.gif\" alt=\"粮食\" title=\"粮食\" />".${'u'.$i}['crop']."|
								<img class=\"r5\" src=\"img/x.gif\" alt=\"粮食消耗\" title=\"粮食消耗\" />".${'u'.$i}['pop']."|
								<img class=\"clock\" src=\"img/x.gif\" alt=\"训练时间\" title=\"训练时间\" />";
					echo $generator->getTimeFormat(round(${'u'.$i}['time'] * ($bid21[$village->resarray['f'.$id]]['attri'] / 100) / SPEED));
					echo "</div>
						</td>
						<td class=\"val\">
							<input type=\"text\" class=\"text\" name=\"t$i\" value=\"0\" maxlength=\"$i\">
						</td>
						<td class=\"max\">
							<a href=\"#\" onClick=\"document.snd.t$i.value=".$technology->maxUnit($i)."; return false;\">(".$technology->maxUnit($i).")</a>
						</td>
					</tr>";
					$success += 1;
				}
			}
			if ($success == 0)
			{
				echo "<tr>
					<td colspan=\"3\">
						<div class=\"none\" align=\"center\">目前还不能生产任何单位，请先在研发所中研发。</div>
					</td>
					</tr>";
			}
			?>
		</tbody>
		</table>
		
		<p>
			<input type="image" id="btn_train" class="dynamic_img" value="ok" name="s1" src="img/x.gif" alt="训练" />
		</p>
	</form>
	
	<?php
    $trainlist = $technology->getTrainingList(3);
    if (count($trainlist) > 0)
	{
		$timer = 2 * count($trainlist);
    	echo "
		<table cellpadding=\"1\" cellspacing=\"1\" class=\"under_progress\">
		<thead>
		<tr>
			<td>训练中的单位</td>
			<td>所需时间</td>
			<td>结束于</td>
		</tr>
		</thead>
		<tbody>";
        foreach ($trainlist as $train)
		{
			echo "<tr>
				<td class=\"desc\">";
			echo "<img class=\"unit u".$train['unit']."\" src=\"img/x.gif\" alt=\"".$train['name']."\" title=\"".$train['name']."\" />".$train['amt']." ".$train['name']."
				</td>
				<td class=\"dur\">
					<span id=timer".$timer.">".$generator->getTimeFormat($train['commence'] + $train['eachtime'] * $train['amt'] - time())."</span>
				</td>
				<td class=\"fin\">";
			$timer -= 1;
			$time = $generator->procMTime($train['commence'] + $train['eachtime'] * $train['amt']);
			echo "于 <span>";
			if ($time[0] != "today")
			{
				echo $time[0]." ";
			}
			echo $time[1]."</span>
				</td>
			</tr>
			<tr class=\"next\">
				<td colspan=\"3\">
					下一个单位将在
					<span id=timer".$timer.">".$generator->getTimeFormat($train['commence'] + $train['eachtime'] - time())."</span>
					完成
				</td>
			</tr>";
        }
        echo "</tbody>
			</table>";
    }
	
	include("upgrade.tpl");
    ?>
</div>