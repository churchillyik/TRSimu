<?php
//	生成器类
class Generator
{
	//	生成随机的16位ID，并进行MD5加密
	public function generateRandID()
	{
		return md5($this->generateRandStr(16));
	}

	//	生成长度为$length的随机字符串
	public function generateRandStr($length)
	{
		$randstr = "";
		for ($i = 0; $i < $length; $i++)
		{
			$randnum = mt_rand(0, 61);
			if ($randnum < 10)
			{
				$randstr .= chr($randnum + 48);
			}
			elseif ($randnum < 36)
			{
				$randstr .= chr($randnum + 55);
			}
			else
			{
				$randstr .= chr($randnum + 61);
			}
		}
		return $randstr;
	}

	//	用md5加密字符串，并取前$length字节
	public function encodeStr($str, $length)
	{
		$encode = md5($str);
		return substr($encode, 0, $length);
	}

	//	计算两个坐标之间的行程时间
	public function procDistanceTime($coor, $thiscoor, $ref, $mode)
	{
		global $bid28, $bid14, $building;
		if ($thiscoor['x'] > $coor['x'])
		{
			$xdistance = $thiscoor['x'] - $coor['x'];
		}
		else
		{
			$xdistance = $coor['x'] - $thiscoor['x'];
		}
		if (($coor['x'] < 0 && $thiscoor['x'] > 0) || ($thiscoor['x'] < 0 && $coor['x'] > 0))
		{
			$xdistance += 1;
		}
		if ($xdistance >= WORLD_MAX)
		{
			while ($xdistance >= WORLD_MAX) :
				$xdistance -= WORLD_MAX;
			endwhile;
		}
		if ($thiscoor['y'] > $coor['y'])
		{
			$ydistance = $thiscoor['y'] - $coor['y'];
		}
		else
		{
			$ydistance = $coor['y'] - $thiscoor['y'];
		}
		if (($coor['y'] < 0 && $thiscoor['y'] > 0) || ($thiscoor['y'] < 0 && $coor['y'] > 0))
		{
			$ydistance += 1;
		}
		if ($ydistance >= WORLD_MAX)
		{
			while ($ydistance >= WORLD_MAX) :
				$ydistance -= WORLD_MAX;
			endwhile;
		}
		$distance = $xdistance + $ydistance;
		if (!$mode)
		{
			if ($ref == 1)
			{
				$speed = 16;
			}
			elseif ($ref == 2)
			{
				$speed = 24;
			}
			else
			{
				$speed = 12;
			}
			
			if ($building->getTypeLevel(28) != 0)
			{
				$speed *= $bid28[$building->getTypeLevel(28)]['attri'] / 100;
			}
		}
		else
		{
			$speed = $ref;
			if ($building->getTypeLevel(14) != 0)
			{
				$speed *= $bid14[$building->getTypeLevel(14)]['attri'] / 100;
			}
		}
		return round(($distance / $speed) * 3600 / INCREASE_SPEED);
	}

	//	把秒转化为（时:分:秒）的格式
	public function getTimeFormat($time)
	{
		$min = 0;
		$hr = 0;
		while ($time >= 60) :
			$time -= 60;
			$min += 1;
		endwhile;
		while ($min > 60) :
			$min -= 60;
			$hr += 1;
		endwhile;
		if ($min < 10)
		{
			$min = "0".$min;
		}
		if ($time < 10)
		{
			$time = "0".$time;
		}
		return $hr.":".$min.":".$time;
	}

	//	把UNIX时间戳转化为一定的格式
	public function procMtime($time)
	{
		$now = time();
		if (date("j", $time) == date("j", $now) && date("n", $time) == date("n", $now) && date("y", $time) == date("y", $now))
		{
			$day = "今天";
		}
		else
		{
			$pref = 4;
			switch ($pref)
			{
			case 1:
				$day = date("m/j/y", $time);
				break;
			case 2:
				$day = date("j/m/y", $time);
				break;
			case 3:
				$day = date("j.m.y", $time);
				break;
			case 4:
				$day = date("Y-m-d", $time);
				break;
			default:
				$day = date("y/m/j", $time);
				break;
			}
		}
		$new = date("H:i", $time);
		return array($day, $new);
	}

	//	取得坐标为x和y的格子ID号，这是[-WORLD_MAX, WORLD_MAX]对正整数的一个既单且满的映射
	public function getBaseID($x, $y)
	{
		return (WORLD_MAX - $y) * (WORLD_MAX * 2 + 1) + (WORLD_MAX + $x + 1);
	}

	//	取得地图校验码
	public function getMapCheck($wref)
	{
		return substr(md5($wref), 5, 2);
	}

	//	页面载入开始时间
	public function pageLoadTimeStart()
	{
		$starttime = microtime();
		$startarray = explode(" ", $starttime);
		$starttime = $startarray[0] + $startarray[1];
		return $starttime;
	}

	//	页面载入结束时间
	public function pageLoadTimeEnd()
	{
		$endtime = microtime();
		$endarray = explode(" ", $endtime);
		$endtime = $endarray[0] + $endarray[1];
		return $endtime;
	}
};
$generator = new Generator;
?>