<table class="results defender" cellpadding="1" cellspacing="1">
<thead>
<tr>
	<td class="role">防御方</td>
	<td><img src="img/x.gif" class="unit u21" title="方阵兵" alt="方阵兵" /></td>
	<td><img src="img/x.gif" class="unit u22" title="剑士" alt="剑士" /></td>
	<td><img src="img/x.gif" class="unit u23" title="探路者" alt="探路者" /></td>
	<td><img src="img/x.gif" class="unit u24" title="雷法师" alt="雷法师" /></td>
	<td><img src="img/x.gif" class="unit u25" title="德鲁伊骑兵" alt="德鲁伊骑兵" /></td>
	<td><img src="img/x.gif" class="unit u26" title="海顿圣骑士" alt="海顿圣骑士" /></td>
	<td><img src="img/x.gif" class="unit u27" title="冲撞车" alt="冲撞车" /></td>
	<td><img src="img/x.gif" class="unit u28" title="投石器" alt="投石器" /></td>
	<td><img src="img/x.gif" class="unit u29" title="首领" alt="首领" /></td>
	<td><img src="img/x.gif" class="unit u30" title="拓荒者" alt="拓荒者" /></td>
</tr>
</thead>
<tbody>
<tr>
	<th>军队</th>
	<td <?php if (!$form->getValue('a2_21')) { echo "class=\"none\">0"; } else { echo ">".$form->getValue('a2_21'); } ?></td>
	<td <?php if (!$form->getValue('a2_22')) { echo "class=\"none\">0"; } else { echo ">".$form->getValue('a2_22'); } ?></td>
	<td <?php if (!$form->getValue('a2_23')) { echo "class=\"none\">0"; } else { echo ">".$form->getValue('a2_23'); } ?></td>
	<td <?php if (!$form->getValue('a2_24')) { echo "class=\"none\">0"; } else { echo ">".$form->getValue('a2_24'); } ?></td>
	<td <?php if (!$form->getValue('a2_25')) { echo "class=\"none\">0"; } else { echo ">".$form->getValue('a2_25'); } ?></td>
	<td <?php if (!$form->getValue('a2_26')) { echo "class=\"none\">0"; } else { echo ">".$form->getValue('a2_26'); } ?></td>
	<td <?php if (!$form->getValue('a2_27')) { echo "class=\"none\">0"; } else { echo ">".$form->getValue('a2_27'); } ?></td>
	<td <?php if (!$form->getValue('a2_28')) { echo "class=\"none\">0"; } else { echo ">".$form->getValue('a2_28'); } ?></td>
	<td <?php if (!$form->getValue('a2_29')) { echo "class=\"none\">0"; } else { echo ">".$form->getValue('a2_29'); } ?></td>
	<td <?php if (!$form->getValue('a2_30')) { echo "class=\"none\">0"; } else { echo ">".$form->getValue('a2_30'); } ?></td>
</tr>
<tr>
	<th>损失</th>
	<td <?php if (!$troops = $form->getValue('a2_21')) { echo "class=\"none\">0"; } else { echo ">".$dead = round($troops * $_POST['result'][2]); } ?></td>
	<td <?php if (!$troops = $form->getValue('a2_22')) { echo "class=\"none\">0"; } else { echo ">".$dead = round($troops * $_POST['result'][2]); } ?></td>
	<td <?php if (!$troops = $form->getValue('a2_23')) { echo "class=\"none\">0"; } else { echo ">".$dead = round($troops * $_POST['result'][2]); } ?></td>
	<td <?php if (!$troops = $form->getValue('a2_24')) { echo "class=\"none\">0"; } else { echo ">".$dead = round($troops * $_POST['result'][2]); } ?></td>
	<td <?php if (!$troops = $form->getValue('a2_25')) { echo "class=\"none\">0"; } else { echo ">".$dead = round($troops * $_POST['result'][2]); } ?></td>
	<td <?php if (!$troops = $form->getValue('a2_26')) { echo "class=\"none\">0"; } else { echo ">".$dead = round($troops * $_POST['result'][2]); } ?></td>
	<td <?php if (!$troops = $form->getValue('a2_27')) { echo "class=\"none\">0"; } else { echo ">".$dead = round($troops * $_POST['result'][2]); } ?></td>
	<td <?php if (!$troops = $form->getValue('a2_28')) { echo "class=\"none\">0"; } else { echo ">".$dead = round($troops * $_POST['result'][2]); } ?></td>
	<td <?php if (!$troops = $form->getValue('a2_29')) { echo "class=\"none\">0"; } else { echo ">".$dead = round($troops * $_POST['result'][2]); } ?></td>
	<td <?php if (!$troops = $form->getValue('a2_30')) { echo "class=\"none\">0"; } else { echo ">".$dead = round($troops * $_POST['result'][2]); } ?></td>
</tr>
</tbody>
</table>