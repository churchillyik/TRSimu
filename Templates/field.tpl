<map name="rx" id="rx">
<?php 
//	每个坑的坐标，下标从1开始
$coorarray = array(1 => 
"101,33,28",
"165,32,28",
"224,46,28",
"46,63,28",
"138,74,28",
"203,94,28",
"262,86,28",
"31,117,28",
"83,110,28",
"214,142,28",
"269,146,28",
"42,171,28",
"93,164,28",
"160,184,28",
"239,199,28",
"87,217,28",
"140,231,28",
"190,232,28");
for ($i = 1; $i <= 18; $i++)
{
    echo "
	<area href=\"build.php?id=$i\" coords=\"$coorarray[$i]\" shape=\"circle\" title=\""
	.$building->procResType($village->resarray['f'.$i.'t'])
	." 等级 ".$village->resarray['f'.$i]."\"/>";
}
?>
<area href="dorf2.php" coords="144,131,36" shape="circle" title="Village centre" alt="" />
</map>

<div id="village_map" class="f<?php echo $village->type; ?>">
	<?php 
	for ($i = 1; $i <= 18; $i++)
	{
		if ($village->resarray['f'.$i.'t'] != 0)
		{
			$text = "";
			switch($i)
			{
			case 1:
				$text = "伐木场 等级";
				break;
			case 2:
				$text = "粘土矿 等级";
				break;
			case 3:
				$text = "铁矿 等级";
				break;
			case 4:
				$text = "粮田 等级";
				break;
			}
			echo "<img src=\"img/x.gif\" class=\"reslevel rf$i level".$village->resarray['f'.$i]."\" alt=\"$text ".$village->resarray['f'.$i]."\" />";
		}
	}
	?>
	<img id="resfeld" usemap="#rx" src="img/x.gif" alt="" />
</div>