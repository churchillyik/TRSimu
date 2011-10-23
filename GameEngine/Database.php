<?php
//////////////////////////////////////////////////////////////////////////////////////////////////////
//                                             TRAVIANX                                             //
//            Only for advanced users, do not edit if you dont know what are you doing!             //
//                                Made by: Dzoki & Dixie (TravianX)                                 //
//                              - TravianX = Travian Clone Project -                                //
//                                 DO NOT REMOVE COPYRIGHT NOTICE!                                  //
//////////////////////////////////////////////////////////////////////////////////////////////////////

include("config.php");

switch(DB_TYPE) {
	case 1:
	include("Database/db_MYSQLi.php");
	break;
	//case 2:
	//include("Database/db_MSSQL.php");
	//break;
	default:
	include("Database/db_MYSQL.php");
	break;
}
?>