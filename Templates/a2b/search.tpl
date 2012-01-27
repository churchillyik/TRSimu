	<table id="coords" cellpadding="1" cellspacing="1">
	<tbody>
	<tr>
		<td class="sel">
			<label>
				<input class="radio" name="c" checked="checked" value="2" type="radio">
				增援
			</label>
		</td>
		<td class="vil">
			<span>村庄：</span>
			<input class="text" name="dname" value="" maxlength="20" type="text">
		</td>
	</tr>
	<tr>
		<td class="sel">
			<label>
				<input class="radio" name="c" value="3" type="radio">
				攻击
			</label>
		</td>
		<td class="or">或</td>
	</tr>
	<tr>
		<td class="sel">
			<label>
				<input class="radio" name="c" value="4" type="radio">
				掠夺
			</label>
		</td>

		<?php
		if (isset($_GET['z']))
		{
			$coor = $database->getCoor($_GET['z']);
		}
		else
		{
			$coor['x'] = "";
			$coor['y'] = "";
		}
		?>
		<td class="target">
			<span>x:</span>
			<input class="text" name="x" value="<?php echo $coor['x']; ?>" maxlength="4" type="text">
			<span>y:</span>
			<input class="text" name="y" value="<?php echo $coor['y']; ?>" maxlength="4" type="text">
		</td>
	</tr>
	</tbody>
	</table>

	<input value="ok" name="s1" id="btn_ok" class="dynamic_img" src="img/x.gif" alt="确定" type="image">
</form>
<p class="error"><?php echo $form->getError("error"); ?></p>