<?php 

//////////////////////////////////////////////////////////////////////////////////////////////////////
//                                             TRAVIANX                                             //
//            Only for advanced users, do not edit if you dont know what are you doing!             //
//                                Made by: Dzoki & Dixie (TravianX)                                 //
//                              - TravianX = Travian Clone Project -                                //
//                                 DO NOT REMOVE COPYRIGHT NOTICE!                                  //
//////////////////////////////////////////////////////////////////////////////////////////////////////

if ($_SESSION['qst']!=24 && QUEST==true){?>

<div id="anm" style="width:120px; height:140px; visibility:hidden;"></div>
			<div id="qge">
				<?php if ($_SESSION['qst']==0){ ?>
				<img onclick="qst_handle();" src="img/x.gif" id="qgei" class="q_l<?php echo $session->userinfo['tribe'];?>" title="to the task" style="height:174px" alt="to the task" />
				<?php }else{?>
				<img onclick="qst_handle();" src="img/x.gif" id="qgei2" class="q_l<?php echo $session->userinfo['tribe'];?>" title="to the task" style="height:174px" alt="to the task" />
				<?php } ?>
			</div>
			<script type="text/javascript">
				<?php if ($_SESSION['qst']==0){ ?>
				quest.number=null;
				<?php }else{ ?>
				quest.number=0;
				<?php } ?>
				quest.last = 23;
				cache_preload = new Image();
				cache_preload.src = "img/x.gif";
				cache_preload.className = "wood";
			</script>						
<?php } ?>

