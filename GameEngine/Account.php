<?php
include_once("Session.php");

class Account
{
	//	帐号信息处理入口
	function Account()
	{
		global $session;
		if (isset($_POST['ft']))
		{
			switch ($_POST['ft'])
			{
			//	帐号注册
			case "a1":
				$this->Signup();
				break;
			
			//	激活
			case "a2":
				$this->Activate();
				break;
				
			//	取消注册
			case "a3":
				$this->Unreg();
				break;
				
			//	登录
			case "a4":
				$this->Login();
				break;
			}
		}
		
		if (isset($_GET['code']))
		{
			//	有激活码的话，判断激活码匹配
			$_POST['id'] = $_GET['code'];
			$this->Activate();
		}
		else
		{
			//	当前会话为登入状态并且页面是为logout，则登出
			if ($session->logged_in && in_array("logout.php", explode("/", $_SERVER['PHP_SELF'])))
			{
				$this->Logout();
			}
		}
	}
	
	//	帐号注册
	private function Signup()
	{
		global $database, $form, $mailer, $generator, $session;
		if (!isset($_POST['name']) || $_POST['name'] == "")
		{
			//	用户名为空
			$form->addError("name", USRNM_EMPTY);
		}
		else
		{
			if (strlen($_POST['name']) < USRNM_MIN_LENGTH)
			{
				//	用户名太短
				$form->addError("name", USRNM_SHORT);
			}
			elseif (!USRNM_SPECIAL && preg_match('/[^0-9A-Za-z]/', $_POST['name']))
			{
				//	用户名含特殊字符
				$form->addError("name", USRNM_CHAR);
			}
			elseif ($database->checkExist($_POST['name'], 0))
			{
				//	用户名有重复（已激活的）
				$form->addError("name", USRNM_TAKEN);
			}
			elseif ($database->checkExist_activate($_POST['name'], 0))
			{
				//	用户名有重复（未激活的）
				$form->addError("name", USRNM_TAKEN);
			}
		}
		
		if (!isset($_POST['pw']) || $_POST['pw'] == "")
		{
			//	密码为空
			$form->addError("pw", PW_EMPTY);
		}
		else
		{
			if (strlen($_POST['pw']) < PW_MIN_LENGTH)
			{
				//	密码太短
				$form->addError("pw", PW_SHORT);
			}
			elseif ($_POST['pw'] == $_POST['name'])
			{
				//	帐号和密码相同
				$form->addError("pw", PW_INSECURE);
			}
		}
		
		if (!isset($_POST['email']))
		{
			//	电邮为空
			$form->addError("email", EMAIL_EMPTY);
		}
		else
		{
			if (!$this->validEmail($_POST['email']))
			{
				//	电邮非法
				$form->addError("email", EMAIL_INVALID);
			}
			elseif ($database->checkExist($_POST['email'], 1))
			{
				//	电邮有重复（已激活的）
				$form->addError("email", EMAIL_TAKEN);
			}
			elseif ($database->checkExist_activate($_POST['email'], 1))
			{
				//	电邮有重复（未激活的）
				$form->addError("email", EMAIL_TAKEN);
			}
		}
		
		if (!isset($_POST['vid']))
		{
			//	种族未选
			$form->addError("tribe", TRIBE_EMPTY);
		}
		
		if (!isset($_POST['agb']))
		{
			//	为勾选同意用户协议
			$form->addError("agree", AGREE_ERROR);
		}
		
		if ($form->returnErrors() > 0)
		{
			//	返回错误信息
			$_SESSION['errorarray'] = $form->getErrors();
			$_SESSION['valuearray'] = $_POST;
			
			header("Location: anmelden.php");
		}
		else
		{
			if (AUTH_EMAIL)
			{
				//	加入待激活表并发送激活邮件，跳转到激活页面
				$act = $generator->generateRandStr(10);
				$act2 = $generator->generateRandStr(5);
				$uid = $database->activate($_POST['name'], md5($_POST['pw']), $_POST['email'], $_POST['vid'], $_POST['kid'], $act, $act2);
				if ($uid)
				{
					$mailer->sendActivate($_POST['email'], $_POST['name'], $_POST['pw'], $act);
					header("Location: activate.php?id=$uid&q=$act2");
				}
			}
			else
			{
				//	创建用户信息，并跳转到登录页面
				$uid = $database->register($_POST['name'], md5($_POST['pw']), $_POST['email'], $_POST['vid'], $_POST['kid'], $act);
				if ($uid)
				{
					setcookie("COOKUSR", $_POST['name'], time() + COOKIE_EXPIRE, COOKIE_PATH);
					setcookie("COOKEMAIL", $_POST['email'], time() + COOKIE_EXPIRE, COOKIE_PATH);
					$database->updateUserField($uid, "act", "", 1);
					$this->generateBase($_POST['kid'], $uid, $_POST['name']);
					header("Location: login.php");
				}
			}
		}
	}
	
	//	帐号激活
	private function Activate()
	{
		global $database;
		$q = "SELECT * FROM ".TB_PREFIX."activate where act = '".$_POST['id']."'";
		$result = mysql_query($q, $database->connection);
		$dbarray = mysql_fetch_array($result);
		
		if ($dbarray['act'] == $_POST['id'])
		{
			//	如果激活码存在，则注册对应的帐号，并跳转到激活成功页面
			$uid = $database->register($dbarray['username'], $dbarray['password'], $dbarray['email'], $dbarray['tribe'], $dbarray['location'], "");
			if ($uid)
			{
				$database->unreg($dbarray['username']);
				$this->generateBase($dbarray['kid'], $uid, $dbarray['username']);
				header("Location: activate.php?e=2");
			}
		}
		else
		{
			//	如果激活码不存在，则跳转到激活失败页面
			header("Location: activate.php?e=3");
		}
	}
	
	private function Unreg()
	{
		//	取消待激活状态
		global $database;
		$q = "SELECT * FROM ".TB_PREFIX."activate where id = '".$_POST['id']."'";
		$result = mysql_query($q, $database->connection);
		$dbarray = mysql_fetch_array($result);
		if (md5($_POST['pw']) == $dbarray['password'])
		{
			$database->unreg($dbarray['username']);
			header("Location: anmelden.php");
		}
		else
		{
			header("Location: activate.php?e=3");
		}
	}
	
	private function Login()
	{
		global $database, $session, $form;
		if (!isset($_POST['user']) || $_POST['user'] == "")
		{
			//	帐号为空
			$form->addError("user", LOGIN_USR_EMPTY);
		}
		elseif (!$database->checkExist($_POST['user'], 0))
		{
			//	找不到帐号
			$form->addError("user", USR_NT_FOUND);
		}
		
		if (!isset($_POST['pw']) || $_POST['pw'] == "")
		{
			//	密码为空
			$form->addError("pw", LOGIN_PASS_EMPTY);
		}
		elseif (!$database->login($_POST['user'], $_POST['pw']) && !$database->sitterLogin($_POST['user'], $_POST['pw']))
		{
			//	密码错误
			$form->addError("pw", LOGIN_PW_ERROR);
		}
		
		if ($database->getUserField($_POST['user'], "act", 1) != "")
		{
			//	帐号处于待激活状态
			$form->addError("activate", $_POST['user']);
		}
		
		if ($form->returnErrors() > 0)
		{
			//	如果出错，则停留在登录页面，并显示出错信息
			$_SESSION['errorarray'] = $form->getErrors();
			$_SESSION['valuearray'] = $_POST;
			header("Location: login.php");
		}
		else
		{
			//	登入帐号
			setcookie("COOKUSR", $_POST['user'], time() + COOKIE_EXPIRE, COOKIE_PATH);
			$database->UpdateOnline("login", $_POST['user'], time());
			$session->login($_POST['user']);
		}
	}
	
	private function Logout()
	{
		//	登出帐号
		global $session, $database;
		unset($_SESSION['wid']);
		$database->activeModify($session->username, 1);
		$database->UpdateOnline("logout") or die(mysql_error());
		$session->Logout();
	}
	
	private function validEmail($email)
	{
		//	检查电邮有效性
		$regexp = "/^[a-z0-9]+([_\\.-][a-z0-9]+)*@([a-z0-9]+([\.-][a-z0-9]+)*)+\\.[a-z]{2,}$/i";
		if (!preg_match($regexp, $email))
		{
			return false;
		}
		return true;
	}
	
	function generateBase($kid, $uid, $username)
	{
		//	激活成功后创建角色信息
		global $database, $message;
		if ($kid == 0)
		{
			$kid = rand(1, 4);
		}
		else
		{
			$kid = $_POST['kid'];
		}
		
		$wid = $database->generateBase($kid);
		$database->setFieldTaken($wid);
		$database->addVillage($wid, $uid, $username, 1);
		$database->addResourceFields($wid, $database->getVillageType($wid));
		$database->addUnits($wid);
		$database->addTech($wid);
		$database->addABTech($wid);
		$database->updateUserField($uid, "access", USER, 1);
		$message->sendWelcome($uid, $username);
	}
};

$account = new Account;
?>