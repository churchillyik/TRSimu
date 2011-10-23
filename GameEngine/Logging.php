<?php

//////////////////////////////////////////////////////////////////////////////////////////////////////
//                                             TRAVIANX                                             //
//            Only for advanced users, do not edit if you dont know what are you doing!             //
//                                Made by: Dzoki & Dixie (TravianX)                                 //
//                              - TravianX = Travian Clone Project -                                //
//                                 DO NOT REMOVE COPYRIGHT NOTICE!                                  //
//////////////////////////////////////////////////////////////////////////////////////////////////////

class Logging {
	
	public function addIllegal($uid,$ref,$type) {
		global $database;
		if(LOG_ILLEGAL) {
			$log = "Attempted to ";
			switch($type) {
				case 1:
				$log .= "access village $ref";
				break;
			}
			$q = "Insert into ".TB_PREFIX."illegal_log values (0,$uid,'$log')";
			$database->query($q);
		}
	}
	
	public function addLoginLog($id,$ip) {
		global $database;
		if(LOG_LOGIN) {
			$q = "Insert into ".TB_PREFIX."login_log values (0,$id,'$ip')";
			$database->query($q);
		}
	}
	
	public function addBuildLog($wid,$building,$level,$type) {
		global $database;
		if(LOG_BUILD) {
			if($type) {
				$log = "Start Construction of ";
			}
			else {
				$log = "Start Upgrade of ";
			}
			$log .= $building." at level ".$level;
			$q = "Insert into ".TB_PREFIX."build_log values (0,$wid,'$log')";
			$database->query($q);
		}
	}
	
	public function addTechLog($wid,$tech,$level) {
		global $database;
		if(LOG_TECH) {
			$log = "Upgrading of tech ".$tech." to level ".$level;
			$q = "Insert into ".TB_PREFIX."tech_log values (0,$wid,'$log')";
			$database->query($q);
		}
	}
	
	public function goldFinLog($wid) {
		global $database;
		if(LOG_GOLD_FIN) {
			$log = "Finish construction and research with gold";
			$q = "Insert into ".TB_PREFIX."gold_fin_log values (0,$wid,'$log')";
			$database->query($q);
		}
	}
	
	public function addAdminLog() {
		global $database;
	}
	
	public function addMarketLog($wid,$type,$data) {
		global $database;
		if(LOG_MARKET) {
			if($type == 1) {
				$log = "Sent ".$data[0].",".$data[1].",".$data[2].",".$data[3]." to village ".$data[4];
			}
			else if($type == 2) {
				$log = "Traded resource between ".$wid." and ".$data[0]." market ref is ".$data[1];
			}
			$q = "Insert into ".TB_PREFIX."market_log values (0,$wid,'$log')";
			$database->query($q);
		}
	}

	public function VillageDestroyCatalog($wid) {
		global $database;
		if(LOG_GOLD_FIN) {
			$log = "Village destroyed";
			$q = "Insert into ".TB_PREFIX."destroy_log values (0,$wid,'$log')";
			$database->query($q);
		}
	}
	
	public function addWarLog() {
		global $database;
	}
	
	public function clearLogs() {
		global $database;
	}
	
};


$logging = new Logging;
?>