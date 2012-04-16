<?php//	市场操作类class Market{
	public $onsale, $onmarket, $sending, $recieving, $return = array();
	public $maxcarry, $merchant, $used;	//	市场操作
	public function procMarket($post)	{
		$this->loadMarket();
		if (isset($_SESSION['loadMarket']))		{
			$this->loadOnsale();
			unset($_SESSION['loadMarket']);
		}
		if (isset($post['ft']))		{
			switch ($post['ft'])			{
				case "mk1":
					$this->sendResource($post);
					break;
				case "mk2":
					$this->addOffer($post);
					break;
				case "mk3":
					$this->tradeResource($post);
					break;
			}
		}
	}	//	移除操作
	public function procRemove($get)	{
		global $database, $village, $session;
		if (isset($get['t']) && $get['t'] == 1)		{
			$this->filterNeed($get);
		}
		elseif (isset($get['t']) && $get['t'] ==2 && isset($get['a']) && $get['a'] == 5 && isset($get['del']))		{
			$database->addMarket($village->wid, $get['del'], 0, 0, 0, 0, 0, 0, 1);
			header("Location: build.php?id=".$get['id']);
		}
		if (isset($get['t']) && $get['t'] == 1 && isset($get['a']) && $get['a'] == $session->mchecker && !isset($get['del']))		{
			$session->changeChecker();
			$this->acceptOffer($get);
		}
	}	//	可用的商人
	public function merchantAvail()	{
		return $this->merchant - $this->used;
	}	//	读取市场信息
	private function loadMarket()	{
		global $session, $building, $bid28, $bid17, $database, $village;		
		$this->recieving = $database->getMovement(0, $village->wid, 1);
		$this->sending = $database->getMovement(0, $village->wid, 0);
		$this->return = $database->getMovement(2, $village->wid, 1);
		$this->merchant = ($building->getTypeLevel(17) > 0)? $bid17[$building->getTypeLevel(17)]['attri'] : 0;
		$this->used = $database->totalMerchantUsed($village->wid);
		$this->onmarket = $database->getMarket($village->wid, 0);
		$this->maxcarry = ($session->tribe == 1)? 3000 : (($session->tribe == 2)? 3000 : 3000);
		if ($building->getTypeLevel(28) != 0)		{
			$this->maxcarry *= $bid28[$building->getTypeLevel(28)]['attri'] / 100;
		}
	}	//	发送资源
	private function sendResource($post)	{
		global $database, $village, $session, $generator, $logging;
		$wtrans = (isset($post['r1']) && $post['r1'] != "")? $post['r1'] : 0;
		$ctrans = (isset($post['r2']) && $post['r2'] != "")? $post['r2'] : 0;
		$itrans = (isset($post['r3']) && $post['r3'] != "")? $post['r3'] : 0;
		$crtrans = (isset($post['r4']) && $post['r4'] != "")? $post['r4'] : 0;
		$wtrans = str_replace("-", "", $wtrans);
		$ctrans = str_replace("-", "", $ctrans);
		$itrans = str_replace("-", "", $itrans);
		$crtrans = str_replace("-", "", $crtrans);
		$resource = array($wtrans, $ctrans, $itrans, $crtrans);
		$reqMerc = 1;
		if (array_sum($resource) > $this->maxcarry)		{
			$reqMerc = round(array_sum($resource) / $this->maxcarry);
			if (array_sum($resource) > $this->maxcarry * $reqMerc)			{
				$reqMerc += 1;
			}
		}
		if ($this->merchantAvail() != 0 && $reqMerc <= $this->merchantAvail())		{
			if (isset($post['dname']) && $post['dname'] != "")			{
				$id = $database->getVillageByName($post['dname']);
				$coor = $database->getCoor($id);
			}			
			if (isset($post['x']) && isset($post['y']) && $post['x'] != "" && $post['y'] != "")			{
				$coor = array('x'=>$post['x'], 'y'=>$post['y']);
				$id = $generator->getBaseID($coor['x'], $coor['y']);
			}
			$timetaken = $generator->procDistanceTime($coor, $village->coor, $session->tribe, 0);
			$reference = $database->sendResource($resource[0], $resource[1], $resource[2], $resource[3], $reqMerc, 0);
			$database->modifyResource($village->wid, $resource[0], $resource[1], $resource[2], $resource[3], 0);
			$database->addMovement(0, $village->wid, $id, $reference, time() + $timetaken);
			$logging->addMarketLog($village->wid, 1, array($resource[0], $resource[1], $resource[2], $resource[3], $id));
		}
		header("Location: build.php?id=".$post['id']);
	}	//	添加挂售
	private function addOffer($post)	{
		global $database, $village, $session;
		$wood = ($post['rid1'] == 1)? $post['m1'] : 0;
		$clay = ($post['rid1'] == 2)? $post['m1'] : 0;
		$iron = ($post['rid1'] == 3)? $post['m1'] : 0;
		$crop = ($post['rid1'] == 4)? $post['m1'] : 0;
		$reqMerc = 1;
		if ($wood + $clay + $iron + $crop > $this->maxcarry)		{
			$reqMerc = round(($wood + $clay + $iron + $crop) / $this->maxcarry);
			if ($wood + $clay + $iron + $crop > $this->maxcarry * $reqMerc)			{
				$reqMerc += 1;
			}
		}
		if ($this->merchantAvail() != 0 && $reqMerc <= $this->merchantAvail())		{
			if ($database->modifyResource($village->wid, $wood, $clay, $iron, $crop, 0))			{
				$time = 0;
				if (isset($_POST['d1']))				{
					$time = $_POST['d2'] * 3600;
				}
				$alliance = (isset($post['ally']) && $post['ally'] == 1)? $session->userinfo['alliance'] : 0;
				$database->addMarket($village->wid, $post['rid1'], $post['m1'], $post['rid2'], $post['m2'], $time, $alliance, $reqMerc, 0);
			}
		}
		header("Location: build.php?id=".$post['id']);
	}	//	同意挂售
	private function acceptOffer($get)	{
		global $database, $village, $session, $logging, $generator;
		$infoarray = $database->getMarketInfo($get['g']);
		$reqMerc = 1;
		if($infoarray['wamt'] > $this->maxcarry)		{
			$reqMerc = round($infoarray['wamt'] / $this->maxcarry);
			if ($infoarray['wamt'] > $this->maxcarry * $reqMerc)			{
				$reqMerc += 1;
			}
		}
		$myresource = $hisresource = array(1=>0, 0, 0, 0);
		$myresource[$infoarray['wtype']] = $infoarray['wamt'];
		$mysendid = $database->sendResource($myresource[1], $myresource[2], $myresource[3], $myresource[4], $reqMerc, 0);		
		$hisresource[$infoarray['gtype']] = $infoarray['gamt'];
		$hissendid = $database->sendResource($hisresource[1], $hisresource[2], $hisresource[3], $hisresource[4], $infoarray['merchant'], 0);
		$hiscoor = $database->getCoor($infoarray['vref']);		
		$mytime = $generator->procDistanceTime($hiscoor, $village->coor, $session->tribe, 0);
		$targettribe = $database->getUserField($database->getVillageField($infoarray['vref'], "owner"), "tribe", 0);
		$histime = $generator->procDistanceTime($village->coor, $hiscoor, $targettribe, 0);
		$database->addMovement(0, $village->wid, $infoarray['vref'], $mysendid, $mytime + time());
		$database->addMovement(0, $infoarray['vref'], $village->wid, $hissendid, $histime + time());		
		$resource = array(1=>0, 0, 0, 0);
		$resource[$infoarray['wtype']] = $infoarray['wamt'];
		$database->modifyResource($village->wid, $resource[1], $resource[2], $resource[3], $resource[4], 0);
		$database->setMarketAcc($get['g']);		
		$logging->addMarketLog($village->wid, 2, array($infoarray['vref'], $get['g']));
		header("Location: build.php?id=".$get['id']);
	}	//	读取当前买卖的信息
	private function loadOnsale()	{
		global $database, $village, $session, $multisort, $generator;
		$displayarray = $database->getMarket($village->wid, 1);
		$holderarray = array();
		foreach ($displayarray as $value)		{
			$targetcoor = $database->getCoor($value['vref']);
			$duration = $generator->procDistanceTime($targetcoor, $village->coor, $session->tribe, 0);
			if ($duration <= $value['maxtime'] || $value['maxtime'] == 0)			{
				$value['duration'] = $duration;
				array_push($holderarray, $value);
			}
		}
		$this->onsale = $multisort->sorte($holderarray, "'duration'", true, 2);
	}	//	过滤需求
	private function filterNeed($get)	{
		if (isset($get['v']) || isset($get['s']) || isset($get['b']))		{
			$holder = $holder2 = array();
			if (isset($get['v']) && $get['v'] == "1:1")			{
				foreach ($this->onsale as $equal)				{
					if ($equal['wamt'] <= $equal['gamt'])					{
						array_push($holder, $equal);
					}
				}
			}
			else			{
				$holder = $this->onsale;
			}
			foreach ($holder as $sale)			{
				if (isset($get['s']) && isset($get['b']))				{
					if ($sale['gtype'] == $get['s'] && $sale['wtype'] == $get['b'])					{
						array_push($holder2, $sale);
					}
				}
				elseif (isset($get['s']) && !isset($get['b']))				{
					if ($sale['gtype'] == $get['s'])					{
						array_push($holder2, $sale);
					}
				}
				elseif (isset($get['b']) && !isset($get['s']))				{
					if ($sale['wtype'] == $get['b'])					{
						array_push($holder2, $sale);
					}
				}
				else				{
					$holder2 = $holder;
				}
			}			
			$this->onsale = $holder2;
		}
		else		{
			$this->loadOnsale();
		}
	}	//	交易资源
	private function tradeResource($post)	{
		global $session, $database, $village;
		if ($session->userinfo['gold'] >= 3)		{
			if ($post['m2'][0] + $post['m2'][1] + $post['m2'][2] + $post['m2'][3] <= 			round($village->awood) + round($village->aclay) + round($village->airon) + round($village->acrop))			{
				$database->setVillageField($village->wid, "wood", $post['m2'][0]);
				$database->setVillageField($village->wid, "clay", $post['m2'][1]);
				$database->setVillageField($village->wid, "iron", $post['m2'][2]);
				$database->setVillageField($village->wid, "crop", $post['m2'][3]);
				$database->modifyGold($session->uid, 3, 0);
				header("Location: build.php?id=".$post['id']."&t=3&c");
			}			else			{
				header("Location: build.php?id=".$post['id']."&t=3");
			}
		}		else		{
			header("Location: build.php?id=".$post['id']."&t=3");
		}
	}
};
$market = new Market;
?>