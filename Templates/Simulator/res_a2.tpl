<table class="results attacker" cellpadding="1" cellspacing="1">
<thead>
<tr>
	<td class="role">攻击方</td>
	<td><img src="img/x.gif" class="unit u11" title="棍棒兵" alt="棍棒兵" /></td>
	<td><img src="img/x.gif" class="unit u12" title="矛兵" alt="矛兵" /></td>
	<td><img src="img/x.gif" class="unit u13" title="斧头兵" alt="斧头兵" /></td>
	<td><img src="img/x.gif" class="unit u14" title="侦查兵" alt="侦查兵" /></td>
	<td><img src="img/x.gif" class="unit u15" title="圣骑士" alt="圣骑士" /></td>
	<td><img src="img/x.gif" class="unit u16" title="日耳曼骑兵" alt="日耳曼骑兵" /></td>
	<td><img src="img/x.gif" class="unit u17" title="冲撞车" alt="冲撞车" /></td>
	<td><img src="img/x.gif" class="unit u18" title="投石器" alt="投石器" /></td>
	<td><img src="img/x.gif" class="unit u19" title="执政官" alt="执政官" /></td>
	<td><img src="img/x.gif" class="unit u20" title="拓荒者" alt="拓荒者" /></td>
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