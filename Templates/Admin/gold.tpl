<?php
mysql_connect(SQL_SERVER, SQL_USER, SQL_PASS);
mysql_select_db(SQL_DB);
if ($session->access < MODERATOR)
mysql_query("UPDATE ".TB_PREFIX."users SET gold = gold + 35 WHERE access < ".MODERATOR);
echo "每个玩家的金币都增加了35单位金币。
mysql_close();
?>