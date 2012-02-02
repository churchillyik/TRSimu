<?php
include(dirname(__FILE__)."/config.php");

switch (DB_TYPE)
{
case 1:
	include(dirname(__FILE__)."/Database/db_MYSQLi.php");
	break;
default:
	include(dirname(__FILE__)."/Database/db_MYSQL.php");
	break;
}
?>