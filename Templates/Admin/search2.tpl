<?php 
//////////////////////////////////////////////////////////////////////////////////////////////////////
//                                             TRAVIANX                                             //
//            Only for advanced users, do not edit if you dont know what are you doing!             //
//                                Made by: Dzoki & Dixie (TravianX)                                 //
//                              - TravianX = Travian Clone Project -                                //
//                                 DO NOT REMOVE COPYRIGHT NOTICE!                                  //
//////////////////////////////////////////////////////////////////////////////////////////////////////
?>
<form action="" method="post">  
<table id="profile">
  <thead>
    <tr>
        <th colspan="3" class="left">Information</th>
    </tr>
  </thead> 
</table> 
      <center><div id="s_nav2">
        <span class="f8">
          <span class="b"><br />Player</span>: <a href="?p=player&uid=<?php echo $user['id'];?>"><?php echo $user['username'];?></a> (uid: <?php echo $user['id'];?>)
        </span>
        <br>
        <span class="f8">
          <span class="b">Tribe</span>: <?php                        
                if($user['tribe'] == 1) {
                echo "Roman";
                }
                else if($user['tribe'] == 2) {
                echo "Teutons";
                }
                else if($user['tribe'] == 3) {
                echo "Gauls";
                } ?> | <span class="b">Villages</span>: <?php echo count($varray);?><br /><br />
        </span>
      </div>
      <?php if($_GET['did']){  ?> 
      <div id="s_nav4">
        <span class="f10">
          <span class="b">Village</span>: <a href="?p=village&did=<?php echo $village['wref'];?>"><?php echo $village['name'];?></a> (did: <?php echo $village['wref'];?>)
        </span>
        <br>
        <span class="f8">
          <span class="b">Coordinates</span>: (<?php echo $coor['x'];?>|<?php echo $coor['y'];?>) | <span class="b">Inhabitants</span>: <?php echo $village['pop'];?>
        </span
      </div>
      <?php }?>
</center>

</form>