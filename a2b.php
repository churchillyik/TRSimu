<?php

//////////////////////////////////////////////////////////////////////////////////////////////////////
//                                             TRAVIANX                                             //
//            Only for advanced users, do not edit if you dont know what are you doing!             //
//                                Made by: Dzoki & Dixie (TravianX)                                 //
//                              - TravianX = Travian Clone Project -                                //
//                                 DO NOT REMOVE COPYRIGHT NOTICE!                                  //
//////////////////////////////////////////////////////////////////////////////////////////////////////

include("GameEngine/Village.php");
include("GameEngine/Units.php");

$start = $generator->pageLoadTimeStart();
if(isset($_GET['newdid'])) {
	$_SESSION['wid'] = $_GET['newdid'];
	header("Location: ".$_SERVER['PHP_SELF']);
}
else {
$building->procBuild($_GET);
}

if(isset($_GET['id'])) {
	$id = $_GET['id'];
}
if(isset($_GET['w'])) {
	$w = $_GET['w'];
}
if(isset($_GET['r'])) {
	$r = $_GET['r'];
}
	$process = $units->procUnits($_POST);	

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
	<title><?php echo SERVER_NAME ?></title>
    <link REL="shortcut icon" HREF="favicon.ico"/>
	<meta http-equiv="cache-control" content="max-age=0" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<meta http-equiv="imagetoolbar" content="no" />
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="mt-full.js?0faaa" type="text/javascript"></script>
	<script src="unx.js?0faaa" type="text/javascript"></script>
	<script src="new.js?0faaa" type="text/javascript"></script>
	<link href="gpack/travian_basic/lang/en/lang.css?f4b7c" rel="stylesheet" type="text/css" />
	<link href="gpack/travian_basic/lang/en/compact.css?f4b7c" rel="stylesheet" type="text/css" />
	<?php
	if($session->gpack == null || GP_ENABLE == false) {
	echo "
	<link href='".GP_LOCATE."travian.css?e21d2' rel='stylesheet' type='text/css' />
	<link href='".GP_LOCATE."lang/en/lang.css?e21d2' rel='stylesheet' type='text/css' />";
	} else {
	echo "
	<link href='".$session->gpack."travian.css?e21d2' rel='stylesheet' type='text/css' />
	<link href='".$session->gpack."lang/en/lang.css?e21d2' rel='stylesheet' type='text/css' />";
	}
	?>
	<script type="text/javascript">

		window.addEvent('domready', start);
	</script>
</head>
 
 
<body class="v35 ie ie8">
<div class="wrapper">
<img style="filter:chroma();" src="img/x.gif" id="msfilter" alt="" />
<div id="dynamic_header">
	</div>
<?php include("Templates/header.tpl"); ?>
<div id="mid">
<?php include("Templates/menu.tpl"); ?>
<div id="content"  class="a2b">
<?php 
if(!empty($id)){
	include("Templates/a2b/newdorf.tpl");
}
else if (isset($w)){
	$enforce=$database->getEnforceArray($w,0);
	if($enforce['vref']==$village->wid){
		$to = $database->getVillage($enforce['from']); $ckey=$w;
		include("Templates/a2b/sendback_".$database->getUserField($to['owner'],'tribe',0).".tpl");
	} else { 
		include("Templates/a2b/units_".$session->tribe.".tpl");
		include("Templates/a2b/search.tpl");
	}
} else if (isset($r)){
	$enforce=$database->getEnforceArray($r,0);
	if($enforce['from']==$village->wid){
		$to = $database->getVillage($enforce['from']); $ckey=$r;
		include("Templates/a2b/sendback_".$database->getUserField($to['owner'],'tribe',0).".tpl");
	} else { 
		include("Templates/a2b/units_".$session->tribe.".tpl");
		include("Templates/a2b/search.tpl");
	}
} else {
	if (isset($process['0'])){
		$coor = $database->getCoor($process['0']);
		include("Templates/a2b/attack_".$session->tribe.".tpl");
	}else{
		include("Templates/a2b/units_".$session->tribe.".tpl");
		include("Templates/a2b/search.tpl");
	}
}

?>

<div id="side_info">
<?php
include("Templates/quest.tpl");
include("Templates/news.tpl");
include("Templates/multivillage.tpl");
include("Templates/links.tpl");
?>
</div>
<div class="clear"></div>
</div>
<div class="footer-stopper"></div>
<div class="clear"></div>
<?php 
include("Templates/footer.tpl"); 
include("Templates/res.tpl"); 
?>
<div id="stime">
<div id="ltime">
<div id="ltimeWrap">
<?php echo CALCULATED; ?> <b><?php
echo round(($generator->pageLoadTimeEnd()-$start)*1000);?></b> ms
 
<br /><?php echo SERVER_TIME; ?> <span id="tp1" class="b"><?php echo date('H:i:s'); ?></span>
</div>
	</div>
</div>
<div id="ce"></div>
</body>
</html>