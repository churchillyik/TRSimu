<?php
$wood = round($village->getProd("wood"));
$clay = round($village->getProd("clay"));
$iron = round($village->getProd("iron"));
$crop = round($village->getProd("crop"));
$totalproduction = $village->allcrop; // all crops + bakery + grain mill
?> 

<div id="res">
<div id="resWrap">
	<table cellpadding="1" cellspacing="1">
	<tr>
		<!-- 4种资源 -->
		<td><img src="img/x.gif" class="r1" alt="<?php echo LUMBER; ?>" title="<?php echo LUMBER; ?>" /></td>
		<td id="l4" title="<?php echo $wood; ?>"><?php echo round($village->awood)."/".$village->maxstore; ?></td>
		
		<td><img src="img/x.gif" class="r2" alt="<?php echo CLAY; ?>" title="<?php echo CLAY; ?>" /></td>
		<td id="l3" title="<?php echo $clay; ?>"><?php echo round($village->aclay)."/".$village->maxstore; ?></td>
		
		<td><img src="img/x.gif" class="r3" alt="<?php echo IRON; ?>" title="<?php echo IRON; ?>" /></td>
		<td id="l2" title="<?php echo $iron; ?>"><?php echo round($village->airon)."/".$village->maxstore; ?></td>
		
		<td><img src="img/x.gif" class="r4" alt="<?php echo CROP; ?>" title="<?php echo CROP; ?>" /></td>
		<td id="l1" title="<?php echo $crop; ?>"><?php echo round($village->acrop)."/".$village->maxcrop; ?></td>
		
		<td><img src="img/x.gif" class="r5" alt="<?php echo CROP_COM; ?>" title="<?php echo CROP_COM; ?>" /></td>
		<td><?php echo ($village->pop + $technology->getUpkeep($village->unitall,0))."/".$totalproduction.""; ?></td>
	</tr>
	</table>
	
	<table cellpadding="1" cellspacing="1">
	<tr>
		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td> 
        <td></td>
		
		<td>
		<?php 
		//	显示当前金币
		if($session->gold <= 1)
		{
			echo '
			<font color="#B3B3B3">
			<img src="gpack/travian_redesign/img/a/gold_g.gif" alt="剩余金币" title="当前剩余：'.$session->gold.' 金币"/> '.$session->gold.'
			<span>
				<span>金</span>
				<span>币</span>
			</span>
			</font>';
		}
		else if($session->gold >= 2)
		{
			echo '
			<img src="gpack/travian_redesign/img/a/gold.gif" alt="剩余金币" title="当前剩余：'.$session->gold.' 金币"/> '.$session->gold.' <span>
				<span>金</span>
				<span>币</span>
			</span>';
		}
		?>
		</td>
	</tr>
	</table>
</div>
</div>