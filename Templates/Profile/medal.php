<?php
if ($session->gpack == null || GP_ENABLE == false)
{
	$gpack= GP_LOCATE;
}
else
{
	$gpack= $session->gpack;
}

if ($displayarray['protect'] > time())
{
	$uurover=date('H:i:s', ($displayarray['protect'] - time()));
	$profiel = preg_replace("/\[#0]/is", '<img src="'.$gpack.'img/t/tn.gif" border="0" onmouseout="med_closeDescription()" onmousemove="med_mouseMoveHandler(arguments[0],\'<table><tr><td>该玩家的新手保护时间还剩下 '.$uurover.' 小时</td></tr></table>\')">', $profiel, 1);
}
else
{
	$geregistreerd=date('d-m-Y', ($displayarray['timestamp']));
	$profiel = preg_replace("/\[#0]/is",'<img src="'.$gpack.'img/t/tnd.gif" border="0" onmouseout="med_closeDescription()" onmousemove="med_mouseMoveHandler(arguments[0],\'<table><tr><td>该玩家的注册时间为 '.$geregistreerd.'.</td></tr></table>\')">', $profiel, 1);
}

if ($displayarray['username'] == "Natars")
{
	$profiel = preg_replace("/\[#natars]/is",'<img src="'.$gpack.'img/t/t10_2.jpg" border="0" onmouseout="med_closeDescription()" onmousemove="med_mouseMoveHandler(arguments[0],\'<table><tr><td>官方纳塔帐号</td></tr></table>\')">', $profiel, 1);
}

foreach ($varmedal as $medal)
{
	switch ($medal['categorie'])
	{
	case "1":
		$titel = "每周攻击手";
		$woord = "点数";
		break;
	case "2":
		$titel = "每周防御手";
		$woord = "点数";
		break;
	case "3":
		$titel = "每周人口上升";
		$woord = "排名";
		break;
	case "4":
		$titel = "每周资源掠夺";
		$woord = "资源";
		break;
	case "5":
		$titel = "同时在攻击榜和防御榜排名前10因而获得该奖牌";
		$bonus[$medal['id']] = 1;
		break;
	case "6":
		$titel = "在攻击榜上排名前3 ".$medal['points'];
		$bonus[$medal['id']] = 1;
		break;
	case "7":
		$titel = "在防御榜上排名前3 ".$medal['points'];
		$bonus[$medal['id']] = 1;
		break;
	case "8":
		$titel = "在人口上升排名上排名前3 ".$medal['points'];
		$bonus[$medal['id']] = 1;
		break;
	case "9":
		$titel = "在资源掠夺榜上排名前3 ".$medal['points'];
		$bonus[$medal['id']] = 1;
		break;
	}

	if (isset($bonus[$medal['id']]))
	{
		$profiel = preg_replace("/\[#".$medal['id']."]/is", '<img src="'.$gpack.'img/t/'.$medal['img'].'.jpg" border="0" onmouseout="med_closeDescription()" onmousemove="med_mouseMoveHandler(arguments[0],\'<table><tr><td>'.$titel.'<br /><br />每周内获得的奖牌：'.$medal['week'].'</td></tr></table>\')">', $profiel, 1);
	}
	else
	{
		$profiel = preg_replace("/\[#".$medal['id']."]/is",'<img src="'.$gpack.'img/t/'.$medal['img'].'.jpg" border="0" onmouseout="med_closeDescription()" onmousemove="med_mouseMoveHandler(arguments[0],\'<table><tr><td>种类：</td><td>'.$titel.'</td></tr><tr><td>周：</td><td>'.$medal['week'].'</td></tr><tr><td>名次：</td><td>'.$medal['plaats'].'</td></tr><tr><td>'.$woord.'：</td><td>'.$medal['points'].'</td></tr></table>\')">', $profiel, 1);
	}
}
?>