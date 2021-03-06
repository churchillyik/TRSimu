<?php
class MYSQL_DB
{
	var $connection;
	
	function MYSQL_DB()
	{
		$this->connection = mysql_connect(SQL_SERVER, SQL_USER, SQL_PASS) or die(mysql_error());
		mysql_select_db(SQL_DB, $this->connection) or die(mysql_error());
	}

	function mysql_fetch_all($result)
	{
		$all = array();
		if ($result)
		{
			while ($row = mysql_fetch_assoc($result))
			{
				$all[] = $row;
			}
			return $all;
		}
	}
	
	function query_return($q)
	{
		$result = mysql_query($q, $this->connection);
		return $this->mysql_fetch_all($result);
	}

	function query($query)
	{
		return mysql_query($query, $this->connection);
	}
	
	function RemoveXSS($val)
	{
		return htmlspecialchars($val, ENT_QUOTES);
	}
	
	//--------------------------------------------------------------------
	//	user表
	//--------------------------------------------------------------------
	
	//	注册
	function register($username, $password, $email, $tribe, $locate, $act)
	{
		$time = time();
		$timep = time() + PROTECTION;
		$q = "INSERT INTO ".TB_PREFIX."users (username, password, access, email, timestamp, tribe, location, act, protect) VALUES ('$username', '$password', ".USER.", '$email', $time, $tribe, $locate, '$act', $timep)";
		if (mysql_query($q, $this->connection))
		{
			return mysql_insert_id($this->connection);
		}
		else
		{
			return false;
		}
	}
	
	//	检查用户名或电子邮箱是否存在
	function checkExist($ref, $mode)
	{
		if (!$mode)
		{
			$q = "SELECT username FROM ".TB_PREFIX."users where username = '$ref' LIMIT 1";
		}
		else
		{
			$q = "SELECT email FROM ".TB_PREFIX."users where email = '$ref' LIMIT 1";
		}
		$result = mysql_query($q, $this->connection);
		if (mysql_num_rows($result))
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	
	//	根据用户名或用户ID更新用户信息
	function updateUserField($ref, $field, $value, $switch)
	{
		if (!$switch)
		{
			$q = "UPDATE ".TB_PREFIX."users set $field = '$value' where username = '$ref'";
		}
		else
		{
			$q = "UPDATE ".TB_PREFIX."users set $field = '$value' where id = '$ref'";
		}
		return mysql_query($q, $this->connection);
	}
	
	//	检查某用户都是哪些用户的代管
	function getSitee($uid)
	{
		$q = "SELECT id FROM ".TB_PREFIX."users where sit1 = $uid or sit2 = $uid";
		$result = mysql_query($q, $this->connection);
		return $this->mysql_fetch_all($result);
	}
	
	//	移除某用户的代管
	function removeMeSit($uid, $uid2)
	{
		$q = "UPDATE ".TB_PREFIX."users set sit1 = 0 where id = $uid and sit1 = $uid2";
		mysql_query($q, $this->connection);
		
		$q2 = "UPDATE ".TB_PREFIX."users set sit2 = 0 where id = $uid and sit2 = $uid2";
		mysql_query($q2, $this->connection);
	}
	
	//	获取user表的字段信息
	function getUserField($ref, $field, $mode)
	{
		if (!$mode)
		{
			$q = "SELECT $field FROM ".TB_PREFIX."users where id = '$ref'";
		}
		else
		{
			$q = "SELECT $field FROM ".TB_PREFIX."users where username = '$ref'";
		}
		$result = mysql_query($q, $this->connection) or die(mysql_error());
		$dbarray = mysql_fetch_array($result);
		return $dbarray[$field];
	}
	
	//	根据用户名或用户ID取得user表的所有字段信息
	function getUserArray($ref, $mode)
	{
		if (!$mode)
		{
			$q = "SELECT * FROM ".TB_PREFIX."users where username = '$ref'";
		}
		else
		{
			$q = "SELECT * FROM ".TB_PREFIX."users where id = $ref";
		}
		$result = mysql_query($q, $this->connection);
		return mysql_fetch_array($result);
	}
	
	//	检查用户登录信息
	function login($username, $password)
	{
		$q = "SELECT password, sessid FROM ".TB_PREFIX."users where username = '$username' and access != ".BANNED;
		$result = mysql_query($q, $this->connection);
		$dbarray = mysql_fetch_array($result);
		if ($dbarray['password'] == md5($password))
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	
	//	检查代管登录信息
	function sitterLogin($username, $password)
	{
		$q = "SELECT sit1, sit2 FROM ".TB_PREFIX."users where username = '$username' and access != ".BANNED;
		$result = mysql_query($q, $this->connection);
		$dbarray = mysql_fetch_array($result);
		if ($dbarray['sit1'] != 0)
		{
			$q2 = "SELECT password FROM ".TB_PREFIX."users where id = ".$dbarray['sit1']." and access != ".BANNED;
			$result2 = mysql_query($q2, $this->connection);
			$dbarray2 = mysql_fetch_array($result2);
		}
		elseif ($dbarray['sit2'] != 0)
		{
			$q3 = "SELECT password FROM ".TB_PREFIX."users where id = ".$dbarray['sit2']." and access != ".BANNED;
			$result3 = mysql_query($q3, $this->connection);
			$dbarray3 = mysql_fetch_array($result3);
		}
		
        if ($dbarray['sit1'] != 0 || $dbarray['sit2'] != 0)
		{
			if ($dbarray2['password'] == md5($password) || $dbarray3['password'] == md5($password))
			{
                return true;
            }
            else
			{
                return false;
            }
        }
		else
		{
			return false;
        }
	}
	
	//	修改用户的金币数
	function modifyGold($userid, $amt, $mode)
	{
		if (!$mode)
		{
			$q = "UPDATE ".TB_PREFIX."users set gold = gold - $amt where id = $userid";
		}
		else
		{
			$q = "UPDATE ".TB_PREFIX."users set gold = gold + $amt where id = $userid";
		}
		return mysql_query($q, $this->connection);
	}
	
	//	检查用户会话是否处于激活状态
	function checkactiveSession($username, $sessid)
	{
		$q = "SELECT username FROM ".TB_PREFIX."users where username = '$username' and sessid = '$sessid' LIMIT 1";
		$result = mysql_query($q, $this->connection);
		if (mysql_num_rows($result) != 0)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	
	//	更新用户个人资料
	function submitProfile($uid, $gender, $location, $birthday, $des1, $des2)
	{
		$q = "UPDATE ".TB_PREFIX."users set gender = $gender, location = '$location', birthday = '$birthday', desc1 = '$des1', desc2 = '$des2' where id = $uid";
		return mysql_query($q, $this->connection);
	}

	//	更新用户的皮肤包
	function gpack($uid, $gpack)
	{
		$q = "UPDATE ".TB_PREFIX."users set gpack = '$gpack' where id = $uid";
		return mysql_query($q, $this->connection);
	}
	
	function modifyPoints($aid, $points, $amt)
	{
		$q = "UPDATE ".TB_PREFIX."users set $points = $points + $amt where id = $aid";
		return mysql_query($q, $this->connection);
	}
	
	function setCelCp($user, $cp)
	{
		$q = "UPDATE ".TB_PREFIX."users set cp = cp + $cp where id = $user";
		return mysql_query($q, $this->connection);
	}
	
	function getRanking()
	{
		if (INCLUDE_ADMIN)
		{
			$q = "SELECT id, username, alliance, ap, dp, access FROM ".TB_PREFIX."users";
		}
		else
		{
			$q = "SELECT id, username, alliance, ap, dp, access FROM ".TB_PREFIX."users where access != ".ADMIN;
		}
		$result = mysql_query($q, $this->connection);
		return $this->mysql_fetch_all($result);
	}
	
	function getAllMember($aid)
	{
		$q = "SELECT * FROM ".TB_PREFIX."users where alliance = $aid order  by (SELECT sum(pop) FROM ".TB_PREFIX."vdata WHERE owner =  ".TB_PREFIX."users.id) desc";
		$result = mysql_query($q, $this->connection);
		return $this->mysql_fetch_all($result);
	}
	
	function countUser()
	{
		$q = "SELECT count(id) FROM ".TB_PREFIX."users where id != 0";
		$result = mysql_query($q, $this->connection);
		$row = mysql_fetch_row($result);
		return $row[0];
	}
	
	//--------------------------------------------------------------------
	//	activate表
	//--------------------------------------------------------------------
	
	//	激活
	function activate($username, $password, $email, $tribe, $locate, $act, $act2)
	{
		$time = time();
		$q = "INSERT INTO ".TB_PREFIX."activate (username, password, access, email, tribe, timestamp, location, act, act2) VALUES ('$username', '$password', ".USER.", '$email', $tribe, $time, $locate, '$act', '$act2')";
		if (mysql_query($q, $this->connection))
		{
			return mysql_insert_id($this->connection);
		}
		else
		{
			return false;
		}
	}
	
	//	取消激活
	function unreg($username)
	{
		$q = "DELETE from ".TB_PREFIX."activate where username = '$username'";
		return mysql_query($q, $this->connection);
	}

	//	检查用户名或电子邮箱是否在激活中
	function checkExist_activate($ref, $mode)
	{
		if (!$mode)
		{
			$q = "SELECT username FROM ".TB_PREFIX."activate where username = '$ref' LIMIT 1";
		}
		else
		{
			$q = "SELECT email FROM ".TB_PREFIX."activate where email = '$ref' LIMIT 1";
		}
		$result = mysql_query($q, $this->connection);
		if (mysql_num_rows($result))
		{
			return true;
		}
		else
		{
			return false;
		}
	}

	//	获取activate表的字段信息
	function getActivateField($ref, $field, $mode)
	{
		if (!$mode)
		{
			$q = "SELECT $field FROM ".TB_PREFIX."activate where id = '$ref'";
		}
		else
		{
			$q = "SELECT $field FROM ".TB_PREFIX."activate where username = '$ref'";
		}
		$result = mysql_query($q, $this->connection) or die(mysql_error());
		$dbarray = mysql_fetch_array($result);
		return $dbarray[$field];
	}
	
	//	检查用户是否激活
	function checkActivate($act)
	{
		$q = "SELECT * FROM ".TB_PREFIX."activate where act = '$act'";
		$result = mysql_query($q, $this->connection);
		$dbarray = mysql_fetch_array($result);	
		return $dbarray;
	}
	
	//--------------------------------------------------------------------
	//	deleting表
	//--------------------------------------------------------------------
	
	//	设置或撤销帐号删除
	function setDeleting($uid, $mode)
	{
		$time = time() + 72 * 3600;
		if (!$mode)
		{
			$q = "INSERT INTO ".TB_PREFIX."deleting values ($uid, $time)";
		}
		else
		{
			$q = "DELETE FROM ".TB_PREFIX."deleting where uid = $uid";
		}
		mysql_query($q, $this->connection);
	}
	
	//	取得帐号删除的时刻
	function isDeleting($uid)
	{
		$q = "SELECT timestamp from ".TB_PREFIX."deleting where uid = $uid";
		$result = mysql_query($q, $this->connection);
		$dbarray = mysql_fetch_array($result);
		return $dbarray['timestamp'];
	}
	
	function getNeedDelete()
	{
		$time = time();
		$q = "SELECT uid FROM ".TB_PREFIX."deleting where timestamp < $time";
		$result = mysql_query($q, $this->connection);
		return $this->mysql_fetch_all($result);
	}
	
	//--------------------------------------------------------------------
	//	active表
	//--------------------------------------------------------------------
	
	//	增加或删除活跃用户
	function activeModify($username, $mode)
	{
		$time = time();
		if (!$mode)
		{
			$q = "INSERT INTO ".TB_PREFIX."active VALUES ('$username', $time)";
		}
		else {
			$q = "DELETE FROM ".TB_PREFIX."active WHERE username = '$username'";
		}
		return mysql_query($q, $this->connection);
	}

	//	添加活跃用户
	function addActiveUser($username, $time)
	{
		$q = "REPLACE INTO ".TB_PREFIX."active values ('$username', $time)";
		if (mysql_query($q, $this->connection))
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	
	//	更新用户活跃度
	function updateActiveUser($username, $time)
	{
		$q = "REPLACE into ".TB_PREFIX."active values ('$username', $time)";
		$q2 = "UPDATE ".TB_PREFIX."users set timestamp = $time where username = '$username'";			
		$exec1 = mysql_query($q, $this->connection);
		$exec2 = mysql_query($q2, $this->connection);
		if ($exec1 && $exec2)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	
	//--------------------------------------------------------------------
	//	online表
	//--------------------------------------------------------------------
	
	//	更新用户的在线状态
	function UpdateOnline($mode, $name = "", $time = "")
	{
		global $session;
		if ($mode == "login")
		{
			$q = "INSERT IGNORE INTO ".TB_PREFIX."online (name, time) VALUES ('$name', ".time().")";
			return mysql_query($q, $this->connection);
		}
		else
		{
			$q = "DELETE FROM ".TB_PREFIX."online WHERE name ='".$session->username."'";
			return mysql_query($q, $this->connection);
		}
	}

	//--------------------------------------------------------------------
	//	wdata表
	//--------------------------------------------------------------------
	
	//	分配给用户初始村庄
	function generateBase($sector)
	{
		$qeinde = "9999";
		$sector = rand(1, 4);
		$query = "select * from ".TB_PREFIX."wdata where fieldtype = 3 and occupied = 0";
		$result = mysql_query($query, $this->connection);
		for ($i = 0; $row = mysql_fetch_assoc($result); $i++)
		{
			$oke = '1';
			$x = $row['x'];
			$y = $row['y'];
			if ($x[0] == "-")
			{
				$x = ($x * -1);
				if ($sector == '2' or $sector == '4')
				{
					$oke = '0';
				}
			}
			else
			{
				if ($sector == '1' or $sector == '3')
				{
					$oke = '0';
				}
			}
			if ($y[0] == "-")
			{
				$y = ($y * -1);
				if ($sector == '1' or $sector == '2')
				{
					$oke = '0';
				}
			}
			else
			{
				if ($sector == '3' or $sector == '4')
				{
					$oke = '0';
				}
			}
			$afstand = sqrt(pow($x, 2) + pow($y, 2));
			if ($oke == '1')
			{
				if ($qeinde > $afstand)
				{
					$rand = rand(1, 10);
					if ($rand == '3')
					{
						$qeinde = $afstand;
						$qid = $row['id'];
					}
				}
			}
		}
		if (isset($qid))
		{
			return $qid;
		}
		else
		{
			$query = "select * from ".TB_PREFIX."wdata where fieldtype = 3 and occupied = 0 LIMIT 0,1";
			$result = mysql_query($query, $this->connection);
			$row = mysql_fetch_array($result);
			return $row['id'];
		}
	}
	
	//	更新地图方块的占领状态
	function setFieldTaken($id)
	{
		$q = "UPDATE ".TB_PREFIX."wdata set occupied = 1 where id = $id";
		return mysql_query($q, $this->connection);
	}
	
	//	获得地图方块的占领状态
	function getVillageState($wref)
	{
		$q = "SELECT occupied FROM ".TB_PREFIX."wdata where id = $wref";
		$result = mysql_query($q, $this->connection);
		$dbarray = mysql_fetch_array($result);
		return $dbarray['occupied'];
	}
	
	//	获得村庄类型
	function getVillageType($wref)
	{
		$q = "SELECT id, fieldtype FROM ".TB_PREFIX."wdata where id = $wref";
		$result = mysql_query($q, $this->connection);
		$dbarray = mysql_fetch_array($result);
		return $dbarray['fieldtype'];
	}
	
	//	获得某地图ID的坐标
	function getCoor($wref)
	{
		$q = "SELECT x, y FROM ".TB_PREFIX."wdata where id = $wref";
		$result = mysql_query($q, $this->connection);
		return mysql_fetch_array($result);
	}
	
	//--------------------------------------------------------------------
	//	vdata表
	//--------------------------------------------------------------------
	
	//	增加新的村庄
	function addVillage($wid, $uid, $username, $capital)
	{
		$total = count($this->getVillagesID($uid));
		if ($total >= 1)
		{
			$vname = $username."的村庄 ".($total + 1);
		}
		else
		{
			$vname = $username."的村庄";
		} 
		$time = time();
		$q = "INSERT into ".TB_PREFIX."vdata (wref, owner, name, capital, pop, cp, celebration, wood, clay, iron, maxstore, crop, maxcrop, lastupdate, created) values 
		($wid, $uid, '$vname', $capital, 2, 1, 0, 750, 750, 750, 800, 750, 800, $time, $time)";
		return mysql_query($q, $this->connection) or die(mysql_error());
	}
	
	//	获得某用户的村庄列表
	function getProfileVillages($uid)
	{
      $q = "SELECT capital, wref, name, pop, created from ".TB_PREFIX."vdata where owner = $uid order by pop desc";
      $result = mysql_query($q, $this->connection);
      return $this->mysql_fetch_all($result);
	}
	
	//	获得某用户所有村庄的ID
	function getVillagesID($uid)
	{
		$q = "SELECT wref from ".TB_PREFIX."vdata where owner = $uid order by capital DESC";
		$result = mysql_query($q, $this->connection);
		$array = $this->mysql_fetch_all($result);
		$newarray = array();
		for ($i = 0; $i < count($array); $i++)
		{
			array_push($newarray, $array[$i]['wref']);
		}
		return $newarray;
	}
	
	//	获得某个村庄的信息
	function getVillage($vid)
	{
		$q = "SELECT * FROM ".TB_PREFIX."vdata where wref = $vid";
		$result = mysql_query($q, $this->connection);
		return mysql_fetch_array($result);
	}
	
	//	获得某村庄的地图信息
	function getMInfo($id)
	{
		$q = "SELECT * FROM ".TB_PREFIX."wdata left JOIN ".TB_PREFIX."vdata ON ".TB_PREFIX."vdata.wref = ".TB_PREFIX."wdata.id where ".TB_PREFIX."wdata.id = $id";
		$result = mysql_query($q, $this->connection);
		return mysql_fetch_array($result);
	}
	
	//	通过地图ID查找村庄信息
	function getVillageField($ref, $field)
	{
		$q = "SELECT $field FROM ".TB_PREFIX."vdata where wref = $ref";
		$result = mysql_query($q, $this->connection);
		$dbarray = mysql_fetch_array($result);
		return $dbarray[$field];
	}
	
	//	通过地图ID更新村庄信息
	function setVillageField($ref, $field, $value)
	{
		$q = "UPDATE ".TB_PREFIX."vdata set $field = '$value' where wref = $ref";
		return mysql_query($q,$this->connection);
	}
	
	function modifyResource($vid, $wood, $clay, $iron, $crop, $mode)
	{
		if (!$mode)
		{
			$q = "UPDATE ".TB_PREFIX."vdata set wood = wood - $wood, clay = clay - $clay, iron = iron - $iron, crop = crop - $crop where wref = $vid";
		}
		else
		{
			$q = "UPDATE ".TB_PREFIX."vdata set wood = wood + $wood, clay = clay + $clay, iron = iron + $iron, crop = crop + $crop where wref = $vid";
		}
		return mysql_query($q, $this->connection);
	}
	
	function getVSumField($uid, $field)
	{
		$q = "SELECT sum(".$field.") FROM ".TB_PREFIX."vdata where owner = $uid";
		$result = mysql_query($q, $this->connection);
		$row = mysql_fetch_row($result);
		return $row[0];
	}
	
	function updateVillage($vid)
	{
		$time = time();
		$q = "UPDATE ".TB_PREFIX."vdata set lastupdate = $time where wref = $vid";
		return mysql_query($q, $this->connection);
	}

	function setVillageName($vid, $name)
	{
		$q = "UPDATE ".TB_PREFIX."vdata set name = '$name' where wref = $vid";
		return mysql_query($q, $this->connection);
	}
	
	function modifyPop($vid, $pop, $mode)
	{
		if (!$mode)
		{
			$q = "UPDATE ".TB_PREFIX."vdata set pop = pop + $pop where wref = $vid";
		}
		else
		{
			$q = "UPDATE ".TB_PREFIX."vdata set pop = pop - $pop where wref = $vid";
		}
		return mysql_query($q, $this->connection);
	}

	function addCP($ref, $cp)
	{
		$q = "UPDATE ".TB_PREFIX."vdata set cp = cp + $cp where wref = $ref";
		return mysql_query($q, $this->connection);
	}
  
	function addCel($ref, $cel, $type)
	{
		$q = "UPDATE ".TB_PREFIX."vdata set celebration = $cel, type= $type where wref = $ref";
		return mysql_query($q, $this->connection);
	}

	function getCel()
	{
		$time = time();
		$q = "SELECT * FROM ".TB_PREFIX."vdata where celebration < $time AND celebration != 0";
		$result = mysql_query($q, $this->connection);
		return $this->mysql_fetch_all($result);
	}

	function clearCel($ref)
	{
		$q = "UPDATE ".TB_PREFIX."vdata set celebration = 0, type = 0 where wref = $ref";
		return mysql_query($q, $this->connection);
	}
	
	function getVillageByName($name)
	{
		$name = mysql_real_escape_string($name, $this->connection); 
		$q = "SELECT wref FROM ".TB_PREFIX."vdata where name = '$name' limit 1";
		$result = mysql_query($q, $this->connection);
		$dbarray = mysql_fetch_array($result);
		return $dbarray['wref'];
	}
	
	function getVRanking()
	{
		$q = "SELECT wref, name, owner, pop FROM ".TB_PREFIX."vdata where wref != ''";
		$result = mysql_query($q, $this->connection);
		return $this->mysql_fetch_all($result);
	}
	
	function updateResource($vid, $what, $number)
	{
		$q = "UPDATE ".TB_PREFIX."vdata set ".$what."=".$number." where wref = $vid";
		$result = mysql_query($q, $this->connection);
		return mysql_query($q, $this->connection);
	}
	
	//--------------------------------------------------------------------
	//	fdata表
	//--------------------------------------------------------------------
	
	//	增加村庄的资源类型
	function addResourceFields($vid, $type)
	{
		switch ($type)
		{
		case 1:
			$q = "INSERT into ".TB_PREFIX."fdata (vref,f1t,f2t,f3t,f4t,f5t,f6t,f7t,f8t,f9t,f10t,f11t,f12t,f13t,f14t,f15t,f16t,f17t,f18t,f26,f26t) values($vid,4,4,1,4,4,2,3,4,4,3,3,4,4,1,4,2,1,2,1,15)";
			break;
		case 2:
			$q = "INSERT into ".TB_PREFIX."fdata (vref,f1t,f2t,f3t,f4t,f5t,f6t,f7t,f8t,f9t,f10t,f11t,f12t,f13t,f14t,f15t,f16t,f17t,f18t,f26,f26t) values($vid,3,4,1,3,2,2,3,4,4,3,3,4,4,1,4,2,1,2,1,15)";
			break;
		case 3:
			$q = "INSERT into ".TB_PREFIX."fdata (vref,f1t,f2t,f3t,f4t,f5t,f6t,f7t,f8t,f9t,f10t,f11t,f12t,f13t,f14t,f15t,f16t,f17t,f18t,f26,f26t) values($vid,1,4,1,3,2,2,3,4,4,3,3,4,4,1,4,2,1,2,1,15)";
			break;
		case 4:
			$q = "INSERT into ".TB_PREFIX."fdata (vref,f1t,f2t,f3t,f4t,f5t,f6t,f7t,f8t,f9t,f10t,f11t,f12t,f13t,f14t,f15t,f16t,f17t,f18t,f26,f26t) values($vid,1,4,1,2,2,2,3,4,4,3,3,4,4,1,4,2,1,2,1,15)";
			break;
		case 5:
			$q = "INSERT into ".TB_PREFIX."fdata (vref,f1t,f2t,f3t,f4t,f5t,f6t,f7t,f8t,f9t,f10t,f11t,f12t,f13t,f14t,f15t,f16t,f17t,f18t,f26,f26t) values($vid,1,4,1,3,1,2,3,4,4,3,3,4,4,1,4,2,1,2,1,15)";
			break;
		case 6:
			$q = "INSERT into ".TB_PREFIX."fdata (vref,f1t,f2t,f3t,f4t,f5t,f6t,f7t,f8t,f9t,f10t,f11t,f12t,f13t,f14t,f15t,f16t,f17t,f18t,f26,f26t) values($vid,4,4,1,3,4,4,4,4,4,4,4,4,4,4,4,2,4,4,1,15)";
			break;
		case 7:
			$q = "INSERT into ".TB_PREFIX."fdata (vref,f1t,f2t,f3t,f4t,f5t,f6t,f7t,f8t,f9t,f10t,f11t,f12t,f13t,f14t,f15t,f16t,f17t,f18t,f26,f26t) values($vid,1,4,4,1,2,2,3,4,4,3,3,4,4,1,4,2,1,2,1,15)";
			break;
		case 8:
			$q = "INSERT into ".TB_PREFIX."fdata (vref,f1t,f2t,f3t,f4t,f5t,f6t,f7t,f8t,f9t,f10t,f11t,f12t,f13t,f14t,f15t,f16t,f17t,f18t,f26,f26t) values($vid,3,4,4,1,2,2,3,4,4,3,3,4,4,1,4,2,1,2,1,15)";
			break;
		case 9:
			$q = "INSERT into ".TB_PREFIX."fdata (vref,f1t,f2t,f3t,f4t,f5t,f6t,f7t,f8t,f9t,f10t,f11t,f12t,f13t,f14t,f15t,f16t,f17t,f18t,f26,f26t) values($vid,3,4,4,1,1,2,3,4,4,3,3,4,4,1,4,2,1,2,1,15)";
			break;
		case 10:
			$q = "INSERT into ".TB_PREFIX."fdata (vref,f1t,f2t,f3t,f4t,f5t,f6t,f7t,f8t,f9t,f10t,f11t,f12t,f13t,f14t,f15t,f16t,f17t,f18t,f26,f26t) values($vid,3,4,1,2,2,2,3,4,4,3,3,4,4,1,4,2,1,2,1,15)";
			break;
		case 11:
			$q = "INSERT into ".TB_PREFIX."fdata (vref,f1t,f2t,f3t,f4t,f5t,f6t,f7t,f8t,f9t,f10t,f11t,f12t,f13t,f14t,f15t,f16t,f17t,f18t,f26,f26t) values($vid,3,1,1,3,1,4,4,3,3,4,4,3,1,4,4,2,4,4,1,15)";
			break;
		case 12:
			$q = "INSERT into ".TB_PREFIX."fdata (vref,f1t,f2t,f3t,f4t,f5t,f6t,f7t,f8t,f9t,f10t,f11t,f12t,f13t,f14t,f15t,f16t,f17t,f18t,f26,f26t) values($vid,1,4,1,1,2,2,3,4,4,3,3,4,4,1,4,1,2,1,1,15)";
			break;
		}
		return mysql_query($q, $this->connection);
	}
	
	//	改变资源田的等级
	function setVillageLevel($ref, $field, $value)
	{
		$q = "UPDATE ".TB_PREFIX."fdata set ".$field." = '".$value."' where vref = ".$ref."";
		return mysql_query($q,$this->connection);
	}
	
	//	获得资源田的等级
	function getResourceLevel($vid)
	{
		$q = "SELECT * from ".TB_PREFIX."fdata where vref = $vid";
		$result = mysql_query($q, $this->connection);
		return mysql_fetch_assoc($result);
	}
	
	function getFieldLevel($vid, $field)
	{
		$q = "SELECT f".$field." from ".TB_PREFIX."fdata where vref = $vid";
		$result = mysql_query($q, $this->connection);
		return mysql_result($result, 0);
	}
	
	//--------------------------------------------------------------------
	//	odata表
	//--------------------------------------------------------------------
	
	//	获得绿洲占领的信息
	function getOasis($vid)
	{
		$q = "SELECT * FROM ".TB_PREFIX."odata where conqured = $vid";
		$result = mysql_query($q, $this->connection);
		return $this->mysql_fetch_all($result);
	}
	
	//	根据地图ID查询绿洲信息
	function getOasisInfo($wid)
	{
		$q = "SELECT * FROM ".TB_PREFIX."odata where wref = $wid";
		$result = mysql_query($q, $this->connection);
		return mysql_fetch_assoc($result);
	}
	
	//--------------------------------------------------------------------
	//	medal表
	//--------------------------------------------------------------------
	
	//	获得某用户的所有奖牌
	function getProfileMedal($uid)
	{
		$q = "SELECT id, categorie, plaats, week, img, points from ".TB_PREFIX."medal where userid = $uid order by id desc";
		$result = mysql_query($q, $this->connection);
		return $this->mysql_fetch_all($result);
	}
	
	//--------------------------------------------------------------------
	//	forum_cat表
	//--------------------------------------------------------------------

	function CheckForum($id)
	{
		$q = "SELECT * from ".TB_PREFIX."forum_cat where alliance = '$id'";
		$result = mysql_query($q, $this->connection);
		if (mysql_num_rows($result))
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	
	function ForumCat($id)
	{
		$q = "SELECT * from ".TB_PREFIX."forum_cat where alliance = '$id' ORDER BY id";
		$result = mysql_query($q, $this->connection);
		return $this->mysql_fetch_all($result);
	}
   
	function ForumCatEdit($id)
	{
		$q = "SELECT * from ".TB_PREFIX."forum_cat where id = '$id'";
		$result = mysql_query($q, $this->connection);
		return $this->mysql_fetch_all($result);
	}
   
	function ForumCatName($id)
	{
		$q = "SELECT forum_name from ".TB_PREFIX."forum_cat where id = $id";
		$result = mysql_query($q, $this->connection);
		$dbarray = mysql_fetch_array($result);
		return $dbarray['forum_name'];
	}

	function UpdateEditForum($id, $name, $des)
	{
		$q = "UPDATE ".TB_PREFIX."forum_cat set forum_name = '$name', forum_des = '$des' where id = $id";
		return mysql_query($q, $this->connection);
	}
	
	function CreatForum($owner, $alli, $name, $des, $area)
	{
		$q = "INSERT into ".TB_PREFIX."forum_cat values (0, '$owner', '$alli', '$name', '$des', '$area')";
		mysql_query($q, $this->connection);
		return mysql_insert_id($this->connection);
	}
	
	function DeleteCat($id)
	{
		$qs = "DELETE from ".TB_PREFIX."forum_cat where id = '$id'";
		$q = "DELETE from ".TB_PREFIX."forum_topic where cat = '$id'";
		mysql_query($qs, $this->connection);
		return mysql_query($q, $this->connection);
	}
	
	//--------------------------------------------------------------------
	//	forum_topic表
	//--------------------------------------------------------------------
   
	function CountCat($id)
	{
		$q = "SELECT count(id) FROM ".TB_PREFIX."forum_topic where cat = '$id'";
		$result = mysql_query($q, $this->connection);
		$row = mysql_fetch_row($result);
		return $row[0];
	}
   
	function LastTopic($id)
	{
		$q = "SELECT * from ".TB_PREFIX."forum_topic where cat = '$id' order by post_date";
		$result = mysql_query($q, $this->connection);
		return $this->mysql_fetch_all($result);
	}
	
	function CheckCatTopic($id)
	{
		$q = "SELECT * from ".TB_PREFIX."forum_topic where cat = '$id'";
		$result = mysql_query($q, $this->connection);
		if (mysql_num_rows($result))
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	
	function CheckLastTopic($id)
	{
		$q = "SELECT * from ".TB_PREFIX."forum_topic where cat = '$id'";
		$result = mysql_query($q, $this->connection);
		if (mysql_num_rows($result))
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	
	function CheckCloseTopic($id)
	{
		$q = "SELECT close from ".TB_PREFIX."forum_topic where id = '$id'";
		$result = mysql_query($q, $this->connection);
		$dbarray = mysql_fetch_array($result);
		return $dbarray['close'];
	}
	
	function UpdateEditTopic($id, $title, $cat)
	{
		$q = "UPDATE ".TB_PREFIX."forum_topic set title = '$title', cat = '$cat' where id = $id";
		return mysql_query($q, $this->connection);
	}
	
	function StickTopic($id, $mode)
	{
		$q = "UPDATE ".TB_PREFIX."forum_topic set stick = '$mode' where id = '$id'";
		return mysql_query($q, $this->connection);
	}
   
	function ForumCatTopic($id)
	{
		$q = "SELECT * from ".TB_PREFIX."forum_topic where cat = '$id' AND stick = '' ORDER BY post_date desc";
		$result = mysql_query($q, $this->connection);
		return $this->mysql_fetch_all($result);
	}
   
	function ForumCatTopicStick($id)
	{
		$q = "SELECT * from ".TB_PREFIX."forum_topic where cat = '$id' AND stick = '1' ORDER BY post_date desc";
		$result = mysql_query($q, $this->connection);
		return $this->mysql_fetch_all($result);
	}
   
	function ShowTopic($id)
	{
		$q = "SELECT * from ".TB_PREFIX."forum_topic where id = '$id'";
		$result = mysql_query($q, $this->connection);
		return $this->mysql_fetch_all($result);
	}

	function CreatTopic($title, $post, $cat, $owner, $alli, $ends)
	{
		$date = time();
		$q = "INSERT into ".TB_PREFIX."forum_topic values (0, '$title', '$post', '$date', '$date', '$cat', '$owner', '$alli', '$ends', '', '')";
		mysql_query($q, $this->connection);
		return mysql_insert_id($this->connection);
	}
	
	function UpdatePostDate($id)
	{
		$date = time();
		$q = "UPDATE ".TB_PREFIX."forum_topic set post_date = '$date' where id = $id";
		return mysql_query($q, $this->connection);
	}

	function EditUpdateTopic($id, $post)
	{
		$q = "UPDATE ".TB_PREFIX."forum_topic set post = '$post' where id = $id";
		return mysql_query($q, $this->connection);
	}
	
	function LockTopic($id, $mode)
	{
		$q = "UPDATE ".TB_PREFIX."forum_topic set close = '$mode' where id = '$id'";
		return mysql_query($q, $this->connection);
	}
	
	//--------------------------------------------------------------------
	//	forum_post表
	//--------------------------------------------------------------------
	
	function CheckLastPost($id)
	{
		$q = "SELECT * from ".TB_PREFIX."forum_post where topic = '$id'";
		$result = mysql_query($q, $this->connection);
		if (mysql_num_rows($result))
		{
			return true;
		}
		else
		{
			return false;
		}
	}
   
	function LastPost($id)
	{
		$q = "SELECT * from ".TB_PREFIX."forum_post where topic = '$id'";
		$result = mysql_query($q, $this->connection);
		return $this->mysql_fetch_all($result);
	}
   
	function CountTopic($id)
	{
		$q = "SELECT count(id) FROM ".TB_PREFIX."forum_post where owner = '$id'";
		$result = mysql_query($q, $this->connection);
		$row = mysql_fetch_row($result);

		$qs = "SELECT count(id) FROM ".TB_PREFIX."forum_topic where owner = '$id'";
		$results = mysql_query($qs, $this->connection);
		$rows = mysql_fetch_row($results);
		return $row[0] + $rows[0];
	}
   
	function CountPost($id)
	{
		$q = "SELECT count(id) FROM ".TB_PREFIX."forum_post where topic = '$id'";
		$result = mysql_query($q, $this->connection);
		$row = mysql_fetch_row($result);
		return $row[0];
	}
	
	function ShowPost($id)
	{
		$q = "SELECT * from ".TB_PREFIX."forum_post where topic = '$id'";
		$result = mysql_query($q, $this->connection);
		return $this->mysql_fetch_all($result);
	}

	function ShowPostEdit($id)
	{
		$q = "SELECT * from ".TB_PREFIX."forum_post where id = '$id'";
		$result = mysql_query($q, $this->connection);
		return $this->mysql_fetch_all($result);
	}

	function CreatPost($post, $tids, $owner)
	{
		$date = time();
		$q = "INSERT into ".TB_PREFIX."forum_post values (0, '$post', '$tids', '$owner', '$date')";
		mysql_query($q, $this->connection);
		return mysql_insert_id($this->connection);
	}
	
	function EditUpdatePost($id, $post)
	{
		$q = "UPDATE ".TB_PREFIX."forum_post set post = '$post' where id = $id";
		return mysql_query($q, $this->connection);
	}
	
	function DeleteTopic($id)
	{
		$q = "DELETE from ".TB_PREFIX."forum_post where topic = '$id'";
		return mysql_query($q, $this->connection);
	}

	function DeletePost($id)
	{
		$q = "DELETE from ".TB_PREFIX."forum_post where id = '$id'";
		return mysql_query($q, $this->connection);
	}
	
	//--------------------------------------------------------------------
	//	forum_edit表
	//--------------------------------------------------------------------
	
	function CheckResultEdit($alli)
	{
		$q = "SELECT * from ".TB_PREFIX."forum_edit where alliance = '$alli'";
		$result = mysql_query($q, $this->connection);
		if (mysql_num_rows($result))
		{
			return true;
		}
		else
		{
			return false;
		}
	}
   
	function CheckEditRes($alli)
	{
		$q = "SELECT result from ".TB_PREFIX."forum_edit where alliance = '$alli'";
		$result = mysql_query($q, $this->connection);
		$dbarray = mysql_fetch_array($result);
		return $dbarray['result'];
	}
   
	function CreatResultEdit($alli, $result)
	{
		$q = "INSERT into ".TB_PREFIX."forum_edit values (0, '$alli', '$result')";
		mysql_query($q, $this->connection);
		return mysql_insert_id($this->connection);
	}
   
	function UpdateResultEdit($alli, $result)
	{
		$date = time();
		$q = "UPDATE ".TB_PREFIX."forum_edit set result = '$result' where alliance = '$alli'";
		return mysql_query($q, $this->connection);
	}

	//--------------------------------------------------------------------
	//	alidata表
	//--------------------------------------------------------------------
	function getAllianceName($id)
	{
		$q = "SELECT tag from ".TB_PREFIX."alidata where id = $id";
		$result = mysql_query($q, $this->connection);
		$dbarray = mysql_fetch_array($result);
		return $dbarray['tag'];
	}
	
	function getAlliance($id)
	{
		$q = "SELECT * from ".TB_PREFIX."alidata where id = $id";
		$result = mysql_query($q, $this->connection);
		return mysql_fetch_assoc($result);
	}
	
	function setAlliName($aid, $name, $tag)
	{
		$q = "UPDATE ".TB_PREFIX."alidata set name = '$name', tag = '$tag' where id = $aid";
		return mysql_query($q, $this->connection);
	}
	
	function isAllianceOwner($id)
	{
		$q = "SELECT * from ".TB_PREFIX."alidata where leader = '$id'";
		$result = mysql_query($q, $this->connection);
		if (mysql_num_rows($result))
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	
	function aExist($ref, $type)
	{
		$q = "SELECT $type FROM ".TB_PREFIX."alidata where $type = '$ref'";
		$result = mysql_query($q, $this->connection);
		if (mysql_num_rows($result))
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	
	function createAlliance($tag, $name, $uid, $max)
	{
		$q = "INSERT into ".TB_PREFIX."alidata values (0, '$name', '$tag', $uid, 0, 0, 0, '', '', $max)";
		mysql_query($q, $this->connection);
		return mysql_insert_id($this->connection);
	}
	
	function submitAlliProfile($aid, $notice, $desc)
	{
		$q = "UPDATE ".TB_PREFIX."alidata SET `notice` = '$notice', `desc` = '$desc' where id = $aid";
		return mysql_query($q, $this->connection);
	}
		
	function getUserAlliance($id)
	{
		$q = "SELECT ".TB_PREFIX."alidata.tag from ".TB_PREFIX."users join ".TB_PREFIX."alidata where ".TB_PREFIX."users.alliance = ".TB_PREFIX."alidata.id and ".TB_PREFIX."users.id = $id";
		$result = mysql_query($q, $this->connection);
		$dbarray = mysql_fetch_array($result);
		if ($dbarray['tag'] == "")
		{
			return "-";
		}
		else
		{
			return $dbarray['tag'];
		}
	}
	
	function getARanking()
	{
		$q = "SELECT id, name, tag FROM ".TB_PREFIX."alidata where id != ''";
		$result = mysql_query($q, $this->connection);
		return $this->mysql_fetch_all($result);
	}
	
	function countAlli()
	{
		$q = "SELECT count(id) FROM ".TB_PREFIX."alidata where id != 0";
		$result = mysql_query($q, $this->connection);
		$row = mysql_fetch_row($result);
		return $row[0];
	}
	
	//--------------------------------------------------------------------
	//	ali_log表
	//--------------------------------------------------------------------
	function insertAlliNotice($aid, $notice)
	{
		$time = time();
		$q = "INSERT into ".TB_PREFIX."ali_log values (0, '$aid', '$notice', $time)";
		mysql_query($q, $this->connection);
		return mysql_insert_id($this->connection);
	}
	
	function readAlliNotice($aid)
	{
		$q = "SELECT * from ".TB_PREFIX."ali_log where aid = $aid ORDER BY date DESC";
		$result = mysql_query($q, $this->connection);
		return $this->mysql_fetch_all($result);
	}

	//--------------------------------------------------------------------
	//	ali_permission表
	//--------------------------------------------------------------------
	function createAlliPermissions($uid, $aid, $rank, $opt1, $opt2, $opt3, $opt4, $opt5, $opt6, $opt7, $opt8)
	{	
		$q = "INSERT into ".TB_PREFIX."ali_permission values(0, '$uid', '$aid', '$rank', '$opt1', '$opt2', '$opt3', '$opt4', '$opt5', '$opt6', '$opt7', '$opt8')";
		mysql_query($q, $this->connection);
		return mysql_insert_id($this->connection);
	}

	function deleteAlliPermissions($uid)
	{
		$q = "DELETE from ".TB_PREFIX."ali_permission where uid = '$uid'";
		return mysql_query($q, $this->connection);
	}	

	function updateAlliPermissions($uid, $aid, $rank, $opt1, $opt2, $opt3, $opt4, $opt5, $opt6, $opt7)
	{	
		$q = "UPDATE ".TB_PREFIX."ali_permission SET rank = '$rank', opt1 = '$opt1', opt2 = '$opt2', opt3 = '$opt3', opt4 = '$opt4', opt5 = '$opt5', opt6 = '$opt6', opt7 = '$opt7' where uid = $uid && alliance = $aid";
		return mysql_query($q, $this->connection);
	}

	function getAlliPermissions($uid, $aid)
	{
		$q = "SELECT * FROM ".TB_PREFIX."ali_permission where uid = $uid && alliance = $aid";
		$result = mysql_query($q, $this->connection);
		return mysql_fetch_assoc($result);
	}			
	
	//--------------------------------------------------------------------
	//	ali_invite表
	//--------------------------------------------------------------------
	function getInvitation($uid)
	{
		$q = "SELECT * FROM ".TB_PREFIX."ali_invite where uid = $uid";
		$result = mysql_query($q, $this->connection);
		return $this->mysql_fetch_all($result);
	}
	
	function getAliInvitations($aid)
	{
		$q = "SELECT * FROM ".TB_PREFIX."ali_invite where alliance = $aid && accept = 0";
		$result = mysql_query($q, $this->connection);
		return $this->mysql_fetch_all($result);
	}
	
	function sendInvitation($uid, $alli, $sender)
	{
		$time = time();
		$q = "INSERT INTO ".TB_PREFIX."ali_invite values (0, $uid, $alli, $sender, $time, 0)";
		return mysql_query($q, $this->connection) or die(mysql_error());
	}
	
	function removeInvitation($id)
	{
		$q = "DELETE FROM ".TB_PREFIX."ali_invite where id = $id";
		return mysql_query($q, $this->connection);
	}
	
	//--------------------------------------------------------------------
	//	mdata表
	//--------------------------------------------------------------------
	function sendMessage($client, $owner, $topic, $message, $send)
	{
		$time = time();
		$q = "INSERT INTO ".TB_PREFIX."mdata values (0, $client, $owner, '$topic', '$message', 0, 0, $send, $time)";
		return mysql_query($q, $this->connection);
	}
	
	function setArchived($id)
	{
		$q = "UPDATE ".TB_PREFIX."mdata set archived = 1 where id = $id";
		return mysql_query($q, $this->connection);
	}
	
	function setNorm($id)
	{
		$q = "UPDATE ".TB_PREFIX."mdata set archived = 0 where id = $id";
		return mysql_query($q, $this->connection);
	}

	function getMessage($id, $mode)
	{
		switch ($mode)
		{
		case 1:
			$q = "SELECT * FROM ".TB_PREFIX."mdata WHERE target = $id and send = 0 and archived = 0 ORDER BY time DESC";
			break;
		case 2:
			$q = "SELECT * FROM ".TB_PREFIX."mdata WHERE owner = $id and send = 1 and archived = 0 ORDER BY time DESC";
			break;
		case 3:
			$q = "SELECT * FROM ".TB_PREFIX."mdata where id = $id";
			break;
		case 4:
			$q = "UPDATE ".TB_PREFIX."mdata set viewed = 1 where id = $id";
			break;
		case 5:
			$q = "DELETE FROM ".TB_PREFIX."mdata where id = $id";
			break;
		case 6:
			$q = "SELECT * FROM ".TB_PREFIX."mdata where target = $id and send = 0 and archived = 1";
			break;
		}
		
		if ($mode <= 3 || $mode == 6)
		{
			$result = mysql_query($q, $this->connection);
			return $this->mysql_fetch_all($result);
		}
		else
		{
			return mysql_query($q, $this->connection);
		}
	}
	
	//--------------------------------------------------------------------
	//	ndata表
	//--------------------------------------------------------------------
	function unarchiveNotice($id)
	{
		$q = "UPDATE ".TB_PREFIX."ndata set ntype = archive, archive = 0 where id = $id";
		return mysql_query($q, $this->connection);
	}
	
	function archiveNotice($id)
	{
		$q = "update ".TB_PREFIX."ndata set archive = ntype, ntype = 9 where id = $id";
		return mysql_query($q, $this->connection);
	}
	
	function removeNotice($id)
	{
		$q = "DELETE FROM ".TB_PREFIX."ndata where id = $id";
		return mysql_query($q, $this->connection);
	}
	
	function noticeViewed($id)
	{
		$q = "UPDATE ".TB_PREFIX."ndata set viewed = 1 where id = $id";
		return mysql_query($q, $this->connection);
	}
	
	function addNotice($uid, $type, $topic, $data)
	{
		$time = time();
		$q = "INSERT INTO ".TB_PREFIX."ndata (id, uid, topic, ntype, data, time, viewed) values (0, '$uid', '$topic', $type, '$data', $time, 0)";
		return mysql_query($q, $this->connection) or die(mysql_error());
	}
	
	function getNotice($uid)
	{
		$q = "SELECT * FROM ".TB_PREFIX."ndata where uid = $uid ORDER BY time DESC";
		$result = mysql_query($q, $this->connection);
		return $this->mysql_fetch_all($result);
	}
	
	//--------------------------------------------------------------------
	//	bdata表
	//--------------------------------------------------------------------
	function addBuilding($wid, $field, $type, $loop, $time)
	{
		$q = "INSERT into ".TB_PREFIX."bdata values (0, $wid, $field, $type, $loop, $time)";
		return mysql_query($q, $this->connection);
	}
	
	function removeBuilding($d)
	{
		$q = "DELETE FROM ".TB_PREFIX."bdata where id = $d";
		return mysql_query($q, $this->connection);
	}
	
	function getJobs($wid)
	{
		$q = "SELECT * FROM ".TB_PREFIX."bdata where wid = $wid order by ID ASC";
		$result = mysql_query($q, $this->connection);
		return $this->mysql_fetch_all($result);
	}
	
	//--------------------------------------------------------------------
	//	market表
	//--------------------------------------------------------------------
	function setMarketAcc($id)
	{
		$q = "UPDATE ".TB_PREFIX."market set accept = 1 where id = $id";
		return mysql_query($q, $this->connection);
	}

	function addMarket($vid, $gtype, $gamt, $wtype, $wamt, $time, $alliance, $merchant, $mode)
	{
		if (!$mode)
		{
			$q = "INSERT INTO ".TB_PREFIX."market values (0, $vid, $gtype, $gamt, $wtype, $wamt, 0, $time, $alliance, $merchant)";
			mysql_query($q, $this->connection);
			return mysql_insert_id($this->connection);
		}
		else
		{
			$q = "DELETE FROM ".TB_PREFIX."market where id = $gtype and vref = $vid";
			return mysql_query($q, $this->connection);
		}
	}

	function getMarket($vid, $mode)
	{
		$alliance = $this->getUserField($this->getVillageField($vid, "owner"), "alliance", 0);
		if (!$mode)
		{
			$q = "SELECT * FROM ".TB_PREFIX."market where vref = $vid and accept = 0";
		}
		else
		{
			$q = "SELECT * FROM ".TB_PREFIX."market where vref != $vid and alliance = $alliance or vref != $vid and alliance = 0 and accept = 0";
		}
		$result = mysql_query($q, $this->connection);
		return $this->mysql_fetch_all($result);
	}

	function getMarketInfo($id)
	{
		$q = "SELECT * FROM ".TB_PREFIX."market where id = $id";
		$result = mysql_query($q, $this->connection);
		return mysql_fetch_assoc($result);
	}
	
	//--------------------------------------------------------------------
	//	send表
	//--------------------------------------------------------------------
	function sendResource($ref, $clay, $iron, $crop, $merchant, $mode)
	{
		if (!$mode)
		{
			$q = "INSERT INTO ".TB_PREFIX."send values (0, $ref, $clay, $iron, $crop, $merchant)";
			mysql_query($q, $this->connection);
			return mysql_insert_id($this->connection);
		}
		else
		{
			$q = "DELETE FROM ".TB_PREFIX."send where id = $ref";
			return mysql_query($q, $this->connection);
		}
	}

	//--------------------------------------------------------------------
	//	movement表
	//--------------------------------------------------------------------
	
	function setMovementProc($moveid)
	{
		$q = "UPDATE ".TB_PREFIX."movement set proc = 1 where moveid = $moveid";
		return mysql_query($q, $this->connection);
	}

	//	获得当前已使用的所有商人
	function totalMerchantUsed($vid)
	{
		$time = time();
		
		$q = "SELECT sum(".TB_PREFIX."send.merchant) from ".TB_PREFIX."send, ".TB_PREFIX."movement where ".TB_PREFIX."movement.from = $vid and ".TB_PREFIX."send.id = ".TB_PREFIX."movement.ref and ".TB_PREFIX."movement.proc = 0 and sort_type = 0";
		$result = mysql_query($q, $this->connection);
		$row = mysql_fetch_row($result);
		
		$q2 = "SELECT sum(ref) from ".TB_PREFIX."movement where sort_type = 2 and ".TB_PREFIX."movement.to = $vid and proc = 0";
		$result2 = mysql_query($q2, $this->connection);
		$row2 = mysql_fetch_row($result2);
		
		$q3 = "SELECT sum(merchant) from ".TB_PREFIX."market where vref = $vid and accept = 0";
		$result3 = mysql_query($q3, $this->connection);
		$row3 = mysql_fetch_row($result3);
		
		return $row[0] + $row2[0] + $row3[0];
	}

	//	获得商人或军队的移动信息
	function getMovement($type, $village, $mode)
	{
		$time = time();
		if (!$mode)
		{
			$where = "from";
		}
		else
		{
			$where = "to";
		}
		switch ($type)
		{
		//	己村商人出去或别村商人过来
		case 0:
			$q = "SELECT * FROM ".TB_PREFIX."movement, ".TB_PREFIX."send where ".TB_PREFIX."movement.".$where." = $village and ".TB_PREFIX."movement.ref = ".TB_PREFIX."send.id and ".TB_PREFIX."movement.proc = 0 and ".TB_PREFIX."movement.sort_type = 0";
			break;
		//	己村商人返回
		case 2:
			$q = "SELECT * FROM ".TB_PREFIX."movement where ".TB_PREFIX."movement.".$where." = $village and ".TB_PREFIX."movement.proc = 0 and ".TB_PREFIX."movement.sort_type = 2";
			break;
		//	己村的军队出去或返回
		case 3:
			$q = "SELECT * FROM ".TB_PREFIX."movement, ".TB_PREFIX."attacks where ".TB_PREFIX."movement.".$where." = $village and ".TB_PREFIX."movement.ref = ".TB_PREFIX."attacks.id and ".TB_PREFIX."movement.proc = 0 and ".TB_PREFIX."movement.sort_type = 3 ORDER BY endtime DESC";
			break;
		//	对自己增援的军队
		case 4:
			$q = "SELECT * FROM ".TB_PREFIX."movement, ".TB_PREFIX."attacks where ".TB_PREFIX."movement.".$where." = $village and ".TB_PREFIX."movement.ref = ".TB_PREFIX."attacks.id and ".TB_PREFIX."movement.proc = 0 and ".TB_PREFIX."movement.sort_type = 4 ORDER BY endtime DESC";
			break;
		//	拓荒者出去开村
		case 5:
			$q = "SELECT * FROM ".TB_PREFIX."movement where ".TB_PREFIX."movement.".$where." = $village and sort_type = 5 and proc = 0";
			break;
		//	包括3类型和4类型的所有军队
		case 34:
			$q = "SELECT * FROM ".TB_PREFIX."movement, ".TB_PREFIX."attacks where ".TB_PREFIX."movement.".$where." = $village and ".TB_PREFIX."movement.ref = ".TB_PREFIX."attacks.id and ".TB_PREFIX."movement.proc = 0 and ".TB_PREFIX."movement.sort_type = 3 or ".TB_PREFIX."movement.".$where." = $village and ".TB_PREFIX."movement.ref = ".TB_PREFIX."attacks.id and ".TB_PREFIX."movement.proc = 0 and ".TB_PREFIX."movement.sort_type = 4 ORDER BY endtime DESC";
			break;
		}
		$result = mysql_query($q, $this->connection);
		$array = $this->mysql_fetch_all($result);
		return $array;
	}

	//	添加商人或军队的移动信息
	function addMovement($type, $from, $to, $ref, $endtime)
	{
		$q = "INSERT INTO ".TB_PREFIX."movement values (0, $type, $from, $to, $ref, $endtime, 0)";
		return mysql_query($q, $this->connection);
	}
	
	//--------------------------------------------------------------------
	//	a2b表
	//--------------------------------------------------------------------
	function addA2b($ckey, $timestamp, $to, $t1, $t2, $t3, $t4, $t5, $t6, $t7, $t8, $t9, $t10, $t11, $type)
	{
		$q = "INSERT INTO ".TB_PREFIX."a2b (ckey, time_check, to_vid, u1, u2, u3, u4, u5, u6, u7, u8, u9, u10, u11, type) VALUES ('$ckey', '$timestamp', '$to', '$t1', '$t2', '$t3', '$t4', '$t5', '$t6', '$t7', '$t8', '$t9', '$t10', '$t11', '$type')";
		mysql_query($q, $this->connection);
		return mysql_insert_id($this->connection);
	}
	
	function getA2b($ckey, $check)
	{
		$q = "SELECT * from ".TB_PREFIX."a2b where ckey = '".$ckey."' AND time_check = '".$check."'";
		$result = mysql_query($q, $this->connection);
		if ($result)
		{
			return mysql_fetch_assoc($result);
		}
		else
		{
			return false;
		}
	}
	
	//--------------------------------------------------------------------
	//	attacks表
	//--------------------------------------------------------------------
	function addAttack($vid, $t1, $t2, $t3, $t4, $t5, $t6, $t7, $t8, $t9, $t10, $t11, $type)
	{
		$q = "INSERT INTO ".TB_PREFIX."attacks values (0, $vid, $t1, $t2, $t3, $t4, $t5, $t6, $t7, $t8, $t9, $t10, $t11, $type)";
		mysql_query($q, $this->connection);
		return mysql_insert_id($this->connection);
	}
	
	function modifyAttack($aid, $unit, $amt)
	{
		$unit = 't'.$unit;
		$q = "UPDATE ".TB_PREFIX."attacks set $unit = $unit - $amt where id = $aid";
		return mysql_query($q, $this->connection);
	}
	
	//--------------------------------------------------------------------
	//	enforcement表
	//--------------------------------------------------------------------
	function getEnforce($vid, $from)
	{		
		$q = "SELECT * FROM ".TB_PREFIX."enforcement WHERE `from` = $from and vref = $vid";
		$result = mysql_query($q, $this->connection);
		return mysql_fetch_assoc($result);
	}

	function addEnforce($data)
	{
		$q = "INSERT INTO ".TB_PREFIX."enforcement (vref,`from`) VALUES (".$data['to'].",".$data['from'].")";
		mysql_query($q, $this->connection);
		$id = mysql_insert_id($this->connection);
		$owntribe = $this->getUserField($this->getVillageField($data['from'], "owner"), "tribe", 0);
		$start = ($owntribe == 1)? 1 : (($owntribe == 2)? 11 : 21);
		$end = ($owntribe == 1)? 10 : (($owntribe == 2)? 20 : 30);

		$j = '1';			
		for ($i = $start; $i <= $end; $i++)
		{
			$this->modifyEnforce($id, $i, $data['t'.$j], 1);
			$j++;
		}
		return mysql_insert_id($this->connection);
	}
	
	function modifyEnforce($id, $unit, $amt, $mode)
	{
		$unit = 'u'.$unit;
		if (!$mode)
		{
			$q = "UPDATE ".TB_PREFIX."enforcement set $unit = $unit - $amt where id = $id";
		}
		else
		{
			$q = "UPDATE ".TB_PREFIX."enforcement set $unit = $unit + $amt where id = $id";
		}
		mysql_query($q, $this->connection);
	}

	function getEnforceArray($id, $mode)
	{
		if (!$mode)
		{
			$q = "SELECT * from ".TB_PREFIX."enforcement where id = $id";
		}
		else
		{	
			$q = "SELECT * from ".TB_PREFIX."enforcement where `from` = $id";
		}	
		$result = mysql_query($q, $this->connection);
		return mysql_fetch_assoc($result);
	}

	function getEnforceVillage($id, $mode)
	{	
		if (!$mode)
		{
			$q = "SELECT * from ".TB_PREFIX."enforcement where vref = $id";
		}
		else
		{	
			$q = "SELECT * from ".TB_PREFIX."enforcement where `from` = $id";	
		}	
		$result = mysql_query($q, $this->connection);
		return $this->mysql_fetch_all($result);	
	}
	
	function deleteReinf($id)
	{
		$q = "DELETE from ".TB_PREFIX."enforcement where id = '$id'";
		mysql_query($q, $this->connection);
	}

	//--------------------------------------------------------------------
	//	hero表
	//--------------------------------------------------------------------
	function getHeroRanking()
	{
		$q = "SELECT * FROM ".TB_PREFIX."hero";
		$result = mysql_query($q, $this->connection);
		return $this->mysql_fetch_all($result);
	}
	
	//--------------------------------------------------------------------
	//	units表
	//--------------------------------------------------------------------
	function addUnits($vid)
	{
		$q = "INSERT INTO ".TB_PREFIX."units (vref) values ($vid)";
		return mysql_query($q, $this->connection);
	}
	
	function getUnit($vid)
	{
		$q = "SELECT * from ".TB_PREFIX."units where vref = $vid";
		$result = mysql_query($q, $this->connection);
		return mysql_fetch_assoc($result);
	}
	
	function modifyUnit($vref, $unit, $amt, $mode)
	{
		if ($unit == 230) { $unit = 30; }
		if ($unit == 231) { $unit = 31; }
		if ($unit == 120) { $unit = 20; }
		if ($unit == 121) { $unit = 21; }
		$unit = 'u'.$unit;
		if (!$mode)
		{
			$q = "UPDATE ".TB_PREFIX."units SET $unit = $unit - $amt WHERE vref = $vref";
		}
		else
		{
			$q = "UPDATE ".TB_PREFIX."units SET $unit = $unit + $amt WHERE vref = $vref";
		}
		return mysql_query($q, $this->connection);
	}
	
	//--------------------------------------------------------------------
	//	tdata表
	//--------------------------------------------------------------------
	function addTech($vid)
	{
		$q = "INSERT into ".TB_PREFIX."tdata (vref) values ($vid)";
		return mysql_query($q, $this->connection);
	}
	
	function getTech($vid)
	{
		$q = "SELECT * from ".TB_PREFIX."tdata where vref = $vid";
		$result = mysql_query($q, $this->connection);
		return mysql_fetch_assoc($result);
	}
	
	//--------------------------------------------------------------------
	//	abdata表
	//--------------------------------------------------------------------
	function addABTech($vid)
	{
		$q = "INSERT into ".TB_PREFIX."abdata (vref) values ($vid)";
		return mysql_query($q, $this->connection);
	}
	
	function getABTech($vid)
	{
		$q = "SELECT * FROM ".TB_PREFIX."abdata where vref = $vid";
		$result = mysql_query($q, $this->connection);
		return mysql_fetch_assoc($result);
	}
	
	//--------------------------------------------------------------------
	//	research表
	//--------------------------------------------------------------------
	function addResearch($vid, $tech, $time)
	{
		$q = "INSERT into ".TB_PREFIX."research values (0, $vid, '$tech', $time)";
		return mysql_query($q, $this->connection);
	}
	
	function getResearching($vid)
	{
		$q = "SELECT * FRom ".TB_PREFIX."research where vref = $vid";
		$result = mysql_query($q, $this->connection);
		return $this->mysql_fetch_all($result);
	}
	
	//--------------------------------------------------------------------
	//	training表
	//--------------------------------------------------------------------
	function getTraining($vid)
	{
		$q = "SELECT * FROM ".TB_PREFIX."training where vref = $vid";
		$result = mysql_query($q, $this->connection);
		return $this->mysql_fetch_all($result);
	}
	
	function trainUnit($vid, $unit, $amt, $pop, $each, $time, $mode)
	{
		global $village, $building, $session;
		if (!$mode)
		{
			if ($unit == 10 OR $unit == 20 OR $unit == 30)
			{
				$query = mysql_query('SELECT * FROM `' . TB_PREFIX . 'units` WHERE `vref` = ' . $village->wid);
				$data = mysql_fetch_assoc($query);
				if ($building->getTypeLevel(25) == 0 AND $building->getTypeLevel(26) > 0)
				{
					$max_settlers = ($building->getTypeLevel(26) * 3) / 10;
					if ($building->getTypeLevel(26) == 15)
					{
						$max_settlers += 1;
					}
					elseif ($building->getTypeLevel(26) == 20)
					{
						$max_settlers += 3;
					}
				}
				elseif ($building->getTypeLevel(25) > 0 AND $building->getTypeLevel(26) == 0)
				{
					$max_settlers = ($building->getTypeLevel(25) * 3) / 10;
				}
				$query2 = mysql_query('SELECT * FROM `'.TB_PREFIX.'vdata` WHERE `wref` = '.$village->wid);
				$data2 = mysql_fetch_assoc($query2);
				$exp_c = 0;

				if ($data2['exp1'] != 0) ++$exp_c;
				if ($data2['exp2'] != 0) ++$exp_c;
				$can_settle = 2 - $exp_c;

				if ($can_settle == 0)
				{
					$unit = 0;
				}
				else
				{
					if ($amt > ($max_settlers - $data['u' . $session->tribe . '0']))
					{
						$amt = $max_settlers - $data['u' . $session->tribe . '0'];
					}
				}
			}
			$q = "INSERT INTO ".TB_PREFIX."training VALUES (0, $vid, $unit, $amt, $pop, $time, 1, $time)";
		}
		else
		{
			$q = "DELETe FROM ".TB_PREFIX."training WHERE id = $vid";
		}
		return mysql_query($q, $this->connection);
	}
	
	function updateTraining($id, $trained)
	{
		$time = time();
		$q = "UPDATE ".TB_PREFIX."training SET amt = amt - $trained, timestamp = $time WHERE id = $id";
		return mysql_query($q, $this->connection);
	}

	function modifyCommence($id)
	{	
		$time = time();		
		$q = "UPDATE ".TB_PREFIX."training set commence = $time";	
		return mysql_query($q, $this->connection);
	}
	
	function getTrainingList()
	{
		$q = "SELECT * FROM ".TB_PREFIX."training where vref != ''";
		$result = mysql_query($q, $this->connection);
		return $this->mysql_fetch_all($result);
	}
};

$database = new MYSQL_DB;
?>