<div id="textmenu">
	<a href="spieler.php?uid=<?php if (isset($_GET['uid'])) { echo $_GET['uid']; } else { echo $session->uid; } ?>" <?php if (isset($_GET['uid'])) { echo "class=\"selected\""; } ?>>概况</a>
	| 
	<a href="spieler.php?s=1" <?php if (isset($_GET['s']) && $_GET['s'] == 1) { echo "class=\"selected\""; } ?>>个人资料</a>
	| 
	<a href="spieler.php?s=2" <?php if (isset($_GET['s']) && $_GET['s'] == 2) { echo "class=\"selected\""; } ?>>设置</a>
	| 
	<a href="spieler.php?s=3" <?php if (isset($_GET['s']) && $_GET['s'] == 3) { echo "class=\"selected\""; } ?>>帐号</a>
	<?php
	//if (GP_ENABLE)
	{
	?>
	| <a href="spieler.php?s=4" <?php if (isset($_GET['s']) && $_GET['s'] == 4) { echo "class=\"selected\""; } ?>>界面风格</a>
	<?php
	}
	?>
</div>