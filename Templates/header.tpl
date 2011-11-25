<div id="header">
	<div id="mtop">
		<a href="dorf1.php" id="n1" accesskey="1"><img src="img/x.gif" title="资源" alt="资源" /></a>
		<a href="dorf2.php" id="n2" accesskey="2"><img src="img/x.gif" title="建筑" alt="建筑" /></a>
		<a href="karte.php" id="n3" accesskey="3"><img src="img/x.gif" title="地图" alt="地图" /></a>
		<a href="statistiken.php" id="n4" accesskey="4"><img src="img/x.gif" title="统计" alt="统计" /></a>
		
        <?php
		//	针对报告或讯息中是否有未读的条目，则显示不同的图片。
        if ($message->unread && !$message->nunread)
		{
			$class = "i2";
        }
        else if (!$message->unread && $message->nunread)
		{
			$class = "i3";
        }
        else if ($message->unread && $message->nunread)
		{
			$class = "i1";
        }
        else
		{
			$class = "i4";
        }
        ?>
		
  		<div id="n5" class="<?php echo $class ?>">
			<a href="berichte.php" accesskey="5"><img src="img/x.gif" class="l" title="报告" alt="报告"/></a>
			<a href="nachrichten.php" accesskey="6"><img src="img/x.gif" class="r" title="讯息" alt="讯息" /></a>
		</div>
		
		<?php
		$MyGold = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE `username`='".$session->username."'") or die(mysql_error());
		$golds = mysql_fetch_array($MyGold);
		$date2 = strtotime("NOW");
		if ($golds['plus'] <= $date2)
		{ 
		?>
		
		<a href="plus.php" id="plus">
			<span class="plus_text">
				<span class="plus_g">金</span>
				<span class="plus_o">币</span>
				<span class="plus_g">功</span>
				<span class="plus_o">能</span>
			</span>
			<img src="img/x.gif" id="btn_plus" class="inactive" title="Plus menu" alt="Plus menu" />
		</a>
		
		<?php 
		}
		else 
		{ 
		?>
		
		<a href="plus.php" id="plus">
			<span class="plus_text">
				<span class="plus_g">金</span>
				<span class="plus_o">币</span>
				<span class="plus_g">功</span>
				<span class="plus_o">能</span>
			</span>
			<img src="img/x.gif" id="btn_plus" class="active" title="Plus menu" alt="Plus menu">
		</a>
			
		<?php 
		} 
		?>
		<div class="clear"></div>
	</div>
</div>