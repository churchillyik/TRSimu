<?php

//////////////////////////////////////////////////////////////////////////////////////////////////////
//                                             TRAVIANX                                             //
//            Only for advanced users, do not edit if you dont know what are you doing!             //
//                                Made by: Dzoki & Dixie (TravianX)                                 //
//                              - TravianX = Travian Clone Project -                                //
//                                 DO NOT REMOVE COPYRIGHT NOTICE!                                  //
//////////////////////////////////////////////////////////////////////////////////////////////////////

class Generator {
	
	public function generateRandID(){
		return md5($this->generateRandStr(16));
		}

   public function generateRandStr($length){
      $randstr = "";
      for($i=0; $i<$length; $i++){
         $randnum = mt_rand(0,61);
         if($randnum < 10){
            $randstr .= chr($randnum+48);
         }else if($randnum < 36){
            $randstr .= chr($randnum+55);
         }else{
            $randstr .= chr($randnum+61);
         }
      }
      return $randstr;
   }
   
   public function encodeStr($str,$length) {
	   $encode = md5($str);
	   return substr($encode,0,$length);
   }
   
   public function procDistanceTime($coor,$thiscoor,$ref,$mode) {
		global $bid28,$bid14,$building;
		if($thiscoor['x'] > $coor['x']) {
			$xdistance = $thiscoor['x'] - $coor['x'];
		}
		else {
			$xdistance = $coor['x'] - $thiscoor['x'];
		}
		if(($coor['x'] < 0 && $thiscoor['x'] > 0) || ($thiscoor['x'] < 0 && $coor['x'] > 0)) {
			$xdistance += 1;
		}
		if($xdistance >= WORLD_MAX) {
			while($xdistance >= WORLD_MAX):
			$xdistance -= WORLD_MAX;
			endwhile;
		}
		if($thiscoor['y'] > $coor['y']) {
			$ydistance = $thiscoor['y'] - $coor['y'];
		}
		else {
			$ydistance = $coor['y'] - $thiscoor['y'];
		}
		if(($coor['y'] < 0 && $thiscoor['y'] > 0) || ($thiscoor['y'] < 0 && $coor['y'] > 0)) {
			$ydistance += 1;
		}
		if($ydistance >= WORLD_MAX) {
			while($ydistance >= WORLD_MAX):
			$ydistance -= WORLD_MAX;
			endwhile;
		}
		$distance = $xdistance + $ydistance;
		if(!$mode) {
			if($ref == 1) {
				$speed = 16;
			}
			else if($ref == 2) {
				$speed = 24;
			}
			else {
				$speed = 12;
			}
			if($building->getTypeLevel(28) != 0) {
				$speed *= $bid28[$building->getTypeLevel(28)]['attri'] / 100;
			}
		}
		else {
			$speed = $ref;
			if($building->getTypeLevel(14) != 0) {
				$speed *= $bid14[$building->getTypeLevel(14)]['attri'] / 100;
			}
		}
		return round(($distance/$speed) * 3600 / INCREASE_SPEED);
	}
   
   public function getTimeFormat($time) {
	   /*if ($time%10 < 5) {
			$time = $time-($time%10);
		}
		else {
			$time = $time + (10 - $time%10);
		}*/
	   $min = 0;
	   $hr = 0;
	   while($time >= 60) :
		   $time -= 60;
		   $min += 1;
	   endwhile;
	   while ($min > 60) :
		   $min -= 60;
		   $hr += 1;
	   endwhile;
	   if ($min < 10) {
		   $min = "0".$min;
	   }
	   if($time < 10) {
		   $time = "0".$time;
	   }
		return $hr.":".$min.":".$time;
   }

	public function procMtime($time) {
		/*$timezone = 7;
		switch($timezone) {
			case 7:
			$time -= 3600;
			break;
		}*/
		if ((time()-$time) < 24*60*60) {
			$day = "today";
		}
		else {
			$pref = 3;
			switch($pref) {
			case 1:
			$day = date("m/j/y",$time);
			break;
			case 2:
			$day = date("j/m/y",$time);
			break;
			case 3:
			$day = date("j.m.y",$time);
			break;
			default:
			$day = date("y/m/j",$time);
			break;
			}
		}
		$new = date("H:i",$time);
		return array($day,$new);
	}
   
	public function getBaseID($x,$y) {
	return ((WORLD_MAX-$y) * (WORLD_MAX*2+1)) + (WORLD_MAX +$x + 1);
	}
   
	public function getMapCheck($wref) {
		return substr(md5($wref),5,2);
	}
   
	public function pageLoadTimeStart() {
		$starttime = microtime();
		$startarray = explode(" ", $starttime);
		//$starttime = $startarray[1] + $startarray[0];
		return $startarray[0];
	}

	public function pageLoadTimeEnd() {
		$endtime = microtime();
		$endarray = explode(" ", $endtime);
		//$endtime = $endarray[1] + $endarray[0];
		return $endarray[0];
	}
	
};
$generator = new Generator;