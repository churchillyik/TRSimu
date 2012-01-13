<div id="build" class="gid17">
	<a href="#" onClick="return Popup(17,4);" class="build_logo"> 
		<img class="building g17" src="img/x.gif" alt="市场" title="市场" />
	</a> 
	<h1>
		市场
		<span class="level">等级 <?php echo $village->resarray['f'.$id]; ?></span>
	</h1> 
	<p class="build_desc">
		在市场你可以和其他玩家交易资源。而市场每升一级，你便可以多一个商人帮你运送资源。
	</p>

	<?php include("17_menu.tpl"); ?>

	<script language="JavaScript"> 
	<!--
	var haendler = <?php echo $market->merchantAvail(); ?>;
	var carry = <?php echo $market->maxcarry; ?>;
	//-->
	</script>

	<form method="POST" name="snd" action="build.php"> 
		<input type="hidden" name="ft" value="mk1">
		<input type="hidden" name="id" value="<?php echo $id; ?>">
		
		<table id="send_select" class="send_res" cellpadding="1" cellspacing="1">
		<tr> 
			<td class="ico">
				<a href="#" onClick="upd_res(1,1); return false;"><img class="r1" src="img/x.gif" alt="木材" title="木材" /></a>
			</td>
			<td class="nam"> 
				木材：
			</td>
			<td class="val">
				<input class="text" type="text" name="r1" id="r1" value="" maxlength="5" onKeyUp="upd_res(1)" tabindex="1">
			</td>
			<td class="max">
				<a href="#" onMouseUp="add_res(1);" onClick="return false;">(<?php echo $market->maxcarry; ?>)</a>
			</td>
		</tr>
		<tr> 
			<td class="ico"> 
				<a href="#" onClick="upd_res(2,1); return false;"><img class="r2" src="img/x.gif" alt="粘土" title="粘土" /></a> 
			</td> 
			<td class="nam"> 
				粘土：
			</td> 
			<td class="val"> 
				<input class="text" type="text" name="r2" id="r2" value="" maxlength="5" onKeyUp="upd_res(2)" tabindex="2"> 
			</td> 
			<td class="max"> 
				<a href="#" onMouseUp="add_res(2);" onClick="return false;">(<?php echo$market->maxcarry; ?>)</a> 
			</td> 
		</tr>
		<tr> 
			<td class="ico"> 
				<a href="#" onClick="upd_res(3,1); return false;"><img class="r3" src="img/x.gif" alt="铁矿" title="铁矿" /></a> 
			</td> 
			<td class="nam"> 
				铁矿：
			</td> 
			<td class="val"> 
				<input class="text" type="text" name="r3" id="r3" value="" maxlength="5" onKeyUp="upd_res(3)" tabindex="3"> 
			</td> 
			<td class="max"> 
				<a href="#" onMouseUp="add_res(3);" onClick="return false;">(<?php echo $market->maxcarry; ?>)</a> 
			</td> 
		</tr>
		<tr> 
			<td class="ico"> 
				<a href="#" onClick="upd_res(4,1); return false;"><img class="r4" src="img/x.gif" alt="粮食" title="粮食" /></a> 
			</td> 
			<td class="nam"> 
				粮食：
			</td> 
			<td class="val"> 
				<input class="text" type="text" name="r4" id="r4" value="" maxlength="5" onKeyUp="upd_res(4)" tabindex="4"> 
			</td> 
			<td class="max"> 
				<a href="#" onMouseUp="add_res(4);" onClick="return false;">(<?php echo $market->maxcarry; ?>)</a> 
			</td> 
		</tr>
		</table>
	 
		<table id="target_select" class="res_target" cellpadding="1" cellspacing="1"> 
		<tr> 
			<td class="mer">商人 <?php echo $market->merchantAvail(); ?>/<?php echo $market->merchant; ?></td> 
		</tr> 
		<tr> 
			<td class="vil"> 
				<span>村庄：</span> 
				<input class="text" type="text" name="dname" value="" maxlength="20" tabindex="5"> 
			</td> 
		<tr> 
			<td class="or">或者</td> 
		</tr>
		<?php
		if (isset($_GET['z']))
		{
			$coor = $database->getCoor($_GET['z']);
		}
		else
		{
			$coor['x'] = "";
			$coor['y'] = "";
		}
		?>
		<tr>
			<td class="coo">
				<span>X：</span><input class="text" type="text" name="x" value="<?php echo $coor['x']; ?>" maxlength="4" tabindex="6">
			</td>
		</tr>
		<tr>
			<td class="coo">
				<span>Y：</span><input class="text" type="text" name="y" value="<?php echo $coor['y']; ?>" maxlength="4" tabindex="7">
			</td>
		</tr>
		</table>
		<div class="clear"></div>
		<p>
			<input type="image" value="ok" name="s1" id="btn_ok" class="dynamic_img" src="img/x.gif" tabindex="8" alt="OK" 
			<?php if (!$market->merchantAvail()) { echo "DISABLED"; } ?> />
		</p>
	</form>

	<script language="JavaScript" type="text/javascript"> 
	//<!--
	document.snd.r1.focus();
	//-->
	</script>

	<p>
		每个商人可以运载 <b><?php echo $market->maxcarry; ?></b> 单位资源。
	</p>
	<?php
	$timer = 1;
	if (count($market->recieving) > 0)
	{ 
		echo "<h4>即将到来的商人：</h4>";
		foreach ($market->recieving as $recieve)
		{
			echo "<table class=\"traders\" cellpadding=\"1\" cellspacing=\"1\">";
			$villageowner = $database->getVillageField($recieve['from'], "owner");
			echo "<thead>
			<tr>
			<td>
				<a href=\"spieler.php?uid=$villageowner\">".$database->getUserField($villageowner,"username",0)."</a>
			</td>";
			echo "<td>
			<a href=\"karte.php?d=".$recieve['from']."&c=".$generator->getMapCheck($recieve['from'])."\">商人所在的村庄</a>
			</td>";
			echo "</tr>
			</thead>
			<tbody>
			<tr>
				<th>到达时间</th>
				<td>";
			echo "<div class=\"in\">
			<span id=timer$timer>还有 ".$generator->getTimeFormat($recieve['endtime'] - time())."</span> 小时
			</div>";
			$datetime = $generator->procMtime($recieve['endtime']);
			echo "<div class=\"at\">";
			if ($datetime[0] != "today")
			{
				echo "于 ".$datetime[0]." ";
			}
			echo "于 ".$datetime[1]."</div>";
			echo "</td>
			</tr>
			</tbody>
			<tr class=\"res\">
				<th>资源</th>
				<td colspan=\"2\"><span class=\"f10\">";
			echo "<img class=\"r1\" src=\"img/x.gif\" alt=\"木材\" title=\"木材\" />".$recieve['wood']." | 
			<img class=\"r2\" src=\"img/x.gif\" alt=\"粘土\" title=\"粘土\" />".$recieve['clay']." | 
			<img class=\"r3\" src=\"img/x.gif\" alt=\"铁矿\" title=\"铁矿\" />".$recieve['iron']." | 
			<img class=\"r4\" src=\"img/x.gif\" alt=\"粮食\" title=\"粮食\" />".$recieve['crop']."
			</td>
			</tr>
			</tbody>";
			echo "</table>";
			$timer += 1;
		}
	}
	if (count($market->sending) > 0)
	{
		echo "<h4>运输外出的商人：</h4>";
		foreach ($market->sending as $send)
		{
			$villageowner = $database->getVillageField($send['to'], "owner");
			$ownername = $database->getUserField($villageowner, "username", 0);
			echo "<table class=\"traders\" cellpadding=\"1\" cellspacing=\"1\">";
			echo "<thead>
				<tr>
					<td><a href=\"spieler.php?uid=$villageowner\">$ownername</a></td>";
			echo "<td>
				<a href=\"karte.php?d=".$send['to']."&c=".$generator->getMapCheck($send['to'])."\">商人前往的村庄</a>
				</td>";
			echo "</tr>
				</thead>
				<tbody>
				<tr>
					<th>到达时间</th>
					<td>";
			echo "<div class=\"in\">
				<span id=timer".$timer.">还有 ".$generator->getTimeFormat($send['endtime'] - time())."</span> 小时
				</div>";
			$datetime = $generator->procMtime($send['endtime']);
			echo "<div class=\"at\">";
			if ($datetime[0] != "today")
			{
				echo "于 ".$datetime[0]." ";
			}
			echo "于 ".$datetime[1]."</div>";
			echo "</td>
				</tr>
				<tr class=\"res\">
					<th>资源</th>
				<td>";
			echo "<img class=\"r1\" src=\"img/x.gif\" alt=\"木材\" title=\"木材\" />".$send['wood']." | 
				<img class=\"r2\" src=\"img/x.gif\" alt=\"粘土\" title=\"粘土\" />".$send['clay']." | 
				<img class=\"r3\" src=\"img/x.gif\" alt=\"铁矿\" title=\"铁矿\" />".$send['iron']." | 
				<img class=\"r4\" src=\"img/x.gif\" alt=\"粮食\" title=\"粮食\" />".$send['crop']."
			</td>
			</tr>
			</tbody>";
			echo "</table>";
			$timer += 1;
		}
	}
	if (count($market->return) > 0)
	{
		echo "<h4>返回的商人：</h4>";
		foreach ($market->return as $return)
		{
			$villageowner = $database->getVillageField($return['from'], "owner");
			$ownername = $database->getUserField($villageowner, "username", 0);
			echo "<table class=\"traders\" cellpadding=\"1\" cellspacing=\"1\">";
			echo "<thead>
				<tr>
				<td><a href=\"spieler.php?uid=$villageowner\">$ownername</a></td>";
			echo "<td>
				<a href=\"karte.php?d=".$return['from']."&c=".$generator->getMapCheck($return['from'])."\">商人前往的村庄</a>
				</td>";
			echo "</tr>
			</thead>
			<tbody>
			<tr>
				<th>到达时间</th>
			<td>";
			echo "<div class=\"in\">
				<span id=timer".$timer.">还有 ".$generator->getTimeFormat($return['endtime'] - time())."</span> 小时
				</div>";
			$datetime = $generator->procMtime($return['endtime']);
			echo "<div class=\"at\">";
			if ($datetime[0] != "today")
			{
				echo "于 ".$datetime[0]." ";
			}
			echo "于 ".$datetime[1]."</div>";
			echo "</td>
				</tr>";
			echo "</tbody>
				</table>";
			$timer += 1;
		}
	}
	include("upgrade.tpl");
	?>
</div> 