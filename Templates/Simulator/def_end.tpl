<tbody>
<tr>
	<th>其他</th>
</tr>
<tr>
	<td class="details">
		<table cellpadding="1" cellspacing="1">
		<tr>
			<td class="ico"><img src="img/x.gif" class="unit uhab" alt="人口" title="人口" /></td>
			<td class="desc">人口</td>
			<td class="value">
			<input class="text" type="text" name="ew2" value="<?php echo $form->getValue('ew2')==""? 1 : $form->getValue('ew2'); ?>" maxlength="4" title="人口数量" />
			</td>
			<td class="research"></td>
		</tr>
		<?php
		if (in_array(1, $target))
		{
			echo "
			<tr>
				<td class=\"ico\"><img src=\"img/x.gif\" class=\"unit uwall\" alt=\"罗马城墙\" title=\"罗马城墙\" /></td>
				<td class=\"desc\">罗马城墙</td>
				<td class=\"value\">
					<input class=\"text\" type=\"text\" name=\"wall1\" value=\"0\" maxlength=\"2\" title=\"罗马城墙等级\" />
				</td>
				<td class=\"research\"></td>
			</tr>";
		}
		if (in_array(2, $target))
		{
			echo "
			<tr>
				<td class=\"ico\"><img src=\"img/x.gif\" class=\"unit ubarr\" alt=\"日耳曼城墙\" title=\"日耳曼城墙\" /></td>
				<td class=\"desc\">日耳曼城墙</td>
				<td class=\"value\">
					<input class=\"text\" type=\"text\" name=\"wall2\" value=\"0\" maxlength=\"2\" title=\"日耳曼城墙等级\" />
				</td>
				<td class=\"research\"></td>
			</tr>";
		}
		if (in_array(3, $target))
		{
			echo "
			<tr>
				<td class=\"ico\"><img src=\"img/x.gif\" class=\"unit ustock\" alt=\"高卢城墙\" title=\"高卢城墙\" /></td>
				<td class=\"desc\">高卢城墙</td>
				<td class=\"value\">
					<input class=\"text\" type=\"text\" name=\"wall3\" value=\"0\" maxlength=\"2\" title=\"高卢城墙等级\" />
				</td>
				<td class=\"research\"></td>
			</tr>";
		}
		?>
		<tr>
			<td class="ico"><img src="img/x.gif" class="unit upal" alt="皇宫" title="皇宫" /></td>
			<td class="desc" title="皇宫">皇宫</td>
			<td class="value">
				<input class="text" type="text" name="palast" value="<?php echo $form->getValue('palast')==""? 0 : $form->getValue('palast'); ?>" maxlength="2" title="皇宫等级" />
			</td>
			<td class="research"></td>
		</tr>
		<tr>
			<td class="ico"><img src="img/x.gif" class="unit upal" alt="石匠铺" title="石匠铺" /></td>
			<td class="desc" title="石匠铺">石匠铺</td>
			<td class="value">
				<input class="text" type="text" name="stonemason" value="<?php echo $form->getValue('stonemason')==""? 0 : $form->getValue('stonemason'); ?>" maxlength="2" title="石匠铺等级" />
			</td>
			<td class="research"></td>
		</tr>
		</table>
	</td>
</tr>
</tbody>
</table>