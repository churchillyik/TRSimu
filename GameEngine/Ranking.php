<?php

//////////////////////////////////////////////////////////////////////////////////////////////////////
//                                             TRAVIANX                                             //
//            Only for advanced users, do not edit if you dont know what are you doing!             //
//                                Made by: Dzoki & Dixie (TravianX)                                 //
//                              - TravianX = Travian Clone Project -                                //
//                                 DO NOT REMOVE COPYRIGHT NOTICE!                                  //
//////////////////////////////////////////////////////////////////////////////////////////////////////

class Ranking {

	private $rankarray =  array();
	private $rlastupdate;
	
	public function getRank() {
		return $this->rankarray;
	}
	
	public function procRankReq($get) {
		global $village,$session;
		if(isset($get['id'])) {
			switch($get['id']) {
				case 1:
				$this->procRankArray();
				break;
				case 8:
				$this->procHeroRankArray();
				break;
				case 31:
				$this->procAttRankArray();
				break;
				case 32:
				$this->procDefRankArray();
				break;
				case 2:
				$this->procVRankArray();
				$this->getStart($this->searchRank($village->wid,"wref"));
				break;
				case 4:
				$this->procARankArray();
				if($session->alliance == 0) {
					$this->getStart(1);
				}
				else {
					$this->getStart($this->searchRank($session->alliance,"id"));
				}
				break;
				case 41:
				$this->procAAttRankArray();
				if($session->alliance == 0) {
					$this->getStart(1);
				}
				else {
					$this->getStart($this->searchRank($session->alliance,"id"));
				}
				break;
				case 42:
				$this->procADefRankArray();
				if($session->alliance == 0) {
					$this->getStart(1);
				}
				else {
					$this->getStart($this->searchRank($session->alliance,"id"));
				}
				break;
			}
		}
		else {
			$this->procRankArray();
			$this->getStart($this->searchRank($session->username,"username"));
		}
	}
	
	public function procRank($post) {
		if(isset($post['ft'])) {
			switch($post['ft']) {
				case "r1":
				case "r31":
				case "r32":
				if(isset($post['rank']) && $post['rank'] != "") {
					$this->getStart($post['rank']);
				}
				if(isset($post['name']) && $post['name'] != "") {
					$this->getStart($this->searchRank($post['name'],"username"));
				}
				break;
				case "r2":
				case "r4":
				case "r42":
				case "r41":
				if(isset($post['rank']) && $post['rank'] != "") {
					$this->getStart($post['rank']);
				}
				if(isset($post['name']) && $post['name'] != "") {
					$this->getStart($this->searchRank($post['name'],"name"));
				}
				break;
			}
		}
	}
	
	private function getStart($search) {
       $multiplier = 1;
	   if(!is_numeric($search)) {
		   $_SESSION['search'] = $search;
	   }
	  else {
		  if($search > count($this->rankarray)) {
			  $search = count($this->rankarray)-1;
		  }
			 while($search > (20*$multiplier)) {
				$multiplier +=1;
			}
			$start = 20*$multiplier-19-1;
		   $_SESSION['search'] = $search;
		   $_SESSION['start'] = $start;
	   }
	}
	
	public function getAllianceRank($id) {
		$this->procARankArray();
		while(1) {
			if(count($this->rankarray) > 1) {
				$key = key($this->rankarray);
				if($this->rankarray[$key]["id"] == $id) {
					return $key;
					break;
				}
				else {
					if(!next($this->rankarray)) {
						return false;
						break;
					}
				}
			}
			else {
				return 1;
			}
		}
	}
	
	public function searchRank($name,$field) {
		while(1) {
			$key = key($this->rankarray);
			if($this->rankarray[$key][$field] == $name) {
				return $key;
				break;
			}
			else {
				if(!next($this->rankarray)) {
					return $name;
					break;
				}
			}
		}
	}
	
	private function procRankArray() {
		global $database,$multisort;
		$array = $database->getRanking();
		$holder = array();
		foreach($array as $value) {
			$value['totalvillage'] = count($database->getVillagesID($value['id']));
			$value['totalpop'] = $database->getVSumField($value['id'],"pop");
			$value['aname'] = $database->getAllianceName($value['alliance']);
			
			array_push($holder,$value);
		}
		$holder = $multisort->sorte($holder, "'totalvillage'", false, 2, "'totalpop'", false, 2);
		$newholder = array("pad");
		foreach($holder as $key) {
			array_push($newholder,$key);
		}
		$this->rankarray = $newholder;
	}
	
	private function procAttRankArray() {
		global $database,$multisort;
		$array = $database->getRanking();
		$holder = array();
		foreach($array as $value) {
			
			$value['totalvillage'] = count($database->getVillagesID($value['id']));
			$value['totalpop'] = $database->getVSumField($value['id'],"pop");
			
			array_push($holder,$value);
		}
		$holder = $multisort->sorte($holder, "'ap'", false, 2, "'totalvillage'", false, 2 , "'ap'", false, 2);
		$newholder = array("pad");
		foreach($holder as $key) {
			array_push($newholder,$key);
		}
		$this->rankarray = $newholder;
	}
	
	private function procDefRankArray() {
		global $database,$multisort;
		$array = $database->getRanking();
		$holder = array();
		foreach($array as $value) {
			
			$value['totalvillage'] = count($database->getVillagesID($value['id']));
			$value['totalpop'] = $database->getVSumField($value['id'],"pop");
			
			array_push($holder,$value);
		}
		$holder = $multisort->sorte($holder, "'dp'", false, 2, "'totalvillage'", false, 2 , "'dp'", false, 2);
		$newholder = array("pad");
		foreach($holder as $key) {
			array_push($newholder,$key);
		}
		$this->rankarray = $newholder;
	}
	
	private function procVRankArray() {
		global $database,$multisort;
		$array = $database->getVRanking();
		$holder = array();
		foreach($array as $value) {
			$coor = $database->getCoor($value['wref']);
			$value['x'] = $coor['x'];
			$value['y'] = $coor['y'];
			$value['user'] = $database->getUserField($value['owner'],"username",0);
			
			array_push($holder,$value);
		}
		$holder = $multisort->sorte($holder, "'x'", true, 2 , "'y'", true, 2, "'pop'", false, 2);
		$newholder = array("pad");
		foreach($holder as $key) {
			array_push($newholder,$key);
		}
		$this->rankarray = $newholder;
	}
	
	private function procARankArray() {
		global $database,$multisort;
		$array = $database->getARanking();
		$holder = array();
    
		foreach($array as $value) {      
			$memberlist = $database->getAllMember($value['id']);
			$totalpop = 0;
			foreach($memberlist as $member) {
				$totalpop += $database->getVSumField($member['id'],"pop");
			}
			$value['players'] = count($memberlist);
			$value['totalpop'] = $totalpop;
			if (!isset($value['avg'])) {
			$value['avg'] = round($totalpop/count($memberlist)); }
			else { $value['avg'] = 0; }
			
			array_push($holder,$value);
		}
		$holder = $multisort->sorte($holder, "'totalpop'", false, 2);
		$newholder = array("pad");
		foreach($holder as $key) {
			array_push($newholder,$key);
		}
		$this->rankarray = $newholder;
	}
	
	private function procHeroRankArray() {
		global $database,$multisort;
		$array = $database->getHeroRanking();
		$holder = array();
		foreach($array as $value) {
			$value['owner'] = $database->getUserField($value['uid'],"username",0);
			$value['level'] = round(($value['attackpower']+$value['defpower']+$value['attackbonus']+$value['defbonus']+$value['regspeed'])/5);
			
			array_push($holder,$value);
		}
		$holder = $multisort->sorte($holder, "'pointused'", false, 2);
		$newholder = array("pad");
		foreach($holder as $key) {
			array_push($newholder,$key);
		}
		$this->rankarray = $newholder;
	}
	
	private function procAAttRankArray() {
		global $database,$multisort;
		$array = $database->getARanking();
		$holder = array();
		foreach($array as $value) {
			$memberlist = $database->getAllMember($value['id']);
			$totalap = 0;
			foreach($memberlist as $member) {
				$totalap += $member['ap'];
			}
			$value['players'] = count($memberlist);
			$value['totalap'] = $totalap;
			if ($value['avg'] > 0) {
			$value['avg'] = round($totalap/count($memberlist)); }
			else { $value['avg'] = 0; }
			
			array_push($holder,$value);
		}
		$holder = $multisort->sorte($holder, "'totalap'", false, 2);
		$newholder = array("pad");
		foreach($holder as $key) {
			array_push($newholder,$key);
		}
		$this->rankarray = $newholder;
	}
	
	private function procADefRankArray() {
		global $database,$multisort;
		$array = $database->getARanking();
		$holder = array();
		foreach($array as $value) {
			$memberlist = $database->getAllMember($value['id']);
			$totaldp = 0;
			foreach($memberlist as $member) {
				$totaldp += $member['dp'];
			}
			$value['players'] = count($memberlist);
			$value['totaldp'] = $totaldp;
			if ($value['avg'] > 0) {
			$value['avg'] = round($totalap/count($memberlist)); }
			else { $value['avg'] = 0; }
			
			array_push($holder,$value);
		}
		$holder = $multisort->sorte($holder, "'totaldp'", false, 2);
		$newholder = array("pad");
		foreach($holder as $key) {
			array_push($newholder,$key);
		}
		$this->rankarray = $newholder;
	}
};

$ranking = new Ranking;

?>