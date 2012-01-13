<div id="textmenu"> 
	<a href="build.php?id=<?php echo $id; ?>" <?php if (!isset($_GET['s'])) { echo "class=\"selected\""; } ?>>训练</a> | 
	<a href="build.php?id=<?php echo $id; ?>&amp;s=2" <?php if (isset($_GET['s']) && $_GET['s'] == 2) { echo "class=\"selected\""; } ?>>文明度</a> | 
	<a href="build.php?id=<?php echo $id; ?>&amp;s=3" <?php if (isset($_GET['s']) && $_GET['s'] == 3) { echo "class=\"selected\""; } ?>>忠诚度</a> | 
	<a href="build.php?id=<?php echo $id; ?>&amp;s=4" <?php if (isset($_GET['s']) && $_GET['s'] == 4) { echo "class=\"selected\""; } ?>>扩张</a> 
</div>