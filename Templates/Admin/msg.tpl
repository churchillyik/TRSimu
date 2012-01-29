<?php
$msg = $database->getMessage($_GET['nid'], 3);
if ($msg)
{
?>
<div id="content" class="messages">
	<h1>讯息</h1>
	<div id="read_head" class="msg_head"></div>
	<div id="read_content" class="msg_content">
		<img src="img/x.gif" id="label" class="read" alt="">
		<div id="heading">
			<div><span class="b">寄信人</span>：<?php echo $database->getUserField($msg[0]['owner'], 'username', 0); ?></div>
			<div><span class="b">手信人</span>：<?php echo $database->getUserField($msg[0]['target'], 'username', 0); ?></div>
			<div>
				<span class="b">主题</span>：<?php echo $msg[0]['topic'];?> 
				<div style="float:right;"><?php echo date('Y.m.d H:i', $msg[0]['time']); ?></div>
			</div>
		</div>
		<div class="clear"></div>
		<div id="line"></div>
		<div class="message" style="margin-top: 10px;">
			<?php echo $msg[0]['message']; ?>
		</div>
	</div>
	<div id="read_foot" class="msg_foot"></div>
</div>
<?php
}
else
{
	echo "讯息ID ".$_GET['nid']." 不存在。";
}
?>