<?php
$query = mysql_query('SELECT * FROM `' . TB_PREFIX . 'units` WHERE `vref` = ' . $village->wid);
$data = mysql_fetch_assoc($query);
$max_settlers = ($building->getTypeLevel(26) * 3) / 10;
if($building->getTypeLevel(26) == 15) {
  $max_settlers += 1;
} elseif($building->getTypeLevel(26) == 20) {
  $max_settlers += 3;
}
$query2 = mysql_query('SELECT * FROM `' . TB_PREFIX . 'vdata` WHERE `wref` = ' . $village->wid);
$data2 = mysql_fetch_assoc($query2);
$exp_c = 0;

if($data2['exp1'] != 0) ++$exp_c;
if($data2['exp2'] != 0) ++$exp_c;
if($data2['exp3'] != 0) ++$exp_c;
$can_settle = 3-$exp_c;

if($data['u' . $session->tribe . '0'] < $max_settlers AND ($building->getTypeLevel(26) == 10 OR $building->getTypeLevel(26) == 15 OR $building->getTypeLevel(26) == 20) AND $can_settle != 0) {
?>
<form method="POST" name="snd" action="build.php">
				<input type="hidden" name="id" value="<?php echo $id; ?>" />
                <input type="hidden" name="ft" value="t1" />

			<table cellpadding="1" cellspacing="1" class="build_details">
				<thead>
					<tr>
						<td>Name</td>
						<td>Quantity</td>
						<td>Max</td>
					</tr>
				</thead>
				<tbody>
<?php
			
$unitID = $session->tribe."0";
               echo "<tr><td class=\"desc\">
					<div class=\"tit\">
						<img class=\"unit u".$unitID."\" src=\"img/x.gif\" alt=\"".$technology->getUnitName($unitID)."\" title=\"".$technology->getUnitName($unitID)."\" />
						<a href=\"#\" onClick=\"return Popup(".$unitID.",1);\">".$technology->getUnitName($unitID)."</a>  <span class=\"info\">(Available: ".$village->unitarray['u'.$unitID].")</span>
					</div>
					<div class=\"details\"><img class=\"r1\" src=\"img/x.gif\" alt=\"Lumber\" title=\"Lumber\" />".${'u'.$unitID}['wood']."|<img class=\"r2\" src=\"img/x.gif\" alt=\"Clay\" title=\"Clay\" />".${'u'.$unitID}['clay']."|<img class=\"r3\" src=\"img/x.gif\" alt=\"Iron\" title=\"Iron\" />".${'u'.$unitID}['iron']."|<img class=\"r4\" src=\"img/x.gif\" alt=\"Crop\" title=\"Crop\" />".${'u'.$unitID}['crop']."|<img class=\"clock\" src=\"img/x.gif\" alt=\"duration\" title=\"duration\" />";
                    echo $generator->getTimeFormat(round(${'u'.$unitID}['time']/SPEED));
                    if($session->userinfo['gold'] >= 3 && $building->getTypeLevel(17) > 1) {
                   echo "|<a href=\"build.php?gid=17&t=3&r1=".${'r'.$unitID}['wood']."&r2=".${'r'.$unitID}['clay']."&r3=".${'r'.$unitID}['iron']."&r4=".${'r'.$unitID}['crop']."\" title=\"NPC trade\"><img class=\"npc\" src=\"img/x.gif\" alt=\"NPC trade\" title=\"NPC trade\" /></a>";
                   }
                   echo "
				<td class=\"val\"><input type=\"text\" class=\"text\" name=\"t".$unitID."\" value=\"0\" maxlength=\"4\"></td>
				<td class=\"max\"><a href=\"#\" onClick=\"document.snd.t".$unitID.".value=".$technology->maxUnit($unitID)."; return false;\">(".$technology->maxUnit($unitID).")</a></td></tr></tbody>
	";
                ?>

				</tbody>
			</table>
			<p>
				<input type="image" id="btn_train" class="dynamic_img" value="ok" name="s1" src="img/x.gif" alt="train" />
			</p>
		</form>
<?php
// if prgress
	include ("26_progress.tpl");
// end if
?>
<?php
} else {
  if($building->getTypeLevel(26) == 10 AND $can_settle != 0) {
    print 'You need to build your palast up to level 15';
  } elseif($building->getTypeLevel(26) == 15 AND $can_settle != 0) {
    print 'You need to build your palast up to level 20';
  } elseif($building->getTypeLevel(26) == 20) {
    print 'You can\'t settle or conquer from this village anymore.';
  }
}
?>