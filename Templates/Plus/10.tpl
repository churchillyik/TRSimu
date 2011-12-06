<?php
$MyGold = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE `username`='".$session->username."'") or die(mysql_error());
$golds = mysql_fetch_array($MyGold);
$MyId = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE `username`='".$session->username."'") or die(mysql_error());
$uuid = mysql_fetch_array($MyId);
$MyVilId = mysql_query("SELECT * FROM ".TB_PREFIX."bdata WHERE `wid`='".$village->wid."'") or die(mysql_error());
$uuVilid = mysql_fetch_array($MyVilId);
$goldlog = mysql_query("SELECT * FROM ".TB_PREFIX."gold_fin_log") or die(mysql_error());
$today = date("mdHi");

if (mysql_num_rows($MyGold))
{
	if ($golds['6'] > 2)
	{
		if (mysql_num_rows($MyGold))
		{
			if ($golds['14'] <= time())
			{
				mysql_query("UPDATE ".TB_PREFIX."users set b2 = '0' where `username`='".$session->username."'") or die(mysql_error());
			}
			if ($golds['14'] == 0)
			{
				mysql_query("UPDATE ".TB_PREFIX."users set b2 = '".mktime(date("H"), date("i"), date("s"), date("m"), date("d") + 7, date("Y"))."' where `username`='".$session->username."'") or die(mysql_error());
			}
			else
			{
				mysql_query("UPDATE ".TB_PREFIX."users set b2 = '".($golds['14'] + 604800)."' where `username`='".$session->username."'") or die(mysql_error());
			}
			$done1 = "&nbsp;&nbsp; 粘土产量 +25%";
			mysql_query("UPDATE ".TB_PREFIX."users set gold = ".($session->gold - 5)." where `username`='".$session->username."'") or die(mysql_error());
			mysql_query("INSERT INTO ".TB_PREFIX."gold_fin_log VALUES ('".(mysql_num_rows($goldlog) + 1)."', '".$village->wid."', '+25% 粘土产量成功')") or die(mysql_error());
		}
		else
		{
			$done1 = "&nbsp;&nbsp; 使用粘土产量提升失败";
			mysql_query("INSERT INTO ".TB_PREFIX."gold_fin_log VALUES ('".(mysql_num_rows($goldlog)+1)."', '".$village->wid."', '+25% 粘土产量失败')") or die(mysql_error());
		}
	}
	else
	{
		$done1 = "&nbsp;&nbsp; 您的金币不足";
	}
}
print "<BR><BR><BR><BR>";
echo $done1;
print "<BR>";

include("Templates/Plus/3.tpl");

?>