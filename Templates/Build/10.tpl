<div id="build" class="gid10"><a href="#" onClick="return Popup(10,4);" class="build_logo">
	<img class="building g10" src="img/x.gif" alt="Warehouse" title="Warehouse" />
</a>
<h1>Warehouse <span class="level">Level <?php echo $village->resarray['f'.$id]; ?></span></h1>
<p class="build_desc">The resources wood, clay and iron are stored in your Warehouse. By increasing its level you increase your Warehouse's capacity. .</p>


	<table cellpadding="1" cellspacing="1" id="build_value">
	<tr>
		<th>Current capacity:</th>
		<td><b><?php echo $bid10[$village->resarray['f'.$id]]['attri']; ?></b> units</td>
	</tr>
	<tr>
<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
        ?>
		<th>Capacity at level <?php echo $village->resarray['f'.$id]+1; ?>:</th>
		<td><b><?php echo $bid10[$village->resarray['f'.$id]+1]['attri']; ?></b> units</td>
        <?php
            }
            ?>
	</tr>
	</table>
 <?php 
include("upgrade.tpl");
?>
</p></div>