<?php
//////////////////////////////////////////////////////////////////////////////////////////////////////
//                                             TRAVIANX                                             //
//            Only for advanced users, do not edit if you dont know what are you doing!             //
//                                Made by: Dzoki & Dixie (TravianX)                                 //
//                              - TravianX = Travian Clone Project -                                //
//                                 DO NOT REMOVE COPYRIGHT NOTICE!                                  //
//////////////////////////////////////////////////////////////////////////////////////////////////////

switch($_GET['f']) {
	case 'k7':
		$x = $_GET['x'];
		$y = $_GET['y'];
		$xx = $_GET['xx'];
		$yy = $_GET['yy'];
		$howmany = $x - $xx;
		if($howmany == 12 || $howmany == -12) {
			include("Templates/Ajax/mapscroll2.tpl");
		}
		else {
		include("Templates/Ajax/mapscroll.tpl");
		}
		break;
	case 'kp':
		$z = $_GET['z'];
		//include("Templates/Ajax/plusmap.tpl");
		break;
	case 'qst':
	
	if (isset($_GET['qact'])){
	$qact=$_GET['qact'];
	}else {
	$qact=null;
	}
	if (isset($_GET['qact2'])){
	$qact2=$_GET['qact2'];
	}else {
	$qact2=null;
	}
		include("Templates/Ajax/quest_core.tpl");		
		break;
}
?>