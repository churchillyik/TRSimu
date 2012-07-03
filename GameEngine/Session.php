<?php
if (!file_exists(dirname(__FILE__).'/config.php'))
{
	header("Location: install/");
}
include_once(dirname(__FILE__)."/config.php");
include_once(dirname(__FILE__)."/Data/buidata.php");
include_once(dirname(__FILE__)."/Data/cp.php");
include_once(dirname(__FILE__)."/Data/cel.php");
include_once(dirname(__FILE__)."/Data/resdata.php");
include_once(dirname(__FILE__)."/Data/unitdata.php");
include_once(dirname(__FILE__)."/Database.php");
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
			global $database;
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
		//	取出用户参数
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
		//	更改checker
		global $generator;
		$this->checker = $_SESSION['checker'] = $generator->generateRandStr(3);
		$this->mchecker = $_SESSION['mchecker'] = $generator->generateRandStr(5);
	}
	
	private function checkLogin()
	{
		global $database;
		//	如果已经设定了用户名和会话ID
		if (isset($_SESSION['username']) && isset($_SESSION['sessid']))
		{
			//	检查用户的会话是否激活
			if (!$database->checkActiveSession($_SESSION['username'], $_SESSION['sessid']))
			{
				//	没激活则登出
				$this->Logout();
				return false;
			}
			else
			{
				//	否则更新用户信息
				$this->PopulateVar();
				$database->addActiveUser($_SESSION['username'], $this->time);
				$database->updateUserField($_SESSION['username'], "timestamp", $this->time, 0);
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
		//	取出用户参数
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
			//	如果当前为登出状态，并且当前页面是游戏内的页面，那么跳转到登录页面
			if (!in_array($page, $pagearray))
			{				
				header("Location: login.php");
			}
		}
	}
};

$session = new Session;
$form = new Form;
$message = new Message;
?>