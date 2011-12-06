<?php include("Templates/Plus/pmenu.tpl"); ?>
<br />
<div align=center>
	<h2>获得
		<font color=#71D000>黄</font>
		<font color=#FF6F0F>金</font>
		<font color=#71D000>会</font>
		<font color=#FF6F0F>员</font>
	</h2>
	<br />登录后然后点击金币功能链接
	<br />您将会进入金币功能页面
	<br /><i>该金币功能的使用会受到保护，
	<br />帐号名、访问过的页面以及金币使用都会有记录，
	<br />一旦发现作弊行为，将会根据用户协议给予惩罚。</i>
	<br /><br />
</div>

<?php
if (!$_POST['plus'])
{
?>
<form method="POST">
	<table border="0" width="300" align="center">
	<tr>
		<td><b>$session->username</b></td>
	</tr>
	<tr>
		<td align=center>
			<b>请选择奖励：</b>
			<select name="reward">
				<option value="error" selected>选择奖励...</option>
				<option value="p_plus">黄金会员</option>
				<option value="p_b1">木材加成</option>
				<option value="p_b2">粘土加成</option>
				<option value="p_b3">铁矿加成</option>
				<option value="p_b4">粮食加成 </option>";
			</select>
			<br/><br/>
			<input type="submit" name="plus" value="立刻领奖">
		</td>
	</tr>
	</table>
</form>
<?php
}
else
{
    $account = mysql_real_escape_string($_POST['username']);
    $reward = mysql_real_escape_string($_POST['reward']);
    $valid = TRUE;

    if ($reward == "")
	{
        echo "<b>错误：</b><br />请先选择其中一项奖励";
        echo "<br /><br /><input type=\"button\" value=\"后退\" onclick=\"history.go(-1)\">";
        $valid = FALSE;
    }

    if (!$valid)
	{
		break;
	}
    $valid = TRUE; 
    $plusTime = 604800; // 7 days
    $time = time();
    $giveplus = $time + $plustime;
    $accountCheck = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE `username`='".$session->username."'") or die(mysql_error());
    if (mysql_num_rows($accountCheck) <= 0)
	{
        echo "<b>错误：</b><br />";
        echo "您所输入的帐号不存在";
        echo "<br /><br /><input type=\"button\" value=\"Back\" onclick=\"history.go(-1)\">";
        $valid = FALSE;
    }
	if (!$valid)
	{
		break;
	}
    $valid = TRUE;
    $acc = mysql_fetch_array($accountCheck);

    $plusCheck = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE `username`='".$session->username."'") or die(mysql_error());
    $pluss = mysql_fetch_array($plusCheck);

    switch ($reward)
	{
	case 'p_plus':
        $key = 'plus';
        $gldz = '10';
        $url = 'URL=./plus.php?id=3';
        break;
		
	case 'p_b1':
        $key = 'b1';
        $gldz = '5';
        $url = 'URL=./plus.php?id=3';
        break;
		
	case 'p_b2':
        $key = 'b2';
        $gldz = '5';
        $url = 'URL=./plus.php?id=3';
        break;
		
	case 'p_b3':
        $key = 'b3';
        $gldz = '5';
        $url = 'URL=./plus.php?id=3';
        break;
		
	case 'p_b4':
        $key = 'b4';
        $gldz ='5';
        $url ='URL=./plus.php?id=3';
        break;

	default:
		echo '请选择您需要提升产量的资源<br>';
        $valid = FALSE;
        break;
    }
    if (!$valid)
	{
		break;
    }
	$valid = TRUE;
    
    if (mysql_num_rows($plusCheck) > 0)
	{ 
        if ($time > $pluss[$key])
		{
			$editplus = mysql_query("UPDATE ".TB_PREFIX."users SET `{$key}`= `{$key}` + ('".$time."' + '".$plusTime."'),  `gold` =  `gold` - {$gldz}   WHERE `username`='".$session->username."'") or die(mysql_error());
            echo "<META HTTP-EQUIV=Refresh CONTENT=\"2; {$url}\" ><br /><br /><div align=center><font color=green size=4><b>您的状态已经更新了！</b></font></div>";
		}
		else if ($time < $pluss[$key])
		{
            $editplus = mysql_query("UPDATE ".TB_PREFIX."users SET `{$key}`= `{$key}` + '".$plusTime."',  `gold` =  `gold` - {$gldz}  WHERE `username`='".$session->username."'") or die(mysql_error());
            echo "<META HTTP-EQUIV=Refresh CONTENT=\"2; {$url}\" ><br /><br /><div align=center><font color=green size=4><b>您的状态已经更新了！</b></font></div>";
		}
    }
	else
	{
        $insertplus = mysql_query("INSERT INTO ".TB_PREFIX."users (`username`,`{$key}`, `gold`) VALUES ('".$session->username."', ('".$time."' + '".$plusTime."'),`gold` - {$gldz})") or die(mysql_error());
        echo "<META HTTP-EQUIV=Refresh CONTENT=\"3; {$url})\" ><br /><br /><div align=center><font color=green size=4><b>您的状态已经更新了！</b></font></div>";
	}
}
?>