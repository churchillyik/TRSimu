<form method="post" action="nachrichten.php">
	<div id="block">
		<input type="hidden" name="ft" value="m6" />
		<textarea name="notizen" id="notice">
			<?php echo $message->note; ?>
		</textarea>
		<p class="btn">
			<input id="btn_save" type="image" value="保存" name="s1" src="img/x.gif" class="dynamic_img" alt"保存" />
			<br />&nbsp;
		</p>
	</div>
</form>
