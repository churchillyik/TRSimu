<?php
if (isset($_GET['c']) && $_GET['c'] == 1)
{
	echo "<div class=\"headline\"><span class=\"f10 c5\">创建constant.php的时候发生错误，请检查include目录的读写状态。</span></div><br>";
}
?>
<div class="headline"><span class="f16 c5">配置选项</span></div>
<br />
<br />
<form action="process.php" method="post" id="dataform">

<!-- 服务器相关内容 -->
<div class="lbox">
	<span class="f10 c">服务器相关</span>
	<table>
	<tr>
		<td><span class="f9 c6">服务器名：</span></td>
		<td width="140"><input type="text" name="servername" id="servername" value="Travian"></td>
	</tr>
	<tr>
		<td><span class="f9 c6">资源倍数：</span></td>
		<td><input name="speed" type="text" id="speed" value="1"></td>
	</tr>
	<tr>
		<td><span class="f9 c6">军队移动倍数：</span></td>
		<td width="140"><input type="text" name="incspeed" id="incspeed" value="2"></td>
	</tr>
	<tr>
		<td><span class="f9 c6">地图大小：</span></td>
		<td><input name="wmax" type="text" id="wmax" value="25"></td>
	</tr>
	<tr>
		<td><span class="f9 c6">域名：</span></td>
		<td><input name="domain" type="text" id="domain" value="http://<?php echo $_SERVER['HTTP_HOST']; ?>/"></td>
	</tr>
	<tr>
		<td><span class="f9 c6">主页：</span></td>
		<td><input name="homepage" type="text" id="homepage" value="http://<?php echo $_SERVER['HTTP_HOST']; ?>/"></td>
	</tr>
	<tr>
		<td><span class="f9 c6">语言：</span></td>
		<td><select name="lang">
			<option value="en" selected="selected">中文</option>
		</select></td>
	</tr>
	<tr>
		<td><span class="f9 c6">新手保护时长：</span></td>
		<td><input name="beginner" type="text" id="autodeltime" value="3600*12" size="15"></td>
	</tr>
	</table>
</div>

<!-- 数据库相关内容 -->
<div class="rbox">
	<span class="f10 c">数据库相关</span>
	<table>
	<tr>
		<td><span class="f9 c6">数据库地址：</span></td>
		<td><input name="sserver" type="text" id="sserver" value="localhost"></td>
	</tr>
	<tr>
		<td><span class="f9 c6">用户名：</span></td>
		<td><input name="suser" type="text" id="suser" value="root"></td>
	</tr>
	<tr>
		<td><span class="f9 c6">密码：</span></td>
		<td><input type="text" name="spass" id="spass" value="root"></td>
	</tr>
	<tr>
		<td><span class="f9 c6">数据库名：</span></td>
		<td><input type="text" name="sdb" id="sdb" value="travian"></td>
	</tr>
	<tr>
		<td><span class="f9 c6">表名前缀：</span></td>
		<td><input type="text" name="prefix" id="prefix" value="s1_">
	</td>
	<tr>
		<td><span class="f9 c6">数据库类型：</span></td>
		<td><select name="connectt">
			<option value="0" selected="selected">MYSQL</option>
	  		<option value="1" disabled="disabled">MYSQLi</option>
			</select>
		</td>
	</tr>
	</table>
</div>

<!-- 管理员相关 -->
<div class="lbox">
	<span class="f10 c">管理员相关</span>
	<table>
	<tr>
		<td><span class="f9 c6">管理员名：</span></td>
		<td width="140"><input type="text" name="aname" id="aname" value="tr_admin"></td>
	</tr>
	<tr>
		<td><span class="f9 c6">管理员EMail：</span></td>
		<td><input name="aemail" type="text" id="aemail" value="tr_admin@126.com"></td>
	</tr>
	<tr>
		<td><span class="f9 c6">是否参与排行：</span></td>
		<td><select name="admin_rank">
			<option value="false">否</option>
			<option value="true" selected="selected">是</option>
		</select></td>
	</tr>
	</table>
</div>

<!-- GPACK相关 -->
<div class="rbox">
	<span class="f10 c">GPACK相关</span>
	<table>
	<tr>
		<td><span class="f9 c6">是否使用GPack：</span></td>
		<td><select name="gpack">
			<option value="false" selected="selected">禁用</option>
			<option value="true" disabled="disabled">启用</option>
		</select></td>
	</tr>
	<tr>
		<td><span class="f9 c6">GPack类型：</span></td>
		<td><select name="gplocate">
			<option value="gpack/travian_redesign/" selected="selected">Travian T3.6</option>
		</select></td>
	</tr>
	</table>
</div>

<!-- 新闻盒选项 -->
<div class="lbox">
	<span class="f10 c">新闻盒选项</span>
	<table>
	<tr>
		<td><span class="f9 c6">新闻盒1：</span></td>
		<td><select name="box1">
			<option value="true" selected="selected">启用</option>
			<option value="false">禁用</option>
		</select></td>
	</tr>
	<tr>
		<td><span class="f9 c6">新闻盒2：</span></td>
		<td><select name="box2">
			<option value="true" selected="selected">启用</option>
			<option value="false">禁用</option>
		</select></td>
	</tr>
	<tr>
		<td><span class="f9 c6">新闻盒3：</span></td>
		<td><select name="box3">
			<option value="true" selected="selected">启用</option>
			<option value="false">禁用</option>
		</select></td>
	</tr>
	</table>
</div>

<!-- 日志相关 -->
<div class="lbox">
	<span class="f10 c">日志相关</span>
	<table>
	<tr>
		<td><span class="f9 c6">建造日志：</span></td>
		<td><select name="log_build">
			<option value="false">禁用</option>
			<option value="true" selected="selected">启用</option>
		</select></td>
	</tr>
	<tr>
		<td><span class="f9 c6">科技日志：</span></td>
		<td><select name="log_tech">
			<option value="false">禁用</option>
			<option value="true" selected="selected">启用</option>
		</select></td>
	</tr>
	<tr>
		<td><span class="f9 c6">登录日志：</span></td>
		<td><select name="log_login">
			<option value="false">禁用</option>
			<option value="true" selected="selected">启用</option>
		</select></td>
	</tr>
	<tr>
		<td><span class="f9 c6">金币日志：</span></td>
		<td><select name="log_gold_fin">
			<option value="false">禁用</option>
			<option value="true" selected="selected">启用</option>
		</select></td>
	</tr>
	<tr>
		<td><span class="f9 c6">管理日志：</span></td>
		<td><select name="log_admin">
			<option value="false">禁用</option>
			<option value="true" selected="selected">启用</option>
		</select></td>
	</tr>
	<tr>
		<td><span class="f9 c6">战斗日志：</span></td>
		<td><select name="log_war">
			<option value="false">禁用</option>
			<option value="true" selected="selected">启用</option>
		</select></td>
	</tr>
	<tr>
		<td><span class="f9 c6">市场日志：</span></td>
		<td><select name="log_market">
			<option value="false">禁用</option>
			<option value="true" selected="selected">启用</option>
		</select></td>
	</tr>
	<tr>
		<td><span class="f9 c6">非法日志：</span></td>
		<td><select name="log_illegal">
			<option value="false">禁用</option>
			<option value="true" selected="selected">启用</option>
		</select></td>
	</tr> 
	</table>
</div>

<!-- 其他选项 -->
<div class="rbox">
	<span class="f10 c">其他选项</span>
	<table>
	<tr>
		<td><span class="f9 c6">任务：</span></td>
		<td><select name="quest">
			<option value="false">禁用</option>
			<option value="true" selected="selected">启用</option>
		</select></td>
	</tr>
	<tr>
		<td><span class="f9 c6">帐号激活：</span></td>
		<td><select name="activate">
			<option value="false">禁用</option>
			<option value="true" selected="selected">启用</option>
		</select></td>
	</tr>
	<tr>
		<td><span class="f9 c6">子域：</span></td>
		<td><select name="subdom">
			<option value="false">禁用</option>
			<option value="true" selected="selected">启用</option>
		</select></td>
	</tr>
	<tr>
		<td><span class="f9 c6">邮件限制：</span></td>
		<td><select name="limit_mailbox">
			<option value="false">禁用</option>
			<option value="true" selected="selected">启用</option>
		</select></td>
	</tr>
	<tr>
		<td><span class="f9 c6">邮件上限：</span></td>
		<td><input name="max_mails" type="number" id="max_mails" value="30" size="15"></td>
	</tr>
	<tr>
		<td><span class="f9 c6">可拆除建筑等级：</span></td>
		<td><select name="demolish">
			<option value="5">5</option>
			<option value="10" selected="selected">10</option>
			<option value="15">15</option>
			<option value="20">20</option>
		</select></td>
	</tr>
	<tr>
		<td><span class="f9 c6">村庄扩张速度：</span></td>
		<td><select name="village_expand">
			<option value="1" selected="selected">慢速</option>
			<option value="0">快速</option>
		</select></td>
	</tr>
	<tr>
		<td><span class="f9 c6">错误报告：</span></td>
		<td><select name="error">
			<option value="error_reporting (E_ALL ^ E_NOTICE);" selected="selected">启用</option>
			<option value="error_reporting (0); ">禁用</option>
		</select></td>
	</tr>
	
	<tr>
		<td><span class="f9 c6">自动删除用户：</span></td>
		<td><select name="autodel">
			<option value="false">否</option>
			<option value="true" selected="selected">是</option>
		</select></td>
	</tr>
	<tr>
		<td><span class="f9 c6">自动删除用户的时间：</span></td>
		<td><input name="autodeltime" type="text" id="autodeltime" value="3600*24*7" size="15"></td>
	</tr>
	<tr>
		<td><span class="f9 c6">跟踪用户：</span></td>
		<td>
		<select name="trackusers">
			<option value="false" selected="selected">否</option>
			<option value="true">是</option>
		</select>
		</td>
	</tr>
	<tr>
		<td><span class="f9 c6">超时时间：</span></td>
		<td><input name="timeout" type="text" id="timeout" value="10" size="15"></td>
	</tr>
	
	</table>
</div>

<input type="submit" name="Submit" id="Submit" value="提交">
<input type="hidden" name="subconst" value="1">
</form>
