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
$result = $admin->search_village($_POST['s']);
?>
<table id="member">
  <thead>
    <tr>
        <th class="dtbl"><a href="">1 «</a></th><th>Found villages (<?php echo count($result);?>)</th><th class="dtbl"><a href="">» 100</a></th>
    </tr>
  </thead> 

</table>
<table id="profile">    
    <tr>
        <td class="b">ID</td>
        <td class="b">Name</td>
        <td class="b">Owner</td>         
        <td class="b">Pop</td>
		<td></td>
    </tr>
<?php      
if($result){  
for ($i = 0; $i <= count($result)-1; $i++) {    
echo '
    <tr>
        <td>'.$result[$i]["wref"].'</td>
        <td><a href="?p=village&did='.$result[$i]["wref"].'">'.$result[$i]["name"].'</a></td>
        <td><a href="?p=player&uid='.$result[$i]["owner"].'">'.$database->getUserField($result[$i]["owner"],'username',0).'</a></td>
        <td>'.$result[$i]["pop"].'</td>
		<td><a href="?action=delVil&did='.$result[$i]['wref'].'" onClick="return del(\'did\','.$result[$i]['wref'].');"><img src="../img/Admin/del.gif" class="del">
    </tr>  
'; 
}}
else{  
echo '
    <tr>
        <td colspan="4">No results</td>  
    </tr>  
';
}
?>    
  
</table>
