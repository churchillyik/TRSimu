<?php
if(isset($_GET['c']) && $_GET['c'] == 1) 
{
	echo "<div class=\"headline\">
	<span class=\"f10 c5\">导入数据库时发生错误，请检查数据库配置。</span>
	</div><br>";
}
?>
<div class="headline"><span class="f16 c5">创建数据库表</span></div>
<br />
<br />
<form action="process.php" method="post" id="dataform">
<div class="lbox">
<table>
	<tr>
		<td><span class="f9 c6">执行SQL语句：</span></td><td><input type="submit" name="Submit" id="Submit" value="立即执行.."></td>
	</tr>
</table>
</div>
<input type="hidden" name="substruc" value="1">
</form>