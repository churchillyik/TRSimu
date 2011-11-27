<?php
if (!is_numeric($_SESSION['search']))
{
	echo "<p class=\"error\">玩家 <b>".$_SESSION['search']."</b> 不存在或没有英雄</p>";
    $search = 0;
}
else
{
	$search = $_SESSION['search'];
}
?>

<table cellpadding="1" cellspacing="1" id="heroes" class="row_table_data">
<thead>
	<tr>
		<th colspan="5">等级最高的英雄</th>
	</tr>
	<tr>
		<td>排名</td>
		<td>英雄</td>
		<td>玩家</td>
		<td>等级</td>
		<td>经验值</td>
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
			while ($_GET['rank'] > 20*$multiplier)
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
			if (isset($ranking[$i]['heroname']) && $ranking[$i] != "pad")
			{
				if ($ranking[$i]['uid'] == $session->uid)
				{
					echo "<tr class=\"hl \"><td class=\"ra  fc\" >";
				}
				else
				{
					echo "<tr><td class=\"ra \" >";
				}
				echo $i.".</td>
					<td class=\"hero \">
					<img class=\"unit u".$ranking[$i]['type']."\" alt=\"\" title=\"\" src=\"img/x.gif\"> "
					.$ranking[$i]['heroname']."</td>
					<td class=\"pla \"><a href=\"spieler.php?uid=".$ranking[$i]['uid']."\">"
					.$ranking[$i]['owner']."</a></td>
					<td class=\"lev \">".$ranking[$i]['level']."</td>
					<td class=\"xp \">".$ranking[$i]['pointused']."</td></tr>";
			}
		}
	}
	else
	{
		echo "<td class=\"none\" colspan=\"5\">找不到任何英雄</td>";
	}
	?>
</tbody>
</table>

<?php
include("ranksearch.tpl");
?>