<?php 
//////////////////////////////////////////////////////////////////////////////////////////////////////
//                                             TRAVIANX                                             //
//            Only for advanced users, do not edit if you dont know what are you doing!             //
//                                Made by: Dzoki & Dixie (TravianX)                                 //
//                              - TravianX = Travian Clone Project -                                //
//                                 DO NOT REMOVE COPYRIGHT NOTICE!                                  //
//////////////////////////////////////////////////////////////////////////////////////////////////////
?>
<style>
.del {width:12px; height:12px; background-image: url(img/admin/icon/del.gif);} 
</style>  
<table id="member">
  <thead>
    <tr>
        <th>Villages</th>
    </tr>
  </thead> 

</table>
<table id="profile">    
    <tr>
        <td>Name</td>
        <td>Population</td>
        <td>Coordinates</td>
		<td></td>
    </tr>
<?php         
for ($i = 0; $i <= count($varray)-1; $i++) {
$coorproc = $database->getCoor($varray[$i]['wref']);
if($varray[$i]['capital']){
$capital = '<span class="c">(Capital)</span>';
$delLink = '<a href="#"><img src="../img/Admin/del_g.gif" class="del"></a>'; 
}else{
$capital = '';
$delLink = '<a href="?action=delVil&did='.$varray[$i]['wref'].'" onClick="return del(\'did\','.$varray[$i]['wref'].');"><img src="../img/Admin/del.gif" class="del"></a>';
  
}

echo '
    <tr>
        <td><a href="?p=village&did='.$varray[$i]['wref'].'">'.$varray[$i]['name'].'</a> '.$capital.'</td>
        <td>'.$varray[$i]['pop'].' <a href="?action=recountPop&did='.$varray[$i]['wref'].'">Check<a/></td>
        <td>('.$coorproc['x'].'|'.$coorproc['y'].')</td>
		<td>'.$delLink.' </td>
    </tr>  
'; 
}  

?>    
  
</table>
