<div id="textmenu"> 
	<a href="build.php?id=<?php echo $id; ?>"<?php if (!isset($_GET['t'])) { echo "class=\"selected\""; } ?>">运送资源</a> | 
	<a href="build.php?id=<?php echo $id; ?>&amp;t=1" <?php if (isset($_GET['t']) && $_GET['t'] == 1) { echo "class=\"selected\""; } ?>>买进</a> | 
	<a href="build.php?id=<?php echo $id; ?>&amp;t=2" <?php if (isset($_GET['t']) && $_GET['t'] == 2) { echo "class=\"selected\""; } ?>>卖出</a> 
	<?php
	if ($session->userinfo['gold'] > 3)
	{
	?> | 
	<a href="build.php?id=<?php echo $id; ?>&amp;t=3" <?php if (isset($_GET['t']) && $_GET['t'] == 3) { echo "class=\"selected\""; } ?>>与电脑商人交易</a> 
	<?php
	}
	?>
</div>