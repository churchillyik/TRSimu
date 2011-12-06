<?php
//	获取有前置条件作用建筑的等级
$woodcutter = $building->getTypeLevel(1);
$claypit = $building->getTypeLevel(2);
$ironmine = $building->getTypeLevel(3);
$cropland = $building->getTypeLevel(4);
$grainmill = $building->getTypeLevel(8);
$warehouse = $building->getTypeLevel(10);
$granary = $building->getTypeLevel(11);
$blacksmith = $building->getTypeLevel(12);
$armoury = $building->getTypeLevel(13);
$mainbuilding = $building->getTypeLevel(15);
$rallypoint = $building->getTypeLevel(16);
$market = $building->getTypeLevel(17);
$embassy = $building->getTypeLevel(18);
$barrack = $building->getTypeLevel(19);
$stable = $building->getTypeLevel(20);
$academy = $building->getTypeLevel(22);
$cranny = $building->getTypeLevel(23);
$residence = $building->getTypeLevel(25);
$palace = $building->getTypeLevel(26);
$hero = $building->getTypeLevel(37);
$wall = $village->resarray['f40'];
?>

<div id="build" class="gid0">
	<h1>建造新的建筑</h1>
	<?php
	if ($mainbuilding == 0 && $id != 39 && $id != 40)
	{
		include("avaliable/mainbuilding.tpl");
	}
	if (($cranny == 0 || $cranny == 10) && $mainbuilding >= 1 && $id != 39 && $id != 40)
	{
		include("avaliable/cranny.tpl");
	}
	if (($granary == 0 || $granary == 20) && $mainbuilding >= 1 && $id != 39 && $id != 40)
	{
		include("avaliable/granary.tpl");
	}
	if ($wall == 0)
	{
		if ($session->tribe == 1 && $id != 39 && $id == 40)
		{
			include("avaliable/citywall.tpl");
		}
		if ($session->tribe == 2 && $id != 39 && $id == 40)
		{
			include("avaliable/earthwall.tpl");
		}
		if ($session->tribe == 3 && $id != 39 && $id == 40)
		{
			include("avaliable/palisade.tpl");
		}
	}
	if (($warehouse == 0 || $warehouse == 20) && $id != 39 && $id != 40)
	{
		include("avaliable/warehouse.tpl");
	}
	if ($building->getTypeLevel(36) == 0 && $rallypoint >= 1 && $session->tribe == 3 && $id != 39 && $id != 40)
	{
		include("avaliable/trapper.tpl");
	}
	if ($rallypoint == 0 && $id != 40)
	{
		include("avaliable/rallypoint.tpl");
	}
	if ($embassy == 0 && $id != 39 && $id != 40)
	{
		include("avaliable/embassy.tpl");
	}
	if ($hero == 0 && $mainbuilding >= 3 && $rallypoint >= 1 && $id != 39  && $id != 40)
	{
		include("avaliable/hero.tpl");
	}
	if ($rallypoint >= 1 && $mainbuilding >= 3 && $barrack == 0 && $id != 39 && $id != 40)
	{
		include("avaliable/barracks.tpl");
	}
	if ($mainbuilding >= 3 && $academy >= 1 && $armoury == 0 && $id != 39 && $id != 40)
	{
		include("avaliable/armoury.tpl");
	}
	if ($cropland >= 5 && $grainmill == 0 && $id != 39 && $id != 40)
	{
		include("avaliable/grainmill.tpl");
	}
	if ($granary >= 1 && $warehouse >= 1 && $mainbuilding >= 3 && $market == 0 && $id != 39 && $id != 40)
	{
		include("avaliable/marketplace.tpl");
	}
	if ($mainbuilding >= 5 && $residence == 0  && $id != 39 && $id != 40 && $palace == 0)
	{
		include("avaliable/residence.tpl");
	}
	if ($academy == 0 && $mainbuilding >= 3 && $barrack >= 3 && $id != 39 && $id != 40)
	{
		include("avaliable/academy.tpl");
	}
	if ($palace == 0 && $embassy >= 1 && $mainbuilding >= 5 && $id != 39 && $id != 40 && $residence == 0)
	{
		include("avaliable/palace.tpl");
	}
	if ($building->getTypeLevel(12) == 0 && $academy >= 3 && $mainbuilding >= 3 && $id != 39 && $id != 40)
	{
		include("avaliable/blacksmith.tpl");
	}
	if ($building->getTypeLevel(34) == 0 && $palace >= 3 && $mainbuilding >= 5 && $id != 39 && $id != 40)
	{
		include("avaliable/stonemason.tpl");
	}
	if ($building->getTypeLevel(20) == 0 && $blacksmith >= 3 && $academy >= 5 && $id != 39 && $id != 40)
	{
		include("avaliable/stable.tpl");
	}
	if ($building->getTypeLevel(27) == 0 && $mainbuilding >= 10  && $id != 39 && $id != 40)
	{
		include("avaliable/treasury.tpl");
	}
	if ($building->getTypeLevel(6) == 0 && $claypit >= 10 && $mainbuilding >= 5  && $id != 39 && $id != 40)
	{
		include("avaliable/brickyard.tpl");
	}
	if ($building->getTypeLevel(5) == 0 && $woodcutter >= 10 && $mainbuilding >= 5  && $id != 39 && $id != 40)
	{
	   include("avaliable/sawmill.tpl");
	}
	if($building->getTypeLevel(7) == 0 && $ironmine >= 10 && $mainbuilding >= 5  && $id != 39 && $id != 40)
	{
		include("avaliable/ironfoundry.tpl");
	}
	if ($building->getTypeLevel(21) == 0 && $academy >= 10 && $mainbuilding  >= 5  && $id != 39 && $id != 40)
	{
		include("avaliable/workshop.tpl");
	}
	if ($building->getTypeLevel(14) == 0 && $rallypoint >= 15  && $id != 39 && $id != 40)
	{
		include("avaliable/tsquare.tpl");
	}
	if ($building->getTypeLevel(9) == 0 && $grainmill >= 5 && $cropland >= 10 && $mainbuilding >= 5  && $id != 39 && $id != 40)
	{
		include("avaliable/bakery.tpl");
	}
	if ($building->getTypeLevel(24) == 0 && $mainbuilding >= 10 && $academy >= 10  && $id != 39 && $id != 40)
	{
		include("avaliable/townhall.tpl");
	}
	if ($building->getTypeLevel(28) == 0 && $market == 20 && $stable >= 10  && $id != 39 && $id != 40)
	{
		include("avaliable/tradeoffice.tpl");
	}
	if ($building->getTypeLevel(41) == 0 && $rallypoint >= 10 && $stable == 20  && $id != 39 && $id != 40)
	{
		include("avaliable/horsedrinking.tpl");
	}
	if ($building->getTypeLevel(35) == 0 && $rallypoint >= 10 && $granary == 20  && $id != 39 && $id != 40)
	{
		include("avaliable/brewery.tpl");
	}
	if ($id != 39 && $id != 40)
	{
	?>
	
	<p class="switch"><a id="soon_link" href="javascript:show_build_list('soon');">显示快要可以建造的建筑</a></p>
	<div id="build_list_soon" class="hide">
		<?php
		if ($rallypoint == 0 && $session->tribe == 3)
		{
			include("soon/trapper.tpl");
		}
		if ($hero == 0 && $mainbuilding <= 2 && $rallypoint == 0)
		{
			include("soon/hero.tpl");
		}
		if ($rallypoint == 0 || $mainbuilding <= 2)
		{
			include("soon/barracks.tpl");
		}
		if ($mainbuilding <= 2 || $academy == 0)
		{
			include("soon/armoury.tpl");
		}
		if ($cropland <= 4)
		{
			include("soon/grainmill.tpl");
		}
		if ($mainbuilding <= 2 || $granary == 0 || $warehouse == 0)
		{
			include("soon/marketplace.tpl");
		}
		if ($mainbuilding <= 4)
		{
			include("soon/residence.tpl");
		}
		if ($academy == 0 && ($mainbuilding <= 2 || $barrack <= 2))
		{
			include("soon/academy.tpl");
		}
		if ($embassy == 0 || $mainbuilding >= 2 && $mainbuilding <= 4)
		{
			include("soon/palace.tpl");
		}
		if ($academy <= 2 && $academy != 0 && $mainbuilding <= 2)
		{
			include("soon/blacksmith.tpl");
		}
		if ($palace <= 2  && $palace != 0 && $mainbuilding >= 2 && $mainbuilding <= 4 && $residence == 0)
		{
			include("soon/stonemason.tpl");
		}
		if ($blacksmith <= 2 && $blacksmith != 0 || $academy >= 2 && $academy <= 4)
		{
			include("soon/stable.tpl");
		}
		if ($mainbuilding <= 9 && $mainbuilding >= 5)
		{
			include("soon/treasury.tpl");
		}
		if ($claypit <= 9  && $claypit >= 5 && $mainbuilding >= 2  && $mainbuilding <= 4)
		{
			include("soon/brickyard.tpl");
		}
		if ($woodcutter <= 9 && $woodcutter >= 5 && $mainbuilding >= 2 && $mainbuilding <= 4)
		{
			include("soon/sawmill.tpl");
		}
		if ($ironmine <= 9 && $ironmine >= 5 && $mainbuilding >= 2 && $mainbuilding <= 4)
		{
			include("soon/ironfoundry.tpl");
		}
		if ($academy <= 9 && $academy >= 5 && $mainbuilding >= 2 && $mainbuilding <= 4)
		{
			include("soon/workshop.tpl");
		}
		if ($rallypoint <= 14 && $rallypoint >= 7)
		{
			include("soon/tsquare.tpl");
		}
		if ($grainmill <= 4 && $grainmill != 0 && $cropland >= 5 &&  $cropland <= 9 && $mainbuilding >= 2 && $mainbuilding <= 4)
		{
			include("soon/bakery.tpl");
		}
		if ($mainbuilding <= 9 && $mainbuilding >= 5 && $academy >= 5 && $academy <= 9)
		{
			include("soon/townhall.tpl");
		}
		if ($market <= 19 && $market >= 10 || $stable >= 5 && $stable <= 9)
		{
			include("soon/tradeoffice.tpl");
		}
		if ($rallypoint <= 9 && $rallypoint >= 5 || $stable <= 19 && $stable >= 10)
		{
			include("soon/horsedrinking.tpl");
		}
		if ($rallypoint <= 9 && $rallypoint >= 5 || $granary <= 19 && $granary >= 10 && $session->tribe == 2)
		{
			include("soon/brewery.tpl");
		}
		?>
    </div>
	
	<p class="switch"><a id="all_link" class="hide" href="javascript:show_build_list('all');">显示更多</a></p>
    <div id="build_list_all" class="hide">
		<?php
		if ($mainbuilding == 1 || $barrack == 0)
		{
			include("soon/academy.tpl");
		}
		if ($embassy == 0 || $mainbuilding <= 2)
		{
			include("soon/palace.tpl");
		}
		if ($academy == 0 || $mainbuilding == 1)
		{
			include("soon/blacksmith.tpl");
		}
		if (($palace == 0 || $mainbuilding <= 2) && $residence == 0)
		{
			include("soon/stonemason.tpl");
		}
		if ($blacksmith == 0 || $academy <= 2)
		{
			include("soon/stable.tpl");
		}
		if ($mainbuilding <= 5)
		{
			include("soon/treasury.tpl");
		}
		if ($claypit <= 5 || $mainbuilding <= 2) 
		{
			include("soon/brickyard.tpl");
		}
		if ($woodcutter <= 5 || $mainbuilding <= 2)
		{
			include("soon/sawmill.tpl");
		}
		if ($ironmine <= 5 || $mainbuilding <= 2)
		{
			include("soon/ironfoundry.tpl");
		}
		if ($academy <= 5 || $mainbuilding <= 2)
		{
			include("soon/workshop.tpl");
		}
		if ($rallypoint <= 7)
		{
			include("soon/tsquare.tpl");
		}
		if ($grainmill == 0 || $cropland <= 5 || $mainbuilding <= 2)
		{
			include("soon/bakery.tpl");
		}
		if ($mainbuilding <= 5 || $academy <= 5)
		{
			include("soon/townhall.tpl");
		}
		if ($market <= 10 || $stable <= 5)
		{
			include("soon/tradeoffice.tpl");
		}
		if ($rallypoint <= 5 || $stable <= 10)
		{
			include("soon/horsedrinking.tpl");
		}
		if ($rallypoint <= 5 || $granary <= 10 && $session->tribe == 2)
		{
			include("soon/brewery.tpl");
		}
		?>
    </div>
	
	<script language="JavaScript" type="text/javascript">
	function show_build_list(list)
	{
		var build_list = document.getElementById('build_list_' + list);
		var link = document.getElementById(list + '_link');

		var all_link = document.getElementById('all_link');
		var soon_link = document.getElementById('soon_link');

		var build_list_all = document.getElementById('build_list_all');
		var build_list_soon = document.getElementById('build_list_soon');

		if (build_list.className == 'hide')
		{
			build_list.className = '';
			if (link == soon_link)
			{
				link.innerHTML = '隐藏快要可以建造的建筑';
				if (all_link !== null)
				{
					all_link.className = '';
				}
			}
			else
			{
				link.innerHTML = '隐藏更多';
			}
		}
		else
		{
			build_list.className = 'hide';
			if (link == soon_link)
			{
				link.innerHTML = '显示快要可以建造的建筑';
				if (all_link !== null)
				{
					all_link.innerHTML = '显示更多';
					all_link.className = 'hide';
					build_list_all.className = 'hide';
				}
			}
			else
			{
				link.innerHTML = '显示更多';
			}
		}
	}
	</script>
	
	<?php 
	}
	?>
</div>