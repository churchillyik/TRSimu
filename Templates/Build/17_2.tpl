<div id="build" class="gid17">
	<a href="#" onClick="return Popup(17,4);" class="build_logo"> 
		<img class="building g17" src="img/x.gif" alt="Marketplace" title="Marketplace" /> 
	</a> 
	<h1>
		市场 
		<span class="level">等级 <?php echo $village->resarray['f'.$id]; ?></span>
	</h1> 
	<p class="build_desc">
		在市场你可以和其他玩家交易资源。而市场每升一级，你便可以多一个商人帮你运送资源。
	</p>
 
	<?php include("17_menu.tpl"); ?>

	<form method="POST" action="build.php">
		<input type="hidden" name="id" value="<?php echo $id; ?>" /> 
		<input type="hidden" name="ft" value="mk2" /> 
	 
		<table id="sell" cellpadding="1" cellspacing="1">
		<tr> 
			<th>提供</th> 
			<td class="val"><input class="text" tabindex="1" name="m1" value="" maxlength="6" /></td> 
			<td class="res"> 
				<select name="rid1" tabindex="2" class="dropdown"> 
					<option value="1" selected="selected">木材</option> 
					<option value="2">粘土</option> 
					<option value="3">铁矿</option> 
					<option value="4">粮食</option> 
				</select> 
			</td> 
			<td class="tra">
				<input class="check" type="checkbox" tabindex="5" name="d1" value="1" /> 最大运输时间：
				<input class="text" tabindex="6" name="d2" value="2" maxlength="2" /> 小时
			</td>
		</tr>
		<tr> 
			<th>需求</th> 
			<td class="val"><input class="text" tabindex="3" name="m2" value="" maxlength="6" /></td> 
			<td class="res"> 
				<select name="rid2" tabindex="4" class="dropdown"> 
					<option value="1">木材</option> 
					<option value="2" selected="selected">粘土</option> 
					<option value="3">铁矿</option> 
					<option value="4">粮食</option> 
				</select> 
			</td> 
			<td class="al">
				<?php 
				if ($session->userinfo['alliance'] != 0)
				{
					echo "<input class=\"check\" type=\"checkbox\" tabindex=\"7\" name=\"ally\" value=\"1\" /> 仅限于自己联盟的成员可买";
				}
				?> 
			</td>
		</tr> 
		</table>
		<p>商人：<?php echo $market->merchantAvail(); ?>/<?php echo $market->merchant; ?></p>
		<p><input type="image" tabindex="8" value="ok" name="s1" id="btn_ok" class="dynamic_img" src="img/x.gif" alt="确定" <?php if (!$market->merchantAvail()) { echo "不可挂售"; }?>/></p>
	</form>

	<?php
	if (count($market->onmarket) > 0)
	{
		echo "<table id=\"sell_overview\" cellpadding=\"1\" cellspacing=\"1\">
			<thead>
			<tr>
				<th colspan=\"6\">我挂售的货物</th>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>提供</td>
				<td>需求</td>
				<td>商人</td>
				<td>联盟</td>
				<td>需时</td>
			</tr>
			</thead>
			<tbody>";
		foreach ($market->onmarket as $offer)
		{
			echo "<tr>
				<td class=\"abo\">
					<a href=\"build.php?id=$id&t=2&a=5&del=".$offer['id']."\"><img class=\"del\"src=\"img/x.gif\" alt=\"删除\" title=\"删除\" /></a>
				</td>";
			echo "<td class=\"val\">";
			switch ($offer['gtype'])
			{
				case 1: echo "<img src=\"img/x.gif\" class=\"r1\" alt=\"木材\" title=\"木材\" />"; break;
				case 2: echo "<img src=\"img/x.gif\" class=\"r2\" alt=\"粘土\" title=\"粘土\" />"; break;
				case 3: echo "<img src=\"img/x.gif\" class=\"r3\" alt=\"铁矿\" title=\"铁矿\" />"; break;
				case 4: echo "<img src=\"img/x.gif\" class=\"r4\" alt=\"粮食\" title=\"粮食\" />"; break;
			}
			echo $offer['gamt'];
			echo "</td>
				<td class=\"val\">";
			switch ($offer['wtype'])
			{
				case 1: echo "<img src=\"img/x.gif\" class=\"r1\" alt=\"木材\" title=\"木材\" />"; break;
				case 2: echo "<img src=\"img/x.gif\" class=\"r2\" alt=\"粘土\" title=\"粘土\" />"; break;
				case 3: echo "<img src=\"img/x.gif\" class=\"r3\" alt=\"铁矿\" title=\"铁矿\" />"; break;
				case 4: echo "<img src=\"img/x.gif\" class=\"r4\" alt=\"粮食\" title=\"粮食\" />"; break;
			}
			echo $offer['wamt'];
			echo "</td>
				<td class=\"tra\">1</td>
				<td class=\"al\">";
			echo ($offer['alliance'] == 0)? 'No' : 'Yes';
			echo "</td><td class=\"dur\">";
			if ($offer['maxtime'] != 0)
			{
				echo $offer['maxtime'] / 3600;
				echo " 小时";
			}
			else
			{
				echo "全部";
			}
			echo "</td></tr>";
		}
		echo "</table>";
	}
	?>
</div> 