<div id="build" class="gid36">
	<a href="#" onClick="return Popup(36,4, 'gid');" class="build_logo">
		<img class="building g36" src="img/x.gif" alt="陷阱机" title="陷阱机" />
	</a>
	<h1>
		陷阱机 
		<span class="level">等级 <?php echo $village->resarray['f'.$id]; ?></span>
	</h1>
	<p class="build_desc">
		陷阱机可以建造陷阱来保护你的村庄。进攻者一不小心就会跌进陷阱机而不能再对村庄造成威胁。陷阱机级别越高，就可以越快地建造陷阱。
	</p>

	<table cellpadding="1" cellspacing="1" id="build_value">
	<tr>
		<th>Actuele maximale aantal</th>
		<td><b>10</b> Vallen</td>
	</tr>
	<tr>
		<th>Maximale aantal bij niveau 2</th>
		<td><b>22</b> Vallen</td>
	</tr>
	</table>
	
	<p>
		Je bezit op het moment <b>0</b> vallen, daarvan zijn er <b>0</b> bezet.
	</p>
	
	<form method="POST" name="snd" action="build.php">
		<input type="hidden" name="id" value="22" />
		<input type="hidden" name="z" value="17" />
		<input type="hidden" name="a" value="2" />

		<table cellpadding="1" cellspacing="1" class="build_details">
		<thead>
		<tr>
			<td>Naam</td>
			<td>Aantal</td>
			<td>max</td>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td class="desc">
				<div class="tit">
					<img class="unit u99" src="img/x.gif" alt="Val" title="Val" />
					<a href="#" onClick="return Popup(36,4,'gid');">Vallen</a>
					<span class="info">(Aanwezig: 0)</span>
				</div>
				<div class="details">
					<span><img class="r1" src="img/x.gif" alt="木材" title="Hout" />20|</span>
					<span><img class="r2" src="img/x.gif" alt="粘土" title="Klei" />30|</span>
					<span><img class="r3" src="img/x.gif" alt="铁矿" title="IJzer" />10|</span>
					<span><img class="r4" src="img/x.gif" alt="粮食" title="Graan" />20|</span>
					<span><img class="r5" src="img/x.gif" alt="粮食消耗" title="Graanverbruik" />0|
					<img class="clock" src="img/x.gif" alt="所需时间" title="所需时间" />0:10:00</span>
				</div>
			</td>
			<td class="val"><input type="text" class="text" name="t99" value="0" maxlength="4"></td>
			<td class="max"><a href="#" onClick="document.snd.t99.value=10">(10)</a></td>
		</tr>
		</tbody>
		</table>

		<p>
			<input type="image" value="ok" name="s1" id="btn_train" class="dynamic_img" src="img/x.gif" alt="补充" />
		</p>
	</form>
	
	<?php include("upgrade.tpl"); ?>
</div>