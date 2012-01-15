<?php
$ranking->procRankReq($_GET);
$displayarray = $database->getUserArray($_GET['uid'], 1);
$varmedal = $database->getProfileMedal($_GET['uid']);
$profiel="".$displayarray['desc1']."".md5(skJkev3)."".$displayarray['desc2']."";
require("medal.php");
$profiel = explode("".md5(skJkev3)."", $profiel);
$varray = $database->getProfileVillages($_GET['uid']);
$totalpop = 0;
foreach ($varray as $vil)
{
	$totalpop += $vil['pop'];
}
?>

<h1>玩家资料</h1>

<?php 
if ($_GET['uid'] == $session->uid)
{
	include("menu.tpl");
}
?>

<table id="profile" cellpadding="1" cellspacing="1">
<thead>
<tr>
	<th colspan="2">玩家 <?php echo $displayarray['username']; ?></th>
</tr>
<tr>
	<td>详细资料</td>
	<td>描述</td>
</tr>
</thead>
<tbody>
<tr>
	<td class="empty"></td>
	<td class="empty"></td>
</tr>
<tr>
	<td class="details">
		<table cellpadding="0" cellspacing="0">
		<?php
		if ($displayarray['access'] == BANNED)
		{
			echo "
			<tr>
				<td colspan='2'><center><b>该帐号已停封。</b></center></td>
			</tr>";
		}
		?>
		<tr>
			<th>排行</th>
			<td><?php echo $ranking->searchRank($displayarray['username'], "username"); ?></td>
		</tr>
		<tr>
			<th>种族</th>
			<td>
			<?php 
				if ($displayarray['tribe'] == 1)
				{
					echo "罗马";
				}
				else if ($displayarray['tribe'] == 2)
				{
					echo "日耳曼";
				}
				else if ($displayarray['tribe'] == 3)
				{
					echo "高卢";
				}
				?>
			</td>
		</tr>
		<tr>
			<th>联盟</th>
			<td>
				<?php
				if ($displayarray['alliance'] == 0)
				{
					echo "-";
				}
				else
				{
					$displayalliance = $database->getAllianceName($displayarray['alliance']);
					echo "<a href=\"allianz.php?aid=".$displayarray['alliance']."\">".$displayalliance."</a>";
				}
				?>
			</td>
		</tr>
		<tr>
			<th>村庄</th>
			<td><?php echo count($varray);?></td>
		</tr>
		<tr>
			<th>人口</th>
			<td><?php echo $totalpop; ?></td>
		</tr>
		<?php
		//	年龄
		if (isset($displayarray['birthday']) && $displayarray['birthday'] != 0)
		{
			$age = date('Y') - substr($displayarray['birthday'], 0, 4);
			if ((date('m') - substr($displayarray['birthday'], 5, 2)) < 0)
			{
				$age--;
			}
			elseif ((date('m') - substr($displayarray['birthday'], 5, 2)) == 0)
			{
				if (date('d') < substr($displayarray['birthday'], 8, 2))
				{
					$age--;
				}
			}
			echo "<tr><th>年龄</th><td>$age</td></tr>";
		}
		//	性别
		if (isset($displayarray['gender']) && $displayarray['gender'] != 0)
		{
			$gender = ($displayarray['gender']== 1)? "男" : "女";
			echo "
			<tr>
				<th>性别</th>
				<td>".$gender."</td>
			</tr>";
		}
		//	地区
		if ($displayarray['location'] != "")
		{
			echo "
			<tr>
				<th>地区</th>
				<td>".$displayarray['location']."</td>
			</tr>";
		}
		?>
		<tr>
			<td colspan="2" class="empty"></td>
		</tr>
		<tr>
			<?php
			if ($_GET['uid'] == $session->uid)
			{
				echo "
				<td colspan=\"2\">
					<a href=\"spieler.php?s=1\">&raquo; 编辑资料</a>
				</td>";
			}
			else
			{
				echo "
				<td colspan=\"2\">
					<a href=\"nachrichten.php?t=1&amp;id=".$_GET['uid']."\">&raquo; 编写消息</a>
				</td>";
			}
			?>           
		</tr>
		<tr>
			<td colspan="2" class="desc2">
				<div class="desc2div"><?php echo nl2br($profiel[0]); ?></div>
			</td>
		</tr>
		</table>
	</td>

	<td class="desc1" >
		<div><?php echo nl2br($profiel[1]); ?></div>
	</td>
</tr>
</tbody>
</table>

<table cellpadding="1" cellspacing="1" id="villages">
<thead>
<tr>
	<th colspan="3">村庄</th>
</tr>
<tr>
	<td>名字</td>
	<td>人口</td>
	<td>坐标</td>
</tr>
</thead>
<tbody>
<?php 
foreach ($varray as $vil)
{
	$coor = $database->getCoor($vil['wref']);
	echo "
	<tr>
		<td class=\"nam\">
			<a href=\"karte.php?d=".$vil['wref']."&amp;c=".$generator->getMapCheck($vil['wref'])."\">".$vil['name']."</a>";
	if ($vil['capital'] == 1)
	{
		echo "<span class=\"none3\"> （主村）</span>";
	}
	echo "
		</td>";
	echo "
		<td class=\"hab\">".$vil['pop']."</td>
		<td class=\"aligned_coords\">";
	echo "
			<div class=\"cox\">(".$coor['x']."</div>
			<div class=\"pi\">|</div>
			<div class=\"coy\">".$coor['y'].")</div>
		</td>
	</tr>";
}
?>
</tbody>
</table>