<style>
.del {width:12px; height:12px; background-image: url(img/admin/icon/del.gif);}
</style>
<table id="member" style="width:225px">
<thead>
<tr>
	<th colspan="2">用户投诉</th>
</tr>
</thead>
<tr>
	<td>用户投诉</td>
	<td>	<form action="" method="get">		<input type="hidden" name="p" value="message">		<input type="text" class="fm" name="nid" value="<?php echo $_GET['nid'];?>"> 		<input type="submit" value="确定">	</form>	</td>
</tr>
</table><br>
<?php
if ($_GET['nid'] and ereg('^[0-9]', $_GET['nid'])){
	include('msg.tpl');
}
?>