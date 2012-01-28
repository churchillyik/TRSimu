<table class="results attacker" cellpadding="1" cellspacing="1">
<thead>
<tr>
	<td class="role">攻击方</td>
	<td><img src="img/x.gif" class="unit u1" title="古罗马步兵" alt="古罗马步兵" /></td>
	<td><img src="img/x.gif" class="unit u2" title="禁卫兵" alt="禁卫兵" /></td>
	<td><img src="img/x.gif" class="unit u3" title="帝国兵" alt="帝国兵" /></td>
	<td><img src="img/x.gif" class="unit u4" title="使节骑士" alt="使节骑士" /></td>
	<td><img src="img/x.gif" class="unit u5" title="帝国骑士" alt="帝国骑士" /></td>
	<td><img src="img/x.gif" class="unit u6" title="将军骑士" alt="将军骑士" /></td>
	<td><img src="img/x.gif" class="unit u7" title="冲撞车" alt="冲撞车" /></td>
	<td><img src="img/x.gif" class="unit u8" title="火焰投石器" alt="火焰投石器" /></td>
	<td><img src="img/x.gif" class="unit u9" title="参议员" alt="参议员" /></td>
	<td><img src="img/x.gif" class="unit u10" title="拓荒者" alt="拓荒者" /></td>
</tr>
</thead>
<tbody>
<tr>
	<th>军队</th>
	<td <?php if (!$form->getValue('a1_1')) { echo "class=\"none\">0"; } else { echo ">".$form->getValue('a1_1'); } ?></td>
	<td <?php if (!$form->getValue('a1_2')) { echo "class=\"none\">0"; } else { echo ">".$form->getValue('a1_2'); } ?></td>
	<td <?php if (!$form->getValue('a1_3')) { echo "class=\"none\">0"; } else { echo ">".$form->getValue('a1_3'); } ?></td>
	<td <?php if (!$form->getValue('a1_4')) { echo "class=\"none\">0"; } else { echo ">".$form->getValue('a1_4'); } ?></td>
	<td <?php if (!$form->getValue('a1_5')) { echo "class=\"none\">0"; } else { echo ">".$form->getValue('a1_5'); } ?></td>
	<td <?php if (!$form->getValue('a1_6')) { echo "class=\"none\">0"; } else { echo ">".$form->getValue('a1_6'); } ?></td>
	<td <?php if (!$form->getValue('a1_7')) { echo "class=\"none\">0"; } else { echo ">".$form->getValue('a1_7'); } ?></td>
	<td <?php if (!$form->getValue('a1_8')) { echo "class=\"none\">0"; } else { echo ">".$form->getValue('a1_8'); } ?></td>
	<td <?php if (!$form->getValue('a1_9')) { echo "class=\"none\">0"; } else { echo ">".$form->getValue('a1_9'); } ?></td>
	<td <?php if (!$form->getValue('a1_10')) { echo "class=\"none\">0"; } else { echo ">".$form->getValue('a1_10'); } ?></td>
</tr>
<tr>
	<th>损失</th>
	<td <?php if (!$troops = $form->getValue('a1_1')) { echo "class=\"none\">0"; } else { echo ">".$dead = round($troops * $_POST['result'][1]); } ?></td>
	<td <?php if (!$troops = $form->getValue('a1_2')) { echo "class=\"none\">0"; } else { echo ">".$dead = round($troops * $_POST['result'][1]); } ?></td>
	<td <?php if (!$troops = $form->getValue('a1_3')) { echo "class=\"none\">0"; } else { echo ">".$dead = round($troops * $_POST['result'][1]); } ?></td>
	<td <?php if (!$troops = $form->getValue('a1_4')) { echo "class=\"none\">0"; } else { echo ">".$dead = round($troops * $_POST['result'][1]); } ?></td>
	<td <?php if (!$troops = $form->getValue('a1_5')) { echo "class=\"none\">0"; } else { echo ">".$dead = round($troops * $_POST['result'][1]); } ?></td>
	<td <?php if (!$troops = $form->getValue('a1_6')) { echo "class=\"none\">0"; } else { echo ">".$dead = round($troops * $_POST['result'][1]); } ?></td>
	<td <?php if (!$troops = $form->getValue('a1_7')) { echo "class=\"none\">0"; } else { echo ">".$dead = round($troops * $_POST['result'][1]); } ?></td>
	<td <?php if (!$troops = $form->getValue('a1_8')) { echo "class=\"none\">0"; } else { echo ">".$dead = round($troops * $_POST['result'][1]); } ?></td>
	<td <?php if (!$troops = $form->getValue('a1_9')) { echo "class=\"none\">0"; } else { echo ">".$dead = round($troops * $_POST['result'][1]); } ?></td>
	<td <?php if (!$troops = $form->getValue('a1_10')) { echo "class=\"none\">0"; } else { echo ">".$dead = round($troops * $_POST['result'][1]); } ?></td>
</tr>
</tbody>
</table>