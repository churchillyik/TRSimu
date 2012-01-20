<h1>玩家资料</h1>

<?php 
$varmedal = $database->getProfileMedal($session->uid);
include("menu.tpl");
?>

<form action="spieler.php" method="POST">
    <input type="hidden" name="ft" value="p1" />
    <input type="hidden" name="uid" value="<?php echo $session->uid; ?>" />
    <input type="hidden" name="id" value="<?php echo $id; ?>" />
    
    <table cellpadding="1" cellspacing="1" id="edit" ><thead>
    <tr>
        <th colspan="3">玩家 <?php echo $session->username; ?></th>
    </tr>    
    <tr>
        <td colspan="2">明细</td>
        <td>描述</td>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td colspan="2" class="empty"></td>
		<td class="empty"></td>
	</tr>
    <tr>
		<?php 
		if ($session->userinfo['birthday'] != 0)
		{
			$bday = explode("-",$session->userinfo['birthday']);
		}
		else
		{
			$bday = array('', '', '');
		}
		?>
		<th>生日</th>
		<td class="birth">
			<input tabindex="1" class="text day" type="text" name="tag" value="<?php echo $bday[2]; ?>" maxlength="2" />
			<select tabindex="2" name="monat" size="" class="dropdown">
				<option value="0"></option>
				<option value="1" <?php if ($bday[1] == 1) { echo "selected"; } ?>>1月</option>
				<option value="2" <?php if ($bday[1] == 2) { echo "selected"; } ?>>2月</option>
				<option value="3" <?php if ($bday[1] == 3) { echo "selected"; } ?>>3月</option>
				<option value="4" <?php if ($bday[1] == 4) { echo "selected"; } ?>>4月</option>
				<option value="5" <?php if ($bday[1] == 5) { echo "selected"; } ?>>5月</option>
				<option value="6" <?php if ($bday[1] == 6) { echo "selected"; } ?>>6月</option>
				<option value="7" <?php if ($bday[1] == 7) { echo "selected"; } ?>>7月</option>
				<option value="8" <?php if ($bday[1] == 8) { echo "selected"; } ?>>8月</option>
				<option value="9" <?php if ($bday[1] == 9) { echo "selected"; } ?>>9月</option>
				<option value="10" <?php if ($bday[1] == 10) { echo "selected"; } ?>>10月</option>
				<option value="11" <?php if ($bday[1] == 11) { echo "selected"; } ?>>11月</option>
				<option value="12" <?php if ($bday[1] == 12) { echo "selected"; } ?>>12月</option>
			</select>
			<input tabindex="3" type="text" name="jahr" value="<?php echo $bday[0]; ?>" maxlength="4" class="text year">
		</td>
		<td rowspan="7" class="desc1"><textarea tabindex="7" name="be1"><?php echo $session->userinfo['desc2']; ?></textarea></td>
	</tr>
    <tr>
		<th>性别</th>
		<td class="gend">
			<label><input class="radio" type="radio" name="mw" value="0" <?php if ($session->userinfo['gender'] == 0) { echo "checked"; } ?> tabindex="4">保密</label>
			<label><input class="radio" type="radio" name="mw" value="1" <?php if ($session->userinfo['gender'] == 1) { echo "checked"; } ?> >男</label>
			<label><input class="radio" type="radio" name="mw" value="2" <?php if ($session->userinfo['gender'] == 2) { echo "checked"; } ?> >女</label>
		</td>
	</tr>
    <tr>
		<th>地区</th>
		<td><input tabindex="5" type="text" name="ort" value="<?php echo $session->userinfo['location']; ?>" maxlength="30" class="text"></td>
	</tr>
    <tr>
		<td colspan="2" class="empty"></td>
	</tr>
	
    <?php
	$varray = $database->getProfileVillages($session->uid);
    for ($i=0; $i <= count($varray) - 1; $i++)
	{
		echo "
		<tr>
			<th>村庄名称</th>
			<td><input tabindex=\"6\" type=\"text\" name=\"dname$i\" value=\"".$varray[$i]['name']."\" maxlength=\"20\" class=\"text\"></td>
		</tr>";
    }
    ?>
    <tr>
		<td colspan="2" class="desc2"><textarea tabindex="8" name="be2"><?php echo $session->userinfo['desc1']; ?></textarea></td>
	</tr>
    </table>
	<p>
		<table cellspacing="1" cellpadding="2" class="tbg">
		<tr>
			<td class="rbg" colspan="4">勋章</td>
		</tr>
		<tr>
			<td>类别</td>
			<td>排名</td>
			<td>周次</td>
			<td>BB-Code</td>
		</tr>
		<?php
		foreach ($varmedal as $medal)
		{
			$titel = "勋章";
			switch ($medal['categorie'])
			{
			case "1":
				$titel="每周攻击手";
				break;
			case "2":
				$titel="每周防御手";
				break;
			case "3":
				$titel="每周人口上升";
				break;
			case "4":
				$titel="每周资源掠夺";
				break;
		}			
		echo "
			<tr>
				<td> ".$titel."</td>
				<td>".$medal['plaats']."</td>
				<td>".$medal['week']."</td>
				<td>[#".$medal['id']."]</td>
			</tr>";
		}
		?>
		<tr>
			<td>新手保护</td>
			<td></td>
			<td></td>
			<td>[#0]</td>
		</tr>
		</table>
	</p>
	<p class="btn">
		<input type="image" value="" tabindex="9" name="s1" id="btn_ok" class="dynamic_img" src="img/x.gif" alt="确定" />
	</p>
</form>   