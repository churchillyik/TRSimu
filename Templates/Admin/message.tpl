<?php ////////////////////////////////////////////////////////////////////////////////////////////////////////                                             TRAVIANX                                             ////            Only for advanced users, do not edit if you dont know what are you doing!             ////                                Made by: Dzoki & Dixie (TravianX)                                 ////                              - TravianX = Travian Clone Project -                                ////                                 DO NOT REMOVE COPYRIGHT NOTICE!                                  ////////////////////////////////////////////////////////////////////////////////////////////////////////?><style>
.del {width:12px; height:12px; background-image: url(img/admin/icon/del.gif);} 
</style>
<table id="member" style="width:225px">
  <thead>
    <tr>
        <th colspan="2">IGM/Reports</th>
    </tr>
  </thead> 
    <tr>
        <td>IGM ID</td>
        <td><form action="" method="get"><input type="hidden" name="p" value="message"><input type="text" class="fm" name="nid" value="<?php echo $_GET['nid'];?>"> <input type="submit" value="ok"></form></td>
    </tr>
    <tr>
        <td>Report ID</td>
        <td><form action="" method="get"><input type="hidden" name="p" value="message"><input type="text" class="fm" name="bid" value="<?php echo $_GET['bid'];?>"> <input type="submit" value="ok"></form></td>
    </tr>

</table><br>
<?php

if($_GET['nid'] and ereg('^[0-9]', $_GET['nid'])){
  include('msg.tpl');
}elseif($_GET['bid'] and ereg('^[0-9]', $_GET['bid'])){
  include('report.tpl');
}

?>
