<?php

// *****  错误报告  *****//
// (E_ALL ^ E_NOTICE) = enabled
// (0) = disabled
%ERROR%


// *****  服务器设定  *****//

// 服务器名
define("SERVER_NAME", "%SERVERNAME%");

// 服务器启动时间
// Defines when has server started.
define("COMMENCE", "%STARTTIME%");

// 语言
// Choose your server language.
define("LANG", "%LANG%");

// 资源倍数
// Choose your server speed. NOTICE: Higher speed, more likely
// to have some bugs. Lower speed, most likely no major bugs.
// Values: 1 (normal), 3 (3x speed) etc...
define("SPEED", "%SPEED%");

// 地图大小
// Defines world size. NOTICE: DO NOT EDIT!!
define("WORLD_MAX", "%MAX%");

// 图片包
// True = enabled, false = disabled
// Notice: Gpacks are not 100% done yet.
define("GP_ENABLE", %GP%);

// 图片包路径 (default: gpack/travian_redesign/)
define("GP_LOCATE", "gpack/travian_redesign/");

// 军队移动倍数
// Values: 1 (normal), 3 (3x speed) etc...
define("INCREASE_SPEED", "%INCSPEED%");

// 村庄扩张速度
// 1 = slow village expanding - more Cultural Points needed for every new village
// 0 = fast village expanding - less Cultural Points needed for every new village
define("CP", %VILLAGE_EXPAND%);

// 可拆除建筑等级（中心大楼等级）
// Defines which level of Main building is required to be able to
// demolish. Min value = 1, max value = 20
// Default: 10
define("DEMOLISH_LEVEL_REQ", "%DEMOLISH%");

// 任务
// Ingame quest enabled/disabled.
define("QUEST", %QUEST%);

// 新手保护时长
// 3600 = 1 hour
// 3600*12 = 12 hours
// 3600*24 = 1 day
// 3600*24*3 = 3 days
// You can choose any value you want!
define("PROTECTION", "%BEGINNER%");

// 邮件激活帐号
// true = activation mail will be sent, users will have to finish registration
//        by clicking on link recieved in mail.
// false =  users can register with any mail. Not needed to be real one.
define("AUTH_EMAIL", %ACTIVATE%);


//    **** LOG SETTINGS  ****   //

// 建造日志
define("LOG_BUILD", %LOGBUILD%);

// 科技日志
define("LOG_TECH", %LOGTECH%);

// 登录日志(IP's)
define("LOG_LOGIN", %LOGLOGIN%);

// 金币日志
define("LOG_GOLD_FIN", %LOGGOLDFIN%);

// 管理日志
define("LOG_ADMIN", %LOGADMIN%);

// 战斗日志
define("LOG_WAR", %LOGWAR%);

// 市场日志
define("LOG_MARKET", %LOGMARKET%);

// 非法日志
define("LOG_ILLEGAL", %LOGILLEGAL%);


// ****  新闻盒设定  **** //

//true = enabled
//false = disabled
define("NEWSBOX1", %BOX1%);
define("NEWSBOX2", %BOX2%);
define("NEWSBOX3", %BOX3%);


//   ****  数据库设定  ****   //

// 数据库地址
// example. sql106.000space.com / localhost
// If you host server on own PC than this value is: localhost
// If you use online hosting, value must be written in host cpanel
define("SQL_SERVER", "%SSERVER%");

// 数据库用户名
define("SQL_USER", "%SUSER%");

// 数据库密码
define("SQL_PASS", "%SPASS%");

// 数据库名
define("SQL_DB", "%SDB%");

// 表名前缀
define("TB_PREFIX", "%PREFIX%");

// 数据库类型
// 0 = MYSQL
// 1 = MYSQLi
// default: 1
define("DB_TYPE", %CONNECTT%);


//   ****  其他设定  ****   //

// Censore words
//define("WORD_CENSOR", "%ACTCEN%");

// Words (censore)
// Choose which words do you want to be censored
//define("CENSORED", "%CENWORDS%");

// 邮件限制
// Limits mailbox to defined number of mails. (IGM's)
define("LIMIT_MAILBOX", %LIMIT_MAILBOX%);

// 邮件上限 
// If enabled, define number of maximum mails.
define("MAX_MAIL", "%MAX_MAILS%");

// 管理员是否参与排行
// Include administrator in statistics/rank
define("INCLUDE_ADMIN", %ARANK%);


//   ****  管理员设定  ****   //

// 管理员邮件
define("ADMIN_EMAIL", "%AEMAIL%");

// 管理员名称
define("ADMIN_NAME", "%ANAME%");


//   ****  非必要不要修改的设定  ****   //

define("TRACK_USR", "%UTRACK%");
define("USER_TIMEOUT", "%UTOUT%"); 
define("ALLOW_BURST", false);
define("BASIC_MAX", 1);
define("INNER_MAX", 1);
define("PLUS_MAX", 1);
define("ALLOW_ALL_TRIBE", false);
define("CFM_ADMIN_ACT", true);
define("SERVER_WEB_ROOT", false);
define("USRNM_SPECIAL", true);
define("USRNM_MIN_LENGTH", 3);
define("PW_MIN_LENGTH", 4);
define("BANNED", 0);
define("AUTH", 1);
define("USER", 2);
define("MODERATOR", 5);
define("ADMIN", 9);
define("COOKIE_EXPIRE", 60*60*24*7); 
define("COOKIE_PATH", "/"); 
define("SUBDOMAIN", %SUBDOM%);


//   ****  域名和主页地址  ****   //
define("DOMAIN", "%DOMAIN%");
define("HOMEPAGE", "%HOMEPAGE%");
define("SERVER", "%DOMAIN%");

?>