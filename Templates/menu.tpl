<?php
if(!$session->logged_in){
?>	<div id="side_navi">		<a id="logo" href="<?php echo HOMEPAGE; ?>"><img src="img/x.gif" alt="Travian" /></a>
		<p>		<a href="<?php echo HOMEPAGE; ?>"><?php echo HOME; ?></a>		<a href="login.php"><?php echo LOGIN; ?></a>		<a href="anmelden.php"><?php echo REG; ?></a>		</p>	</div>
<?php
}
else {
?>	<div id="side_navi">		<a id="logo" href="<?php echo HOMEPAGE; ?>">		<img src="img/x.gif" <?php if($session->plus) { echo "class=\"logo_plus\""; } ?> alt="Travian" /></a>				<p>		<a href="<?php echo HOMEPAGE; ?>"><?php echo HOME; ?></a>		<a href="spieler.php?uid=<?php echo $session->uid ?>"><?php echo PROFILE; ?></a>		<?php 		if($session->access == ADMIN)		{			echo "<a href=\"Admin/admin.php\">管理面板</a>";			echo "<a href=\"massmessage.php\">群消息</a>";			echo "<a href=\"medals.php\">更新前10玩家</a>";			echo "<a href=\"#\"><strike>系统讯息</strike></a>";
			echo "<a href=\"gold.php\">赠送35金币</a>";		}		?>		<a href="logout.php"><?php echo LOGOUT; ?></a>		</p>				<p>		<a href="#">论坛</a>		</p>		
		<p>
		</p>				<p>		<a href="plus.php?id=3"> 			<b>				<span class="plus_g">金</span>				<span class="plus_o">币</span>				<span class="plus_g">功</span>				<span class="plus_o">能</span>			</b>		</a>		<a href="spieler.php?uid=0"><b>客服支持</b></a>		<a href="contact.php">联系我们！</a>		<br />		</p>	</div>
	<?php
	if($_SESSION['ok']=='1')	{
	?>
		<div id="content" class="village1">
			<h1>公告</h1>			<h2>亲爱的<?php echo $session->username; ?>，你好！</h2>			<br />			<?php include("Templates/text.tpl"); ?>			<center><a href="dorf1.php?ok"><h2>&raquo; 继续游戏</h2></a></center>
		</div>
		<div id="side_info">
			<?php
			include("Templates/quest.tpl");
			include("Templates/news.tpl");
			include("Templates/multivillage.tpl");
			include("Templates/links.tpl");
			?>
		</div>
		<div class="clear"></div>
		<div class="footer-stopper"></div>
		<div class="clear"></div>
		<?php 
		include("Templates/footer.tpl");
		include("Templates/res.tpl");
		include("Templates/time.tpl");
		?>
		<div id="ce"></div>
		<?php		die();
	}
}
?>