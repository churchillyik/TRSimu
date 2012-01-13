<form method="post" action="build.php">
	<input type="hidden" name="id" value="<?php echo $id ?>">
	<input type="hidden" name="ft" value="ali1">
	
    <table cellpadding="1" cellspacing="1" id="found">
	<thead>
	<tr>
		<th colspan="2">建立联盟</th>
	</tr>
	</thead>
	<tbody>
	<tr>
		<th>快捷名</th>
		<td class="tag">
			<input class="text" name="ally1" value="<?php echo $form->getValue("ally1"); ?>" maxlength="8">
			<span class="error"><?php echo $form->getError("ally1"); ?></span>
		</td>
	</tr>
	<tr>
		<th>联盟名字</th>
		<td class="nam">
			<input class="text" name="ally2" value="<?php echo $form->getValue("ally2"); ?>" maxlength="25">
			<span class="error"><?php echo $form->getError("ally2"); ?></span>
		</td>
	</tr>
	</tbody>
	</table>
	
	<p>
		<input type="image" value="ok" name="s1" id="btn_ok" class="dynamic_img" src="img/x.gif" alt="确定" />
	</p>
</form>