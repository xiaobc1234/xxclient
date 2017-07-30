
local data={}


data["登录"] = {
	['登录账号']={'登录账号',{0xffffff,"-18|-6|0xffffff,-49|-14|0x31b960",95,551,403,768,489}},
--	['登录公告']={'登录公告',{0xffffff,"7|-1|0xb58f8d,23|3|0xfff7f7,11|29|0x8c1c19,10|94|0x9c814a",95,860,796,1057,981}},
	['登录游戏']={'登录游戏',{0xf2df87,"27|-3|0xf9ffa5,16|-2|0xb63a22",95,590,544,707,604}},
	['选择角色']={'选择角色',{0xf5f3a2,"-23|4|0xf1dd84,-9|0|0xbb3e22",95,1066,646,1176,713}},--{1130,151},{1130,257},{1130,388},{1130,526}
	['已登录']={'已登录',{0xdcd640,"6|-2|0xc9c062,-3|1|0x1e0e02",95,16,1,64,25}},
--	['安峰公告']={'安峰公告',{0xd1f2eb,"12|-7|0xffffff,41|-9|0xfcfefe,33|20|0x39c5a9",95,813,891,1057,1017}}
	['移动浮层']={'移动浮层',{0xf72e2e,"-7|-2|0xf72e2e,6|-2|0xf72e2e",95,829,7,914,86}},
	['移动左侧浮层']={'移动左侧浮层',{0xc8c4c0,"5|4|0x1c1812,11|7|0xc6c3bf,8|-1|0x1b160f",95,3,346,54,406}},
	['创建道士']={'创建道士',{0x25c118,"-9|6|0xeeb534,-14|-5|0x1a4314",95,1087,409,1162,468}},
	['角色2没有创建']={'角色2没有创建',{0x599c27,"4|8|0x3b7f1a,6|6|0x43861a",95,1238,264,1281,310}},
	['角色3没有创建']={'角色3没有创建',{0x599c27,"4|8|0x3b7f1a,6|6|0x43861a",95,1240,400,1277,437}},
	['角色4没有创建']={'角色4没有创建',{0x599c27,"4|8|0x3b7f1a,6|6|0x43861a",95,1238,529,1282,571}},
	
	['角色1']={'角色1',{0xe3b7a7,"5|6|0xe1b2a8,3|8|0xdead9e",95,941,93,1036,188}},
	['角色2']={'角色2',{0xe3b7a7,"5|6|0xe1b2a8,3|8|0xdead9e",95,952,259,1025,318}},
	['角色3']={'角色3',{0xe3b7a7,"5|6|0xe1b2a8,3|8|0xdead9e",95,945,348,1036,436}},
	['角色4']={'角色4',{0xe3b7a7,"5|6|0xe1b2a8,3|8|0xdead9e",95,936,464,1053,605}},
	
}

data['召唤战神']={
	['点击召唤战神']={'点击召唤战神',{0xf4f2f0,"-10|-2|0xa77124,31|-5|0xf1ece3",95,629,602,711,659}},
	['关闭召唤战神']={'关闭召唤战神',{0xfaf53b,"9|-7|0xfdf017,8|12|0x340604",95,397,170,481,631}}--{1197,93}
}

data['离线奖励']={
	['离线奖励'] ={'离线奖励',{0xf1dc6a,"10|-4|0xf9d949,-3|2|0xe33f21",95,626,553,698,616}},--{1225,44}
	['关闭提示']={'关闭提示',{0xf8f4c1,"27|-2|0xe9e4b3,12|-4|0xa63310",95,623,491,707,535}}
}

data['主线']={
	['开始游戏'] ={'开始游戏',{0xf2fbde,"-8|-7|0xdf2a1c,11|-3|0xe5c4aa",95,641,500,742,564}},
	['完成任务']={'完成任务',{0xfcfcfb,"16|3|0xfffefd,26|1|0xd6cdbb,12|-5|0xbd932c",95,163,617,280,675}},
	['装备']={'装备',{0xffffcc,"23|-2|0xf0e9b8,18|-12|0xb03910",95,901,593,981,644}},
	['任务栏完成']={'任务栏完成',{0xffcc00,"13|3|0xffcc00,33|3|0xfecb00,122|5|0x26ce04,134|8|0x33d504,158|0|0x33dd00",95,4,172,234,328}},
	['任务栏完成2']={'任务栏完成2',{0xf1be02,"22|2|0xfcca01,53|2|0xf2c006,72|5|0xebba03,125|6|0x30cb02,140|5|0x22c802",95,5,178,232,275}},
	--	['任务栏未完成']={'任务栏未完成',{0xfdca00,"102|0|0xce0302,114|-1|0xdf0201",95,4,149,192,209}},--不需要这个
	['羽翼']={'羽翼',{0xf1ebbb,"-2|5|0xd5c89c,15|-1|0xe5d9ac,24|-11|0xb23d10",95,997,637,1076,690}},
	['PK之城']={'PK之城',{0xfdc900,"21|3|0xfac901,106|11|0x36d105,117|10|0x34d703,133|12|0x37cf06",95,3,174,236,311}},
	['冲级大礼包']={'冲级大礼包',{0xf6f2c0,"18|-5|0xede4b6,38|-1|0xdacea6,6|-12|0xa9370f",95,584,439,748,505}},
	['主线回收装备']={'主线回收装备',{0xf3edbd,"15|-1|0xd2bf96,10|-30|0xe9d971,14|-58|0x2c1d18",95,1018,513,1168,651}},
	['主线回收装备2']={'主线回收装备2',{0xd6c79a,"-9|4|0x791708,-54|-4|0xffdd51,-78|4|0x2a1e1b",95,942,579,1103,658}},
	['除魔完成']={'除魔完成',{0xf0bd04,"25|2|0xfecb00,43|-5|0xfbc901,84|-1|0x28c105,96|-2|0x33dc00",95,6,174,222,395}},
	['除魔领奖']={'除魔领奖',{0xeadfd7,"-19|-1|0xb54a2d,-10|0|0xefe6e1",95,120,406,234,482}},
	['除魔刷新']={'除魔刷新',{0xf9f8f5,"-6|-5|0xfbfbf9,7|-12|0xcda541",95,173,468,264,510}},
	['除魔接任务']={'除魔接任务',{0xedebe7,"0|1|0xe6e3dd,10|2|0xf1f0ee,4|-4|0xb68d25",95,169,622,244,674}},
	['除魔进行中']={'除魔进行中',{0xfac801,"22|-4|0xe7b607,30|-6|0xfecb00,-21|13|0xddddaa,-21|17|0xdcdca9",95,5,174,234,397}},
	['除魔进行中2']={'除魔进行中2',{0xfac801,"0|-5|0xeebc04,4|-2|0xfdca01,-26|19|0xdbdba8,-25|24|0xdcdca9",95,3,173,236,395}},
	['主线战神图标']={'主线战神图标',{0xfefec7,"-18|-3|0xffc139,15|-26|0xfff353,-12|-24|0x451000",95,616,292,744,449}},
	['主线召唤战神']={'主线召唤战神',{0xfcfbfa,"-7|0|0xfefefe,112|11|0xfffd98,105|17|0xecd940,113|16|0xfefd25",95,905,12,1113,86}},
--	['主线强化图标']={'主线强化图标',{0xd28326,"-4|10|0xac5320,22|5|0xd87621,5|12|0xba6420",95,636,337,748,434}},
	['主线强化']={'主线强化',{0xfafaf9,"13|-3|0x352723,56|-8|0xf5d756,62|5|0xf1a266",95,975,161,1116,222}},
	['主线强化step2']={'主线强化step2',{0xc2ac87,"-15|0|0xa07a55,26|-2|0x74371d,28|1|0xfbfac7",95,401,631,509,679}},--关闭{1185,44}
	['主线个人boss图标']={'主线个人boss图标',{0xae4c0e,"-5|10|0x470b00,17|17|0x600c00",95,620,315,743,429}},
	['主线个人BOSS未完成']={'主线个人BOSS未完成',{0xfdca00,"-1|3|0xfecc00,12|10|0xfecb00,0|30|0xdcdca9,18|37|0xdbdaa8,31|40|0xddddaa",95,3,177,204,271}},
	['主线个人boss']={'主线个人boss',{0xfefdca,"0|7|0xfaf9c6,8|5|0xfaf8c5,7|-10|0xb33e0d",95,1022,639,1105,697}},
	['主线个人boss领奖']={'主线个人boss领奖',{0xeee6b4,"-5|6|0xd2d2a0,8|-1|0xf1eeb7,8|-5|0xa03010",95,63,340,140,393}},
	['主线个人boss退出']={'主线个人boss退出',{0xfbf9c7,"11|-5|0x712910,19|5|0xad9f7a,-65|-66|0xd61a19",95,39,269,213,410}},
	['主线等级限制']={'主线等级限制',{0xfdca00,"-1|4|0xefbc01,21|5|0xfbc800,54|8|0xffcc00,124|12|0xd80403,137|8|0xe50201",95,5,175,227,285}},
--	['主线称号']={'主线称号',{0x501b0d,"-10|-3|0x52250b,-4|18|0x892610",100,534,257,631,358}},
	['主线未知暗殿']={'主线未知暗殿',{0xfefefe,"12|-2|0xf1efeb,32|-8|0xfefefe,56|-4|0xe3dccf,78|-2|0xfdfdfd,68|-15|0xbf982a",95,123,610,277,679}},
	['主线到70级']={'主线到70级',{0xfecb00,"8|5|0xedbf01,-1|11|0xffcc00,29|14|0xf3c301,-15|35|0x26d003,-3|37|0x30d001",95,19,180,228,271}},
	['主线对话']={'主线对话',{0xf2efea,"9|-2|0xe3e0d8,25|-3|0xe7e3d9,21|-11|0xbb922a",95,182,622,258,659}},
	['聊天窗口']={'聊天窗口',{0x12120c,"5|0|0x946e21,1|-10|0xb6943d,-11|0|0xa47b22,-3|11|0x603a14",95,40,556,91,599}},
	['70级以上']={'70级以上',{0xffffff,"4|0|0xffffff,4|4|0xf3f2f1,1|11|0xffffff,-3|-3|0x6b5a21",95,0,0,18,34}},
	['80级以上']={'80级以上',{0xfcfcfc,"3|4|0xffffff,3|-2|0xf9f8f8,3|11|0xffffff,6|8|0xfcfcfc,1|5|0xffffff",95,6,8,18,35}}
}

data["回收装备"]={
	["全部回收"]={'全部回收',{0xf3efbb,"-5|-2|0xdbd0a3,6|-14|0xae3a0f",95,1033,593,1111,640}},
	['关闭回收']={'关闭回收',{0xfac800,"-8|-4|0xab1b0a,12|1|0x98180a",95,729,25,762,61}}
}

data['除魔']={
	['除魔可接']={'除魔可接',{0xedba02,"13|-2|0xfecb00,30|1|0xf1be01,52|0|0xfecb00,84|6|0xf4c302,101|9|0xffcc00,117|3|0xffcc00",95,6,173,234,393}},
	['除魔滑动']={'除魔滑动',{0xfdfcc9,"11|2|0xf3f0bc,32|6|0xf7f4c2,22|-5|0xb2410e",95,14,134,81,171}},
	-- TODO 主线除魔进行中  和一般的除魔进行中不一样
	['召唤战神']={'召唤战神',{0x8a3a38,"-2|7|0x8f783c,6|3|0xefee9b,11|9|0xbda964",95,958,34,1019,83}},
	['左侧任务']={'左侧任务',{0xebe9b4,"-8|1|0xdad7a7,4|-3|0x5c3a1f",95,4,130,86,174}},
	['左侧变强']={'左侧变强',{0x3e2615,"19|0|0x341e11,11|7|0x4b2e18",95,100,137,178,173}},
	['左侧变强高亮']={'左侧变强高亮',{0x7f270a,"9|-1|0x9d7351,4|-10|0xaf450b",95,99,137,174,171}},
	['左侧回收装备']={'左侧回收装备',{0xfae934,"-6|-6|0xfbe933,-11|-4|0xfeed33,-23|-7|0xffdd33",95,3,172,236,392}}
--	['左侧回收装备']={'左侧回收装备',{0xffed33,"13|3|0xfeed33,48|33|0x66dd44,75|28|0x66dd44",95,6,176,235,390}}
}

data['每日必做']={
	['每日必做']={'每日必做',{0x981818,"16|-2|0x6a55bb,3|17|0x3e2922",95,870,9,941,82}},
	['除魔']={'除魔',{0x7a1a0a,"-354|0|0xd3bd29,-363|1|0xfdf730,-349|-9|0xf7e731",95,149,80,1183,495}},
	['通天塔']={'通天塔',{0x871d0b,"-255|-17|0xfe65fe,-275|-6|0xf964f8,-347|-1|0xb34d22",95,151,81,1184,503}},
	['护盾副本']={'副本',{0x871e0b,"-339|8|0x2bc0d1,-351|10|0x148e90,-346|-3|0xcffeff",95,149,80,1186,503}},
	['膜拜城主']={'膜拜城主',{0x8d220b,"-290|-14|0xef5aeb,-267|-7|0xef61eb,-336|5|0x7d0b03",95,149,80,1186,503}},
	['领取必做奖励']={'领取必做奖励',{0x3da5b4,"11|12|0xb38229,0|20|0x205e75",95,285,528,363,610}},
	['每日回收']={'每日回收',{0xe6e4b2,"6|29|0xe8e6b1,0|19|0x4f321d",95,78,405,130,550}},
	['每日回收经验丹']={'每日回收经验丹',{0x83d781,"0|12|0x685c1e,8|19|0x908029",95,334,519,435,609}}
}

data['通天塔']={
	['进入通天塔']={'进入通天塔',{0xeae6de,"18|7|0xe2ded5,28|5|0xebe8e2,49|5|0xd7d0c1,39|-6|0xbf912a",95,154,620,294,668}},
	['通天塔界面']={'通天塔界面',{0xffffcc,"-8|-4|0xf6f6c4,20|-4|0xffffcc,6|-12|0xb13710",95,87,381,173,418}},
	['通天塔领取奖励']={'通天塔领取奖励',{0xeedd88,"-17|3|0x7e5521,10|1|0xe3d383",95,449,270,547,327}},
--	['通天塔左侧领取奖励']={'通天塔左侧领取奖励',{0xfefefe,"13|7|0xffffff,34|24|0xfffbff,54|21|0xfefefe,65|13|0xb58621",95,205,891,406,972}}
}

data['喝酒']={
	['喝酒']={'喝酒',{0x4a4817,"9|12|0x6b5310,-5|-5|0x7b7a37,26|-9|0xebe8d2",95,1072,363,1326,714}}
}

data['膜拜城主']={
	['膜拜城主']={'膜拜城主',{0xd3cebf,"22|4|0xbcb094,37|-13|0xbf9c2c",95,147,568,281,630}}
}

data['个人BOSS']={
	['个人BOSS']={'个人BOSS',{0xdaa451,"-7|21|0xecd883,6|19|0xbfa762,-7|13|0xf38031",95,869,3,1102,78}},	
	['个人BOSS左菜单']={'个人BOSS左菜单',{0x5a3621,"-15|-2|0xf5f4c3,9|25|0xffffcc",95,65,304,127,386}},
	['祖玛教主']={'祖玛教主',{0xe4df94,"-11|0|0x66441a,15|-2|0xc1bb7d",95,214,160,287,218}},
	['魔龙教主']={'魔龙教主',{0xc5b779,"-5|6|0xd2ca89,-12|-2|0x744b21",95,206,390,294,447}},
	['赤月恶魔']={'赤月恶魔',{0xe5e292,"2|-5|0xe9e497,-14|-1|0x6e4a21",95,198,237,300,298}},
	['牛魔王']={'牛魔王',{0xc9c27c,"6|-1|0xd5d587,-13|3|0x714820",95,213,311,306,370}},
	['挑战BOSS']={'挑战BOSS',{0xfaf8c5,"-8|-2|0xfbf9c7,18|-4|0xa42e10",95,1010,643,1129,690}},
	['挑战条件不足']={'挑战条件不足',{0xff3300,"0|-1|0xff3300",95,568,635,778,698}},
	['召唤战神']={'个人BOSS召唤战神',{0xeaa84f,"-7|-3|0xd86b0b,10|6|0xc5b26a",95,1080,11,1165,90}},
	['秒退']={'秒退',{0xfaf9c7,"-15|0|0xc8c090,-14|5|0xffffcc,10|-5|0xa93110",95,86,356,173,389}},
	['个人BOSS关闭提示']={'个人BOSS关闭提示',{0x611c0a,"-7|3|0xd8c79d,23|-4|0xb3906b",95,504,497,549,529}}
}

data['副本']={
	['祖玛寺庙']={'祖玛寺庙',{0x9e945e,"17|-1|0xc7c278,-9|2|0x62411d",95,195,155,306,214}},
	['封魔恶谷']={'封魔恶谷',{0xaa9e65,"0|8|0xc0b978,-12|2|0x734a1f",95,213,236,293,297}},
	['赤月神殿']={'赤月神殿',{0xe3d894,"-6|3|0xaca465,-20|-4|0x754b1e",95,210,317,298,370}},
	['挑战副本']={'挑战副本',{0xf6f2c1,"8|5|0xeee7b7,24|2|0xa62f10",95,762,561,861,607}},
	['挑战条件不足']={'挑战条件不足',{0xfa2e01,"0|1|0xfa2e01",95,794,396,888,505}},
	['副本领奖']={'副本领奖',{0xf2f1bf,"-11|-3|0xdddaaa,-6|-3|0xa02d0f,-9|6|0xebe9b9",95,49,336,171,391}},
	['副本领奖退出']={'副本领奖退出',{0x786749,"-17|2|0xe8e8b5,8|-6|0x712910,-67|-66|0xd21918",95,41,282,191,391}},
	['副本提前退出']={'副本提前退出',{0x665e3c,"11|4|0x604f35,20|-7|0xab380f,25|5|0xbab189",95,84,353,165,393}},
	['副本提前退出确认']={'副本提前退出确认',{0xfdfcc9,"13|-2|0xe4d7a1,27|0|0x9d2a10",95,493,484,575,536}}
}

data['切换角色']={
	['底部菜单设置']={'底部菜单设置',{0x5f2a03,"-13|-1|0x74400d,5|11|0x140201",95,1014,641,1091,727}},
	['设置左侧菜单']={'设置左侧菜单',{0xdfddae,"7|4|0x9e9671,5|-12|0x5c3c23",95,82,329,123,413}},
	['返回登录']={'返回登录',{0xf9f6c2,"22|5|0x743721,41|-5|0xac3c0e",95,601,626,729,675}},
	['返回登录确认']={'返回登录确认',{0xfdfcc9,"13|-6|0xa67b54,22|-11|0xb23d10",95,480,486,597,538}}
}

data['挂机']={
	['底部菜单']={'底部菜单',{0xdac97b,"9|-23|0xc7c573,-9|-19|0xdbd17c,-635|36|0x74582f",95,10,610,708,728}},
	['未知暗殿召唤战神']={'未知暗殿召唤战神',{0x836032,"11|-3|0xf6f64c,13|-11|0xfabf11,21|-1|0x620900",95,1198,105,1293,195}},
	['自动战斗']={'自动战斗',{0xdfcb88,"-16|6|0x7d6f3a,-13|11|0x5e5033,-6|6|0x30241a",95,1225,289,1330,482}},
	['底部装备菜单']={'底部装备菜单',{0xd8d7b4,"22|3|0xd8d2ac,9|-8|0x9e6a18",95,411,656,476,727}},
	['底部合成菜单']={'底部合成菜单',{0xb67e32,"15|8|0x7c4c10,3|14|0xc9c9ba",95,412,536,470,604}},
	['合成装备手镯']={'合成装备手镯',{0x1d150e,"2|-27|0x5a3510,29|-23|0x664814",95,993,152,1104,237}},
	['合成按钮']={'合成按钮',{0xe8ddac,"6|-2|0xf8f7c4,14|-9|0xb23b10",95,761,611,856,661}},
	['合成70级装备']={'合成70级装备',{0xd1c983,"1|7|0xcac680,-2|12|0xeeea99,-11|8|0x6b4321",95,193,162,281,217}},
	['合成关闭']={'合成关闭',{0xffd100,"-8|-7|0xf3d331,10|-4|0xa51b0a",95,1164,23,1207,65}},
	['未知暗殿boss刷新1']={'未知暗殿boss刷新1',{0x70e300,"22|1|0x6bd900,30|9|0x64ce00",95,975,48,1064,78}},
	['未知暗殿boss刷新2']={'未知暗殿boss刷新2',{0x6ee100,"2|7|0x68d400,22|9|0x5ec800",95,983,74,1064,110}},
	['主线未知暗殿']={'主线未知暗殿',{0xd19f06,"1|8|0xe3b005,122|4|0xd40302,48|29|0x33dc00,65|30|0x33dd00",95,1,174,233,278}},
	['任务栏主线未知暗殿2']={'任务栏主线未知暗殿2',{0xfbc901,"-22|6|0xf5c206,-22|-1|0xf4c105,27|4|0xfcca01,40|2|0xf6c504,101|5|0xdd0a09",95,4,173,233,349}},
	['英雄试炼任务完成']={'英雄试炼任务完成',{0xd3a006,"48|2|0xfdca01,88|0|0xebba04,112|-4|0xf8c601,122|3|0x32cf04,137|3|0x26cb07",95,3,176,234,277}},
	
	['没血了']={'没血了',{0xdd0b0b,"2|-23|0xebd514,14|-26|0xe6a506",95,555,558,782,623}},
	['包裹商店随机石']={'包裹商店随机石',{0x7b1809,"-238|-7|0x8f718d,-227|6|0xe35ca8",95,792,180,1196,535}},
	['包裹关闭按钮']={'包裹关闭按钮',{0xfac800,"-7|-2|0xa31b0a,8|-2|0xa0190a",95,724,23,772,78}},
	
	['右上角地图']={'右上角地图',{0x492e15,"0|-8|0x472001,-10|-9|0x401d01",95,1175,10,1240,81}},
	['世界地图']={'世界地图',{0x7f6f65,"-16|6|0x826e6a,-7|-9|0x977a49",95,22,188,137,236}},
	['赤月神殿']={'赤月神殿',{0x776d42,"-13|6|0x4c261a,-1|-7|0xfaf1b4",95,367,136,500,219}},
	['被杀了']={'被杀了',{0xb68881,"-25|-2|0xa73d2d,11|-6|0x884537",95,695,449,818,499}}
}

data['设置']={
	['底部菜单角色']={'底部菜单角色',{0x8e200b,"-3|-16|0xe8d65a,18|12|0xdcdab5",95,233,648,302,733}},
	['左侧内功菜单']={'左侧内功菜单',{0xf7f7bf,"-8|10|0xe6e3b5,-11|23|0x533521",95,81,300,128,384}},
	['升级内功']={'升级内功',{0x81543e,"-17|-7|0x865032,21|-7|0x621d0a",95,939,360,1077,428}},
	['关闭内功界面']={'关闭内功界面',{0xfecf00,"-8|-3|0xa31a0a,-3|-9|0xc2220a",95,1168,27,1206,62}},
	['底部神翼菜单']={'底部神翼菜单',{0x954512,"22|4|0x3a1a0c,10|11|0xdfddb9",95,503,657,569,726}},
	['自动培养']={'自动培养',{0xece5b8,"38|4|0xe6ddad,66|6|0xfcfbc8",95,1003,641,1120,693}},
	['底部成就菜单']={'底部成就菜单',{0xb78d29,"-12|9|0x734618,0|20|0xd3d1af",95,754,654,826,728}},
	['成就可领取']={'成就可领取',{0x71481b,"59|-2|0xb0270f,62|-7|0xffc33f",95,283,60,432,698}},
	['领取成就']={'领取成就',{0xe7ddb0,"8|-5|0xf3edbe,-13|-4|0x691b0a",95,1023,87,1170,155}},
--	['成就升级']={'成就升级',{0x63543f,"-7|4|0x5e3d23,-15|-19|0xcd1603",95,68,242,133,392}},
	['成就领取完了']={'成就领取完了',{0x992a1a,"-13|-20|0x8b6e29,-10|-10|0xc1300e",95,73,82,121,160}},
	['升级勋章']={'升级勋章',{0xffffcc,"16|-10|0x6a240a,39|4|0x7f4b39",95,387,625,499,670}},
	
	['自动召唤神兽']={'自动召唤神兽',{0xa40909,"9|3|0x6b0910,-28|1|0x955200",95,933,225,1054,292}},
	['生命保护50']={'生命保护50',{0x975400,"-6|8|0x743700,10|6|0x925105",95,450,189,494,244}},
	['回城保护5']={'回城保护5',{0xb06200,"-8|11|0x713c09,8|6|0x783b00",95,228,597,265,637}},
	['回城石']={'回城石',{0x7091b4,"-7|-15|0x6d7187,-7|-7|0x3190c6",95,783,556,843,637}},
	['随机石']={'随机石',{0xbb5693,"-9|3|0x7a5978,-12|6|0xd24894",95,451,319,553,400}},
	['左侧拾取菜单']={'左侧拾取菜单',{0x807554,"9|-10|0x756951,6|16|0x4d2d1c",95,80,207,128,298}},
	['不捡金币']={'不捡金币',{0x123d03,"46|2|0x7b4100,24|-6|0x155900",95,968,609,1072,662}},
	['左侧设置菜单']={'左侧设置菜单',{0x4c3d2a,"6|21|0xaba47d,-9|3|0x563821",95,82,328,131,418}},
	['屏蔽设置']={'屏蔽设置',{0x5e2517,"-40|-3|0x8d4300,-21|4|0x950509",95,340,190,589,610}},
	['屏蔽翅膀']={'屏蔽翅膀',{0xd4c297,"9|-1|0x6e1914,-32|0|0x8c4b00",95,338,534,488,602}},
	['屏蔽衣服']={'屏蔽衣服',{0xd4c297,"9|-1|0x6e1914,-32|0|0x8c4b00",95,996,539,1137,598}},
	['省电设置']={'省电设置',{0xd4c297,"9|-1|0x6e1914,-32|0|0x8c4b00",95,959,452,1092,504}},
	
	['左侧转生菜单']={'左侧转生菜单',{0x50301b,"-2|12|0xa89f77,-2|22|0x978e66",95,85,411,131,490}},
	['获取转生修为']={'获取转生修为',{0xf5f3c1,"4|0|0xe1d8aa,-1|12|0xf3efbf,19|-2|0x751d01",95,902,672,1037,708}},
	['兑换修为']={'兑换修为',{0xe1d8aa,"-8|2|0xe6ddaf,-5|7|0xefe9ba,-3|4|0x85220d",95,927,363,959,400}},
	['转生']={'转生',{0xe6daaa,"0|10|0x5d1809,1|15|0xffffcc,14|13|0xe9e1b0,24|6|0xa22d10",95,615,644,716,686}},
	
	['左侧技能菜单']={'左侧技能菜单',{0xafa87d,"11|-4|0xd5d09b,6|-10|0x4f331e",95,84,197,124,278}},
	['快捷设置']={'快捷设置',{0xf9f6c4,"-26|2|0xf4efbb,-15|-4|0x75361e,-26|-6|0xf1ecba",95,971,644,1046,687}},
	['快捷物品']={'快捷物品',{0x9b724e,"-13|-3|0xb2916b,13|-7|0xf5f5c2,2|-11|0xb13d10",95,417,638,486,689}},
	['快捷物品酒']={'快捷物品酒',{0x84843f,"0|6|0x595d1b,-1|2|0x787735,7|-1|0x3f3e14",95,168,97,516,601}},
	
	
}

data['建号']={
	['注册按钮']={'注册按钮',{0x37b264,"6|-2|0x6eb186,0|-6|0xe7e7e7,3|5|0xe6e6e6",95,891,489,941,517}},
	['注册页']={'注册页',{0x262525,"14|-8|0x000000,15|7|0x000000,33|3|0x000000",95,790,134,866,166}},
	['注册页2']={'注册页2',{0x262525,"14|-8|0x000000,15|7|0x000000,33|3|0x000000",95,790,134,866,166}},
	['注册页输入密码']={'注册页输入密码',{0x000000,"20|-4|0x020202,34|-4|0x1e1e1e,27|-11|0xefeef1",95,779,92,868,120}},
	['粘贴提示']={'粘贴提示',{0xffffff,"-3|20|0x2a2a2a,7|23|0x2a2a2a,2|28|0x2a2a2a",95,428,229,572,298}},
	['密码已输入']={'密码已输入',{0x000000,"-1|-6|0x000000",95,456,294,602,349}},
	['注册号账号进入']={'注册号账号进入',{0xfdfefd,"-15|3|0x31b960",95,628,514,668,541}}
}

data['奖励']={
	['精彩活动']={'精彩活动',{0x03bff7,"-9|-8|0xfae55c,5|11|0x815009,1|25|0xd7c677,15|30|0x967841",95,1045,167,1329,281}},
	['全民礼包']={'全民礼包',{0xd8d388,"-8|7|0xe0d290,8|6|0xe1de91,0|8|0xdfdf8f,1|19|0xc9c27c,-15|7|0x6c461d",95,143,266,431,608}},
	['领取全民礼包']={'领取全民礼包',{0xd5d1b7,"-19|-9|0xd8caa8,-23|4|0x965c1a,25|-7|0x9c6f22",95,466,237,947,329}},
	['关闭精彩活动']={'关闭精彩活动',{0xffd100,"-11|-1|0x9f190a,-2|-10|0xd12d09,7|-3|0xa3190a",95,1164,28,1202,64}}
	
}




return data