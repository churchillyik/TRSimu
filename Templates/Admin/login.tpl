<?php ////////////////////////////////////////////////////////////////////////////////////////////////////////                                             TRAVIANX                                             ////            Only for advanced users, do not edit if you dont know what are you doing!             ////                                Made by: Dzoki & Dixie (TravianX)                                 ////                              - TravianX = Travian Clone Project -                                ////                                 DO NOT REMOVE COPYRIGHT NOTICE!                                  ////////////////////////////////////////////////////////////////////////////////////////////////////////?><div align="center"><img src="../img/admin/admin.gif" width="468" height="60" border="0"></div>

<p>Login to ACP. Please enter information:</p>

<form method="post" action="admin.php">
<input type="hidden" name="action" value="login">
<p class="old_p1">
<table width="100%" cellspacing="1" cellpadding="0">
<tr><td><label>Username:</label>
<input class="fm fm110" type="text" name="name" value="<?php echo $_SESSION['username']?>" maxlength="15"> <span class="e f7"></span>
</td></tr>
<tr><td><label>Password:</label>
<input class="fm fm110" type="password" name="pw" value="" maxlength="20"> <span class="e f7"></span>
</td></tr>
</table>
</p>
<p align="center"><input type="image" border="0" src="../img/admin/b/l1.gif" width="80" height="20">

</form>


<p align="center"></p>