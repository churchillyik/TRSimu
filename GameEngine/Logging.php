<?php

//	日志类
class Logging
{
	//	非法操作记录
	public function addIllegal($uid, $ref, $type)
	{
		global $database;
		if (LOG_ILLEGAL)
		{
			$log = "试图 ";
			switch ($type)
			{
				case 1:
					$log .= "访问村庄 $ref";
					break;
			}
			$q = "Insert into ".TB_PREFIX."illegal_log values (0, $uid, '$log')";
			$database->query($q);
		}
	}
	
	//	登录记录
	public function addLoginLog($id, $ip)
	{
		global $database;
		if (LOG_LOGIN)
		{
			$q = "Insert into ".TB_PREFIX."login_log values (0, $id, '$ip')";
			$database->query($q);
		}
	}
	
	//	建造记录
	public function addBuildLog($wid, $building, $level, $type)
	{
		global $database;
		if (LOG_BUILD)
		{
			if ($type)
			{
				$log = "开始新建 ";
			}
			else
			{
				$log = "开始升级 ";
			}
			$log .= $building." 于等级 ".$level;
			$q = "Insert into ".TB_PREFIX."build_log values (0, $wid, '$log')";
			$database->query($q);
		}
	}
	
	//	升级科技记录
	public function addTechLog($wid, $tech, $level)
	{
		global $database;
		if (LOG_TECH)
		{
			$log = "升级科技 ".$tech." 到等级 ".$level;
			$q = "Insert into ".TB_PREFIX."tech_log values (0,$wid,'$log')";
			$database->query($q);
		}
	}
	
	//	秒建记录
	public function goldFinLog($wid)
	{
		global $database;
		if (LOG_GOLD_FIN)
		{
			$log = "用金币秒建";
			$q = "Insert into ".TB_PREFIX."gold_fin_log values (0, $wid, '$log')";
			$database->query($q);
		}
	}
	
	//	管理员操作记录
	public function addAdminLog()
	{
		global $database;
	}
	
	//	市场运输记录
	public function addMarketLog($wid, $type, $data)
	{
		global $database;
		if (LOG_MARKET)
		{
			if ($type == 1)
			{
				$log = "送 ".$data[0].",".$data[1].",".$data[2].",".$data[3]." 到村庄 ".$data[4];
			}
			elseif ($type == 2)
			{
				$log = "交易资源发生于村庄 ".$wid." 和 ".$data[0]." 市场引用为 ".$data[1];
			}
			$q = "Insert into ".TB_PREFIX."market_log values (0, $wid, '$log')";
			$database->query($q);
		}
	}

	//	村庄摧毁记录
	public function VillageDestroyCatalog($wid)
	{
		global $database;
		if (LOG_GOLD_FIN)
		{
			$log = "村庄已被摧毁";
			$q = "Insert into ".TB_PREFIX."destroy_log values (0, $wid, '$log')";
			$database->query($q);
		}
	}
	
	//	战报记录
	public function addWarLog()
	{
		global $database;
	}
	
	public function clearLogs()
	{
		global $database;
	}
	
};

$logging = new Logging;
?>