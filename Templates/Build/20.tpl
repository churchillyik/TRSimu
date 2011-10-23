<div id="build" class="gid20"><a href="#" onClick="return Popup(20,4);" class="build_logo">
<img class="building g20" src="img/x.gif" alt="Stable" title="Stable" /> </a>

<h1>Stable <span class="level">Level <?php echo $village->resarray['f'.$id]; ?></span></h1>
<p class="build_desc">Cavalry can be trained in the stable. The higher its level the faster the troops are trained.<br /></p>
		<form method="POST" name="snd" action="build.php">
			<input type="hidden" name="id" value="<?php echo $id; ?>" />
            <input type="hidden" name="ft" value="t1" />
			<table cellpadding="1" cellspacing="1" class="build_details">
				<thead>
					<tr>
						<td>Name</td>
						<td>Quantity</td>
						<td>Max</td>
					</tr>
				</thead>
				<tbody>
                <?php 
                include("20_".$session->tribe.".tpl");
                ?>
				</tbody>
			</table>
			<p>
				<input type="image" id="btn_train" class="dynamic_img" value="ok" name="s1" src="img/x.gif" alt="train" />
			</p>

		</form>
<?php
    $trainlist = $technology->getTrainingList(2);
    if(count($trainlist) > 0) {
    $timer = 2*count($trainlist);
    	echo "
    <table cellpadding=\"1\" cellspacing=\"1\" class=\"under_progress\">
		<thead><tr>
			<td>Training</td>
			<td>Duration</td>
			<td>Finished</td>
		</tr></thead>
		<tbody>";
        foreach($trainlist as $train) {
        echo "<tr><td class=\"desc\">";
        echo "<img class=\"unit u".$train['unit']."\" src=\"img/x.gif\" alt=\"".$train['name']."\" title=\"".$train['name']."\" />".$train['amt']." ".$train['name']."</td><td class=\"dur\"><span id=timer".$timer.">".$generator->getTimeFormat(($train['commence']+($train['eachtime']*$train['amt']))-time())."</span></td><td class=\"fin\">";
        $timer -= 1;
        $time = $generator->procMTime($train['commence']+($train['eachtime']*$train['amt']));
        if($time[0] != "today") {
            echo "on ".$time[0]." at";
            }
            echo $time[1]."</span><span> o'clock</td>
		</tr><tr class=\"next\"><td colspan=\"3\">The next unit will be finished in <span id=timer".$timer.">".$generator->getTimeFormat(($train['commence']+$train['eachtime'])-time())."</span></td></tr>";
        }
        echo "</tbody></table>";
    }
    ?>
	<?php 
include("upgrade.tpl");
?> </p></div>
