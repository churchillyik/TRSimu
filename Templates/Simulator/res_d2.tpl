<table class="results defender" cellpadding="1" cellspacing="1">
<thead>
<tr>
	<td class="role">防御方</td>
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
	<td <?php if (!$form->getValue('a2_11')) { echo "class=\"none\">0"; } else { echo ">".$form->getValue('a2_11'); } ?></td>
	<td <?php if (!$form->getValue('a2_12')) { echo "class=\"none\">0"; } else { echo ">".$form->getValue('a2_12'); } ?></td>
	<td <?php if (!$form->getValue('a2_13')) { echo "class=\"none\">0"; } else { echo ">".$form->getValue('a2_13'); } ?></td>
	<td <?php if (!$form->getValue('a2_14')) { echo "class=\"none\">0"; } else { echo ">".$form->getValue('a2_14'); } ?></td>
	<td <?php if (!$form->getValue('a2_15')) { echo "class=\"none\">0"; } else { echo ">".$form->getValue('a2_15'); } ?></td>
	<td <?php if (!$form->getValue('a2_16')) { echo "class=\"none\">0"; } else { echo ">".$form->getValue('a2_16'); } ?></td>
	<td <?php if (!$form->getValue('a2_17')) { echo "class=\"none\">0"; } else { echo ">".$form->getValue('a2_17'); } ?></td>
	<td <?php if (!$form->getValue('a2_18')) { echo "class=\"none\">0"; } else { echo ">".$form->getValue('a2_18'); } ?></td>
	<td <?php if (!$form->getValue('a2_19')) { echo "class=\"none\">0"; } else { echo ">".$form->getValue('a2_19'); } ?></td>
	<td <?php if (!$form->getValue('a2_20')) { echo "class=\"none\">0"; } else { echo ">".$form->getValue('a2_20'); } ?></td>
</tr>
<tr>
	<th>损失</th>
	<td <?php if (!$troops = $form->getValue('a2_11')) { echo "class=\"none\">0"; } else { echo ">".$dead = round($troops * $_POST['result'][2]); } ?></td>
	<td <?php if (!$troops = $form->getValue('a2_12')) { echo "class=\"none\">0"; } else { echo ">".$dead = round($troops * $_POST['result'][2]); } ?></td>
	<td <?php if (!$troops = $form->getValue('a2_13')) { echo "class=\"none\">0"; } else { echo ">".$dead = round($troops * $_POST['result'][2]); } ?></td>
	<td <?php if (!$troops = $form->getValue('a2_14')) { echo "class=\"none\">0"; } else { echo ">".$dead = round($troops * $_POST['result'][2]); } ?></td>
	<td <?php if (!$troops = $form->getValue('a2_15')) { echo "class=\"none\">0"; } else { echo ">".$dead = round($troops * $_POST['result'][2]); } ?></td>
	<td <?php if (!$troops = $form->getValue('a2_16')) { echo "class=\"none\">0"; } else { echo ">".$dead = round($troops * $_POST['result'][2]); } ?></td>
	<td <?php if (!$troops = $form->getValue('a2_17')) { echo "class=\"none\">0"; } else { echo ">".$dead = round($troops * $_POST['result'][2]); } ?></td>
	<td <?php if (!$troops = $form->getValue('a2_18')) { echo "class=\"none\">0"; } else { echo ">".$dead = round($troops * $_POST['result'][2]); } ?></td>
	<td <?php if (!$troops = $form->getValue('a2_19')) { echo "class=\"none\">0"; } else { echo ">".$dead = round($troops * $_POST['result'][2]); } ?></td>
	<td <?php if (!$troops = $form->getValue('a2_20')) { echo "class=\"none\">0"; } else { echo ">".$dead = round($troops * $_POST['result'][2]); } ?></td>
</tr>
</tbody>
</table>