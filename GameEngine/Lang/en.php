<?php

//	全局
define("HOME","主页");
define("INSTRUCT","新手指引");
define("LOGIN","登录");
define("LOGOUT","登出");
define("REG","注册");
define("FORUM","论坛");
define("CHAT","聊天");
define("IMPRINT","Imprint");
define("PROFILE","个人资料");
define("SUPPORT","支持");
define("USRNM_EMPTY","（用户名为空）");
define("USRNM_TAKEN","（该用户名已被注册。）");
define("USRNM_SHORT","（用户名长度至少为".USRNM_MIN_LENGTH."个英文字符）");
define("USRNM_CHAR","（无效的用户名）");
define("PW_EMPTY","（密码为空）");
define("PW_SHORT","（用户名长度至少为".PW_MIN_LENGTH."个英文字符）");
define("PW_INSECURE","（为安全起见，密码最好用数字和英文字母混合搭配）");
define("EMAIL_EMPTY","（电子邮箱为空）");
define("EMAIL_INVALID","（无效的电子邮箱地）");
define("EMAIL_TAKEN","（该电子邮箱已被注册）");
define("TRIBE_EMPTY","<li>请选择种族</li>");
define("AGREE_ERROR","<li>您需要同意游戏规则后方可注册。</li>");
define("LOGIN_USR_EMPTY","输入用户名");
define("LOGIN_PASS_EMPTY","输入密码");
define("EMAIL_ERROR","电子邮箱不匹配");
define("PASS_MISMATCH","密码不匹配");
define("ALLI_OWNER","联盟盟主才可踢除成员");
define("SIT_ERROR","代管已经设定好");
define("USR_NT_FOUND","该用户名不存在");
define("LOGIN_PW_ERROR","密码是错误的");
define("LUMBER","木材");
define("CLAY","粘土");
define("IRON","铁矿");
define("CROP","粮食");
define("LEVEL","等级");
define("CROP_COM",CROP."消耗");
define("PER_HR","单位/时");
define("PROD_HEADER","产量");
define("MULTI_V_HEADER","村庄");
define("WEL_TOPIC","有用的帮助信息");
define("ATAG_EMPTY","Tag empty");
define("ANAME_EMPTY","Name empty");
define("ATAG_EXIST","Tag taken");
define("ANAME_EXIST","Name taken");
define("TRAVIAN_COPYRIGHT","掌联科技");
define("CUR_PROD","当前产量");
define("NEXT_PROD","下级产量");
define("B1","伐木场");
define("B1_DESC","伐木场用于生产木材，伐木场的等级越高，木材的产量也越高。");
define("B2","粘土矿");
define("B2_DESC","粘土在这里产出，提高粘土矿的等级可增加粘土的产量。");
define("B3","铁矿");
define("B3_DESC","铁矿生产稀有的钢铁资源，提高铁矿的等级，钢铁的产量也会提升。");
define("B4","粮田");
define("B4_DESC","村庄人口依赖于粮食，通过升级粮田可提高粮食产量。");

//	INDEX.php
define("MANUAL","帮助");
define("PLAY_NOW","注册即玩，永久免费！");
define("WHAT_IS","什么是".SERVER_NAME."？");
define("WHAT_IS_ANSWER","".SERVER_NAME."是一个<strong>网页客户端</strong>的游戏。成千上万的玩家在这里扮演古代的部族展开史诗般的战斗。</p><p><strong>免费</strong>注册即可开玩而<strong>无需下载</strong>。");
define("TOTAL_PLAYERS","玩家总数：");
define("ACTIVE_PLAYERS","活跃玩家：");
define("ONLINE_PLAYERS","在线玩家：");
define("SCREENSHOTS","游戏截图");
define("CLICK_HERE","点这里开始玩".SERVER_NAME."。");

//	ANMELDEN.php
define("NICKNAME","昵称");
define("EMAIL","电子邮箱");
define("PASSWORD","密码");
define("ROMANS","罗马人");
define("TEUTONS","条顿人");
define("GAULS","高卢人");
define("NW","西北");
define("NE","东北");
define("SW","西南");
define("SE","东南");
define("RANDOM","随机");
define("ACCEPT_RULES","我愿意遵守该游戏的规则。");
define("ONE_PER_SERVER","每个用户在一个服务器上只能注册一个帐号。");
define("BEFORE_REGISTER","在注册帐号前，请阅读Travian的<a href='".SERVER."anleitung.php' target='_blank'>游戏指南</a>，了解3个种族的特点和优劣。");
define("BUILDING_UPGRADING","建造中：");
define("HOURS","小时");

//	ATTACKS ETC.
define("TROOP_MOVEMENTS","部队移动：");
define("ARRIVING_REINF_TROOPS","增援过来的军队：");
define("ARRIVING_REINF_TROOPS_SHORT","增援");
define("OWN_ATTACKING_TROOPS","自己外出攻击的军队");
define("ATTACK","攻击");
define("OWN_REINFORCING_TROOPS","自己外出增援的军队");
define("TROOPS_DORF","军队");

//	LOGIN.php
define("COOKIES","游戏登录是依赖于Cookies的，如果你与其他用户共用同一台计算机，为安全起见，请在每次登出后把Cookies删除。");
define("NAME","用户名");
define("PW_FORGOTTEN","忘记密码？");
define("PW_REQUEST","您可以再申请一个帐号，我们将会把该帐号发送到您的电子邮箱中。");
define("PW_GENERATE","或者重新激活帐号。");
define("EMAIL_NOT_VERIFIED","该帐号尚未激活！");
define("EMAIL_FOLLOW","请登录您的电子邮箱激活帐号");
define("VERIFY_EMAIL","或点击本链接更改电子邮箱。");

//	404.php
define("NOTHING_HERE","什么也找不到！");
define("WE_LOOKED","We looked 404 times already but can't find anything");

//	TIME RELATED
define("CALCULATED","Calculated in");
define("SERVER_TIME","服务器时间：");

//	MASSMESSAGE.php
define("MASS","讯息内容");
define("MASS_SUBJECT","标题：");
define("MASS_COLOR","讯息颜色：");
define("MASS_REQUIRED","All fields required");
define("MASS_UNITS","图标（军队）:");
define("MASS_SHOWHIDE","显示/隐藏");
define("MASS_READ","Read this: after adding smilie, you have to add left or right after number otherwise image will won't work");
define("MASS_CONFIRM","确定");
define("MASS_REALLY","Do you really want to send MassIGM?");
define("MASS_ABORT","Aborting right now");
define("MASS_SENT","Mass IGM was sent");

?>