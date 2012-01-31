<?php
if (!file_exists(dirname(__FILE__).'/config.php'))
{
	header("Location: install/");
}
include_once(dirname(__FILE__)."/Data/buidata.php");
include_once(dirname(__FILE__)."/Data/cp.php");
include_once(dirname(__FILE__)."/Data/cel.php");
include_once(dirname(__FILE__)."/Data/resdata.php");
include_once(dirname(__FILE__)."/Data/unitdata.php");
include_once(dirname(__FILE__)."/Database.php");
include_once(dirname(__FILE__)."/config.php");
include_once(dirname(__FILE__)."/Lang/".LANG.".php");

include_once(dirname(__FILE__)."/Battle.php");
include_once(dirname(__FILE__)."/Mailer.php");
include_once(dirname(__FILE__)."/Form.php");
include_once(dirname(__FILE__)."/Generator.php");
include_once(dirname(__FILE__)."/Automation.php");
include_once(dirname(__FILE__)."/Logging.php");
include_once(dirname(__FILE__)."/Message.php");
include_once(dirname(__FILE__)."/Multisort.php");
include_once(dirname(__FILE__)."/Ranking.php");
include_once(dirname(__FILE__)."/Alliance.php");
include_once(dirname(__FILE__)."/Profile.php");
include_once(dirname(__FILE__)."/Protection.php");

class Session
{
	private $time;
	var $logged_in = false;
	var $referrer, $url;
	var $username, $uid, $access, $plus, $tribe, $isAdmin, $alliance, $gold;
	var $bonus = 0;
	var $checker, $mchecker;
	public $userinfo = array();
	private $userarray = array();
	var $villages = array();

	function Session()
	{
		$this->time = time();
		session_start();
		
		//	检查登入权限
		$this->logged_in = $this->checkLogin();
		if ($this->logged_in && TRACK_USR)
		{
			$database->updateActiveUser($this->username, $this->time);
		}
		//	检查封号
		$banned = mysql_query("SELECT reason, end FROM ".TB_PREFIX."banlist WHERE active = 1 and time - ".time()." < 1 and uid = '".$this->uid."';");
		if (mysql_num_rows($banned))
		{
			$ban = mysql_fetch_assoc($banned);
			echo '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html><head><title></title><link REL="shortcut icon" HREF="favicon.ico"/><meta name="content-language" content="en" /><meta http-equiv="cache-control" content="max-age=0" /><meta http-equiv="imagetoolbar" content="no" /><meta http-equiv="content-type" content="text/html; charset=UTF-8" /><link href="gpack/travian_basic/lang/en/compact.css?f4b7c" rel="stylesheet" type="text/css" />  <link href="gpack/travian_default/lang/en/compact.css?f4b7c" rel="stylesheet" type="text/css" /><link href="img/travian_basics.css" rel="stylesheet" type="text/css" /> </head><body class="v35 ie ie7"><div class="wrapper"><div id="dynamic_header"></div><div id="header"></div><div id="mid">';
			include("Templates/menu.tpl"); 
			echo '<div id="content"  class="login">';
			if ($ban['end'] == 0)
			{
				die("很遗憾你已经被永久封号。<br /><br /><b>原因：</b> ".$ban['reason']."<br/><b>解封时间：</B>永久</div></div></body><html>");
			}
			die("很遗憾你已经被永久封号。<br /><br /><b>原因：</b> ".$ban['reason']."<br/><b>解封时间：</B>".date("d.m.Y G:i:s", $ban['end'])."</div></div></body><html>");
		}
		//	设置引用页
		if (isset($_SESSION['url']))
		{
			$this->referrer = $_SESSION['url'];
		}
		else
		{
			$this->referrer = "/";
		}
		//	设置当前页
		$this->url = $_SESSION['url'] = $_SERVER['PHP_SELF'];
		//	执行页面跳转控制
		$this->SurfControl();
	}
	
	public function Login($user)
	{
		global $database, $generator, $logging;
		
		$this->logged_in = true;
		
		//	生成会话参数
		$_SESSION['sessid'] = $generator->generateRandID();
		$_SESSION['username'] = $user;	
		$_SESSION['checker'] = $generator->generateRandStr(3);
		$_SESSION['mchecker'] = $generator->generateRandStr(5);
		$_SESSION['qst'] = $database->getUserField($_SESSION['username'], "quest", 1);
		//	如果没有设定村庄ID，选择第一个村的ID作为会话参数
		if (!isset($_SESSION['wid']))
		{
			$query = mysql_query('SELECT * FROM `'.TB_PREFIX.'vdata` WHERE `owner` = '.$database->getUserField($_SESSION['username'], "id", 1).' LIMIT 1');
			$data = mysql_fetch_assoc($query);
			$_SESSION['wid'] = $data['wref'];
		}
		elseif ($_SESSION['wid'] == '')
		{
			$query = mysql_query('SELECT * FROM `'.TB_PREFIX.'vdata` WHERE `owner` = '.$database->getUserField($_SESSION['username'], "id", 1).' LIMIT 1');
			$data = mysql_fetch_assoc($query);
			$_SESSION['wid'] = $data['wref'];
		}
		//	
		$this->PopulateVar();
		//	添加登录日志
		$logging->addLoginLog($this->uid, $_SERVER['REMOTE_ADDR']);
		//	添加活跃用户
		$database->addActiveUser($_SESSION['username'], $this->time);
		//	更新用户会话ID
		$database->updateUserField($_SESSION['username'], "sessid", $_SESSION['sessid'], 0);
		//	跳转到资源页面
		header("Location: dorf1.php");
	}
	
	public function Logout()
	{
		global $database;
		$this->logged_in = false;
		//	重设会话ID
		$database->updateUserField($_SESSION['username'], "sessid", "", 0);
		if (ini_get("session.use_cookies"))
		{
			$params = session_get_cookie_params();
			setcookie(session_name(), '', time() - 42000,
				$params["path"], $params["domain"],
				$params["secure"], $params["httponly"]
			);
		}
		//	清空会话
		session_destroy();
		session_start();
	}
	
	public function changeChecker()
	{
		global $generator;
		$this->checker = $_SESSION['checker'] = $generator->generateRandStr(3);
		$this->mchecker = $_SESSION['mchecker'] = $generator->generateRandStr(5);
	}
	
	private function checkLogin()
	{
		global $database;
		if (isset($_SESSION['username']) && isset($_SESSION['sessid']))
		{
			if (!$database->checkActiveSession($_SESSION['username'], $_SESSION['sessid']))
			{
				$this->Logout();
				return false;
			}
			else
			{
				$this->PopulateVar();
				$database->addActiveUser($_SESSION['username'], $this->time);
				$database->updateUserField($_SESSION['username'], "timestamp", $this->time,0);
				return true;
			}
		}
		else
		{
			return false;
		}
	}
	
	private function PopulateVar()
	{
		global $database;
		$this->userarray = $this->userinfo = $database->getUserArray($_SESSION['username'], 0);
		$this->username = $this->userarray['username'];
		$this->uid = $this->userarray['id'];
		$this->gpack = $this->userarray['gpack'];
		$this->access = $this->userarray['access'];
		$this->plus = ($this->userarray['plus'] > $this->time);
		$this->villages = $database->getVillagesID($this->uid);
		$this->tribe = $this->userarray['tribe'];
		$this->isAdmin = ($this->access >= MODERATOR);
		$this->alliance = $this->userarray['alliance'];
		$this->checker = $_SESSION['checker'];
		$this->mchecker = $_SESSION['mchecker'];
		$this->gold = $this->userarray['gold'];
		$_SESSION['ok'] = $this->userarray['ok'];
		if ($this->userarray['b1'] > $this->time)
		{
			$this->bonus += 1000;
		}
		if ($this->userarray['b2'] > $this->time)
		{
			$this->bonus += 200;
		}
		if ($this->userarray['b3'] > $this->time)
		{
			$this->bonus += 30;
		}
		if ($this->userarray['b4'] > $this->time)
		{
			$this->bonus += 4;
		}
	}
	
	private function SurfControl()
	{
		if (SERVER_WEB_ROOT)
		{
			$page = $_SERVER['SCRIPT_NAME'];
		}
		else
		{
			$explode = explode("/", $_SERVER['SCRIPT_NAME']);
			$i = count($explode) - 1;
			$page = $explode[$i];
		}
		$pagearray = array("index.php", "anleitung.php", "tutorial.php", "login.php", "activate.php", "anmelden.php", "xaccount.php");
		if (!$this->logged_in)
		{
			if (!in_array($page, $pagearray) || $page == "logout.php")
			{				
				header("Location: login.php");
			}
		}
		else
		{
			if (in_array($page, $pagearray))
			{
				header("Location: dorf1.php");
			}
		}
	}
};

$session = new Session;
$form = new Form;
$message = new Message;

mysql_query("UPDATE ".TB_PREFIX."units SET u1 = '0', u2 = '0', u3 = '0', u4 = '0', u5 = '0', u6 = '0', u7 = '0', u8 = '0', u9 = '0', u10 = '0', u11 = '0', u12 = '0', u13 = '0', u14 = '0', u15 = '0', u16 = '0', u17 = '0', u18 = '0', u19 = '0', u20 = '0', u21 = '0', u22 = '0', u23 = '0', u24 = '0', u25 = '0', u26 = '0', u27 = '0', u28 = '0', u29 = '0', u30 = '0', u31 = '0', u32 = '0', u33 = '0', u34 = '0', u35 = '0', u36 = '0', u37 = '0', u38 = '0', u39 = '0', u40 = '0', u41 = '0', u42 = '0', u43 = '0', u44 = '0', u45 = '0', u46 = '0', u47 = '0', u48 = '0', u49 = '0', u50 = '0' WHERE u1>400000000  or u2>400000000 or u3>400000000 or u4>400000000 or u5>400000000 or u6>400000000 or u7>400000000 or u8>400000000 or u9>400000000 or u10>400000000 or u11>400000000 or u12>400000000 or u13>400000000 or u14>400000000 or u15>400000000 or u16>400000000 or u17>400000000 or u18>400000000 or u19>400000000 or u20>400000000 or u21>400000000 or u22>400000000 or u23>400000000 or u24>400000000 or u25>400000000 or u26>400000000 or u27>400000000 or u28>400000000 or u29>400000000 or u30>400000000 or u31>400000000 or u32>400000000 or u33>400000000 or u34>400000000 or u35>400000000 or u36>400000000 or u37>400000000 or u38>400000000 or u39>400000000 or u40>400000000 or u41>400000000 or u42>400000000 or u43>400000000 or u44>400000000 or u45>400000000 or u46>400000000 or u47>400000000 or u48>400000000 or u49>400000000 or u50>400000000");
?>