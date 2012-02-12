<?php
class Mailer
{
	function sendActivate($email, $username, $pass, $act)
	{
		$subject = "欢迎来到 ".SERVER_NAME;
		$message = "
		<html>
		<head>
		<title>欢迎来到 ".SERVER_NAME."</title>
		</head>
		<body>
		<p>感谢您的注册！</p>
		<table>
		<tr>
			<td>昵称：</td>
			<td>$username</td>
			
		</tr>
		<tr>
			<td>密码：</td>
			<td>$pass</td>
		</tr>
		<tr>
			<td>激活码：</td>
			<td>$act</td>
		</tr>
		</table>
		<p>
		请点击下面的链接来激活您的帐号<br />
		".SERVER."activate.php?code=$act
		</p>
		<p>祝好，<br />Travian</p>
		</body>
		</html>";
		$headers = "MIME-Version: 1.0"."\r\n";
		$headers .= "Content-type:text/html;charset=utf8"."\r\n";
		$headers .= "From: 部落战争<Mailer@".SERVER_NAME.".com>\r\n";
		mail($email, $subject, $message, $headers);
	}
};
$mailer = new Mailer;
?>