<?php
//	表操作类
class Form
{
	//	表存储数组
	public $valuearray = array();
	//	表出错存储数组
	private $errorarray = array();
	//	表出错数量
	private $errorcount;
	
	//	表构造函数
	public function Form()
	{
		if (isset($_SESSION['errorarray']) && isset($_SESSION['valuearray']))
		{
			$this->errorarray = $_SESSION['errorarray'];
			$this->valuearray = $_SESSION['valuearray'];
			$this->errorcount = count($this->errorarray);
			
			unset($_SESSION['errorarray']);
			unset($_SESSION['valuearray']);
		}
		else
		{
			$this->errorcount = 0;
		}
	}
	
	//	添加出错字段
	public function addError($field, $error)
	{
		$this->errorarray[$field] = $error;
		$this->errorcount = count($this->errorarray);
	}
	
	//	获取出错字段
	public function getError($field)
	{
		if (array_key_exists($field, $this->errorarray))
		{
			return $this->errorarray[$field];
		}
		else
		{
			return "";
		}
	}
	
	//	获取字段值
	public function getValue($field)
	{
		if (array_key_exists($field, $this->valuearray))
		{
			return $this->valuearray[$field];
		}
		else
		{
			return "";
		}
	}
	
	//	如果当前Cookie不同于表中存储的值，返回表中的值
	public function getDiff($field, $cookie)
	{
		if (array_key_exists($field, $this->valuearray) && $this->valuearray[$field] != $cookie)
		{
			return $this->valuearray[$field];
		}
		else
		{
			return $cookie;
		}
	}
	
	//	检查对应字段的值和表中的值是否相同
	public function getRadio($field, $value)
	{
		if (array_key_exists($field, $this->valuearray) && $this->valuearray[$field] == $value)
		{
			return "checked";
		}
		else
		{
			return "";
		}
	}
	
	//	获取出错的数量
	public function returnErrors()
	{
		return $this->errorcount;
	}
	
	//	获取出错存储数组
	public function getErrors()
	{
		return $this->errorarray;
	}
};
?>