<?php
include_once("GameEngine/Account.php");
mysql_connect(SQL_SERVER, SQL_USER, SQL_PASS);
mysql_select_db(SQL_DB);
if ($session->access < ADMIN) die("Haxor go away!");
mysql_query("UPDATE ".TB_PREFIX."users SET gold = gold + 35 WHERE id != '0'");
echo "Done <br />&raquo;<a href='dorf1.php'>GO BACK</a>";
mysql_close();
?>