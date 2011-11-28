<div id="content" class="plus">
<h1>Travian 
	<font color="#71D000">金</font>
	<font color="#FF6F0F">币</font>
	<font color="#71D000">功</font>
	<font color="#FF6F0F">能</font>
</h1>
<div id="textmenu">
	<a href="plus.php?id=1" 
	<?php 
	if (isset($_GET['id']) && $_GET['id'] == 1)
	{
		echo "class=\"selected\"";
	}
	?>
	>金币购买</a> | 
	<a href="plus.php?id=2" 
	<?php 
	if (isset($_GET['id']) && $_GET['id'] == 2)
	{
		echo "class=\"selected\"";
	}
	?>
	>功能介绍 </a> | 
	<a href="plus.php?id=3" 
	<?php 
	if (!isset($_GET['id']))
	{
		echo "class=\"selected\"";
	}
	else if (isset($_GET['id']) && $_GET['id'] == 3)
	{
		echo "class=\"selected\"";
	}
	else if (isset($_GET['id']) && $_GET['id'] >= 6)
	{
		echo "class=\"selected\"";
	}
	?>
	>增值服务</a> | 
	<a href="plus.php?id=4" 
	<?php 
	if (isset($_GET['id']) && $_GET['id'] == 4)
	{
		echo "class=\"selected\"";
	}
	?>
	>常见问题</a> | 
	<a href="plus.php?id=5" 
	<?php 
	if (isset($_GET['id']) && $_GET['id'] == 5)
	{
		echo "class=\"selected\"";
	}
	?>
	>挣金币</a>
</div>