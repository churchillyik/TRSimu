<?php//	表达式
$pattern = array();//	格式
$pattern[0] = "/\[b\](.*?)\[\/b\]/is";
$pattern[1] = "/\[i\](.*?)\[\/i\]/is";
$pattern[2] = "/\[u\](.*?)\[\/u\]/is";//	兵种图标
$pattern[3] = "/\[tid1\]/";
$pattern[4] = "/\[tid2\]/";
$pattern[5] = "/\[tid3\]/";
$pattern[6] = "/\[tid4\]/";
$pattern[7] = "/\[tid5\]/";
$pattern[8] = "/\[tid6\]/";
$pattern[9] = "/\[tid7\]/";
$pattern[10] = "/\[tid8\]/";
$pattern[11] = "/\[tid9\]/";
$pattern[12] = "/\[tid10\]/";
$pattern[13] = "/\[tid11\]/";
$pattern[14] = "/\[tid12\]/";
$pattern[15] = "/\[tid13\]/";
$pattern[16] = "/\[tid14\]/";
$pattern[17] = "/\[tid15\]/";
$pattern[18] = "/\[tid16\]/";
$pattern[19] = "/\[tid17\]/";
$pattern[20] = "/\[tid18\]/";
$pattern[21] = "/\[tid19\]/";
$pattern[22] = "/\[tid20\]/";
$pattern[23] = "/\[tid21\]/";
$pattern[24] = "/\[tid22\]/";
$pattern[25] = "/\[tid23\]/";
$pattern[26] = "/\[tid24\]/";
$pattern[27] = "/\[tid25\]/";
$pattern[28] = "/\[tid26\]/";
$pattern[29] = "/\[tid27\]/";
$pattern[30] = "/\[tid28\]/";
$pattern[31] = "/\[tid29\]/";
$pattern[32] = "/\[tid30\]/";
$pattern[33] = "/\[tid31\]/";
$pattern[34] = "/\[tid32\]/";
$pattern[35] = "/\[tid33\]/";
$pattern[36] = "/\[tid34\]/";
$pattern[37] = "/\[tid35\]/";
$pattern[38] = "/\[tid36\]/";
$pattern[39] = "/\[tid37\]/";
$pattern[40] = "/\[tid38\]/";
$pattern[41] = "/\[tid39\]/";
$pattern[42] = "/\[tid40\]/";
$pattern[43] = "/\[tid41\]/";
$pattern[44] = "/\[tid42\]/";
$pattern[45] = "/\[tid43\]/";
$pattern[46] = "/\[tid44\]/";
$pattern[47] = "/\[tid45\]/";
$pattern[48] = "/\[tid46\]/";
$pattern[49] = "/\[tid47\]/";
$pattern[50] = "/\[tid48\]/";
$pattern[51] = "/\[tid49\]/";
$pattern[52] = "/\[tid50\]/";$pattern[53] = "/\[hero\]/";//	资源
$pattern[54] = "/\[l\]/";
$pattern[55] = "/\[cl\]/";
$pattern[56] = "/\[i\]/";
$pattern[57] = "/\[c\]/";//	表情
$pattern[58] = "/\*aha\*/";
$pattern[59] = "/\*angry\*/";
$pattern[60] = "/\*cool\*/";
$pattern[61] = "/\*cry\*/";
$pattern[62] = "/\*cute\*/";
$pattern[63] = "/\*depressed\*/";
$pattern[64] = "/\*eek\*/";
$pattern[65] = "/\*ehem\*/";
$pattern[66] = "/\*emotional\*/";
$pattern[67] = "/\:D/";
$pattern[68] = "/\:\)/";
$pattern[69] = "/\*hit\*/";
$pattern[70] = "/\*hmm\*/";
$pattern[71] = "/\*hmpf\*/";
$pattern[72] = "/\*hrhr\*/";
$pattern[73] = "/\*huh\*/";
$pattern[74] = "/\*lazy\*/";
$pattern[75] = "/\*love\*/";
$pattern[76] = "/\*nocomment\*/";
$pattern[77] = "/\*noemotion\*/";
$pattern[78] = "/\*notamused\*/";
$pattern[79] = "/\*pout\*/";
$pattern[80] = "/\*redface\*/";
$pattern[81] = "/\*rolleyes\*/";
$pattern[82] = "/\:\(/";
$pattern[83] = "/\*shy\*/";
$pattern[84] = "/\*smile\*/";
$pattern[85] = "/\*tongue\*/";
$pattern[86] = "/\*veryangry\*/";
$pattern[87] = "/\*veryhappy\*/";
$pattern[88] = "/\;\)/";//	替换文本
$replace= array();
$replace[0] = "<b>$1</b>";
$replace[1] = "<i>$1</i>";
$replace[2] = "<u>$1</u>";
$replace[3] = "<img class='unit u1' src='img/x.gif' title='古罗马步兵' alt='古罗马步兵'>";
$replace[4] = "<img class='unit u2' src='img/x.gif' title='禁卫兵' alt='禁卫兵'>";
$replace[5] = "<img class='unit u3' src='img/x.gif' title='帝国兵' alt='帝国兵'>";
$replace[6] = "<img class='unit u4' src='img/x.gif' title='使节骑士' alt='使节骑士'>";
$replace[7] = "<img class='unit u5' src='img/x.gif' title='帝国骑士' alt='帝国骑士'>";
$replace[8] = "<img class='unit u6' src='img/x.gif' title='将军骑士' alt='将军骑士'>";
$replace[9] = "<img class='unit u7' src='img/x.gif' title='冲撞车' alt='冲撞车'>";
$replace[10] = "<img class='unit u8' src='img/x.gif' title='火焰投石器' alt='火焰投石器'>";
$replace[11] = "<img class='unit u9' src='img/x.gif' title='参议员' alt='参议员'>";
$replace[12] = "<img class='unit u10' src='img/x.gif' title='拓荒者' alt='拓荒者'>";
$replace[13] = "<img class='unit u11' src='img/x.gif' title='Clubswinger' alt='Clubswinger'>";
$replace[14] = "<img class='unit u12' src='img/x.gif' title='Spearman' alt='Spearman'>";
$replace[15] = "<img class='unit u13' src='img/x.gif' title='Axeman' alt='Axeman'>";
$replace[16] = "<img class='unit u14' src='img/x.gif' title='Scout' alt='Scout'>";
$replace[17] = "<img class='unit u15' src='img/x.gif' title='Paladin' alt='Paladin'>";
$replace[18] = "<img class='unit u16' src='img/x.gif' title='Teutonic Knight' alt='Teutonic Knight'>";
$replace[19] = "<img class='unit u17' src='img/x.gif' title='Ram' alt='Ram'>";
$replace[20] = "<img class='unit u18' src='img/x.gif' title='Catapult' alt='Catapult'>";
$replace[21] = "<img class='unit u19' src='img/x.gif' title='Chief' alt='Chief'>";
$replace[22] = "<img class='unit u20' src='img/x.gif' title='Settler' alt='Settler'>";
$replace[23] = "<img class='unit u21' src='img/x.gif' title='Phalanx' alt='Phalanx'>";
$replace[24] = "<img class='unit u22' src='img/x.gif' title='Swordsman' alt='Swordsman'>";
$replace[25] = "<img class='unit u23' src='img/x.gif' title='Pathfinder' alt='Pathfinder'>";
$replace[26] = "<img class='unit u24' src='img/x.gif' title='Theutates Thunder' alt='Theutates Thunder'>";
$replace[27] = "<img class='unit u25' src='img/x.gif' title='Druidrider' alt='Druidrider'>";
$replace[28] = "<img class='unit u26' src='img/x.gif' title='Haeduan' alt='Haeduan'>";
$replace[29] = "<img class='unit u27' src='img/x.gif' title='Ram' alt='Ram'>";
$replace[30] = "<img class='unit u28' src='img/x.gif' title='Trebuchet' alt='Trebuchet'>";
$replace[31] = "<img class='unit u29' src='img/x.gif' title='Chieftain' alt='Chieftain'>";
$replace[32] = "<img class='unit u30' src='img/x.gif' title='Settler' alt='Settler'>";
$replace[33] = "<img class='unit u31' src='img/x.gif' title='Rat' alt='Rat'>";
$replace[34] = "<img class='unit u32' src='img/x.gif' title='Spider' alt='Spider'>";
$replace[35] = "<img class='unit u33' src='img/x.gif' title='Snake' alt='Snake'>";
$replace[36] = "<img class='unit u34' src='img/x.gif' title='Bat' alt='Bat'>";
$replace[37] = "<img class='unit u35' src='img/x.gif' title='Wild Boar' alt='Wild Boar'>";
$replace[38] = "<img class='unit u36' src='img/x.gif' title='Wolf' alt='Wolf'>";
$replace[39] = "<img class='unit u37' src='img/x.gif' title='Bear' alt='Bear'>";
$replace[40] = "<img class='unit u38' src='img/x.gif' title='Crocodile' alt='Crocodile'>";
$replace[41] = "<img class='unit u39' src='img/x.gif' title='Tiger' alt='Tiger'>";
$replace[42] = "<img class='unit u40' src='img/x.gif' title='Elephant' alt='Elephant'>";
$replace[43] = "<img class='unit u41' src='img/x.gif' title='Pikeman' alt='Pikeman'>";
$replace[44] = "<img class='unit u42' src='img/x.gif' title='Thorned Warrior' alt='Thorned Warrior'>";
$replace[45] = "<img class='unit u43' src='img/x.gif' title='Guardsman' alt='Guardsman'>";
$replace[46] = "<img class='unit u44' src='img/x.gif' title='Birds Of Prey' alt='Birds Of Prey'>";
$replace[47] = "<img class='unit u45' src='img/x.gif' title='Axerider' alt='Axerider'>";
$replace[48] = "<img class='unit u46' src='img/x.gif' title='Natarian Knight' alt='Natarian Knight'>";
$replace[49] = "<img class='unit u47' src='img/x.gif' title='War Elephant' alt='War Elephant'>";
$replace[50] = "<img class='unit u48' src='img/x.gif' title='Ballista' alt='Ballista'>";
$replace[51] = "<img class='unit u49' src='img/x.gif' title='Natarian Emperor' alt='Natarian Emperor'>";
$replace[52] = "<img class='unit u50' src='img/x.gif' title='Settler' alt='Settler'>";
$replace[53] = "<img class='unit uhero' src='img/x.gif' title='Hero' alt='Hero'>";
$replace[54] = "<img src='img/x.gif' class='r1' title='Lumber' alt='Lumber'>";
$replace[55] = "<img src='img/x.gif' class='r2' title='Clay' alt='Clay'>";
$replace[56] = "<img src='img/x.gif' class='r3' title='Iron' alt='Iron'>";
$replace[57] = "<img src='img/x.gif' class='r4' title='Crop' alt='Crop'>";
$replace[58] = "<img class='smiley aha' src='img/x.gif' alt='*aha*' title='*aha*'>";
$replace[59] = "<img class='smiley angry' src='img/x.gif' alt='*angry*' title='*angry*'>";
$replace[60] = "<img class='smiley cool' src='img/x.gif' alt='*cool*' title='*cool*'>";
$replace[61] = "<img class='smiley cry' src='img/x.gif' alt='*cry*' title='*cry*'>";
$replace[62] = "<img class='smiley cute' src='img/x.gif' alt='*cute*' title='*cute*'>";
$replace[63] = "<img class='smiley depressed' src='img/x.gif' alt='*depressed*' title='*depressed*'>";
$replace[64] = "<img class='smiley eek' src='img/x.gif' alt='*eek*' title='*eek*'>";
$replace[65] = "<img class='smiley ehem' src='img/x.gif' alt='*ehem*' title='*ehem*'>";
$replace[66] = "<img class='smiley emotional' src='img/x.gif' alt='*emotional*' title='*emotional*'>";
$replace[67] = "<img class='smiley grin' src='img/x.gif' alt=':D' title=':D'>";
$replace[68] = "<img class='smiley happy' src='img/x.gif' alt=':)' title=':)'>";
$replace[69] = "<img class='smiley hit' src='img/x.gif' alt='*hit*' title='*hit*'>";
$replace[70] = "<img class='smiley hmm' src='img/x.gif' alt='*hmm*' title='*hmm*'>";
$replace[71] = "<img class='smiley hmpf' src='img/x.gif' alt='*hmpf*' title='*hmpf*'>";
$replace[72] = "<img class='smiley hrhr' src='img/x.gif' alt='*hrhr*' title='*hrhr*'>";
$replace[73] = "<img class='smiley huh' src='img/x.gif' alt='*huh*' title='*huh*'>";
$replace[74] = "<img class='smiley lazy' src='img/x.gif' alt='*lazy*' title='*lazy*'>";
$replace[75] = "<img class='smiley love' src='img/x.gif' alt='*love*' title='*love*'>";
$replace[76] = "<img class='smiley nocomment' src='img/x.gif' alt='*nocomment*' title='*nocomment*'>";
$replace[77] = "<img class='smiley noemotion' src='img/x.gif' alt='*noemotion*' title='*noemotion*'>";
$replace[78] = "<img class='smiley notamused' src='img/x.gif' alt='*notamused*' title='*notamused*'>";
$replace[79] = "<img class='smiley pout' src='img/x.gif' alt='*pout*' title='*pout*'>";
$replace[80] = "<img class='smiley redface' src='img/x.gif' alt='*redface*' title='*redface*'>";
$replace[81] = "<img class='smiley rolleyes' src='img/x.gif' alt='*rolleyes*' title='*rolleyes*'>";
$replace[82] = "<img class='smiley sad' src='img/x.gif' alt=':(' title=':('>";
$replace[83] = "<img class='smiley shy' src='img/x.gif' alt='*shy*' title='*shy*'>";
$replace[84] = "<img class='smiley smile' src='img/x.gif' alt='*smile*' title='*smile*'>";
$replace[85] = "<img class='smiley tongue' src='img/x.gif' alt='*tongue*' title='*tongue*'>";
$replace[86] = "<img class='smiley veryangry' src='img/x.gif' alt='*veryangry*' title='*veryangry*'>";
$replace[87] = "<img class='smiley veryhappy' src='img/x.gif' alt='*veryhappy*' title='*veryhappy*'>";
$replace[88] = "<img class='smiley wink' src='img/x.gif' alt=';)' title=';)'>";//	用替换文本替换所有的表达式
$bbcoded = preg_replace($pattern, $replace, $input);
?>