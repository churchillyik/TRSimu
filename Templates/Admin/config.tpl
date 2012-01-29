<style>
.del {width:12px; height:12px; background-image: url(img/admin/icon/del.gif);}
</style>
<table id="member">
<thead>
<tr>
	<th>~ 服务器全局设置 ~</th>
</tr>
</thead>
</table>
<table id="profile">
<tr>
	<td class="b">参数项</td>
	<td class="b">参数值</td>
</tr>
<tr>
	<td>服务器名</td>
	<td><?php echo SERVER_NAME;?></td>
</tr><tr>	<td>服务器启动时间</td>	<td><?php echo date("Y.m.d H:i", COMMENCE);?></td></tr>  
<tr>
	<td>语言</td>
	<td><?php if (LANG == 'en') { echo "英文"; } ?></td>
</tr>
<tr>
	<td>资源倍数</td>
	<td><?php echo SPEED;?></td>
</tr>
<tr>
	<td>地图大小</td>
	<td><?php echo WORLD_MAX; ?> x <?php echo WORLD_MAX; ?></td>
</tr>
<tr>
	<td>军队移动倍数</td>
	<td><?php echo INCREASE_SPEED;?>x</td>
</tr> <tr>	<td>村庄扩张速度</td>	<td>		<?php		if (CP == 1)		{			echo "快";		}		elseif (CP == 0)		{			echo "慢";		}		?>	</td></tr>   <tr>	<td>新手保护时长</td>	<td><?php echo (PROTECTION / 3600); ?> 小时</td></tr><tr>	<td>邮件激活帐号</td>	<td>		<?php		if (AUTH_EMAIL == true)		{			echo "<b><font color='Green'>启用</font></b>";		}		elseif (AUTH_EMAIL == false)		{			echo "<b><font color='Red'>禁用</font></b>";		}		?>	</td></tr><tr>	<td>任务</td>	<td>		<?php 		if (QUEST == true)		{			echo "<b><font color='Green'>启用</font></b>";		}		elseif (QUEST == false)		{			echo "<b><font color='Red'>禁用</font></b>";		}		?>	</td></tr><tr>	<td>可拆除建筑等级（中心大楼等级）</td>	<td><?php echo DEMOLISH_LEVEL_REQ; ?></td></tr>
</table>
<table id="member">
<thead>
<tr>
	<th>~ 服务器日志 ~</th>
</tr>
</thead>
</table>
<table id="profile">
<tr>
	<td class="b">参数项</td>
	<td class="b">参数值</td>
</tr>
<tr>
	<td>日志生成</td>
	<td>		<?php		if (LOG_BUILD == true)		{			echo "<b><font color='Green'>启用</font></b>";		}		elseif (LOG_BUILD == false)		{			echo "<b><font color='Red'>禁用</font></b>"; 		}		?>	</td>
</tr>
<tr>
	<td>科技日志</td>
	<td>	<?php		if (LOG_TECH == true)		{			echo "<b><font color='Green'>启用</font></b>";		}		elseif (LOG_TECH == false)		{			echo "<b><font color='Red'>禁用</font></b>"; 		}		?>	</td>
</tr>
<tr>
	<td>登录日志</td>
	<td>		<?php		if (LOG_LOGIN == true)		{			echo "<b><font color='Green'>启用</font></b>";		}		elseif (LOG_LOGIN == false)		{			echo "<b><font color='Red'>禁用</font></b>"; 		}		?>	</td>
</tr>
<tr>
	<td>金币日志</td>
	<td>		<?php		if (LOG_GOLD_FIN == true)		{			echo "<b><font color='Green'>启用</font></b>";		}		elseif (ALOG_GOLD_FIN == false)		{			echo "<b><font color='Red'>禁用</font></b>"; 		}		?>	</td>
</tr>
<tr>
	<td>管理日志</td>
	<td>		<?php		if (LOG_ADMIN == true)		{			echo "<b><font color='Green'>启用</font></b>";		}		elseif (LOG_ADMIN == false)		{			echo "<b><font color='Red'>禁用</font></b>";		}		?>	</td>
</tr>
<tr>
	<td>战斗日志</td>
	<td>		<?php		if (LOG_WAR == true)		{			echo "<b><font color='Green'>启用</font></b>";		}		elseif (LOG_WAR == false)		{			echo "<b><font color='Red'>禁用</font></b>";		}		?>	</td>
</tr>
<tr>
	<td>市场日志</td>
	<td>		<?php		if (LOG_MARKET == true)		{			echo "<b><font color='Green'>启用</font></b>";		}		elseif (LOG_MARKET == false)		{			echo "<b><font color='Red'>禁用</font></b>";		}		?>	</td>
</tr>
<tr>
	<td>非法日志</td>
	<td>		<?php		if (LOG_ILLEGAL == true)		{			echo "<b><font color='Green'>启用</font></b>";		}		elseif (LOG_ILLEGAL == false)		{			echo "<b><font color='Red'>禁用</font></b>";		}		?>	</td>
</tr>
</table>
<table id="member">
<thead>
<tr>
	<th>~ 新闻盒设定 ~</th>
</tr>
</thead>
</table>  
<table id="profile">
<tr>
	<td class="b">参数项</td>
	<td class="b">参数值</td>
</tr><tr>	<td>新闻盒 1</td>	<td>		<?php		if (NEWSBOX1 == true)		{			echo "<b><font color='Green'>启用</font></b>";		}		elseif (NEWSBOX1 == false)		{			echo "<b><font color='Red'>禁用</font></b>";		}		?>	</td></tr><tr>	<td>新闻盒 2</td>	<td>		<?php		if (NEWSBOX2 == true)		{			echo "<b><font color='Green'>启用</font></b>";		}		elseif (NEWSBOX2 == false)		{			echo "<b><font color='Red'>禁用</font></b>";		}		?>	</td></tr><tr>	<td>新闻盒 3</td>	<td>		<?php		if (NEWSBOX3 == true)		{			echo "<b><font color='Green'>启用</font></b>";		}		elseif (NEWSBOX3 == false)		{			echo "<b><font color='Red'>禁用</font></b>";		}		?>	</td></tr>
</table>
<table id="member">
<thead>
<tr>
	<th>~ 数据库设定 ~</th>
</tr>
</thead></table>
<table id="profile">
<tr>
	<td class="b">参数项</td>
	<td class="b">参数值</td>
</tr>
<tr>
	<td>数据库地址</td>
	<td><?php echo SQL_SERVER;?></td>
</tr>
<tr>
	<td>数据库用户名</td>
	<td><?php echo SQL_USER;?></td>
</tr>
<tr>
	<td>数据库密码</td>
	<td><?php echo SQL_PASS;?></td>
</tr>
<tr>
	<td>数据库名</td>
	<td><?php echo SQL_DB;?></td>
</tr>
<tr>
	<td>表名前缀</td>
	<td><?php echo TB_PREFIX;?></td>
</tr>
<tr>
	<td>数据库类型</td>
	<td>		<?php 		if (DB_TYPE == 0)		{			echo "MYSQL";		}		elseif (DB_TYPE == 1)		{			echo "MYSQLi";		}		?>	</td>
</tr>
</table><table id="member"><thead><tr>	<th>~ 其他设定 ~</th></tr></thead></table><table id="profile"><tr>	<td class="b">参数项</td>	<td class="b">参数值</td></tr><tr>	<td>邮件限制</td>	<td>	<?php	if (LIMIT_MAILBOX == true)	{		echo "<b><font color='Green'>启用</font></b>";	}	elseif (LIMIT_MAILBOX == false)	{		echo "<b><font color='Red'>禁用</font></b>";	}	?>	</td></tr>    <tr>	<td>邮件上限</td>	<td>		<?php		if (LIMIT_MAILBOX == true)		{			echo MAX_MAIL;		}		elseif (LIMIT_MAILBOX == false)		{			echo "<font color='Gray'>邮件限制已禁用</font>";		}		?>	</td></tr>    <tr>	<td>管理员是否参与排行</td>	<td>		<?php		if (INCLUDE_ADMIN == true)		{			echo "<b><font color='Green'>启用</font></b>";		}		elseif (INCLUDE_ADMIN == false)		{			echo "<b><font color='Red'>禁用</font></b>";		}		?>	</td></tr></table><table id="member"><thead><tr>	<th>~ 管理员设定 ~</th></tr></thead></table><table id="profile"><tr>	<td class="b">参数项</td>	<td class="b">参数值</td></tr><tr>	<td>管理员邮件</td>	<td>		<?php		if (ADMIN_EMAIL == '')		{			echo "<b><font color='Red'>未定义管理员邮箱</b></font>";		}		elseif (ADMIN_EMAIL != '')		{			echo ADMIN_EMAIL;		}		?>	</td></tr>  <tr>	<td>管理员名称</td>	<td>		<?php		if (ADMIN_NAME == '')		{			echo "<b><font color='Red'>未定义管理员名称</b></font>";		}		elseif (ADMIN_NAME != '')		{			echo ADMIN_NAME;		}		?>	</td></tr></table>

<?php
function define_array($array, $keys = NULL)
{
    foreach ($array as $key => $value)
    {
        $keyname = ($keys ? $keys."_" : "").$key;
        if (is_array($array[$key]))		{
            define_array($array[$key], $keyname);		}
        else		{
            define($keyname, $value);		}
    }
}
?>