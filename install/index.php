<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>Travian 安装</title>
<link REL="shortcut icon" HREF="../favicon.ico"/>
<link rel=stylesheet type="text/css" href="main.css"/>
<meta name="content-language" content="cn"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="imagetoolbar" content="no"/>
<style type="text/css" media="screen"></style>
</head>

<body>
<div id="ltop1"></div>
<div id="lmidall">
<div id="lmidlc">

<div id="lleft">
<div id="lmenu">
<ul>
<?php
//	侧边的安装进度栏
//	c2 当前的进度
//	c3 已完成的进度
//	c1 未完成的进度
if(isset($_GET['s'])) 
{
	switch($_GET['s']) 
	{
		case 1:
			echo 
			"<li class=\"c3 f9\">简介</li>
			<li class=\"c2 f9\">配置选项</li>
			<li class=\"c1 f9\">创建数据库</li>
			<li class=\"c1 f9\">创建地图</li>
			<li class=\"c1 f9\">安装结束</li>";
			break;
		case 2:
			echo 
			"<li class=\"c3 f9\">简介</li>
			<li class=\"c3 f9\">配置选项</li>
			<li class=\"c2 f9\">创建数据库</li>
			<li class=\"c1 f9\">创建地图</li>
			<li class=\"c1 f9\">安装结束</li>";
			break;
		case 3:
			echo 
			"<li class=\"c3 f9\">简介</li>
			<li class=\"c3 f9\">配置选项</li>
			<li class=\"c3 f9\">创建数据库</li>
			<li class=\"c2 f9\">创建地图</li>
			<li class=\"c1 f9\">安装结束</li>";
			break;
		case 4:
			echo 
			"<li class=\"c3 f9\">简介</li>
			<li class=\"c3 f9\">配置选项</li>
			<li class=\"c3 f9\">创建数据库</li>
			<li class= \"c3 f9\">创建地图</li>
			<li class=\"c2 f9\">安装结束</li>";
			break;
	}
}
else 
{
	echo 
	"<li class=\"c2 f9\">简介</li>
	<li class=\"c1 f9\">配置选项</li>
	<li class=\"c1 f9\">创建数据库</li>
	<li class=\"c1 f9\">创建地图</li>
	<li class=\"c1 f9\">安装结束</li>";
}
?>
</ul>
</div>
</div>

<div id="lmid1">
<div id="lmid2">
<?php
if(!isset($_GET['s'])) 
{
	include("templates/greet.tpl");
}
else 
{
	switch($_GET['s'])
	{
		case 1:
			include("templates/config.tpl");
			break;
		case 2:
			include("templates/dataform.tpl");
			break;
		case 3:
			include("templates/field.tpl");
			break;
		case 4:
			include("templates/end.tpl");
			break;
	}
}
?>
</div>
</div>

<div id="lright1"></div>
<style media="screen" type="text/css">#lmidall{width:950px;}</style>

</div>
</div>

</body></html>