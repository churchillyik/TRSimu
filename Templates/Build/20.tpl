<div id="build" class="gid20">
	<a href="#" onClick="return Popup(20,4);" class="build_logo">
		<img class="building g20" src="img/x.gif" alt="马厩" title="马厩" />
	</a>

	<h1>
		马厩 
		<span class="level">等级 <?php echo $village->resarray['f'.$id]; ?></span>
	</h1>
	<p class="build_desc">
		马厩是一个训练骑兵的场所，每一名强悍的骑兵都经由马厩训练出来的。马厩等级越高，训练骑兵的速度便越快。
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
			<?php include("20_".$session->tribe.".tpl"); ?>
		</tbody>
		</table>
		
		<p>
			<input type="image" id="btn_train" class="dynamic_img" value="ok" name="s1" src="img/x.gif" alt="训练" />
		</p>
	</form>
	
	<?php
    $trainlist = $technology->getTrainingList(2);
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