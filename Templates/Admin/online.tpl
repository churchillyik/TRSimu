<?php 
//////////////////////////////////////////////////////////////////////////////////////////////////////
//                                             TRAVIANX                                             //
//            Only for advanced users, do not edit if you dont know what are you doing!             //
//                                Made by: Dzoki & Dixie (TravianX)                                 //
//                              - TravianX = Travian Clone Project -                                //
//                                 DO NOT REMOVE COPYRIGHT NOTICE!                                  //
//////////////////////////////////////////////////////////////////////////////////////////////////////
?>
<?php
$active = $admin->getUserActive(); 
?>
<style>
.del {width:12px; height:12px; background-image: url(img/admin/icon/del.gif);} 
</style>  

<table id="member"> 
  <thead>
    <tr>
        <th colspan="6">Online users (<?php echo count($active);?>)</th>
    </tr>
  </thead>    
    <tr>
        <td>Name [access]</td>
        <td>Time</td>
        <td>Tribe</td> 
        <td>Pop</td> 
        <td>Villages</td> 
        <td>Gold</td>  
    </tr>
<?php 
if($active){         
for ($i = 0; $i <= count($active)-1; $i++) {
$uid = $database->getUserField($active[$i]['username'],'id',1);
$varray = $database->getProfileVillages($uid);
$totalpop = 0;
foreach($varray as $vil) {
	$totalpop += $vil['pop'];
}
echo '
    <tr>
        <td><a href="?p=player&uid='.$uid.'">'.$active[$i]['username'].' ['.$active[$i]['access'].']</a></td>
        <td>'.date("d.m.y H:i:s",$active[$i]['timestamp']).'</td>
        <td>'.$active[$i]['tribe'].'</td>
        <td>'.$totalpop.'</td>
        <td>'.count($varray).'</td>
        <td>'.$active[$i]['gold'].'</td>
    </tr>  
'; 
} 
}else{
echo '<tr><td  colspan="6" class="hab">No online users</td></tr>';

} 

?>    
  
</table>
