<?php
$count = "0";
include("GameEngine/Config.php");

$connection = mysql_connect(SQL_SERVER, SQL_USER, SQL_PASS) or die(mysql_error());
mysql_select_db(SQL_DB, $connection) or die(mysql_error());

$q = "SELECT * FROM ".TB_PREFIX."movement where endtime < ".time()." and proc = 0";
$result = mysql_query($q, $connection);
$count = mysql_num_rows($result);
?>

<h1>
	<img class="point" src="img/x.gif" alt="" title="" /> 消息堵塞(00:00:0?)
</h1>

<p>
	目前发送的消息将由消息系统来作延迟的运算处理。在服务器超负荷或者网页服务器和数据库之间的连接出现堵塞时，就会发生该种情况。
	<br />
	当服务器收到的消息数量超过其运算处理的数量，例如建筑建造完成和军队抵达目的地，该消息将会被扔进一个等待处理的队列。
	<br />
	即便在消息堵塞的时候，军队仍然会按时间顺序移动，所以军队仍然会正常抵达目的地，首先抵达的仍然会首先抵达。
	<br />
	玩家用户除了等待不需要进行任何操作，正常情况下，这种情况将会在几分钟内自动恢复。当前消息队列中还有<b><?php echo $count; ?></b>条等待处理。
</p>

<map id="nav" name="nav">
	<area href="manual.php?s=1" title="上一页" coords="0,0,45,18" shape="rect" alt="" />
	<area href="manual.php?s=1" title="总览" coords="46,0,70,18" shape="rect" alt="" />
	<area href="manual.php?s=1" title="下一页" coords="71,0,116,18" shape="rect" alt="" />
</map>
<img usemap="#nav" src="img/x.gif" class="navi" alt="" />