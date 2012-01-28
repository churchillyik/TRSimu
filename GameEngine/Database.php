<?php
include("config.php");

switch (DB_TYPE)
{
case 1:
	include("Database/db_MYSQLi.php");
	break;
default:
	include("Database/db_MYSQL.php");
	break;
}
?>