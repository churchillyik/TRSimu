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
<form method="post" action="admin.php">
<input name="action" type="hidden" value="addVillage">
<input name="uid" type="hidden" value="<?php echo $user['id'];?>">
<table id="member" style="width: 225px;"> 
  <thead>
    <tr>
        <th colspan="2">Add Village</th>
    </tr>
  </thead>   
  
	<tr>
        <td colspan="2"><center>Coordinates (<b>X</b>|<b>Y</b>)</center></td>
    </tr>  
    
	<tr>
        <td>X:</td>
        <td><input name="x" class="fm" value="" type="input"></td>
    </tr>
	
    <tr>
        <td>Y:</td>
        <td><input name="y" class="fm" value="" type="input"></td>
    </tr>
	
    <tr>
        <td colspan="2"><center><input value="Add Village" type="submit"></center></td>
    </tr> 
	
</table>
</form>