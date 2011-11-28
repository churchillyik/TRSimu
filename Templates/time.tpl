<div id="stime">
<div id="ltime">
	<div id="ltimeWrap">
		载入时间：
		<b>
		<?php
		echo round(($generator->pageLoadTimeEnd() - $start) * 1000);
		?>
		</b>毫秒
		<br />
		服务器时间：<span id="tp1" class="b"><?php echo date('H:i:s'); ?></span>
	</div>
</div>
</div>