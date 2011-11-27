<?php
if (!is_numeric($_SESSION['search']))
{
	echo "<p class=\"error\">联盟 <b>".$_SESSION['search']."</b> 不存在</p>";
    $search = 0;
}
else
{
	$search = $_SESSION['search'];
}
?>

<table cellpadding="1" cellspacing="1" id="alliance_def" class="row_table_data">
<thead>
	<tr>
		<th colspan="5">最成功的联盟（防御）
			<div id="submenu">
				<a title="防御者" href="statistiken.php?id=4"><img class="active btn_def" src="img/x.gif" alt="防御者" /></a>
				<a title="攻击者" href="statistiken.php?id=41"><img class="btn_off" src="img/x.gif" alt="攻击者" /></a>
			</div>
		</th>
	</tr>
	<tr>
		<td>排名</td>
		<td>联盟</td>
		<td>玩家</td>
		<td>&Oslash;</td>
		<td>点数</td>
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
			if (isset($ranking[$i]['name']) && $ranking[$i] != "pad")
			{
				if ($i == $search)
				{
					echo "<tr class=\"hl\"><td class=\"ra fc\" >";
				}
				else
				{
					echo "<tr><td class=\"ra \" >";
				}
				echo $i.".</td><td class=\"al \" ><a href=\"allianz.php?aid="
					.$ranking[$i]['id']."\">".$ranking[$i]['tag']."</a></td><td class=\"pla \" >";
				echo $ranking[$i]['players']."</td><td class=\"av \" >"
					.$ranking[$i]['avg']."</td><td class=\"po \">".$ranking[$i]['totaldp']."</td></tr>";
			}
		}
	}
	else
	{
		echo "<td class=\"none\" colspan=\"5\">找不到任何联盟</td>";
	}
	?>
</tbody>
</table>

<?php
include("ranksearch.tpl");
?>