<?php
$aantal = (count($database->getMovement(4, $village->wid, 1))
 + count($database->getMovement(4, $village->wid, 0))
 + count($database->getMovement(3, $village->wid, 1))
 + count($database->getMovement(3, $village->wid, 0)));
if ($aantal > 0)
{
	echo '
	<table id="movements" cellpadding="1" cellspacing="1">
	<thead>
	<tr>
		<th colspan="3">'.TROOP_MOVEMENTS.'</th>
	</tr>
	</thead>
	<tbody>';
?>

<?php
//	对自己增援的部队
$aantal = count($database->getMovement(4, $village->wid, 1));
$aantal2 = $database->getMovement(4, $village->wid, 1);
if ($aantal > 0)
{
	foreach ($aantal2 as $receive)
	{
		$action = 'def1';
		$aclass = 'd1';
		$title = ''.ARRIVING_REINF_TROOPS.'';
		$short = ''.ARRIVING_REINF_TROOPS_SHORT.'';
	}
			
	echo '
	<tr>
		<td class="typ">
			<a href="build.php?id=39"><img src="img/x.gif" class="'.$action.'" alt="'.$title.'" title="'.$title.'" /></a>
			<span class="'.$aclass.'">&raquo;</span>
		</td>
		<td>
			<div class="mov">
				<span class="'.$aclass.'">'.$aantal.'&nbsp;'.$short.'</span>
			</div>
			<div class="dur_r">
				所需时间&nbsp;
				<span id="timer'.$timer.'">'.$generator->getTimeFormat($receive['endtime'] - time()).'</span>
				&nbsp;'.HOURS.'
			</div>
		</td>
	</tr>';
	
	$timer += 1;
}
?>

<?php
//	自己外出攻击、掠夺的部队
$aantal = count($database->getMovement(3, $village->wid, 1));
$aantal2 = $database->getMovement(3, $village->wid, 1);
for($i = 0; $i < $aantal; $i++)
{
	if($aantal2[$i]['attack_type'] == 2)
	{
		$aantal -= 1;
	}
}
if($aantal > 0)
{
	foreach($aantal2 as $receive)
	{
		$action = 'att1';
		$aclass = 'a1';
		$title = ''.OWN_ATTACKING_TROOPS.'';
		$short = ''.ATTACK.'';
	}
			
	echo '
	<tr>
		<td class="typ">
			<a href="build.php?id=39"><img src="img/x.gif" class="'.$action.'" alt="'.$title.'" title="'.$title.'" /></a>
			<span class="'.$aclass.'">&raquo;</span>
		</td>
		<td>
			<div class="mov">
				<span class="'.$aclass.'">'.$aantal.'&nbsp;'.$short.'</span>
			</div>
			<div class="dur_r">
				所需时间&nbsp;
				<span id="timer'.$timer.'">'.$generator->getTimeFormat($receive['endtime'] - time()).'</span>
				&nbsp;'.HOURS.'
			</div>
		</td>
	</tr>';
	
	$timer += 1;
}
?>

<?php
//
$aantal = count($database->getMovement(3, $village->wid, 0));
$aantal2 = $database->getMovement(3, $village->wid, 0);
for($i = 0; $i < $aantal; $i++)
{
	if($aantal2[$i]['attack_type'] == 2)
	{
		$aantal -= 1;
	}
}
if($aantal > 0)
{
	foreach($aantal2 as $receive)
	{
		$action = 'att2';
		$aclass = 'a2';
		$title = ''.OWN_ATTACKING_TROOPS.'';
		$short = ''.ATTACK.'';
	}

	echo '
	<tr>
		<td class="typ">
			<a href="build.php?id=39"><img src="img/x.gif" class="'.$action.'" alt="'.$title.'" title="'.$title.'" /></a>
			<span class="'.$aclass.'">&raquo;</span>
		</td>
		<td>
			<div class="mov">
				<span class="'.$aclass.'">'.$aantal.'&nbsp;'.$short.'</span>
			</div>
			<div class="dur_r">
				所需时间&nbsp;
				<span id="timer'.$timer.'">'.$generator->getTimeFormat($receive['endtime'] - time()).'</span>
				&nbsp;'.HOURS.'
			</div>
		</td>
	</tr>';
	
	$timer += 1;
}
?>

<?php
//	自己外出增援的部队
$aantal = count($database->getMovement(3, $village->wid, 0));
$lala = $aantal;
$aantal2 = $database->getMovement(3, $village->wid, 0);
for($i = 0; $i < $aantal; $i++)
{
	if(($aantal2[$i]['attack_type'] == 1) or ($aantal2[$i]['attack_type'] == 3) or ($aantal2[$i]['attack_type'] == 4))
	{
		$lala -= 1;
	}
}

if($lala > 0)
{
	foreach($aantal2 as $receive)
	{
		$action = 'def2';
		$aclass = 'd2';
		$title = ''.OWN_REINFORCING_TROOPS.'';
		$short = ''.ARRIVING_REINF_TROOPS_SHORT.'';
	}
			
	echo '
	<tr>
		<td class="typ">
			<a href="build.php?id=39"><img src="img/x.gif" class="'.$action.'" alt="'.$title.'" title="'.$title.'" /></a>
			<span class="'.$aclass.'">&raquo;</span>
		</td>
		<td>
			<div class="mov">
				<span class="'.$aclass.'">'.$lala.'&nbsp;'.$short.'</span>
			</div>
			<div class="dur_r">
				in&nbsp;
				<span id="timer'.$timer.'">'.$generator->getTimeFormat($receive['endtime']-time()).'</span>
				&nbsp;'.HOURS.'
			</div>
		</td>
	</tr>';
	
	$timer += 1;
}
?>

<?php
//	增援到自己村庄的部队
$aantal = count($database->getMovement(3, $village->wid, 1)); 
$lala=$aantal;
$aantal2 = $database->getMovement(3, $village->wid, 1);
for($i = 0; $i < $aantal; $i++)
{
	if(($aantal2[$i]['attack_type'] == 1) or ($aantal2[$i]['attack_type'] == 3) or ($aantal2[$i]['attack_type'] == 4))
	{
		$lala -= 1;
	}
}
if($lala > 0)
{
	foreach($aantal2 as $receive)
	{
		$action = 'def1';
		$aclass = 'd1';
		$title = ''.OWN_REINFORCING_TROOPS.'';
		$short = ''.ARRIVING_REINF_TROOPS_SHORT.'';
	}
		
	echo '
	<tr>
		<td class="typ">
			<a href="build.php?id=39"><img src="img/x.gif" class="'.$action.'" alt="'.$title.'" title="'.$title.'" /></a>
			<span class="'.$aclass.'">&raquo;</span>
		</td>
		<td>
			<div class="mov">
				<span class="'.$aclass.'">'.$lala.'&nbsp;'.$short.'</span>
			</div>
			<div class="dur_r">
				in&nbsp;
				<span id="timer'.$timer.'">'.$generator->getTimeFormat($receive['endtime']-time()).'</span>
				&nbsp;'.HOURS.'
			</div>
		</td>
	</tr>';
	
	$timer += 1;
}
?>

<?php
//	部队攻击目标后返回
$gettroops = $database->getMovement(3, $village->wid, 1);
for($i = 0; $i<count($gettroops); $i++)
{
	if($gettroops[$i]['attack_type'] == 1)
	{
		unset($gettroops[$i]);
	}
}
$aantal2 = array_values($gettroops);
$aantal = count($aantal2);
if($aantal > 0)
{
	foreach($aantal2 as $receive)
	{
		$action = 'att1';
		$aclass = 'a1';
		$title = 'Incomming troops';
		$short = 'Attack';
	}
			
	echo '
	<tr>
		<td class="typ">
			<a href="build.php?id=39"><img src="img/x.gif" class="'.$action.'" alt="'.$title.'" title="'.$title.'" /></a>
			<span class="'.$aclass.'">&laquo;</span>
		</td>
		<td>
			<div class="mov">
				<span class="'.$aclass.'">'.$aantal.'&nbsp;'.$short.'</span>
			</div>
			<div class="dur_r">
				in&nbsp;
				<span id="timer'.$timer.'">'.$generator->getTimeFormat($receive['endtime']-time()).'</span>
				&nbsp;'.HOURS.'
			</div>
		</td>
	</tr>';
	
	$timer += 1;
}
?>
<?php
	echo '
	</tbody>
	</table>';
}
?>