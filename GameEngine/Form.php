<?php
//	表单类
class Form
{
	//	表单键值数组
	public $valuearray = array();
	//	错误信息数组
	private $errorarray = array();
	//	表错误信息数量
	private $errorcount;
	
	//	构造函数
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
	
	//	添加错误信息
	public function addError($field, $error)
	{
		$this->errorarray[$field] = $error;
		$this->errorcount = count($this->errorarray);
	}
	
	//	获取错误信息
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
	
	//	获取表单键值
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
	
	//	如果当前Cookie的某个键值不同于表单中对应的键值，返回表单键值
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