<table cellpadding="1" cellspacing="1" class="build_details">
<thead>
<tr>
	<td>研发</td>
	<td>行为</td>
</tr>
</thead>
<tbody>
	<?php 
	$fail = $success = 0;
	for ($i = 22; $i <= 29; $i++)
	{
		if ($technology->meetRRequirement($i) && !$technology->getTech($i) && !$technology->isResearch($i, 1))
		{
			echo "<tr>
				<td class=\"desc\">
					<div class=\"tit\">
						<img class=\"unit u".$i."\" src=\"img/x.gif\" alt=\"".$technology->getUnitName($i)."\" title=\"".$technology->getUnitName($i)."\" />
						<a href=\"#\" onClick=\"return Popup(".$i.",1);\">".$technology->getUnitName($i)."</a>
					</div>
					<div class=\"details\">
						<img class=\"r1\" src=\"img/x.gif\" alt=\"木材\" title=\"木材\" />".${'r'.$i}['wood']."|
						<img class=\"r2\" src=\"img/x.gif\" alt=\"粘土\" title=\"粘土\" />".${'r'.$i}['clay']."|
						<img class=\"r3\" src=\"img/x.gif\" alt=\"铁矿\" title=\"铁矿\" />".${'r'.$i}['iron']."|
						<img class=\"r4\" src=\"img/x.gif\" alt=\"粮食\" title=\"粮食\" />".${'r'.$i}['crop']."|
						<img class=\"clock\" src=\"img/x.gif\" alt=\"所需时间\" title=\"所需时间\" />";
			echo $generator->getTimeFormat(round(${'r'.$i}['time'] / SPEED));
			if ($session->userinfo['gold'] >= 3 && $building->getTypeLevel(17) > 1)
			{
				echo "|<a href=\"build.php?gid=17&t=3&r1=".${'r'.$i}['wood']."&r2=".${'r'.$i}['clay']."&r3=".${'r'.$i}['iron']."&r4=".${'r'.$i}['crop']."\" title=\"和电脑商人交易\"><img class=\"npc\" src=\"img/x.gif\" alt=\"和电脑商人交易\" title=\"和电脑商人交易\" /></a>";
			}
			if (${'r'.$i}['wood'] > $village->maxstore || 
				${'r'.$i}['clay'] > $village->maxstore || 
				${'r'.$i}['iron'] > $village->maxstore)
			{
				echo "<br><span class=\"none\">请先升级仓库</span>
					</div>
				</td>";
				echo "
				<td class=\"act\">
					<div class=\"none\">升级<br>仓库</div>
				</td>
				</tr>";
			}
			else if (${'r'.$i}['crop'] > $village->maxcrop)
			{
				echo "<br><span class=\"none\">请先升级粮仓</span>
					</div>
				</td>";
				echo "
				<td class=\"act\">
					<div class=\"none\">升级<br>粮仓</div>
				</td>
				</tr>";
			}
			else if (${'r'.$i}['wood'] > $village->awood || 
					${'r'.$i}['clay'] > $village->aclay || 
					${'r'.$i}['iron'] > $village->airon || 
					${'r'.$i}['crop'] > $village->acrop)
			{
				$time = $technology->calculateAvaliable($i);
				echo "<br><span class=\"none\">充足资源要等到 ".$time[0]." ".$time[1]."</span>
					</div>
				</td>";
				echo "
				<td class=\"act\">
					<div class=\"none\">资源<br>不足</div>
				</td>
				</tr>";
			}
			else
			{
				echo "</td>";
				echo "
				<td class=\"act\">
					<a class=\"research\" href=\"build.php?id=$id&amp;a=$i&amp;c=".$session->mchecker."\">研发</a>
				</td>
				</tr>";
			}
			$success += 1;
		}
		else
		{
			$fail += 1;
		}
	}
	if ($success == 0)
	{
		echo "<td colspan=\"2\"><div class=\"none\" align=\"center\">还无法研发任何科技。</div></td>";
	}
	?>
</tbody>
</table>

<?php
if ($fail > 0)
{
	echo "<p class=\"switch\">
		<a id=\"researchFutureLink\" href=\"#\" onclick=\"return $('researchFuture').toggle();\">显示更多</a>
		</p>
		<table id=\"researchFuture\" class=\"build_details hide\" cellspacing=\"1\" cellpadding=\"1\">
		<thead>
		<tr>
			<td colspan=\"2\">开发要求</td>
		</tr>
		<tbody>";
	if (!$technology->meetRRequirement(22) && !$technology->getTech(22))
	{
		echo "<tr>
		<td class=\"desc\">
		<div class=\"tit\">
			<img class=\"unit u22\" title=\"剑士\" alt=\"剑士\" src=\"img/x.gif\"/>
			<a onclick=\"return Popup(22, 1);\" href=\"#\">剑士</a>
		</div>
		</td>
		<td class=\"cond\">
			<a href=\"#\" onclick=\"return Popup(22, 4);\">研发所</a>
			<span title=\"+2\">等级 3</span>
			<br />
			<a href=\"#\" onclick=\"return Popup(12, 4);\">铁匠铺</a>
			<span title=\"+1\">等级 1</span>
		</td>
		</tr>";
	}
	if (!$technology->meetRRequirement(23) && !$technology->getTech(23))
	{
		echo "<tr>
		<td class=\"desc\">
			<div class=\"tit\">
				<img class=\"unit u23\" title=\"探路者\" alt=\"探路者\" src=\"img/x.gif\"/>
				<a onclick=\"return Popup(23, 1);\" href=\"#\">探路者</a>
			</div>
		</td>
		<td class=\"cond\">
			<a href=\"#\" onclick=\"return Popup(22, 4);\">研发所</a>
			<span title=\"+2\">等级 5</span>
			<br />
			<a href=\"#\" onclick=\"return Popup(20, 4);\">马厩</a>
			<span title=\"+1\">等级 1</span>
		</td>
		</tr>";
	}
	if (!$technology->meetRRequirement(24) && !$technology->getTech(24))
	{
		echo "<tr>
		<td class=\"desc\">
			<div class=\"tit\">
				<img class=\"unit u24\" title=\"雷法师\" alt=\"雷法师\" src=\"img/x.gif\"/>
				<a onclick=\"return Popup(24, 1);\" href=\"#\">雷法师</a>
			</div>
		</td>
		<td class=\"cond\">
			<a href=\"#\" onclick=\"return Popup(22, 4);\">研发所</a>
			<span title=\"+2\">等级 5</span>
			<br />
			<a href=\"#\" onclick=\"return Popup(20, 4);\">马厩</a>
			<span title=\"+3\">等级 3</span>
		</td>
		</tr>";
	}
	if (!$technology->meetRRequirement(25) && !$technology->getTech(25))
	{
		echo "<tr>
		<td class=\"desc\">
			<div class=\"tit\">
				<img class=\"unit u25\" title=\"德鲁伊骑兵\" alt=\"德鲁伊骑兵\" src=\"img/x.gif\"/>
				<a onclick=\"return Popup(25, 1);\" href=\"#\">德鲁伊骑兵</a>
			</div>
		</td>
		<td class=\"cond\">
			<a href=\"#\" onclick=\"return Popup(22, 4);\">研发所</a>
			<span title=\"+2\">等级 5</span>
			<br />
			<a href=\"#\" onclick=\"return Popup(20, 4);\">马厩</a>
			<span title=\"+5\">等级 5</span>
		</td>
		</tr>";
	}
	if (!$technology->meetRRequirement(26) && !$technology->getTech(26))
	{
		echo "<tr>
		<td class=\"desc\">
			<div class=\"tit\">
				<img class=\"unit u26\" title=\"海顿圣骑士\" alt=\"海顿圣骑士\" src=\"img/x.gif\"/>
				<a onclick=\"return Popup(26, 1);\" href=\"#\">海顿圣骑士</a>
			</div>
		</td>
		<td class=\"cond\">
			<a href=\"#\" onclick=\"return Popup(22, 4);\">研发所</a>
			<span title=\"+12\">等级 15</span>
			<br />
			<a href=\"#\" onclick=\"return Popup(20, 4);\">马厩</a>
			<span title=\"+10\">等级 10</span>
		</td>
		</tr>";
	}
	if (!$technology->meetRRequirement(27) && !$technology->getTech(27))
	{
		echo "<tr>
		<td class=\"desc\">
			<div class=\"tit\">
				<img class=\"unit u27\" title=\"冲撞车\" alt=\"冲撞车\" src=\"img/x.gif\"/>
				<a onclick=\"return Popup(27, 1);\" href=\"#\">冲撞车</a>
			</div>
		</td>
		<td class=\"cond\">
			<a href=\"#\" onclick=\"return Popup(22, 4);\">研发所</a>
			<span title=\"+7\">等级 10</span>
			<br />
			<a href=\"#\" onclick=\"return Popup(21, 4);\">工场</a>
			<span title=\"+1\">等级 1</span>
		</td>
		</tr>";
	}
	if (!$technology->meetRRequirement(28) && !$technology->getTech(28))
	{
		echo "<tr>
		<td class=\"desc\">
			<div class=\"tit\">
				<img class=\"unit u28\" title=\"投石车\" alt=\"投石车\" src=\"img/x.gif\"/>
				<a onclick=\"return Popup(28, 1);\" href=\"#\">投石车</a>
			</div>
		</td>
		<td class=\"cond\">
			<a href=\"#\" onclick=\"return Popup(21, 4);\">工场</a>
			<span title=\"+10\">等级 10</span>
			<br />
			<a href=\"#\" onclick=\"return Popup(22, 4);\">研发所</a>
			<span title=\"+12\">等级 15</span>
		</td>
		</tr>";
	}
	if (!$technology->meetRRequirement(29) && !$technology->getTech(29))
	{
		echo "<tr>
		<td class=\"desc\">
			<div class=\"tit\">
				<img class=\"unit u29\" title=\"首领\" alt=\"首领\" src=\"img/x.gif\"/>
				<a onclick=\"return Popup(29, 1);\" href=\"#\">首领</a>
			</div>
		</td>
		<td class=\"cond\">
			<a href=\"#\" onclick=\"return Popup(14, 4);\">集结点</a>
			<span title=\"+9\">等级 10</span>
			<br />
			<a href=\"#\" onclick=\"return Popup(22, 4);\">研发所</a>
			<span title=\"+17\">等级 20</span>
		</td>
		</tr>";
	}
	echo " <script type=\"text/javascript\">
	//<![CDATA[
		$(\"researchFuture\").toggle = (function()
		{
			this.toggleClass(\"hide\");
			$(\"researchFutureLink\").set(\"text\",
				this.hasClass(\"hide\")
				? \"显示更多\"
				: \"隐藏更多\"
			);
			return false;
		}).bind($(\"researchFuture\"));
	//]]>
	</script>";
	echo "</tbody>
		</table>";
}
$acares = $technology->grabAcademyRes();
if (count($acares) > 0)
{
	echo "<table cellpadding=\"1\" cellspacing=\"1\" class=\"under_progress\">
		<thead>
		<tr>
			<td>研发中</td>
			<td>所需时间</td>
			<td>研发完成</td>
		</tr>
		</thead>
		<tbody>";
	$timer = 1;
	foreach ($acares as $aca)
	{
		$unit = substr($aca['tech'], 1, 2);
		echo "<tr>
			<td class=\"desc\">
				<img class=\"unit u$unit\" src=\"img/x.gif\" alt=\"".$technology->getUnitName($unit)."\" title=\"".$technology->getUnitName($unit)."\" />".$technology->getUnitName($unit)."
			</td>";
		echo "<td class=\"dur\">
				<span id=\"timer$timer\">".$generator->getTimeFormat($aca['timestamp'] - time())."</span>
			</td>";
		$date = $generator->procMtime($aca['timestamp']);
		echo "<td class=\"fin\">
				<span>".$date[1]."</span>
				<span> 小时</span>
			</td>";
		echo "</tr>";
		$timer += 1;
	}
	echo "</tbody>
		</table>";
}
?>