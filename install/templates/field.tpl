<?php
if(isset($_GET['c']) && $_GET['c'] == 1) 
{
	echo "<div class=\"headline\">
	<span class=\"f10 c5\">创建wdata（地图数据）的时候发生错误，请检查配置或其他文件。</span>
	</div><br>";
}
?>
<div class="headline"><span class="f16 c5">创建地图数据</span></div>
<br />
<br />
<form action="process.php" method="post" id="dataform">
<div class="lbox">
	<table>
		<tr>
			<td><span class="f9 c6">生成随机的地图数据：</span></td>
			<td><input type="submit" name="Submit" id="Submit" value="立即生成.."></td>
		</tr>
	</table>
	<br />
	<br />
	<font color="Red"><b>注意：</b>地图越大，花费的时间越长！</font>
</div>
<input type="hidden" name="subwdata" value="1">
</form>
