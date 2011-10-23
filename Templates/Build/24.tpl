<div id="build" class="gid24"><a href="#" onClick="return Popup(24,4);" class="build_logo">
	<img class="building g24" src="img/x.gif" alt="Town Hall" title="Town Hall" />
</a>
<h1>Town Hall <span class="level">Level <?php echo $village->resarray['f'.$id]; ?></span></h1>
<p class="build_desc">You can hold pompous celebrations in the Town Hall. Such a celebration increases your culture points. Building up your Town Hall to a higher level will decrease the length of the celebration.
</p>
<?php 
include("24_1.tpl"); 
include("Templates/Build/24_2.tpl");
include("upgrade.tpl");

?>
</p></div>