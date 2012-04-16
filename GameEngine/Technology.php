<?php

//	科技类
class Technology
{
	private $unarray = array(1=>"Legionnaire","Praetorian","Imperian","Equites Legati","Equites Imperatoris","Equites Caesaris","Battering Ram","Fire Catapult","Senator","Settler","Clubswinger","Spearman","Axeman","Scout","Paladin","Teutonic Knight","Ram","Catapult","Chief","Settler","Phalanx","Swordsman","Pathfinder","Theutates Thunder","Druidrider","Haeduan","Ram","Trebuchet","Chieftain","Settler","Rat","Spider","Snake","Bat","Wild Boar","Wolf","Bear","Crocodile","Tiger","Elephant","Pikeman","Thorned Warrior","Guardsman","Birds Of Prey","Axerider","Natarian Knight","War Elephant","Ballista","Natarian Emperor","Settler");
	
	public function grabAcademyRes()
	{
		global $village;
		$holder = array();
		foreach ($village->researching as $research)
		{
			if (substr($research['tech'], 0, 1) == "t")
			{
				array_push($holder, $research);
			}
		}
		return $holder;
	}
	
	//	某科技是否正在研究
	public function isResearch($tech, $type)
	{
		global $village;
		if (count($village->researching) == 0)
		{
			return false;
		}
		else
		{
			switch ($type)
			{
				case 1: $string = "t"; break;
				case 2: $string = "a"; break;
				case 3: $string = "b"; break;
			}
			foreach ($village->researching as $research)
			{
				if ($research['tech'] == $string.$tech)
				{
					return true;
				}
			}
			return false;
		}
	}
	
	//	执行研究
	public function procTech($post)
	{
		if (isset($post['ft']))
		{
			switch($post['ft'])
			{
				case "t1":
				$this->procTrain($post);
				break;
			}
		}
	}
	
	public function procTechno($get)
	{
		global $village;
		if (isset($get['a']))
		{
			switch ($village->resarray['f'.$get['id'].'t'])
			{
				case 22:
					$this->researchTech($get);
					break;
				case 13:
					$this->upgradeArmour($get);
					break;
				case 12:
					$this->upgradeSword($get);
					break;
			}
		}
	}
	
	//	获得训练列表
	public function getTrainingList($type)
	{
		global $database, $village;
		$trainingarray = $database->getTraining($village->wid);
		$listarray = array();
		$footies = array(1, 2, 3, 11, 12, 13, 14, 21, 22);
		$calvary = array(4, 5, 6, 15, 16, 23, 24, 25, 26);
		$workshop = array(7, 8, 17, 18, 27, 28);
		if (count($trainingarray) > 0)
		{
			foreach ($trainingarray as $train)
			{
				if ($type == 1 && in_array($train['unit'], $footies))
				{
					$train['name'] = $this->unarray[$train['unit']];
					array_push($listarray, $train);
				}
				if ($type == 2 && in_array($train['unit'], $calvary))
				{
					$train['name'] = $this->unarray[$train['unit']];
					array_push($listarray, $train);
				}
				if ($type == 3 && in_array($train['unit'], $workshop))
				{
					$train['name'] = $this->unarray[$train['unit']];
					array_push($listarray, $train);
				}
			}
		}
		return $listarray;
	}
	
	//	获得军队列表
	public function getUnitList()
	{
		global $database, $village;

		// get unit list of the village
		$unitcheck = $database->getUnit($village->wid);
		// check from u1 to u50
		for ($i = 1; $i <= 50; $i++)
		{
			// if unit above 4 milion reset them to 0
			if($unitcheck['u'.$i] >= "4000000")
			{
				// reset command
				mysql_query("UPDATE ".TB_PREFIX."units set u".$i." = '0' where vref = $village->wid");
			}
		}

		$unitarray = func_num_args() == 1? $database->getUnit(func_get_arg(0)) : $village->unitall;
		$listArray = array();
		for ($i = 1; $i < count($this->unarray); $i++)
		{
			$holder = array();
			if ($unitarray['u'.$i] != 0 && $unitarray['u'.$i] != "")
			{
				$holder['id'] = $i;
				$holder['name'] = $this->unarray[$i];
				$holder['amt'] = $unitarray['u'.$i];
				array_push($listArray, $holder);
			}
		}
		return $listArray;
	}
	
	public function maxUnit($unit)
	{
		$unit = "u".$unit;
		global $village, $$unit;
		$unitarray = $$unit;
		$res = array();
		$res = mysql_fetch_assoc(mysql_query("SELECT maxstore, maxcrop, wood, clay, iron, crop FROM ".TB_PREFIX."vdata WHERE wref = ".$village->wid)) or die(mysql_error());
		
		if ($res['wood'] > $res['maxstore'])	{$res['wood'] = $res['maxstore'];}
		if ($res['clay'] > $res['maxstore'])	{$res['clay'] = $res['maxstore'];}
		if ($res['iron'] > $res['maxstore'])	{$res['iron'] = $res['maxstore'];}
		if ($res['crop'] > $res['maxcrop']) 	{$res['crop'] = $res['maxcrop'];}
		$woodcalc = floor($res['wood'] / $unitarray['wood']);
		$claycalc = floor($res['clay'] / $unitarray['clay']);
		$ironcalc = floor($res['iron'] / $unitarray['iron']);
		$cropcalc = floor($res['crop'] / $unitarray['crop']);
		
		$popcalc = floor($village->getProd("crop") / $unitarray['pop']);
		return min($woodcalc, $claycalc, $ironcalc, $cropcalc);
	}
	
	//	获得本族的战斗单位
	public function getUnits()
	{
		global $database, $village;
		if (func_num_args() == 1)
		{
			$base = func_get_arg(0);
		}
		$ownunit = func_num_args() == 2? func_get_arg(0) : $database->getUnit($base);
		$enforcementarray = func_num_args() == 2? func_get_arg(1) : $database->getEnforceVillage($base, 0);
		if (count($enforcementarray) > 0)
		{
			foreach ($enforcementarray as $enforce)
			{
				for ($i = 1; $i <= 50; $i++)
				{
					$ownunit['u'.$i] += $enforce['u'.$i];
				}
			}
		}
		return $ownunit;
	}
	
	function getAllUnits($base)
	{
		global $database;
		$ownunit = $database->getUnit($base);
		$enforcementarray = $database->getEnforceVillage($base, 0);
		if (count($enforcementarray) > 0)
		{
			foreach ($enforcementarray as $enforce)
			{
				for ($i = 1; $i <= 50; $i++)
				{
					$ownunit['u'.$i] += $enforce['u'.$i];
				}
			}
		}
		return $ownunit;
	}	
	
	//	检查是否满足研发条件
	public function meetTRequirement($unit)
	{
		global $session;
		switch ($unit)
		{
			case 1:
				if ($session->tribe == 1)
				{
					return true;
				}
				else
				{
					return false;
				}
				break;
			case 2:
			case 3:
			case 4:
			case 5:
			case 6:
			case 7:
			case 8:
				if ($this->getTech($unit) && $session->tribe == 1) { return true; } else { return false; }
				break;
			case 10:
				if ($session->tribe == 1) { return true; } else { return false; }
				break;
			case 11:
				if ($session->tribe == 2) { return true; } else { return false; }
				break;
			case 12:
			case 13:
			case 14:
			case 15:
			case 16:
			case 17:
			case 18:
				if ($session->tribe == 2 && $this->getTech($unit)) { return true; } else { return false; }
				break;
			case 20:
				if ($session->tribe == 2) { return true; } else { return false; }
				break;
			case 21:
				if ($session->tribe == 3) { return true; } else { return false; }
				break;
			case 22: 
			case 23:
			case 24:
			case 25:
			case 26:
			case 27:
			case 28:
				if ($session->tribe == 3 && $this->getTech($unit)) { return true; } else { return false; }
				break;
			case 30:
				if ($session->tribe == 3) { return true; } else { return false; }
				break;
		}
	}
	
	public function getTech($tech)
	{
		global $village;
		return ($village->techarray['t'.$tech] == 1);
	}
	
	private function procTrain($post)
	{
		global $session;
		$start = ($session->tribe == 1)? 1 : (($session->tribe == 2)? 11 : 21);
		for ($i = $start; $i <= $start + 9; $i++)
		{
			if (isset($post['t'.$i]) && $post['t'.$i] != 0)
			{
				$amt = $post['t'.$i];
				$amt = intval($amt);
				if ($amt < 0)
				{
					$amt = 1;
				}
				$this->trainUnit($i, $amt);
			}
		}
		
		header("Location: build.php?id=".$post['id']);
	}
	
	//	获得某战斗单位的粮食消耗
	public function getUpkeep($array, $type)
	{
		$upkeep = 0;
		switch ($type)
		{
			case 0:
				$start = 1;
				$end = 50;
				break;
			case 1:
				$start = 1;
				$end = 10;
				break;
			case 2:
				$start = 11;
				$end = 20;
				break;
			case 3:
				$start = 21;
				$end = 30;
				break;
			case 4:
				$start = 31;
				$end = 40;
				break;
		}	
		for ($i = $start; $i <= $end; $i++)
		{
			$unit = "u".$i;
			global $$unit;
			$dataarray = $$unit;
			$upkeep += $dataarray['pop'] * $array[$unit];
		}
		return $upkeep;
	}
	
	//	训练单位
	private function trainUnit($unit, $amt)
	{
		global $session,$database, ${'u'.$unit}, $building, $village, $bid19, $bid20, $bid21;

		$footies = array(1, 2, 3, 11, 12, 13, 14, 21, 22);
		$calvary = array(4, 5, 6, 15, 16, 23, 24, 25, 26);
		$workshop = array(7, 8, 17, 18, 27, 28);
		if (in_array($unit,$footies))
		{
			$each = round(($bid19[$building->getTypeLevel(19)]['attri'] / 100) * ${'u'.$unit}['time'] / SPEED);
		}
		if (in_array($unit,$calvary))
		{
			$each = round(($bid20[$building->getTypeLevel(20)]['attri'] / 100) * ${'u'.$unit}['time'] / SPEED);
		}
		if (in_array($unit,$workshop))
		{
			$each = round(($bid21[$building->getTypeLevel(21)]['attri'] / 100) * ${'u'.$unit}['time'] / SPEED);
		}
		if ($this->maxUnit($unit) <= $amt)
		{
			$amt = $this->maxUnit($unit);
		}
		$wood = ${'u'.$unit}['wood'] * $amt;
		$clay = ${'u'.$unit}['clay'] * $amt;
		$iron = ${'u'.$unit}['iron'] * $amt;
		$crop = ${'u'.$unit}['crop'] * $amt;


		if ($database->modifyResource($village->wid, $wood, $clay, $iron, $crop, 0))
		{
			$database->trainUnit($village->wid, $unit, $amt, ${'u'.$unit}['pop'], $each, time(), 0);
		}
	}
	
	//	
	public function meetRRequirement($tech)
	{
		global $session, $building;
		switch ($tech)
		{
			case 2:
				if ($building->getTypeLevel(22) >= 1 && $building->getTypeLevel(13) >= 1) { return true; } else { return false; }
				break;
			case 3:
				if ($building->getTypeLevel(22) >= 5 && $building->getTypeLevel(12) >= 1) { return true; } else { return false; }
				break;
			case 4:
			case 23:
				if ($building->getTypeLevel(22) >= 5 && $building->getTypeLevel(20) >= 1) { return true; } else { return false; }
				break;
			case 5:
			case 25:
				if ($building->getTypeLevel(22) >= 5 && $building->getTypeLevel(20) >= 5) { return true; } else { return false; }
				break;
			case 6:
				if ($building->getTypeLevel(22) >= 5 && $building->getTypeLevel(20) >= 10) { return true; } else { return false; }
				break;	
			case 9:
			case 29:
				if ($building->getTypeLevel(22) >= 20 && $building->getTypeLevel(16) >= 10) { return true; } else { return false; }
				break;
			case 12:
				if ($building->getTypeLevel(22) >= 1 && $building->getTypeLevel(19) >= 3) { return true; } else { return false; }
				break;
			case 13:
				if ($building->getTypeLevel(22) >= 3 && $building->getTypeLevel(11) >= 1) { return true; } else { return false; }
				break;
			case 14:
				if ($building->getTypeLevel(22) >= 1 && $building->getTypeLevel(15) >= 5) { return true; } else { return false; }
				break;
			case 15:
				if ($building->getTypeLevel(22) >= 1 && $building->getTypeLevel(20) >= 3) { return true; } else { return false; }
				break;
			case 16:
			case 26:
				if ($building->getTypeLevel(22) >= 15 && $building->getTypeLevel(20) >= 10) { return true; } else { return false; }
				break;
			case 7:
			case 17:
			case 27:
				if ($building->getTypeLevel(22) >= 10 && $building->getTypeLevel(21) >= 1) { return true; } else { return false; }
				break;
			case 8:
			case 18:
			case 28:
				if ($building->getTypeLevel(22) >= 15 && $building->getTypeLevel(21) >= 10) { return true; } else { return false; }
				break;
			case 19:
				if ($building->getTypeLevel(22) >= 20 && $building->getTypeLevel(16) >= 5) { return true; } else { return false; }
				break;
			case 22:
				if ($building->getTypeLevel(22) >= 3 && $building->getTypeLevel(12) >= 1) { return true; } else { return false; }
				break;
			case 24:
				if ($building->getTypeLevel(22) >= 5 && $building->getTypeLevel(20) >= 3) { return true; } else { return false; }
				break;
		}
	}
	
	//	研发科技
	private function researchTech($get)
	{
		global $database, $session, ${'r'.$get['a']}, $village, $logging;
		if ($this->meetRRequirement($get['a']) && $get['c'] == $session->mchecker)
		{
			$data = ${'r'.$get['a']};
			$time = time() + round($data['time'] / SPEED);
			$database->modifyResource($village->wid, $data['wood'], $data['clay'], $data['iron'], $data['crop'], 0);
			$database->addResearch($village->wid, "t".$get['a'], $time);
			$logging->addTechLog($village->wid, "t".$get['a'], 1);
		}
		
		$session->changeChecker();
		header("Location: build.php?id=".$get['id']);
	}
	
	//	升级攻击
	private function upgradeSword($get)
	{
		global $database, $session, ${'ab'.$get['a']}, $village, $logging;
		if ($this->meetRRequirement($get['a']) && $get['c'] == $session->mchecker)
		{
			$data = ${'ab'.$get['a']};
			$time = time() + round($data['time'] / SPEED);
			$database->modifyResource($village->wid, $data['wood'], $data['clay'], $data['iron'], $data['crop'], 0);
			$database->addABTech($village->wid, "b".$get['a'], $time);
		}
		
		$session->changeChecker();
		header("Location: build.php?id=".$get['id']);
	}
	
	//	升级防御
	private function upgradeArmour($get)
	{
		global $database,$session,${'ab'.$get['a']}, $village, $logging;
		if ($this->meetRRequirement($get['a']) && $get['c'] == $session->mchecker)
		{
			$data = ${'ab'.$get['a']};
			$time = time() + round($data['time'] / SPEED);
			$database->modifyResource($village->wid,$data['wood'], $data['clay'], $data['iron'], $data['crop'], 0);
			$database->addABTech($village->wid, "b".$get['a'], $time);
		}
		
		$session->changeChecker();
		header("Location: build.php?id=".$get['id']);
	}
	
	//	获得战斗单位的名称
	public function getUnitName($i)
	{
		return $this->unarray[$i];
	}
	
	//	科技升级完毕
	public function finishTech()
	{
		global $database, $village;
		$q = "SELECT * FROM ".TB_PREFIX."research where vref = ".$village->wid;
		$array = $database->query_return($q);
		foreach ($array as $tech)
		{
			$type = substr($tech['tech'], 0, 1);
			switch ($type)
			{
				case "t":
					$q = "UPDATE ".TB_PREFIX."tdata set ".$tech['tech']." = 1 where vref = ".$village->wid;
					break;
				case "a":
				case "b":
					$q = "UPDATE ".TB_PREFIX."abdata set ".$tech['tech']." = ".$tech['tech']." + 1 where vref = ".$village->wid;
					break;
			}
			$database->query($q);
		}
	}
	
	//	计算可研发的时刻
	public function calculateAvaliable($id)
	{
		global $village, $generator, ${'r'.$id};
		$rwood = ${'r'.$id}['wood'] - $village->awood;
		$rclay = ${'r'.$id}['clay'] - $village->aclay;
		$rcrop = ${'r'.$id}['crop'] - $village->acrop;
		$riron = ${'r'.$id}['iron'] - $village->airon;
		$rwtime = $rwood / $village->getProd("wood") * 3600;
		$rcltime = $rclay / $village->getProd("clay") * 3600;
		$rctime = $rcrop / $village->getProd("crop") * 3600;
		$ritime = $riron / $village->getProd("iron") * 3600;
		
		$reqtime = max($rwtime, $rctime, $rcltime, $ritime);
		$reqtime += time();
		return $generator->procMtime($reqtime);
	}
	
	public function checkReinf($id)
	{
		global $database;
		$enforce=$database->getEnforceArray($id, 0);
		$fail = '0';
		for ($i = 1; $i < 50; $i++)
		{
			if ($enforce['u'.$i.''] > 0)
			{
				$fail = '1';
			}
		}
		if ($fail == 0)
		{ 
			$database->deleteReinf($id);
		}
	}
};

$technology = new Technology;
?>