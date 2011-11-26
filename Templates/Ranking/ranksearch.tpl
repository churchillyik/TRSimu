<?php
if (!isset($_GET['id']))
{
	$_GET['id'] = '1';
}
?>
<table cellpadding="1" cellspacing="1" id="search_navi">
<tr>						
	<td>
		<form method="post" action="statistiken.php?id=<?php echo isset($_GET['id'])? $_GET['id'] : 1; ?>">	
		<div class="search">											
			<span>排行<input type="text" class="text ra" maxlength="5" name="rank" value="<?php echo ($search == 0)? $start : $search; ?>" /></span>
			<span class="or">或者</span>
			<span>昵称<input type="text" class="text name" maxlength="20" name="name" value="<?php if (!is_numeric($search)) { echo $search; } ?>" /></span>
			<input type="hidden" name="ft" value="r<?php echo isset($_GET['id'])? $_GET['id'] : 1; ?>" />
			<input type="image" value="确定" name="submit" id="btn_ok" class="dynamic_img" src="img/x.gif" alt="确定" />
		</div>
		</form>
		<div class="navi">
			<?php
			if ($start != 1 && $start + 20 < count($ranking))
			{
				echo "<a href=\"statistiken.php?id=".$_GET['id']."&amp;rank=".($start - 20)."\">&laquo; 上一页</a> | 
				<a href=\"statistiken.php?id=".$_GET['id']."&amp;rank=".($start + 20)."\">下一页 &raquo;</a>";
			}
			else if ($start == 1 && $start + 20 < count($ranking))
			{
				echo "&laquo; 上一页 | <a href=\"statistiken.php?id=".$_GET['id']."&amp;rank=".($start + 20)."\">下一页 &raquo;</a>";
			}
			else if ($start != 1 && $start - 20 < count($ranking))
			{
				echo "<a href=\"statistiken.php?id=".$_GET['id']."&amp;rank=".($start - 20)."\">&laquo; 上一页</a> | 下一页 &raquo;";
			}
			else
			{
				echo "&laquo; 上一页 | 下一页 &raquo;";
			}
			?>
		</div>
	</td>
</tr>
</table>