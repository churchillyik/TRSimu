<?php
if (!is_numeric($_SESSION['search']))
{
	echo "<p class=\"error\">玩家<b>".$_SESSION['search']."</b>不存在</p>";
    $search = 0;
}
else
{
	$search = $_SESSION['search'];
}
?>

<table cellpadding="1" cellspacing="1" id="player">
<thead>
	<tr>
		<th colspan="5">最强玩家
			<div id="submenu">
				<a title="前10名" href="statistiken.php?id=7"><img class="btn_top10" src="img/x.gif" alt="前10名" /></a>
				<a title="防御者" href="statistiken.php?id=32"><img class="btn_def" src="img/x.gif" alt="防御者" /></a>
				<a title="攻击者" href="statistiken.php?id=31"><img class="btn_off" src="img/x.gif" alt="攻击者" /></a>
			</div>		    
		</th>
	</tr>
	<tr>
		<td>排名</td>
		<td>玩家</td>
		<td>联盟</td>
		<td>人口</td>
		<td>村庄</td>
	</tr>
</thead>
<tbody>
<?php
if (isset($_GET['rank']))
{
	$multiplier = 1;
	if (is_numeric($_GET['rank']))
	{
		if ($_GET['rank'] > count($ranking->getRank()))
		{
			$_GET['rank'] = count($ranking->getRank()) - 1;
		}
		while ($_GET['rank'] > 20 * $multiplier)
		{
			$multiplier += 1;
		}
		$start = 20 * $multiplier - 19;
	}
	else
	{
		$start = $_SESSION['start'] + 1;
	}
}
else
{
	$start = $_SESSION['start'] + 1;
}
if (count($ranking->getRank()) > 0)
{
	$ranking = $ranking->getRank();
	for ($i = $start; $i < $start + 20; $i++)
	{
		if (isset($ranking[$i]['username']) && $ranking[$i] != "pad")
		{
			if ($i == $search)
			{
				echo "<tr class=\"hl\"><td class=\"ra fc\" >";
			}
			else
			{
				echo "<tr><td class=\"ra \" >";
			}
			echo $i.".</td><td class=\"pla \" >";
			echo "<a href=\"spieler.php?uid=".$ranking[$i]['id']."\">".$ranking[$i]['username']."</a>";
			echo "</td><td class=\"al \" >";
			if ($ranking[$i]['alliance'] != 0)
			{
				echo "<a href=\"allianz.php?aid=".$ranking[$i]['alliance']."\">".$ranking[$i]['aname']."</a>";
			}
			else
			{
				echo "-";
			}
			echo "</td><td class=\"pop \" >".$ranking[$i]['totalpop']."</td><td class=\"vil\">".$ranking[$i]['totalvillage']."</td></tr>";
		}
	}
}
else
{
	echo "<td class=\"none\" colspan=\"5\">找不到任何玩家</td>";
}
?>
</tbody>
</table>

<?php
include("ranksearch.tpl");
?>