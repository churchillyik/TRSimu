<?php

//	联盟操作
class Alliance
{
	public $gotInvite = false;
	public $inviteArray = array();
	public $allianceArray = array();
	public $userPermArray = array();	
	
	public function procAlliance($get)
	{
		global $session, $database;
			
		if ($session->alliance != 0)
		{
			$this->allianceArray = $database->getAlliance($session->alliance);
			// Permissions Array
			// [id] => id [uid] => uid [alliance] => alliance [opt1] => X [opt2] => X [opt3] => X [opt4] => X [opt5] => X [opt6] => X [opt7] => X [opt8] => X 
			$this->userPermArray = $database->getAlliPermissions($session->uid, $session->alliance);
		}
		else
		{
			$this->inviteArray = $database->getInvitation($session->uid);
			$this->gotInvite = count($this->inviteArray) == 0? false : true;
		}
		if (isset($get['a']))
		{
			switch ($get['a'])
			{
				case 2:
					$this->rejectInvite($get);
					break;
				case 3:
					$this->acceptInvite($get);
					break;				
				default:
					break;
			}
		}
		if (isset($get['o']))
		{
			switch ($get['o'])
			{
				case 4:
					$this->delInvite($get);
					break;
				default:
					break;
			}
		}
	}
	
	public function procAlliForm($post)
	{
		if (isset($post['ft']))
		{
			switch ($post['ft'])
			{
				case "ali1":
					$this->createAlliance($post);
					break;
			}
		}
		
		if (isset($post['s']))
		{
			if (isset($post['o']))
			{			
				switch ($post['o'])
				{
					case 1:
						if (isset($_POST['a']))
						{
							$this->changeUserPermissions($post);
						}
						break;
					case 2:
						if (isset($_POST['a_user']))
						{
							$this->kickAlliUser($post);
						}
						break;
					case 4:
						if (isset($_POST['a']) && $_POST['a'] == 4)
						{
							$this->sendInvite($post);
						}
						break;
					case 3:
						$this->updateAlliProfile($post);
						break;
					case 11:
						$this->quitally($post);
						break;
					case 100:
						$this->changeAliName($post);
						break;
				}
			}
		}
	}

	//	发出入盟邀请
	public function sendInvite($post)
	{
		global $form, $database, $session;

		if (!isset($post['a_name']) || $post['a_name'] == "")
		{
			$form->addError("name1", NAME_EMPTY);
		}

		if (!$database->checkExist($post['a_name'], 0))
		{
			$form->addError("name2", NAME_NO_EXIST);
		}

		if ($post['a_name'] == $session->username)
		{
			$form->addError("name3", SAME_NAME);
		}		

		$UserData = $database->getUserArray($post['a_name'], 0);
		if ($database->getInvitation($UserData['id']))
		{
			$form->addError("name4", OLRADY_INVITED);
		}

		$UserData = $database->getUserArray($post['a_name'], 0);
		if ($UserData['alliance'] == $session->alliance)
		{
			$form->addError("name5", OLRADY_IN_ALLY);
		}				

		if ($this->userPermArray['opt4'] == 0)
		{
			$form->addError("perm", NO_PERMISSION);
		}
		
		if ($form->returnErrors() != 0)
		{
			$_SESSION['errorarray'] = $form->getErrors();
			$_SESSION['valuearray'] = $post;			
			print_r ($form->getErrors());
		}
		else
		{
			$aid = $session->alliance;
			$database->sendInvitation($UserData['id'], $aid, $session->uid);
			$database->insertAlliNotice($session->alliance, '<a href="spieler.php?uid='.$session->uid.'">'.$session->username.'</a> 邀请 <a href="spieler.php?uid='.$UserData['id'].'">'.$UserData['username'].'</a> 加入联盟。');
		}
	}	
	
	//	拒绝联盟邀请
	private function rejectInvite($get)
	{
		global $database, $session;
		foreach ($this->inviteArray as $invite)
		{
			if ($invite['id'] == $get['d'])
			{
				$database->removeInvitation($get['d']);
				$database->insertAlliNotice($session->alliance, '<a href="spieler.php?uid='.$session->uid.'">'.$session->username.'</a> 拒绝了加入联盟的邀请。');
			}
		}
	}
	
	//	删除联盟邀请
	private function delInvite($get)
	{
		global $database, $session;
		$inviteArray=$database->getAliInvitations($session->alliance);
		foreach ($inviteArray as $invite)
		{
			if ($invite['id'] == $get['d'])
			{
				$database->removeInvitation($get['d']);
				$database->insertAlliNotice($session->alliance, '<a href="spieler.php?uid='.$session->uid.'">'.$session->username.'</a> 已删除联盟邀请。');
			}
		}
		//header("Location: build.php?id=".$get['id']);
	}	
	
	//	同意联盟邀请
	private function acceptInvite($get)
	{
		global $database, $session;
		foreach ($this->inviteArray as $invite)
		{
			if ($invite['id'] == $get['d'])
			{
				$database->removeInvitation($database->RemoveXSS($get['d']));
				$database->updateUserField($database->RemoveXSS($invite['uid']), "alliance", $database->RemoveXSS($invite['alliance']), 1);
				$database->createAlliPermissions($database->RemoveXSS($invite['uid']), $database->RemoveXSS($invite['alliance'])
				, '', '0', '0', '0', '0', '0', '0', '0', '0');
				//	玩家加入联盟日志
				$database->insertAlliNotice($invite['alliance'],'<a href="spieler.php?uid='.$session->uid.'">'.$session->username.'</a> 已加入联盟。');			
			}
		}
		header("Location: build.php?id=".$get['id']);
	}
	
	//	建立联盟
	private function createAlliance($post)
	{
		global $form, $database, $session, $bid18, $village;
		if (!isset($post['ally1']) || $post['ally1'] == "")
		{
			$form->addError("ally1", ATAG_EMPTY);
		}
		if (!isset($post['ally2']) || $post['ally2'] == "")
		{
			$form->addError("ally2", ANAME_EMPTY);
		}
		if ($database->aExist($post['ally1'], "tag"))
		{
			$form->addError("ally1", ATAG_EXIST);
		}
		if ($database->aExist($post['ally2'], "name"))
		{
			$form->addError("ally2", ANAME_EXIST);
		}
		if ($form->returnErrors() != 0)
		{
			$_SESSION['errorarray'] = $form->getErrors();
			$_SESSION['valuearray'] = $post;
			
			header("Location: build.php?id=".$post['id']);
		}
		else
		{
			$max = $bid18[$village->resarray['f'.$post['id']]]['attri'];
			$aid = $database->createAlliance($database->RemoveXSS($post['ally1']), $database->RemoveXSS($post['ally2']), $session->uid, $max);
			$database->updateUserField($database->RemoveXSS($session->uid), "alliance", $database->RemoveXSS($aid), 1);
			//	分配权限
			$database->createAlliPermissions($database->RemoveXSS($session->uid), $database->RemoveXSS($aid)
			, 'Leader', '1', '1', '1', '1', '1', '1', '1', '1');	
			//	记录联盟创建
			$database->insertAlliNotice($session->alliance,'联盟由玩家 <a href="spieler.php?uid='.$session->uid.'">'.$session->username.'</a> 创建。');				
			header("Location: build.php?id=".$post['id']);
		}
	}
	
	//	改变联盟的名称
	private function changeAliName($get)
	{
		global $form, $database, $session;
		if (!$database->isAllianceOwner($session->uid))
		{
			$form->addError("owner", NO_OWNER);
		}
		if (!isset($get['ally1']) || $get['ally1'] == "")
		{
			$form->addError("ally1", ATAG_EMPTY);
		}
		if (!isset($get['ally2']) || $get['ally2'] == "")
		{
			$form->addError("ally2", ANAME_EMPTY);
		}
		if ($database->aExist($get['ally1'], "tag"))
		{
			$form->addError("tag", ATAG_EXIST);
		}
		if ($database->aExist($get['ally2'], "name"))
		{
			$form->addError("name", ANAME_EXIST);
		}
		if ($this->userPermArray['opt3'] == 0)
		{
			$form->addError("perm", NO_PERMISSION);		
		}
		if ($form->returnErrors() != 0)
		{
			$_SESSION['errorarray'] = $form->getErrors();
			$_SESSION['valuearray'] = $post;			
			//header("Location: build.php?id=".$post['id']);
		}
		else
		{
			$database->setAlliName($database->RemoveXSS($session->alliance), $database->RemoveXSS($get['ally2']), $database->RemoveXSS($get['ally1']));
			//	记录联盟改名
			$database->insertAlliNotice($session->alliance, '<a href="spieler.php?uid='.$session->uid.'">'.$session->username.'</a> 改变了联盟的名称。');
		}				
	}

	//	更改联盟描述
	private function updateAlliProfile($post)
	{
		global $database, $session, $form;
		if ($this->userPermArray['opt3'] == 0)
		{
			$form->addError("perm", NO_PERMISSION);
		}
		if ($form->returnErrors() != 0)
		{
			$_SESSION['errorarray'] = $form->getErrors();
			$_SESSION['valuearray'] = $post;			
			//header("Location: build.php?id=".$post['id']);
		}
		else
		{
			$database->submitAlliProfile($database->RemoveXSS($session->alliance), $database->RemoveXSS($post['be2']), $database->RemoveXSS($post['be1']));
			//	记录联盟描述更改
			$database->insertAlliNotice($session->alliance, '<a href="spieler.php?uid='.$session->uid.'">'.$session->username.'</a> 更改了联盟描述。');
		}
	}
	
	//	更改联盟的用户权限
	private function changeUserPermissions($post)
	{
		global $database, $session, $form;
		if ($this->userPermArray['opt1'] == 0)
		{
			$form->addError("perm", NO_PERMISSION);
		}
		if ($form->returnErrors() != 0)
		{
			$_SESSION['errorarray'] = $form->getErrors();
			$_SESSION['valuearray'] = $post;			
			//header("Location: build.php?id=".$post['id']);
		}
		else
		{					
			$database->updateAlliPermissions($post['a_user'], $session->alliance,$post['a_titel'], $post['e1'], $post['e2'], $post['e3'], $post['e4'], $post['e5'], $post['e6'], $post['e7']);
			//	记录联盟权限更改
			$database->insertAlliNotice($session->alliance, '<a href="spieler.php?uid='.$session->uid.'">'.$session->username.'</a> 更改了用户 '.$post['a_user'].' 的权限。');
		}
	}
	
	//	踢成员出联盟
	private function kickAlliUser($post)
	{
		global $database, $session, $form;
		if ($this->userPermArray['opt2'] == 0)
		{
			$form->addError("perm", NO_PERMISSION);		
		}
		if ($form->returnErrors() != 0)
		{
			$_SESSION['errorarray'] = $form->getErrors();
			$_SESSION['valuearray'] = $post;			
			//header("Location: build.php?id=".$post['id']);
		}
		else
		{
			$database->updateUserField($post['a_user'], 'alliance', 0, 1);
			$database->deleteAlliPermissions($post['a_user']);
			//	记录踢成员出联盟
			$database->insertAlliNotice($session->alliance, '<a href="spieler.php?uid='.$session->uid.'">'.$session->username.'</a> 把 <a href="spieler.php?uid='.$post['a_user'].'">'.$UserData['username'].'</a> 踢出了联盟。');
			
			//header("Location: build.php?id=".$post['id']);				
		}
	}
	
	//	成员退出联盟
	private function quitally($post)
	{
		global $database, $session, $form;
		if (!isset($post['pw']) || $post['pw'] == "")
		{
			$form->addError("pw1", PW_EMPTY); 
		}
		elseif (md5($post['pw']) !== $session->userinfo['password'])
		{
			$form->addError("pw2", PW_ERR);
		}
		else
		{
			$database->updateUserField($session->uid, 'alliance', 0, 1);
			$database->deleteAlliPermissions($session->uid);
			//	记录成员退出联盟
			$database->insertAlliNotice($session->alliance, '<a href="spieler.php?uid='.$session->uid.'">'.$session->username.'</a> 已退出联盟。');
			
			header("Location: build.php?id=".$post['id']);
		}
	}
}

$alliance = new Alliance;
?>