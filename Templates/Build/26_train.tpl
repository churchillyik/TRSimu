<?php
$query = mysql_query('SELECT * FROM `' . TB_PREFIX . 'units` WHERE `vref` = ' . $village->wid);
$data = mysql_fetch_assoc($query);
$max_settlers = $building->getTypeLevel(26) * 3 / 10;
if ($building->getTypeLevel(26) == 15)
{
	$max_settlers += 1;
}
else if($building->getTypeLevel(26) == 20)
{
	$max_settlers += 3;
}
$query2 = mysql_query('SELECT * FROM `' . TB_PREFIX . 'vdata` WHERE `wref` = ' . $village->wid);
$data2 = mysql_fetch_assoc($query2);
$exp_c = 0;

if ($data2['exp1'] != 0)
{
	++$exp_c;
}
if ($data2['exp2'] != 0)
{
	++$exp_c;
}
if ($data2['exp3'] != 0)
{
	++$exp_c;
}
$can_settle = 3 - $exp_c;

if ($data['u' . $session->tribe . '0'] < $max_settlers AND 
	($building->getTypeLevel(26) == 10 OR $building->getTypeLevel(26) == 15 OR $building->getTypeLevel(26) == 20) AND 
	$can_settle != 0)
{
?>
	<form method="POST" name="snd" action="build.php">
		<input type="hidden" name="id" value="<?php echo $id; ?>" />
		<input type="hidden" name="ft" value="t1" />

		<table cellpadding="1" cellspacing="1" class="build_details">
		<thead>
		<tr>
			<td>训练</td>
			<td>数量</td>
			<td>最大</td>
		</tr>
		</thead>
		<tbody>
			<?php
			$unitID = $session->tribe."0";
			echo "<tr>
			<td class=\"desc\">
				<div class=\"tit\">
					<img class=\"unit u".$unitID."\" src=\"img/x.gif\" alt=\"".$technology->getUnitName($unitID)."\" title=\"".$technology->getUnitName($unitID)."\" />
					<a href=\"#\" onClick=\"return Popup(".$unitID.",1);\">".$technology->getUnitName($unitID)."</a>
					<span class=\"info\">（现有：".$village->unitarray['u'.$unitID]."）</span>
				</div>
				<div class=\"details\">
					<img class=\"r1\" src=\"img/x.gif\" alt=\"木材\" title=\"木材\" />".${'u'.$unitID}['wood']."|
					<img class=\"r2\" src=\"img/x.gif\" alt=\"粘土\" title=\"粘土\" />".${'u'.$unitID}['clay']."|
					<img class=\"r3\" src=\"img/x.gif\" alt=\"铁矿\" title=\"铁矿\" />".${'u'.$unitID}['iron']."|
					<img class=\"r4\" src=\"img/x.gif\" alt=\"粮食\" title=\"粮食\" />".${'u'.$unitID}['crop']."|
					<img class=\"clock\" src=\"img/x.gif\" alt=\"所需时间\" title=\"所需时间\" />
				</div>
			</td>";
			echo $generator->getTimeFormat(round(${'u'.$unitID}['time'] / SPEED));
			if ($session->userinfo['gold'] >= 3 && $building->getTypeLevel(17) > 1)
			{
				echo "|<a href=\"build.php?gid=17&t=3&r1=".${'r'.$unitID}['wood']."&r2=".${'r'.$unitID}['clay']."&r3=".${'r'.$unitID}['iron']."&r4=".${'r'.$unitID}['crop']."\" title=\"和电脑商人交易\">
				<img class=\"npc\" src=\"img/x.gif\" alt=\"和电脑商人交易\" title=\"和电脑商人交易\" /></a>";
			}
			echo "
			<td class=\"val\">
				<input type=\"text\" class=\"text\" name=\"t".$unitID."\" value=\"0\" maxlength=\"4\">
			</td>
			<td class=\"max\">
				<a href=\"#\" onClick=\"document.snd.t".$unitID.".value=".$technology->maxUnit($unitID)."; return false;\">(".$technology->maxUnit($unitID).")</a>
			</td>
			</tr>";
			?>
		</tbody>
		</table>
		<p>
			<input type="image" id="btn_train" class="dynamic_img" value="ok" name="s1" src="img/x.gif" alt="训练" />
		</p>
	</form>
<?php
	include ("26_progress.tpl");
}
else
{
	if ($building->getTypeLevel(26) == 10 AND $can_settle != 0)
	{
		echo "需要先把皇宫升到15级";
	}
	else if($building->getTypeLevel(26) == 15 AND $can_settle != 0)
	{
		echo "需要先把皇宫升到20级";
	}
	else if($building->getTypeLevel(26) == 20)
	{
		echo "你已经不能兴建新的村落或者占领了其他村庄了";
	}
}
?>