<table class="results defender" cellpadding="1" cellspacing="1">
<thead>
<tr>
	<td class="role">防御方</td>
	<td><img src="img/x.gif" class="unit u31" title="老鼠" alt="老鼠" /></td>
	<td><img src="img/x.gif" class="unit u32" title="蜘蛛" alt="蜘蛛" /></td>
	<td><img src="img/x.gif" class="unit u33" title="蛇" alt="蛇" /></td>
	<td><img src="img/x.gif" class="unit u34" title="蝙蝠" alt="蝙蝠" /></td>
	<td><img src="img/x.gif" class="unit u35" title="野猪" alt="野猪" /></td>
	<td><img src="img/x.gif" class="unit u36" title="狼" alt="狼" /></td>
	<td><img src="img/x.gif" class="unit u37" title="熊" alt="熊" /></td>
	<td><img src="img/x.gif" class="unit u38" title="鳄鱼" alt="鳄鱼" /></td>
	<td><img src="img/x.gif" class="unit u39" title="老虎" alt="老虎" /></td>
	<td><img src="img/x.gif" class="unit u40" title="大象" alt="大象" /></td>
</tr>
</thead>
<tbody>
<tr>
	<th>军队</th>
	<td <?php if (!$form->getValue('a2_31')) { echo "class=\"none\">0"; } else { echo ">".$form->getValue('a2_31'); } ?></td>
	<td <?php if (!$form->getValue('a2_32')) { echo "class=\"none\">0"; } else { echo ">".$form->getValue('a2_32'); } ?></td>
	<td <?php if (!$form->getValue('a2_33')) { echo "class=\"none\">0"; } else { echo ">".$form->getValue('a2_33'); } ?></td>
	<td <?php if (!$form->getValue('a2_34')) { echo "class=\"none\">0"; } else { echo ">".$form->getValue('a2_34'); } ?></td>
	<td <?php if (!$form->getValue('a2_35')) { echo "class=\"none\">0"; } else { echo ">".$form->getValue('a2_35'); } ?></td>
	<td <?php if (!$form->getValue('a2_36')) { echo "class=\"none\">0"; } else { echo ">".$form->getValue('a2_36'); } ?></td>
	<td <?php if (!$form->getValue('a2_37')) { echo "class=\"none\">0"; } else { echo ">".$form->getValue('a2_37'); } ?></td>
	<td <?php if (!$form->getValue('a2_38')) { echo "class=\"none\">0"; } else { echo ">".$form->getValue('a2_38'); } ?></td>
	<td <?php if (!$form->getValue('a2_39')) { echo "class=\"none\">0"; } else { echo ">".$form->getValue('a2_39'); } ?></td>
	<td <?php if (!$form->getValue('a2_40')) { echo "class=\"none\">0"; } else { echo ">".$form->getValue('a2_40'); } ?></td>
</tr>
<tr>
	<th>损失</th>
	<td <?php if (!$troops = $form->getValue('a2_31')) { echo "class=\"none\">0"; } else { echo ">".$dead = round($troops * $_POST['result'][2]); } ?></td>
	<td <?php if (!$troops = $form->getValue('a2_32')) { echo "class=\"none\">0"; } else { echo ">".$dead = round($troops * $_POST['result'][2]); } ?></td>
	<td <?php if (!$troops = $form->getValue('a2_33')) { echo "class=\"none\">0"; } else { echo ">".$dead = round($troops * $_POST['result'][2]); } ?></td>
	<td <?php if (!$troops = $form->getValue('a2_34')) { echo "class=\"none\">0"; } else { echo ">".$dead = round($troops * $_POST['result'][2]); } ?></td>
	<td <?php if (!$troops = $form->getValue('a2_35')) { echo "class=\"none\">0"; } else { echo ">".$dead = round($troops * $_POST['result'][2]); } ?></td>
	<td <?php if (!$troops = $form->getValue('a2_36')) { echo "class=\"none\">0"; } else { echo ">".$dead = round($troops * $_POST['result'][2]); } ?></td>
	<td <?php if (!$troops = $form->getValue('a2_37')) { echo "class=\"none\">0"; } else { echo ">".$dead = round($troops * $_POST['result'][2]); } ?></td>
	<td <?php if (!$troops = $form->getValue('a2_38')) { echo "class=\"none\">0"; } else { echo ">".$dead = round($troops * $_POST['result'][2]); } ?></td>
	<td <?php if (!$troops = $form->getValue('a2_39')) { echo "class=\"none\">0"; } else { echo ">".$dead = round($troops * $_POST['result'][2]); } ?></td>
	<td <?php if (!$troops = $form->getValue('a2_40')) { echo "class=\"none\">0"; } else { echo ">".$dead = round($troops * $_POST['result'][2]); } ?></td>
</tr>
</tbody>
</table>