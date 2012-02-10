<?php
//	战斗系统
class Battle
{
	//	战斗模拟器处理过程
	public function procSim($post)
	{
		global $form;
		if (isset($post['a1_v']) && (isset($post['a2_v1']) || isset($post['a2_v2']) || isset($post['a2_v3']) || isset($post['a2_v4'])))
		{
			//	攻击方
			$_POST['mytribe'] = $post['a1_v'];
			
			//	防御方
			$target = array();
			if (isset($post['a2_v1']))
			{
				array_push($target, 1);
			}
			if (isset($post['a2_v2']))
			{
				array_push($target, 2);
			}
			if (isset($post['a2_v3']))
			{
				array_push($target, 3);
			}
			if (isset($post['a2_v4']))
			{
				array_push($target, 4);
			}
			$_POST['target'] = $target;
			
			if (isset($post['a1_1']))
			{
				//	计算攻击方的部队总数
				$sum = $sum2 = 0;
				for ($i = 1; $i <= 10; $i++)
				{
					$sum += $post['a1_'.$i];
				}
				if ($sum > 0)
				{
					//	检查皇宫和城墙的数据
					if ($post['palast'] == "")
					{
						$post['palast'] = 0;
					}
					if (isset($post['wall1']) && $post['wall1'] == "")
					{
						$post['wall1'] = 0;
					}
					if (isset($post['wall2']) && $post['wall2'] == "")
					{
						$post['wall2'] = 0;
					}
					if (isset($post['wall3']) && $post['wall3'] == "")
					{
						$post['wall3'] = 0;
					}
					//	被攻击的第一个城墙不为0的村
					$post['tribe'] = -1;
					for ($i = 1; $i <= 3; $i++)
					{
						if ($post['wall'.$i] != 0)
						{
							$post['tribe'] = $i;
							break;
						}
					}
					//	如果都没设置城墙，则第一个村为被攻击村
					if ($post['tribe'] == -1)
					{
						$post['tribe'] = $target[0];
					}
					//	计算战斗结果
					$_POST['result'] = $this->simulate($post);
					//	输出结果
					$form->valuearray = $post;
				}
			}
		}
	}
	
	private function simulate($post)
	{
		//	攻击方兵种数据
		$attacker = array(
					'u1'=>0,'u2'=>0,'u3'=>0,'u4'=>0,'u5'=>0,'u6'=>0,'u7'=>0,'u8'=>0,'u9'=>0,'u10'=>0
					,'u11'=>0,'u12'=>0,'u13'=>0,'u14'=>0,'u15'=>0,'u16'=>0,'u17'=>0,'u18'=>0,'u19'=>0,'u20'=>0
					,'u21'=>0,'u22'=>0,'u23'=>0,'u24'=>0,'u25'=>0,'u26'=>0,'u27'=>0,'u28'=>0,'u29'=>0,'u30'=>0
					,'u31'=>0,'u32'=>0,'u33'=>0,'u34'=>0,'u35'=>0,'u36'=>0,'u37'=>0,'u38'=>0,'u39'=>0,'u40'=>0
					,'u41'=>0,'u42'=>0,'u43'=>0,'u44'=>0,'u45'=>0,'u46'=>0,'u47'=>0,'u48'=>0,'u49'=>0,'u50'=>0);
		$start = ($post['a1_v'] == 1)? 1 : (($post['a1_v'] == 2)? 11 : 21);
		
		//	兵种的攻防等级
		$att_ab = array('a1'=>0, 'a2'=>0, 'a3'=>0, 'a4'=>0, 'a5'=>0, 'a6'=>0, 'a7'=>0, 'a8'=>0);
		$def_ab = array('b1'=>0, 'b2'=>0, 'b3'=>0, 'b4'=>0, 'b5'=>0, 'b6'=>0, 'b7'=>0, 'b8'=>0);
		
		//	设置攻击方的兵力和兵种科技等级
		$index = 1;
		for ($i = $start; $i <= $start + 9; $i++)
		{
			$attacker['u'.$i] = $post['a1_'.$index];
			if ($index <= 8)
			{
				$att_ab['a'.$index] = $post['f1_'.$index];
			}
			$index += 1;
		}
		
		//	设置防御方的兵力
		$defender = array();
		for ($i = 1; $i <= 50; $i++)
		{
			if (isset($post['a2_'.$i]) && $post['a2_'.$i] != "")
			{
				$defender['u'.$i] = $post['a2_'.$i];
			}
			else
			{
				$defender['u'.$i] = 0;
			}
		}
		//	设置防御方的兵种科技等级和城墙等级
		$deftribe = $post['tribe'];
		$wall = 0;
		if ($deftribe != 4)
		{
			$wall = $post['wall'.$deftribe];
		}
		for ($i = 1; $i <= 8; $i++)
		{
			$def_ab['b'.$i] = $post['f2_'.($start + $i - 1)];
		}
		
		if ($post['kata'] == "")
		{
			$post['kata'] = 0;
		}
		
		//	检查是否有侦查部队
		$scout = 0;
		for ($i = $start; $i <= $start + 9; $i++)
		{
			if ($i == 4 || $i == 14 || $i == 23)
			{
				if ($attacker['u'.$i] > 0)
				{
					$scout = 1;
					break;
				}
			}
		}
		
		if ($scout)
		{
			//	侦查
			return $this->calculateBattle($attacker, $defender, $wall, $post['a1_v'], $deftribe, $post['palast'], $post['ew1'], $post['ew2'], 1, $att_ab, $def_ab, $post['kata'], $post['stonemason']);
		}
		else
		{
			//	普通攻击和掠夺攻击
			return $this->calculateBattle($attacker, $defender, $wall, $post['a1_v'], $deftribe, $post['palast'], $post['ew1'], $post['ew2'], $post['ktyp'] + 3, $att_ab, $def_ab, $post['kata'], $post['stonemason']);
		}
	}

	/*
		$Attacker, $Defender	攻防双方的兵力
		$def_wall				防御方城墙等级
		$att_tribe, $def_tribe	攻防双方的种族
		$residence				防御方的皇宫等级
		$attpop, $defpop		攻防双方的人口数
		$type					攻击类型
		$att_ab, $def_ab		攻防双方的兵种科技等级
		$tblevel				投石器目标等级
		$stonemason				石匠铺等级
	*/
	function calculateBattle($Attacker, $Defender, $def_wall, $att_tribe, $def_tribe, $residence, $attpop, $defpop, $type, $att_ab, $def_ab, $tblevel, $stonemason)
	{
		global $bid34;
		
		//	骑兵、投石器、冲撞车的编号
		$calvary = array(4, 5, 6, 15, 16, 23, 24, 25, 26);
		$catapult = array(8, 18, 28);
		$rams = array(7, 17, 27);
		
		$catp = $ram = 0;

		//	输出结果序列
		$result = array();
		//	参与战斗的兵力总数
		$involve = 0;
		//	攻击方是否获胜
		$winner = false;

		$ap = $dp = $cap = $cdp = $rap = $rdp = 0;
		
		//	攻击方兵种起始和结束
		$start = ($att_tribe == 1)? 1 : (($att_tribe == 2)? 11: 21);
		$end = ($att_tribe == 1)? 10 : (($att_tribe == 2)? 20: 30);
		//	兵种科技下标
		$abcount = 1;
		
		if ($type == 1)
		{
			//	计算攻击方的侦查力
			for ($i = $start; $i <= $end; $i++)
			{
				global ${'u'.$i};
				if ($abcount <= 8 && $att_ab['a'.$abcount] > 0)
				{
					$ap += (35 + (35 + 300 * ${'u'.$i}['pop'] / 7) * (pow(1.007, $att_ab['a'.$abcount]) - 1)) * $Attacker['u'.$i];
				}
				else
				{
					$ap += $Attacker['u'.$i] * 35;
				}
				$abcount += 1;
				$units['Att_unit'][$i] = $Attacker['u'.$i];
			}
		}
		else
		{
			//	计算攻击方的步兵攻击和骑兵攻击
			for ($i = $start; $i <= $end; $i++)
			{
				global ${'u'.$i};
				if ($abcount <= 8 && $att_ab['a'.$abcount] > 0)
				{
					if (in_array($i, $calvary))
					{
						$cap += (${'u'.$i}['atk'] + (${'u'.$i}['atk'] + 300 * ${'u'.$i}['pop'] / 7) * (pow(1.007, $att_ab['a'.$abcount]) - 1)) * $Attacker['u'.$i];
					}
					else
					{
						$ap += (${'u'.$i}['atk'] + (${'u'.$i}['atk'] + 300 * ${'u'.$i}['pop'] / 7) * (pow(1.007, $att_ab['a'.$abcount]) - 1)) * $Attacker['u'.$i];
					}
				}
				else
				{
					if (in_array($i, $calvary))
					{
						$cap += $Attacker['u'.$i] * ${'u'.$i}['atk'];
					}
					else
					{
						$ap += $Attacker['u'.$i] * ${'u'.$i}['atk'];
					}
				}
				
				$abcount += 1;
				//	投石器的数量
				if (in_array($i, $catapult))
				{
					$catp += $Attacker['u'.$i];
				}
				
				//	冲撞车的数量
				if (in_array($i, $rams))
				{
					$ram += $Attacker['u'.$i];
				}
				
				//	攻击方参与战斗的兵力总数
				$involve += $Attacker['u'.$i];
				$units['Att_unit'][$i] = $Attacker['u'.$i];
			}
		}

		$abcount = 1;
		if ($type == 1)
		{
			//	计算防御方的反侦查力
			for ($y = 4; $y <= 24; $y++)
			{
				if ($y == 4 || $y == 14 || $y == 23)
				{
					global ${'u'.$y};
					if ($y >= $start && $y <= ($end - 2) && $def_ab['b'.$abcount] > 0)
					{
						$dp +=  (20 + (20 + 300 * ${'u'.$y}['pop'] / 7) * (pow(1.007, $def_ab['b'.$y]) - 1)) * $Defender['u'.$y];
						$abcount +=1;
					}
					else
					{
						$dp += $Defender['u'.$y] * 20;
					}
					$units['Def_unit'][$y] = $Defender['u'.$y];
				}
			}
		}
		else
		{
			//	计算防御方的步兵防御和骑兵防御
			for ($y = 1; $y <= 50; $y++)
			{
				global ${'u'.$y};
				if ($y >= $start && $y <= $end - 2 && $def_ab['b'.$abcount] > 0)
				{
					$dp += (${'u'.$y}['di'] + (${'u'.$y}['di'] + 300 * ${'u'.$y}['pop'] / 7) * (pow(1.007, $def_ab['b'.$y]) - 1)) * $Defender['u'.$y];
					$cdp += (${'u'.$y}['dc'] + (${'u'.$y}['dc'] + 300 * ${'u'.$y}['pop'] / 7) * (pow(1.007, $def_ab['b'.$y]) - 1)) * $Defender['u'.$y];
					$abcount +=1;
				}
				else
				{
					$dp += $Defender['u'.$y] * ${'u'.$y}['di'];
					$cdp += $Defender['u'.$y] * ${'u'.$y}['dc'];
				}
				
				//	防御方参与战斗的兵力总数
				$involve += $Defender['u'.$y]; 
				$units['Def_unit'][$y] = $Defender['u'.$y];
			}
		}
		
		//	根据城墙等级和皇宫/行宫等级，计算防御方的步兵防御和骑兵防御
		if ($def_wall > 0)
		{					
			$factor = ($def_tribe == 1)? 1.030 : (($def_tribe == 2)? 1.020 : 1.025);
			$dp *= pow($factor, $def_wall);
			$cdp *= pow($factor, $def_wall);
			$dp += 2 * pow($residence, 2) * pow($factor, $def_wall);
			$cdp += 2 * pow($residence, 2) * pow($factor, $def_wall);
		}
		else
		{		
			$dp += 2 * pow($residence, 2);
			$cdp += 2 * pow($residence, 2);
		}
		
		//	计算攻击点数和防御点数
		$rap = $ap + $cap;
		$rdp = $dp * ($ap / $rap) + $cdp * ($cap / $rap) + 10;
		$result['Attack_points'] = $rap;
		$result['Defend_points'] = $rdp;
		
		//	点数大者为胜方
		$winner = ($rap > $rdp);
		$result['Winner'] = $winner? "attacker" : "defender";
		
		echo "攻击点数：".$ap."+".$cap."=".$rap."<br>";
		echo "防御点数：".($dp * ($ap / $rap))."+".($cdp * ($cap / $rap))."+10=".$rdp."<br>";
		//	计算人口惩罚
		if ($attpop > $defpop)
		{
			if ($rap < $rdp)
			{
				$moralbonus = min(1.5, pow($attpop / $defpop, 0.2 * ($rap / $rdp)));
			}
			else
			{
				$moralbonus = min(1.5, pow($attpop / $defpop, 0.2));
			}
		}
		else
		{
			$moralbonus = 1.0;
		}
		
		echo "参与战斗的兵力总数：".$involve."<br>";
		//	计算兵力损失指数，在攻防双方兵力超过1000的时候，指数会衰减
		if ($involve >= 1000)
		{
			$Mfactor = round(2 * (1.8592 - pow($involve, 0.015)), 4);
		}
		else
		{
			$Mfactor = 1.5;
		}
		echo "兵力损失指数：".$Mfactor." ".round(2 * (1.8592 - pow(1000, 0.015)), 4)."<br>";

		//	下面计算各种攻击类型的攻防双方的战斗损失系数（$result[1]和$result[2]）
		//	侦查
		if ($type == 1)
		{
			$holder = pow($rdp * $moralbonus / $rap, $Mfactor);
			$holder = $holder / (1 + $holder);
			$result[1] = $holder;
			$result[2] = 0;
		}
		elseif ($type == 2)
		{
			
		}
		//	掠夺攻击
		elseif ($type == 4)
		{
			$holder = $winner? pow(($rdp * $moralbonus) / $rap, $Mfactor) : pow($rap / ($rdp * $moralbonus), $Mfactor);
			$holder = $holder / (1 + $holder);
			$result[1] = $winner? $holder : 1 - $holder;
			$result[2] = $winner? 1 - $holder : $holder;
			
			//	投石器剩余的数量
			//$catp -= round($catp * $result[1] / 100);
		}
		//	普通攻击
		elseif ($type == 3)
		{
			$holder = $winner? pow(($rdp * $moralbonus) / $rap, $Mfactor) : pow($rap / ($rdp * $moralbonus), $Mfactor);
			$holder = round($holder, 8);
			$result[1] = $winner? $holder : 1;
			$result[2] = $winner? 1 : $holder;
			echo $result['Winner']."<br>";
			echo "兵力损失比率：".$result[1]."<br>";
			//	有参议员、执政官、首领的情况下，计算忠诚度
			$kings = ($att_tribe == 1)? $Attacker['u9'] : (($att_tribe == 2)? $Attacker['u19'] : $Attacker['u29']);
			$aviables = $kings - round($kings * $result[1]);
			if ($aviables > 0)
			{
				switch ($aviables)
				{
				case 1:
					$fealthy = rand(20, 30);
					break;
				case 2:
					$fealthy = rand(40, 60);
					break;
				case 3:
					$fealthy = rand(60, 80);
					break;
				case 4:
					$fealthy = rand(80, 100);
					break;
				default:
					$fealthy = 100;
					break;
				}
				$result['hero_fealthy'] = $fealthy;
			}
			
			//	投石器剩余的数量
			//$catp -= $winner? round($catp * $result[1] / 100) : round($catp * $result[2] / 100);
		}

		//	计算投石器的效果
		if ($catp > 0 && $tblevel != 0)
		{
			$wctp = pow($rap / $rdp, 1.5);
			$wctp = ($wctp >= 1)? 1 - 0.5 / $wctp : 0.5 * $wctp;
			echo $wctp." * ";
			$wctp *= $catp;
			echo $catp." = ".$wctp."[r4]<br>";
			$need = round($moralbonus * (pow($tblevel, 2) + $tblevel + 1) / (8 * (round(200 * pow(1.0205, $att_ab['a8'])) / 200)) * (1 + $bid34[$stonemason]['attri'] / 100) + 0.5);
			echo $need."[r3]<br>";
			//	完全摧毁建筑需要的投石车数量
			$result[3] = $need;
			//	发挥作用的投石车数量
			$result[4] = $wctp;
		}
		
		$result[6] = pow($rap / $rdp * $moralbonus, $Mfactor);

		//	计算攻击方的部队损失
		$total_att_units = count($units['Att_unit']);
		$start = ($att_tribe == 1)? 1 : (($att_tribe == 2)? 11 : 21);
		$end = ($att_tribe == 1)? 10 : (($att_tribe == 2)? 20 : 30);
		for ($i = $start; $i <= $end; $i++)
		{
			if ($att_tribe == 1)
			{
				$y = $i;
			}
			if ($att_tribe == 2)
			{
				$y = $i - 10;
			}
			if ($att_tribe == 3)
			{
				$y = $i - 20;
			}
			$result['casualties_attacker'][$y] = round($result[1] * $units['Att_unit'][$i]);
		}
		
		//	计算物资掠夺总数掠夺
		$start = ($att_tribe == 1)? 1 : (($att_tribe == 2)? 11: 21);
		$end = ($att_tribe == 1)? 10 : (($att_tribe == 2)? 20: 30);
		$max_bounty = 0;
		for ($i = $start; $i <= $end; $i++)
		{
			if ($att_tribe == 1)
			{
				$y = $i;
			}
			if ($att_tribe == 2)
			{
				$y = $i - 10;
			}
			if ($att_tribe == 3)
			{
				$y = $i - 20;
			}
			$max_bounty += ($Attacker['u'.$i] - $result['casualties_attacker'][$y]) * ${'u'.$i}['cap'];
		}
		$result['bounty'] = $max_bounty;
		
		return $result;
	}
};

$battle = new Battle;
?>