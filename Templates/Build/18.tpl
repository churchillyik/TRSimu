<div id="build" class="gid18">
	<a href="#" onClick="return Popup(18,4);" class="build_logo">
		<img class="building g18" src="img/x.gif" alt="大使馆" title="大使馆" />
	</a>
	<h1>
		大使馆 
		<span class="level">等级 <?php echo $village->resarray['f'.$id]; ?></span>
	</h1>
	<p class="build_desc">
		如果需要加入联盟，你需要一间大使馆。大使馆是外交官的所在地。当你自己的大使馆有等级3时，你可以自己建立一个联盟，然后每提升1级可邀请额外3名玩家。
	</p>

	<?php
	if ($village->resarray['f'.$id] >= 3 && $session->alliance == 0)
	{
		include("18_create.tpl");
	}
	if ($session->alliance != 0)
	{
		echo "
		<table cellpadding=\"1\" cellspacing=\"1\" id=\"ally_info\">
		<thead>
		<tr>
			<th colspan=\"2\">联盟</th>
		</tr>
		</thead>

		<tbody>
		<tr>
			<th>快捷名</th>
			<td>".$alliance->allianceArray['tag']."</td>
		</tr>
		<tr>
			<th>联盟名字</th>
			<td>".$alliance->allianceArray['name']."</td>
		</tr>
		<tr>
			<td class=\"empty\" colspan=\"2\"></td>
		</tr>
		<tr>
			<td colspan=\"2\"><a href=\"allianz.php\">&nbsp;&raquo; 进入联盟</a></td>
		</tr>
		</tbody>
		</table>";
    }
    else
	{
    ?>
	<form method="post" action="build.php">
		<input type="hidden" name="id" value="<?php echo $id ?>">
		<input type="hidden" name="a" value="2">
		<table cellpadding="1" cellspacing="1" id="join">
		<thead>
		<tr>
			<th colspan="3">加入联盟</th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<?php
			if ($alliance->gotInvite)
			{
				foreach ($alliance->inviteArray as $invite)
				{
					echo "<td class=\"abo\">
					<a href=\"build.php?id=".$id."&a=2&d=".$invite['id']."\">
					<img class=\"del\" src=\"img/x.gif\" alt=\"拒绝\" title=\"拒绝\" />
					</a>
					</td>
					<td class=\"nam\">
					<a href=\"allianz.php?aid=".$invite['alliance']."\">&nbsp;".$database->getAllianceName($invite['alliance'])."</a>
					</td>
					<td class=\"acc\">
					<a href=\"build.php?id=".$id."&a=3&d=".$invite['id']."\">&nbsp;同意</a>
					</td>";
				}
			}
			else
			{
				echo "<td colspan=\"3\" class=\"none\">尚未收到入盟邀请。</td>";
			}
			?>
		</tr>
		</tbody>
		</table>
	</form>
	<?php 
        if ($alliance->gotInvite)
		{
			echo "<p class=\"error2\"></p>";
        }
    }
	include("upgrade.tpl");
	?>
</div>