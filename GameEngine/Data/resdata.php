<?php
//	研发所研发兵种需要的资源和时间
$r2 = array('wood'=>700,'clay'=>620,'iron'=>1480,'crop'=>580,'time'=>7080);
$r3 = array('wood'=>1000,'clay'=>740,'iron'=>1880,'crop'=>640,'time'=>7560);
$r4 = array('wood'=>940,'clay'=>740,'iron'=>360,'crop'=>400,'time'=>5880);
$r5 = array('wood'=>3400,'clay'=>1860,'iron'=>2760,'crop'=>760,'time'=>9720);
$r6 = array('wood'=>3400,'clay'=>2660,'iron'=>6600,'crop'=>1240,'time'=>12360);
$r7 = array('wood'=>5500,'clay'=>1540,'iron'=>4200,'crop'=>580,'time'=>15600);
$r8 = array('wood'=>5800,'clay'=>5500,'iron'=>5000,'crop'=>700,'time'=>28800);
$r9 = array('wood'=>15880,'clay'=>13800,'iron'=>36400,'crop'=>22660,'time'=>24475);
$r12 = array('wood'=>970,'clay'=>380,'iron'=>880,'crop'=>400,'time'=>5160);
$r13 = array('wood'=>880,'clay'=>580,'iron'=>1560,'crop'=>580,'time'=>5400);
$r14 = array('wood'=>1060,'clay'=>500,'iron'=>600,'crop'=>460,'time'=>5160);
$r15 = array('wood'=>2320,'clay'=>1180,'iron'=>2520,'crop'=>610,'time'=>9000);
$r16 = array('wood'=>2800,'clay'=>2160,'iron'=>4040,'crop'=>640,'time'=>10680);
$r17 = array('wood'=>6100,'clay'=>1300,'iron'=>3000,'crop'=>580,'time'=>14400);
$r18 = array('wood'=>5500,'clay'=>4900,'iron'=>5000,'crop'=>520,'time'=>28800);
$r19 = array('wood'=>18250,'clay'=>13500,'iron'=>20400,'crop'=>16480,'time'=>19425);		
$r22 = array('wood'=>940,'clay'=>700,'iron'=>1680,'crop'=>520,'time'=>6120);
$r23 = array('wood'=>1120,'clay'=>700,'iron'=>360,'crop'=>400,'time'=>5880);
$r24 = array('wood'=>2200,'clay'=>1900,'iron'=>2040,'crop'=>520,'time'=>9240);
$r25 = array('wood'=>2260,'clay'=>1420,'iron'=>2440,'crop'=>880,'time'=>9480);
$r26 = array('wood'=>3100,'clay'=>2580,'iron'=>5600,'crop'=>1180,'time'=>11160);
$r27 = array('wood'=>5800,'clay'=>2320,'iron'=>2840,'crop'=>610,'time'=>16800);
$r28 = array('wood'=>5860,'clay'=>5900,'iron'=>5240,'crop'=>700,'time'=>28800);
$r29 = array('wood'=>15880,'clay'=>22900,'iron'=>25200,'crop'=>22660,'time'=>24475);

//	铁匠铺升级攻防需要的资源和时间

//	古罗马步兵
$ab1 = array(
1=>array('wood'=>940,'clay'=>800,'iron'=>1250,'crop'=>370,'time'=>6600),
array('wood'=>1635,'clay'=>1395,'iron'=>2175,'crop'=>645,'time'=>11491),
array('wood'=>2265,'clay'=>1925,'iron'=>3010,'crop'=>890,'time'=>15894),
array('wood'=>2850,'clay'=>2425,'iron'=>3790,'crop'=>1120,'time'=>20007),
array('wood'=>3405,'clay'=>2900,'iron'=>4530,'crop'=>1340,'time'=>23918),
array('wood'=>3940,'clay'=>3355,'iron'=>5240,'crop'=>1550,'time'=>27674),
array('wood'=>4460,'clay'=>3795,'iron'=>5930,'crop'=>1755,'time'=>31306),
array('wood'=>4960,'clay'=>4220,'iron'=>6600,'crop'=>1955,'time'=>34835),
array('wood'=>5450,'clay'=>4640,'iron'=>7250,'crop'=>2145,'time'=>38277),
array('wood'=>5930,'clay'=>5050,'iron'=>7885,'crop'=>2335,'time'=>41643),
array('wood'=>6400,'clay'=>5450,'iron'=>8510,'crop'=>2520,'time'=>44943),
array('wood'=>6860,'clay'=>5840,'iron'=>9125,'crop'=>2700,'time'=>48182),
array('wood'=>7315,'clay'=>6225,'iron'=>9730,'crop'=>2880,'time'=>51369),
array('wood'=>7765,'clay'=>6605,'iron'=>10325,'crop'=>3055,'time'=>54506),
array('wood'=>8205,'clay'=>6980,'iron'=>10910,'crop'=>3230,'time'=>57599),
array('wood'=>8640,'clay'=>7350,'iron'=>11485,'crop'=>3400,'time'=>60651),
array('wood'=>9065,'clay'=>7715,'iron'=>12060,'crop'=>3570,'time'=>63665),
array('wood'=>9490,'clay'=>8080,'iron'=>12620,'crop'=>3735,'time'=>66644),
array('wood'=>9910,'clay'=>8435,'iron'=>13180,'crop'=>3900,'time'=>69590),
array('wood'=>10325,'clay'=>8790,'iron'=>13730,'crop'=>4065,'time'=>72505));

//	禁卫兵
$ab2 = array(
1=>array('wood'=>800,'clay'=>1010,'iron'=>1320,'crop'=>650,'time'=>7080)
,array('wood'=>1395,'clay'=>1760,'iron'=>2300,'crop'=>1130,'time'=>12327)
,array('wood'=>1925,'clay'=>2430,'iron'=>3180,'crop'=>1565,'time'=>17050)
,array('wood'=>2425,'clay'=>3060,'iron'=>4000,'crop'=>1970,'time'=>21463)
,array('wood'=>2900,'clay'=>3660,'iron'=>4785,'crop'=>2355,'time'=>25657)
,array('wood'=>3355,'clay'=>4235,'iron'=>5535,'crop'=>2725,'time'=>29686)
,array('wood'=>3795,'clay'=>4790,'iron'=>6260,'crop'=>3085,'time'=>33582)
,array('wood'=>4220,'clay'=>5330,'iron'=>6965,'crop'=>3430,'time'=>37368)
,array('wood'=>4640,'clay'=>5860,'iron'=>7655,'crop'=>3770,'time'=>41061)
,array('wood'=>5050,'clay'=>6375,'iron'=>8330,'crop'=>4100,'time'=>44672)
,array('wood'=>5450,'clay'=>6880,'iron'=>8990,'crop'=>4425,'time'=>48211)
,array('wood'=>5840,'clay'=>7375,'iron'=>9635,'crop'=>4745,'time'=>51687)
,array('wood'=>6225,'clay'=>7860,'iron'=>10275,'crop'=>5060,'time'=>55105)
,array('wood'=>6605,'clay'=>8340,'iron'=>10900,'crop'=>5370,'time'=>58470)
,array('wood'=>6980,'clay'=>8815,'iron'=>11520,'crop'=>5675,'time'=>61788)
,array('wood'=>7350,'clay'=>9280,'iron'=>12130,'crop'=>5975,'time'=>65062)
,array('wood'=>7715,'clay'=>9745,'iron'=>12735,'crop'=>6270,'time'=>68296)
,array('wood'=>8080,'clay'=>10200,'iron'=>13330,'crop'=>6565,'time'=>71491)
,array('wood'=>8435,'clay'=>10650,'iron'=>13920,'crop'=>6855,'time'=>74651)
,array('wood'=>8790,'clay'=>11095,'iron'=>14500,'crop'=>7140,'time'=>77778));

//	帝国兵
$ab3 = array(
1=>array('wood'=>1150,'clay'=>1220,'iron'=>1670,'crop'=>720,'time'=>7560)
,array('wood'=>2000,'clay'=>2125,'iron'=>2910,'crop'=>1255,'time'=>13163)
,array('wood'=>2770,'clay'=>2940,'iron'=>4020,'crop'=>1735,'time'=>18206)
,array('wood'=>3485,'clay'=>3700,'iron'=>5060,'crop'=>2185,'time'=>22918)
,array('wood'=>4165,'clay'=>4420,'iron'=>6050,'crop'=>2610,'time'=>27397)
,array('wood'=>4820,'clay'=>5115,'iron'=>7000,'crop'=>3020,'time'=>31699)
,array('wood'=>5455,'clay'=>5785,'iron'=>7920,'crop'=>3415,'time'=>35859)
,array('wood'=>6070,'clay'=>6440,'iron'=>8815,'crop'=>3800,'time'=>39902)
,array('wood'=>6670,'clay'=>7075,'iron'=>9685,'crop'=>4175,'time'=>43845)
,array('wood'=>7255,'clay'=>7700,'iron'=>10535,'crop'=>4545,'time'=>47700)
,array('wood'=>7830,'clay'=>8310,'iron'=>11370,'crop'=>4905,'time'=>51480)
,array('wood'=>8395,'clay'=>8905,'iron'=>12190,'crop'=>5255,'time'=>55191)
,array('wood'=>8950,'clay'=>9495,'iron'=>13000,'crop'=>5605,'time'=>58841)
,array('wood'=>9495,'clay'=>10075,'iron'=>13790,'crop'=>5945,'time'=>62434)
,array('wood'=>10035,'clay'=>10645,'iron'=>14575,'crop'=>6285,'time'=>65977)
,array('wood'=>10570,'clay'=>11210,'iron'=>15345,'crop'=>6615,'time'=>69473)
,array('wood'=>11095,'clay'=>11770,'iron'=>16110,'crop'=>6945,'time'=>72926)
,array('wood'=>11610,'clay'=>12320,'iron'=>16865,'crop'=>7270,'time'=>76338)
,array('wood'=>12125,'clay'=>12865,'iron'=>17610,'crop'=>7590,'time'=>79712)
,array('wood'=>12635,'clay'=>13400,'iron'=>18345,'crop'=>7910,'time'=>83051));

//	使节骑士
$ab4 = array(
1=>array('wood'=>540,'clay'=>610,'iron'=>170,'crop'=>220,'time'=>5880)
,array('wood'=>940,'clay'=>1060,'iron'=>295,'crop'=>385,'time'=>10238)
,array('wood'=>1300,'clay'=>1470,'iron'=>410,'crop'=>530,'time'=>14160)
,array('wood'=>1635,'clay'=>1850,'iron'=>515,'crop'=>665,'time'=>17825)
,array('wood'=>1955,'clay'=>2210,'iron'=>615,'crop'=>795,'time'=>21309)
,array('wood'=>2265,'clay'=>2560,'iron'=>715,'crop'=>920,'time'=>24655)
,array('wood'=>2560,'clay'=>2895,'iron'=>805,'crop'=>1045,'time'=>27890)
,array('wood'=>2850,'clay'=>3220,'iron'=>895,'crop'=>1160,'time'=>31035)
,array('wood'=>3130,'clay'=>3540,'iron'=>985,'crop'=>1275,'time'=>34101)
,array('wood'=>3405,'clay'=>3850,'iron'=>1075,'crop'=>1390,'time'=>37100)
,array('wood'=>3675,'clay'=>4155,'iron'=>1160,'crop'=>1500,'time'=>40040)
,array('wood'=>3940,'clay'=>4455,'iron'=>1240,'crop'=>1605,'time'=>42926)
,array('wood'=>4205,'clay'=>4750,'iron'=>1325,'crop'=>1710,'time'=>45765)
,array('wood'=>4460,'clay'=>5040,'iron'=>1405,'crop'=>1815,'time'=>48560)
,array('wood'=>4715,'clay'=>5325,'iron'=>1485,'crop'=>1920,'time'=>51316)
,array('wood'=>4960,'clay'=>5605,'iron'=>1560,'crop'=>2020,'time'=>54035)
,array('wood'=>5210,'clay'=>5885,'iron'=>1640,'crop'=>2120,'time'=>56720)
,array('wood'=>5455,'clay'=>6160,'iron'=>1715,'crop'=>2220,'time'=>59374)
,array('wood'=>5695,'clay'=>6430,'iron'=>1790,'crop'=>2320,'time'=>61998)
,array('wood'=>5930,'clay'=>6700,'iron'=>1870,'crop'=>2415,'time'=>64595));
?>