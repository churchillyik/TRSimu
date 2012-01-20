<h1>玩家资料</h1>
<?php include("menu.tpl"); ?>

<form action="spieler.php" method="POST">
	<input type="hidden" name="ft" value="p2">
	<input type="hidden" name="uid" value="<?php echo $session->uid; ?>" />
	
	<table cellpadding="1" cellspacing="1" id="links"><thead>
	<tr>
		<th>
			<a href="#" onClick="return Popup(2,5);"><img class="help" src="img/x.gif" alt="说明" title="说明" /></a>
		</th>
		<th colspan="2">快捷链接</th>
	</tr>
	<tr>
		<td>序号</td>
		<td>链接名</td>
		<td>链接页面</td>
	</tr>
	</thead>
	<tbody>
	<tr>
		<td class="nr"><input class="text" type="text" name="nr0" value="0" size="1" maxlength="3"></td>
		<td class="nam"><input class="text" type="text" name="linkname0" value="" maxlength="30"></td>
		<td class="link"><input class="text" type="text" name="linkziel0" value="" maxlength="255"></td>
	</tr>
	</tbody>
	</table>
	
	<table cellpadding="1" cellspacing="1" id="completion" class="set"><thead>
    <tr>
        <th colspan="2">自动完成</th>
    </tr>
    <tr>
        <td colspan="2">作用于集结点和市场</td>
    </tr>
    </thead>
	<tbody>
    <tr>
        <td class="sel"><input class="check" type="checkbox" name="v1" value="1" checked></td>
        <td>自己的村庄</td>
    </tr>
    <tr>
        <td class="sel"><input class="check" type="checkbox" name="v2" value="1" ></td>
        <td>周围的村庄</td>
    </tr>
    <tr>
        <td class="sel"><input class="check" type="checkbox" name="v3" value="1" ></td>
        <td>联盟玩家的村庄</td>
    </tr>
    </tbody>
	</table>
	
	<table cellpadding="1" cellspacing="1" id="big_map" class="set">
	<thead>
    <tr>
        <th colspan="2">大地图</th>
    </tr>
    </thead><tbody>
    <tr>
        <td class="sel"><input class="check" type="checkbox" name="map" ></td>
        <td>在新窗口显示大地图</td>
    </tr>
    </tbody>
    </table>
	
	<table cellpadding="1" cellspacing="1" id="report_filter" class="set">
	<thead>
    <tr>
        <th colspan="2">报告过滤</th>
    </tr>
    </thead><tbody>
    <tr>
        <td class="sel"><input class="check" type="checkbox" name="v4" value="1" ></td>
        <td>过滤自己村庄之间资源运输的报告</td>

    </tr>
    <tr>
        <td class="sel"><input class="check" type="checkbox" name="v5" value="1" ></td>
        <td>过滤向其他村庄资源运输的报告</td>
    </tr>
    <tr>
        <td class="sel"><input class="check" type="checkbox" name="v6" value="1" ></td>
        <td>过滤从其他村庄资源运输的报告</td>
    </tr>
    </tbody>
    </table>
	
	<table cellpadding="1" cellspacing="1" id="time" class="set">
	<thead>
	<tr>
		<th colspan="2">时间设置</th>
	</tr>
	<tr>
		<td colspan="2">你可以在这里改变时区以对应你所在地区的时间显示</td>
	</tr>
	</thead>
	<tbody>
	<tr>
		<th>时区</th>
		<td>
			<select name="timezone" class="dropdown">
			<optgroup label="local time zones">
				<option value="495">欧洲</option>
				<option value="99">英国</option>
				<option value="492">土耳其</option>
				<option value="328">亚洲/加尔各答</option>
				<option value="345">亚洲/曼谷</option>
				<option value="257">美国/纽约</option>
				<option value="189">美国/芝加哥</option>
				<option value="474">新西兰</option>
			</optgroup>
			<optgroup label="general time zones">
				<option value="12">UTC-11</option>
				<option value="13">UTC-10</option>
				<option value="14">UTC-9</option>
				<option value="15">UTC-8</option>
				<option value="16">UTC-7</option>
				<option value="17">UTC-6</option>
				<option value="18">UTC-5</option>
				<option value="19">UTC-4</option>
				<option value="20">UTC-3</option>
				<option value="21">UTC-2</option>
				<option value="22">UTC-1</option>
				<option value="23">UTC</option>
				<option value="0">UTC+1</option>
				<option value="1">UTC+2</option>
				<option value="2">UTC+3</option>
				<option value="3">UTC+4</option>
				<option value="4">UTC+5</option>
				<option value="5">UTC+6</option>
				<option value="6">UTC+7</option>
				<option value="7" selected="selected">UTC+8</option>
				<option value="8">UTC+9</option>
				<option value="9">UTC+10</option>
				<option value="10">UTC+11</option>
				<option value="11">UTC+12</option>
			</optgroup>
			</select>
		</td>
	</tr>
	<tr>
		<th>日期</th>
		<td>
			<label><input class="radio" type="Radio" name="tformat" value="0" checked> 欧洲 (dd.mm.yy 24h)</label><br />
			<label><input class="radio" type="Radio" name="tformat" value="1"> 美国 (mm/dd/yy 12h)</label><br />
			<label><input class="radio" type="Radio" name="tformat" value="2"> 英国 (dd/mm/yy 12h)</label><br />
			<label><input class="radio" type="Radio" name="tformat" value="3"> ISO (yy/mm/dd 24h)</label>
		</td>
	</tr>
	</tbody>
	</table>
	
	<p class="btn">
		<input type="image" value="" name="s1" id="btn_ok" class="dynamic_img" src="img/x.gif" alt="确定" />
	</p>
</form>