<?php 
//if (GP_ENABLE)
{
?>
<h1>玩家资料</h1>

<?php
include("menu.tpl");
if (isset($_POST["custom_url"]))
{
	$database->updateUserField($session->uid, gpack, $_POST["custom_url"], 1);
}
if (isset($_GET["custom_url"]))
{
?>
<link href="<?php echo $_GET["custom_url"]; ?>lang/en/gp_check.css" rel="stylesheet" type="text/css">
<div id="gpack_popup">
	<div id="gpack_error">
		<img class="logo unknown" src="img/x.gif" alt="unknown" title="unknown">
		<span class="error">找不到皮肤包，这可能是以下原因引起的：</span><br>
		<ul>
			<li>路径必须设定为包含文件'<b>travian.css</b>' 以及文件夹 '<b>img</b>'、'<b>lang</b>'和'<b>modules</b>'的文件夹。</li>
			<li>你的浏览器不支持在本机上使用皮肤包，可以尝试在线使用，在路径前加上'<b>http://</b>'。</li>
		</ul>
		<form action="spieler.php" method="post">
			<input type="hidden" name="s" value="4">
			<div class="btn"><input type="image" alt="确定" src="img/x.gif" value="ok" class="dynamic_img" id="btn_ok"></div>
		</form>
	</div>
	
	<div id="gpack_activate">
		<span class="info">图片包已找到</span><br>
		<img id="preview" src="img/x.gif"><br>
		路径 '<span class="path">http://img.travian.com/gpack/</span>' 给出了可用的皮肤包。保存你的选择并激活皮肤包。你可以随时改变设置。
		<form action="spieler.php" method="post">
			<input type="hidden" name="s" value="4">
			<input type="hidden" name="custom_url" value="<?php echo $_GET["custom_url"]; ?>">
			<div class="btn"><input type="image" alt="保存" src="img/x.gif" value="save" class="dynamic_img" id="btn_save" name="gp_activate_button"></div>
		</form>
	</div>
</div>
<?php
}
?>

<form action="spieler.php" method="post" name="gp_selection">
	<input type="hidden" name="s" value="4" />
	<table cellpadding="1" cellspacing="1" id="gpack">
    <thead>
	<tr>
		<th>界面皮肤设定</th>
	</tr>
	</thead>
	<tbody>
	<tr>
		<td class="info">
			使用皮肤包可以改变Travian页面的外观。你可以选择列表中的皮肤包或者提供其他位于你电脑上的皮肤包的路径。如果使用本地皮肤包，可能在访问页面的时候稍有延迟。<br />
			<span class="alert">请注意！请不要使用可能危害电脑安全的皮肤包。</span>
		</td>
	</tr>
	<tr>
		<th class="empty"></th>
	</tr>
	<tr>
		<td>
		<label>
			<input type="radio" class="radio" name="gp_location" value="gpack/travian_basic/" />
			标准皮肤包
		</label>
		</td>
	</tr>
	<tr>
		<td>
		<label>
			<input type="radio" class="radio" name="gp_location" value="gpack/travian_redesign/" />
			扩展皮肤包 <span class="c5 f7">（新）</span>
		</label>
		</td>
	</tr>
	<tr>
		<th class="empty"></th>
	</tr>
	<tr>
		<td>
		<label>
			<input type="radio" class="radio" name="gp_type" value="custom" checked="checked" />
			自定义皮肤包
		</label>
		<input class="text" type="text" name="custom_url" value="<?php echo $session->gpack; ?>" onclick="document.gp_selection.gp_type[1].checked = true" /><br />
		<div class="example">例子：<span class="path">file:///C:/Travian/gpack/</span> 或 <span class="path">http://www.travian.org/user/gpack/</span></div>
		</td>
	</tr>
	</tbody>
    </table>
	
    <p class="btn">
		<input type="image" alt="确定" src="img/x.gif" name="gp_selection_button" value="ok" class="dynamic_img" id="btn_ok" />
	</p>
</form>

<table cellpadding="1" cellspacing="1" id="download">
<thead>
<tr>
	<th colspan="4">更多的界面皮肤</th>
</tr>
<tr>
	<td>名称</td>
	<td>容量（MB）</td>
	<td>激活</td>
	<td>下载</td>
</tr>
</thead>
<tbody>
<tr>
	<td class="nam">标准</td>
	<td class="size">4</td>
	<td class="act"><a href="spieler.php?s=4&gp_type=custom&custom_url=gpack/travian_default_en/">激活</a></td>
	<td class="down"><a href="gpack/download/travian_default_en.zip" target="_blank">下载</a></td>
</tr>
<tr>
	<td class="nam">复活节</td>
	<td class="size">6</td>
	<td class="act"><a href="spieler.php?s=4&amp;gp_type=custom&amp;custom_url=gpack/revival_en_new/">激活</a></td>
	<td class="down"><a href="gpack/download/revival_en_new.zip" target="_blank">下载</a></td>
</tr>
<tr>
	<td class="nam">新设计</td>
	<td class="size">6</td>
	<td class="act"><a href="spieler.php?s=4&amp;gp_type=custom&amp;custom_url=gpack/travian_redesign/">激活</a></td>
	<td class="down"><a href="gpack/download/travian_redesign.zip" target="_blank">下载</a></td>
</tr>
</tbody>
</table>
<?php
}
?>