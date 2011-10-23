<?php

//////////////////////////////////////////////////////////////////////////////////////////////////////
//                                             TRAVIANX                                             //
//            Only for advanced users, do not edit if you dont know what are you doing!             //
//                                Made by: Dzoki & Dixie (TravianX)                                 //
//                              - TravianX = Travian Clone Project -                                //
//                                 DO NOT REMOVE COPYRIGHT NOTICE!                                  //
//////////////////////////////////////////////////////////////////////////////////////////////////////

class Units {
	public $sending,$recieving,$return = array();

	public function procUnits($post) {
		if(isset($post['c'])) {
			switch($post['c']) {
			
				case "1":
				if (isset($post['a'])&& $post['a']==533374){
				$this->sendTroops($post);
				}else{
				$post = $this->loadUnits($post);
				return $post;								
				}
				break;
					
				case "2":
				if (isset($post['a'])&& $post['a']==533374){
				$this->sendTroops($post);
				}else{
				$post = $this->loadUnits($post);
				return $post;								
				}
				break;	
				
				case "8":
				$this->sendTroopsBack($post);
				break;	
				
				case "3":
				if (isset($post['a'])&& $post['a']==533374){
				$this->sendTroops($post);
				}else{
				$post = $this->loadUnits($post);
				return $post;								
				}
				break;
				
				case "4":
				if (isset($post['a'])&& $post['a']==533374){
					$this->sendTroops($post);
				}else{
				$post = $this->loadUnits($post);
				return $post;								
				}
				
				case "5":
				if (isset($post['a'])&& $post['a']== "new"){
					$this->Settlers($post);
				}else{
				$post = $this->loadUnits($post);
				return $post;								
				}
				break;
			}
		}
	}
	private function loadUnits($post) {
		global $database,$village,$session,$generator,$logging,$form;
				// Busqueda por nombre de pueblo
				// Confirmamos y buscamos las coordenadas por nombre de pueblo
				if(	!$post['t1'] && !$post['t2'] && !$post['t3'] && !$post['t4'] && !$post['t5'] && 
					!$post['t6'] && !$post['t7'] && !$post['t8'] && !$post['t9'] && !$post['t10']){
				$form->addError("error",MIN_1_TROOP);				
				}				
				
				if(!$post['dname'] && !$post['x'] && !$post['y']){
				$form->addError("error",INSERT_NAME_OR_COOR);			
				}
				
				if(isset($post['dname']) && $post['dname'] != "") {
					$id = $database->getVillageByName(stripslashes($post['dname']));
					if (!isset($id)){				
					$form->addError("error",VILLAGE_NOT_EXIST);
					}else{
					$coor = $database->getCoor($id);
					}
				}
				// Busqueda por coordenadas de pueblo
				// Confirmamos y buscamos las coordenadas por coordenadas de pueblo				
				if(isset($post['x']) && isset($post['y']) && $post['x'] != "" && $post['y'] != "") {
					$coor = array('x'=>$post['x'], 'y'=>$post['y']);
					$id = $generator->getBaseID($coor['x'],$coor['y']);
					if (!$database->getVillageState($id)){
						$form->addError("error",ATACK_2_COOR_NOT_EXIST);
					}
					if ($session->tribe == 1){$Gtribe = "";}elseif ($session->tribe == 2){$Gtribe = "1";}else{$Gtribe = "2";}
					for($i=1; $i<11; $i++)
					{
						if(isset($post['t'.$i]))
						{
							if ($post['t'.$i] > $village->unitarray['u'.$Gtribe.$i])
							{
								$form->addError("error","You can't send more units than you have");
								break;
							}
							
							if($post['t'.$i]<0)
							{
								$form->addError("error","You can't send negative units.");
								break;
							}
						}												
					}
				}
				//check if banned:
				$villageOwner = $database->getVillageField($id,'owner');
				$userAccess = $database->getUserField($villageOwner,'access',0);
					if($userAccess == '0'){
								$form->addError("error","Player is Banned. You can't attack him");
								//break;
					}
				// Procesamos el array con los errores dados en el formulario
				if($form->returnErrors() > 0) {
					$_SESSION['errorarray'] = $form->getErrors();
					$_SESSION['valuearray'] = $_POST;
					header("Location: a2b.php");		
				}else{				
				// Debemos devolver un array con $post, que contiene todos los datos mas 
				// otra variable que definira que el flag esta levantado y se va a enviar y el tipo de envio
				$villageName = $database->getVillageField($id,'name');
				$speed= 300;
				$timetaken = $generator->procDistanceTime($coor,$village->coor,INCREASE_SPEED,1);								
				array_push($post, "$id", "$villageName", "$villageOwner","$timetaken");
				return $post;
				
			}	
	
	}
	private function sendTroops($post) {
		global $form, $database, $village, $generator, $session;

		$data = $database->getA2b($post['timestamp_checksum'], $post['timestamp']);

		
		
		 $Gtribe = "";
		if ($session->tribe == '2'){ $Gtribe = "1"; } else if ($session->tribe == '3'){ $Gtribe = "2"; }
				for($i=1; $i<9; $i++){
						if(isset($data['u'.$i])){
							if ($data['u'.$i] > $village->unitarray['u'.$Gtribe.$i])
							{
								$form->addError("error","You can't send more units than you have");
								break;
							}
							
							if($data['u'.$i]<0)
							{
								$form->addError("error","You can't send negative units.");
								break;
							}
						}												
					}
				if($form->returnErrors() > 0) {
					$_SESSION['errorarray'] = $form->getErrors();
					$_SESSION['valuearray'] = $_POST;
					header("Location: a2b.php");		
				} else {
		
		
		 if($session->tribe == 1){ $u = ""; } elseif($session->tribe == 2){ $u = "1"; } else {$u = "2"; }
				
		
		$database->modifyUnit($village->wid,$u."1",$data['u1'],0);
		$database->modifyUnit($village->wid,$u."2",$data['u2'],0);
		$database->modifyUnit($village->wid,$u."3",$data['u3'],0);
		$database->modifyUnit($village->wid,$u."4",$data['u4'],0);
		$database->modifyUnit($village->wid,$u."5",$data['u5'],0);
		$database->modifyUnit($village->wid,$u."6",$data['u6'],0);
		$database->modifyUnit($village->wid,$u."7",$data['u7'],0);
		$database->modifyUnit($village->wid,$u."8",$data['u8'],0);
		$database->modifyUnit($village->wid,$u."9",$data['u9'],0);
		$database->modifyUnit($village->wid,$u.$session->tribe."0",$data['u10'],0);
		$database->modifyUnit($village->wid,$u.$session->tribe."1",$data['u11'],0);
		
    $query1 = mysql_query('SELECT * FROM `' . TB_PREFIX . 'vdata` WHERE `wref` = ' . mysql_escape_string($data['to_vid']));
    $data1 = mysql_fetch_assoc($query1);
    $query2 = mysql_query('SELECT * FROM `' . TB_PREFIX . 'users` WHERE `id` = ' . $data1['owner']);
    $data2 = mysql_fetch_assoc($query2);
    $query11 = mysql_query('SELECT * FROM `' . TB_PREFIX . 'vdata` WHERE `wref` = ' . mysql_escape_string($village->wid));
    $data11 = mysql_fetch_assoc($query11);
    $query21 = mysql_query('SELECT * FROM `' . TB_PREFIX . 'users` WHERE `id` = ' . $data11['owner']);
    $data21 = mysql_fetch_assoc($query21);

				
    if($data2['protect'] < time()) {
		$eigen = $database->getCoor($village->wid);
		$from = array('x'=>$eigen['x'], 'y'=>$eigen['y']);
		$ander = $database->getCoor($data['to_vid']);
		$to = array('x'=>$ander['x'], 'y'=>$ander['y']);
			$start = ($data21['tribe'] == 1)? 1 : (($data21['tribe'] == 2)? 11: 21);
			$end = ($data21['tribe'] == 1)? 10 : (($data21['tible'] == 2)? 20: 30);
			$unitspeeds = array(6,5,7,16,14,10,4,3,4,5,7,7,6,9,10,9,4,3,4,5,7,6,17,19,16,13,4,3,4,5);
			$speeds = array();
			$scout = 1;

				//find slowest unit.
				for($i=1;$i<=10;$i++){
					if (isset($data['u'.$i])){
						if( $data['u'.$i] != '' && $data['u'.$i] > 0){
							$speeds[] = $unitspeeds[$i-2+$start];
							//if($i != 4)
							//$scout = 0;
						}
					}
				}
				
		$time = $generator->procDistanceTime($from,$to,min($speeds),1);
		$reference = $database->addAttack(($village->wid),$data['u1'],$data['u2'],$data['u3'],$data['u4'],$data['u5'],$data['u6'],$data['u7'],$data['u8'],$data['u9'],$data['u10'],$data['u11'],$data['type']);
  		$database->addMovement(3,$village->wid,$data['to_vid'],$reference,($time+time()));
    } else {
      header("Location: build.php?id=39");
    }
			
		
		if($form->returnErrors() > 0) {
			$_SESSION['errorarray'] = $form->getErrors();
			$_SESSION['valuearray'] = $_POST;
			header("Location: a2b.php");
		}		
		header("Location: build.php?id=39");
		
	}}
	
	private function sendTroopsBack($post) {
		global $form, $database, $village, $generator, $session, $technology;

		$enforce=$database->getEnforceArray($post['ckey'],0);
		if(($enforce['from']==$village->wid) || ($enforce['vref']==$village->wid)){
			$to = $database->getVillage($enforce['from']);
			$Gtribe = "";
			if ($database->getUserField($to['owner'],'tribe',0) == '2'){ $Gtribe = "1"; } else if ($database->getUserField($to['owner'],'tribe',0) == '3'){ $Gtribe = "2"; }
		
					for($i=1; $i<10; $i++){
						if(isset($post['t'.$i])){
							if($i!=10){
								if ($post['t'.$i] > $enforce['u'.$Gtribe.$i])
								{
									$form->addError("error","You can't send more units than you have");
									break;
								}
								
								if($post['t'.$i]<0)
								{
									$form->addError("error","You can't send negative units.");
									break;
								}
							}
						} else {
						$post['t'.$i.'']='0';
						}											
					}
				
				if($form->returnErrors() > 0) {
					$_SESSION['errorarray'] = $form->getErrors();
					$_SESSION['valuearray'] = $_POST;
					header("Location: a2b.php");		
				} else {
					
					//change units
					$start = ($database->getUserField($to['owner'],'tribe',0) == 1)? 1 : (($database->getUserField($to['owner'],'tribe',0) == 2)? 11: 21);
					$end = ($database->getUserField($to['owner'],'tribe',0) == 1)? 10 : (($database->getUserField($to['owner'],'tribe',0) == 2)? 20: 30);
					$j='1';
					for($i=$start;$i<=$end;$i++){
						$database->modifyEnforce($post['ckey'],$i,$post['t'.$j.''],0); $j++;
					}
				
						//get cord 
						$fromcoor = $database->getCoor($enforce['from']);
						$tocoor = $database->getCoor($enforce['vref']);
						$fromCor = array('x'=>$tocoor['x'], 'y'=>$tocoor['y']);
						$toCor = array('x'=>$fromcoor['x'], 'y'=>$fromcoor['y']);
		
				$unitspeeds = array(6,5,7,16,14,10,4,3,4,5,7,7,6,9,10,9,4,3,4,5,7,6,17,19,16,13,4,3,4,5);
				$speeds = array();

				//find slowest unit.
				for($i=1;$i<=10;$i++){
					if (isset($post['t'.$i])){
						if( $post['t'.$i] != '' && $post['t'.$i] > 0){
							$speeds[] = $unitspeeds[$i-2+$start];
						} else {
						$post['t'.$i.'']='0';
						}
					} else {
						$post['t'.$i.'']='0';
					}
				}
				$time = $generator->procDistanceTime($fromCor,$toCor,min($speeds),1);
				$reference = $database->addAttack($enforce['from'],$post['t1'],$post['t2'],$post['t3'],$post['t4'],$post['t5'],$post['t6'],$post['t7'],$post['t8'],$post['t9'],$post['t10'],0,2);
				$database->addMovement(4,$village->wid,$enforce['from'],$reference,($time+time()));
				$technology->checkReinf($post['ckey']);

						header("Location: build.php?id=39");

				}
		} else {
			$form->addError("error","You cant change someones troops.");
				if($form->returnErrors() > 0) {
					$_SESSION['errorarray'] = $form->getErrors();
					$_SESSION['valuearray'] = $_POST;
					header("Location: a2b.php");		
				}
		}
	}
	
	public function Settlers($post) {
		global $form, $database, $village, $session;
		
    $mode = CP; 
    $total = count($database->getProfileVillages($session->uid)); 
    $need_cps = ${'cp'.$mode}[$total];
    $cps = $database->getUserField($session->uid, 'cp',0);

    if($cps >= $need_cps) {
      if($session->tribe == 1){
			  $unit = 10;
		  }
		  elseif($session->tribe == 2){
			  $unit = 20;
		  }
		  else{
			  $unit = 30;
		  }
		  $database->modifyResource($village->wid,750,750,750,750,0);
		  $database->modifyUnit($village->wid,$unit,3,0);
		  $database->addMovement(5,$village->wid,$post['s'],0,$post['timestamp']);
		  header("Location: build.php?id=39");
		
		  if($form->returnErrors() > 0) {
			  $_SESSION['errorarray'] = $form->getErrors();
			  $_SESSION['valuearray'] = $_POST;
			  header("Location: a2b.php");
		  }
    } else {
      header("Location: build.php?id=39");
    }	
	}
	
};

$units = new Units;
?>