<?php
include("Templates/Plus/pmenu.tpl");

$MyGold = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE `username`='".$session->username."'") or die(mysql_error());
$golds = mysql_fetch_array($MyGold);
if ($golds['13'] <= time())
{
	mysql_query("UPDATE ".TB_PREFIX."users set b1 = '0' where `username`='".$session->username."'") or die(mysql_error());
}
if ($golds['14'] <= time())
{
	mysql_query("UPDATE ".TB_PREFIX."users set b2 = '0' where `username`='".$session->username."'") or die(mysql_error());
}
if ($golds['15'] <= time())
{
	mysql_query("UPDATE ".TB_PREFIX."users set b3 = '0' where `username`='".$session->username."'") or die(mysql_error());
}
if ($golds['16'] <= time())
{
	mysql_query("UPDATE ".TB_PREFIX."users set b4 = '0' where `username`='".$session->username."'") or die(mysql_error());
}

$MyGold = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE `username`='".$session->username."'") or die(mysql_error());
$golds = mysql_fetch_array($MyGold);
$today = date("mdHi");

if (mysql_num_rows($MyGold))
{
	if ($session->gold == 0)
	{
		echo "<p>您现在还没有金币。</p>";
	}
	else
	{
		echo "<p>您现在拥有<b> $session->gold </b>金币。</p>";
	}
}
?>

<table class="plusFunctions" cellpadding="1" cellspacing="1">
<thead>
<tr>
	<th colspan="5">增值服务</th>
</tr>
<tr>
	<td></td>
	<td>服务项</td>
	<td>持续时长</td>
	<td>花费</td>
	<td>操作</td>
</tr>
</thead>
<tbody>
<tr>
	<td class="man">
		<a href="#" onClick="return Popup(0,6);"><img class="help" src="img/x.gif" alt="" title="" /></a>
	</td>
	<td class="desc">
		<p>
		会员帐号
		<span class="run">
			<?php 
			$datetimep = $golds['plus'];
			$datetime1 = $golds['b1'];
			$datetime2 = $golds['b2'];
			$datetime3 = $golds['b3'];
			$datetime4 = $golds['b4'];
			$datetimeap = $golds['ap'];
			$datetimedp = $golds['dp'];

			$date2 = strtotime("NOW");
			if ($datetimep == 0)
			{
				print "（尚未获得）<br>";
			}
			else if ($datetimep <= $date2)
			{
				print "（已过期）<br>";
				mysql_query("UPDATE ".TB_PREFIX."users set plus = '0' where `username`='".$session->username."'") or die(mysql_error());
			}
			else
			{
				$holdtotmin = ($datetimep - $date2) / 60;
				$holdtothr = ($datetimep - $date2) / 3600;
				$holdtotday = intval(($datetimep - $date2) / 86400);
				echo "<font color='#B3B3B3' size='1'>（剩余：<b>".$holdtotday. "</b> 天";

				$holdhr = intval($holdtothr - $holdtotday * 24);	
				echo "<b>".($holdhr)."</b> 时";

				$holdmr=intval($holdtotmin - ($holdhr * 60 + $holdtotday * 1440)); 
				echo "<b> ".($holdmr). "</b> 分）</font>";
			}
			?>
		</span>
		</p>
	</td>
	<td class="dur">7 天</td>
	<td class="cost">
		<img src="img/x.gif" class="gold" alt="金币" title="金币" />10
	</td>
	<td class="act">
		<?php
		$MyGold = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE `username`='".$session->username."'") or die(mysql_error());
		$golds = mysql_fetch_array($MyGold);
		if (mysql_num_rows($MyGold))
		{
			if ($golds['gold'] > 9 && $datetimep < $date2)
			{
				echo '<a href="plus.php?id=8"><span>激活';
			}
			elseif ($golds['gold'] > 9 && $datetimep > $date2)
			{
				echo '<a href="plus.php?id=8"><span>延长';
			}
			else
			{
				echo '<a href="plus.php?id=1"><span class="none">金币不足';}
			}
			echo '</span></a>';
		?>
	</td>
</tr>
<tr>
	<td colspan="5" class="empty"></td>
</tr>

<tr>
	<td class="man">
		<a href="#" onClick="return Popup(1,6);"><img class="help" src="img/x.gif" alt="" title="" /></a>
	</td>
	<td class="desc">
		<p>
		<img class="r1" src="img/x.gif" alt="木材" title="木材" />
		+<b>25</b>% 木材产量
		<span class="run">
			<?php
			$tl_b1 = $golds['b1'];
			if ($tl_b1 < $date2)
			{
				print " ";
			}
			else
			{
				$holdtotmin1 = ($tl_b1 - $date2) / 60;
				$holdtothr1 = ($tl_b1 - $date2) / 3600; 
				$holdtotday1 = intval(($tl_b1 - $date2) / 86400);
				$holdhr1 = intval($holdtothr1 - $holdtotday1 * 24);
				$holdmr1 = intval($holdtotmin1 - ($holdhr1 * 60 + $holdtotday1 * 1440)); 
			}

			if ($tl_b1 < $date2)
			{
				print " ";
			}
			else
			{
				echo "<font color='#B3B3B3' size='1'>剩余：<b> ".$holdtotday1. " </b>天"; 
				echo "<b> ".($holdhr1)." </b> 时";
				echo "<b> ".($holdmr1)." </b> 分</font>";
			}
			?>
			&nbsp;
		</span>
		</p>
	</td>
	<td class="dur">7 天</td>
	<td class="cost"><img src="img/x.gif" class="gold" alt="金币" title="金币" />5</td>
	<td class="act">
		<?php
		if (mysql_num_rows($MyGold))
		{
			if ($golds['gold'] > 4 && $tl_b1 < $date2)
			{
				echo '<a href="plus.php?id=9"><span>激活';
			}
			elseif ($golds['gold'] > 4 && $datetime1 > $date2)
			{
				echo '<a href="plus.php?id=9"><span>延长';
			}
			else
			{
				echo '<a href="plus.php?id=1"><span class="none">金币不足';}
			}
			echo '</span></a>';
		?>
	</td>
</tr>

<tr>
	<td class="man">
		<a href="#" onClick="return Popup(2,6);"><img class="help" src="img/x.gif" alt="" title="" /></a>
	</td>
	<td class="desc">
		<p>
		<img class="r2" src="img/x.gif" alt="粘土" title="粘土" />
		+<b>25</b>% 粘土产量
		<span class="run">
			<?php
			$tl_b2 = $golds['b2'];
			if ($tl_b2 < $date2)
			{
				print " ";
			}
			else
			{
				$holdtotmin2 = ($tl_b2 - $date2) / 60;
				$holdtothr2 = ($tl_b2 - $date2) / 3600;
				$holdtotday2 = intval(($tl_b2 - $date2) / 86400);
				$holdhr2 = intval($holdtothr2 - $holdtotday2 * 24);
				$holdmr2 = intval($holdtotmin2 - ($holdhr2 * 60 + $holdtotday2 * 1440));
			}
			if ($tl_b2 < $date2)
			{
				 print " ";
			}
			else
			{
				echo "<font color='#B3B3B3' size='1'>剩余：<b> ".$holdtotday2. "</b> 天"; 
				echo "<b> ".($holdhr2)." </b>时";
				echo "<b> ".($holdmr2)." </b>分<font>";
			}
			?>
			&nbsp;
		</span>
		</p>
	</td>
	<td class="dur">7 天</td>
	<td class="cost">
		<img src="img/x.gif" class="gold" alt="金币" title="金币" />5
	</td>
	<td class="act">
		<?php
		if (mysql_num_rows($MyGold))
		{
			if ($golds['gold'] > 4 && $tl_b2 < $date2)
			{
				echo '<a href="plus.php?id=10"><span>激活';
			}
			elseif ($golds['gold'] > 4 && $tl_b2 > $date2)
			{
				echo '<a href="plus.php?id=10"><span>延长';
			}
			else
			{
				echo '<a href="plus.php?id=1"><span class="none">金币不足';}
			}
			echo '</span></a>';
		?>
	</td>
</tr>

<tr>
	<td class="man">
		<a href="#" onClick="return Popup(3,6);"><img class="help" src="img/x.gif" alt="" title="" /></a>
	</td>
	<td class="desc">
		<p>
		<img class="r3" src="img/x.gif" alt="铁矿" title="铁矿" />
		+<b>25</b>% 铁矿产量
		<span class="run">
			<?php
			$tl_b3 = $golds['b3'];
			if ($tl_b3 < $date2)
			{
				print " ";
			}
			else
			{
				$holdtotmin3 = ($tl_b3 - $date2) / 60;
				$holdtothr3 = ($tl_b3 - $date2) / 3600;
				$holdtotday3 = intval(($tl_b3 - $date2) / 86400);
				$holdhr3 = intval($holdtothr3 - $holdtotday3 * 24);	
				$holdmr3 = intval($holdtotmin3 - ($holdhr3 * 60 + $holdtotday3 * 1440));
			}
			if ($tl_b3 < $date2)
			{
				print " ";
			}
			else
			{		
				echo "<font color='#B3B3B3' size='1'>剩余：<b> ".$holdtotday3. "</b> 天"; 
				echo "<b> ".($holdhr3)." </b>时";
				echo "<b> ".($holdmr3)." </b>分</font>";
			}
			?>
			&nbsp;
		</span>
		</p>
	</td>
	<td class="dur">7 天</td>
	<td class="cost">
		<img src="img/x.gif" class="gold" alt="金币" title="金币" />5
	</td>
	<td class="act">
		<?php
		if (mysql_num_rows($MyGold))
		{
			if ($golds['gold'] > 4 && $tl_b3  < $date2)
			{
				echo '<a href="plus.php?id=11"><span>激活';
			}
			elseif ($golds['gold'] > 4 && $tl_b3 > $date2)
			{
				echo '<a href="plus.php?id=11"><span>延长';
			}
			else
			{
				echo '<a href="plus.php?id=1"><span class="none">金币不足';
			}
			echo '</a></td>';
		}
		?>
		&nbsp;
	</span>
</tr>

<tr>
	<td class="man">
		<a href="#" onClick="return Popup(4,6);"><img class="help" src="img/x.gif" alt="" title="" /></a>
	</td>
	<td class="desc">
		<p>
		<img class="r4" src="img/x.gif" alt="粮食" title="粮食" />
		+<b>25</b>% 粮食产量
		<span class="run">
			<?php
			$tl_b4 = $golds['b4'];
			if ($tl_b4 < $date2)
			{
				print " ";
			}
			else
			{
				$holdtotmin4 = ($tl_b4 - $date2) / 60;
				$holdtothr4 = ($tl_b4 - $date2) / 3600;
				$holdtotday4 = intval(($tl_b4 - $date2) / 86400);
				$holdhr4 = intval($holdtothr4 - $holdtotday4 * 24);
				$holdmr4 = intval($holdtotmin4 - ($holdhr4 * 60 + $holdtotday4 * 1440));
			}
			if ($tl_b4 < $date2)
			{
				print " ";
			}
			else
			{		
				echo "<font color='#B3B3B3' size='1'>剩余：<b> ".$holdtotday4."</b> 天"; 
				echo "<b> ".($holdhr4)." </b> 时";
				echo "<b> ".($holdmr4)." </b> 分</font>";
			}
			?>
			&nbsp;
		</span>
		</p>
	</td>
	<td class="dur">7 天</td>
	<td class="cost">
		<img src="img/x.gif" class="gold" alt="金币" title="金币" />5
	</td>
	<td>
		<?php
		if (mysql_num_rows($MyGold))
		{
			if ($golds['gold'] > 4 && $tl_b4 < $date2)
			{
				echo '<a href="plus.php?id=12"><span>激活';
			}
			elseif ($golds['gold'] > 4 && $tl_b4 > $date2)
			{
				echo '<a href="plus.php?id=12"><span>延长';
			}
			else
			{
				echo '<a href="plus.php?id=1"><span class="none">金币不足';}
			}
			echo '</span></a>';
		?>
	</td>
</tr>

<tr>
	<td colspan="5" class="empty"></td>
</tr>

<tr>
	<td class="man">
		<a href="#" onClick="return Popup(7,6);"><img class="help" src="img/x.gif" alt="" title="" /></a>
	</td>
	<td class="desc">
		<p>
		立即结束当前建筑和研究任务
		<br />
		（行宫和皇宫除外）
		</p>
	</td>
	<td class="dur">立即有效</td>
	<td class="cost"><img src="img/x.gif" class="gold" alt="金币" title="金币" />2</td>
	<td class="act">
		<?php
		if (mysql_num_rows($MyGold))
		{
			if ($golds['gold'] > 1)
			{
				echo '<a href="plus.php?id=7"><span>开启';
			}
			else
			{
				echo '<a href="plus.php?id=1"><span class="none">金币不足';
			}
			echo '</span></a>';
		}
		?>
	</td>
</tr>

<tr>
	<td class="man">
		<a href="#" onClick="return Popup(8,6);"><img class="help" src="img/x.gif" alt="" title="" /></a>
	</td>
	<td class="desc">
		<p>
		和电脑商人以1：1的比例交换任何资源
		</p>
	</td>
	<td class="dur">立即有效</td>
	<td class="cost"><img src="img/x.gif" class="gold" alt="金币" title="金币" />3</td>
	<td class="act">
		<?php
		if (mysql_num_rows($MyGold))
		{
			if ($golds['gold'] > 2)
			{
				echo '<a href="plus.php?id=13"><span>进入交易市场';
			}
			else
			{
				echo '<a href="plus.php?id=1"><span class="none">金币不足';
			}
			echo '</span></a>';
		}
		?>
	</td>
</tr>
</tbody>
</table>

<table class="plusFunctions" cellpadding="1" cellspacing="1">
<thead>
<tr>
	<th colspan="5">Travian黄金会员俱乐部</th>
</tr>
<tr>
	<td></td>
	<td>服务项</td>
	<td>持续时间</td>
	<td>花费</td>
	<td>操作</td>
</tr>
</thead>
<tbody>
<tr>
	<td class="man">
		<a href="#" onClick="return Popup(9,6);"><img class="help" src="img/x.gif" alt="" title="" /></a>
	</td>
	<td class="desc">
		<p>
		<b>黄金会员俱乐部</b>
		</p>
	</td>
	<td class="dur">一个游戏轮回</td>
	<td class="cost"><img src="img/x.gif" class="gold" alt="金币" title="金币" />100</td>
	<td class="act">
		<?php
		if (mysql_num_rows($MyGold))
		{
			if ($golds['gold'] > 99 && $golds['access'] > 4)
			{
				echo '<a href="plus.php?id=7"><span>激活';
			}
			elseif ($datetimep > $date2)
			{
				echo '<a href="plus.php?s=3"><span>开启';
			}
			else
			{
				echo '<a href="plus.php?id=1"><span class="none">金币不足';}
			}
			echo '</span></a>';
		?>
	</td>
</tr>
</tbody>
</table>