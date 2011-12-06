<div id="textmenu">
	<a href="nachrichten.php" <?php if (!isset($_GET['t'])) { echo "class=\"selected\""; } ?>>收件箱</a> | 
	<a href="nachrichten.php?t=1" <?php if (isset($_GET['t']) && $_GET['t'] == 1) { echo "class=\"selected\""; } ?> >讯息撰写</a> | 
	<a href="nachrichten.php?t=2" <?php if (isset($_GET['t']) && $_GET['t'] == 2) { echo "class=\"selected\""; } ?> >已发讯息</a>
	<?php 
	if ($session->plus)
	{
		echo " | <a href=\"nachrichten.php?t=3\"";
		if (isset($_GET['t']) && $_GET['t'] == 3)
		{
			echo "class=\"selected\"";
		}
		echo ">存档</a> | <a href=\"nachrichten.php?t=4\"";
		if (isset($_GET['t']) && $_GET['t'] == 4)
		{
			echo "class=\"selected\"";
		}
		echo ">记事本</a>";
	}
	?>
</div>