<?php

if (isset($_POST))
{
	if (!isset($_POST['ft']))
	{
		$_POST = array_map('mysql_real_escape_string', $_POST);
		$_POST = array_map('htmlspecialchars', $_POST);
	}
}

$_GET = array_map('mysql_real_escape_string', $_GET);
$_GET = array_map('htmlspecialchars', $_GET);
$_COOKIE = array_map('mysql_real_escape_string', $_COOKIE);
$_COOKIE = array_map('htmlspecialchars', $_COOKIE);
?>