
local data={}

data["bac"] ={
	['主线石墓']={0xfcc900,"19|2|0xf6c400,74|-5|0xfecb00,79|0|0xfdca00,102|1|0xd90100",95,8,154,163,180},
	['前往沙城']={0xf1bf06,"18|-1|0xfcc901,40|4|0xeebc04,60|3|0xfcc901,102|3|0xda0202",95,9,155,146,176}
}

data["登录"] = {
	['登录账号']={'登录账号',{0x45d879,"29|19|0xffffff",95,0,0,639,1135}},
	['登录公告']={'登录公告',{0xf2eae2,"12|0|0xaa3421",95,532,484,600,528}},
	['登录游戏']={'登录游戏',{0xa93722,"43|-1|0xf5cf74",95,528,463,629,503}},
	['选择角色']={'选择角色',{0xf8f69e,"8|-4|0x7b2210",95,930,553,1022,594}},
	['已登录']={'已登录',{0xcfc43d,"-1|-1|0xccc440",95,10,0,76,27}},
	['移动浮层']={'移动浮层',{0xf72e2e,"10|0|0xf72e2e",95,754,22,794,68}}
}

data["主线"]={
	["开始游戏"]={'开始游戏',{0xf1e5b2,"12|4|0x971312",95,574,444,630,478}},
	['完成任务']={'完成任务',{0xe6ddcf,"-8|2|0xe3dcce,-8|-5|0xb08420",95,133,526,174,568}},
	['任务栏完成']={'任务栏完成',{0x34dc03,"10|0|0x32db01,41|0|0x2ed508",95,90,153,194,328}},
	['装备']={'装备',{0xbdb286,"-5|3|0xf7f6c2,4|-6|0x8f581a,-4|-9|0xeeebb8",95,787,503,836,547}},
	['任务栏未完成']={'任务栏未完成',{0xfdca00,"102|0|0xce0302,114|-1|0xdf0201",95,4,149,192,209}},
	['冲级大礼包']={'冲级大礼包',{0x8c581b,"-13|2|0xded69b",95,539,387,612,423}},
	['主线回收装备']={'主线回收装备',{0xe3d26a,"0|-32|0xe6e5e4,0|-22|0x2d1e19",95,906,433,973,512}},
	['主线回收装备2']={'主线回收装备2',{0xf3f2f2,"0|5|0xeae8e8,47|0|0xdbbb55,75|4|0x68360f",95,756,504,985,543}},
	['除魔完成']={'除魔完成',{0x28cc05,"-5|-1|0xe1b60a,15|0|0x27cf04,35|2|0x2dc805",95,79,147,180,334}},
	['除魔领奖']={'除魔领奖',{0xf0eae9,"5|-6|0x92361f,12|1|0xe4d6d4",95,143,344,254,412}},
	['主线召唤战神']={'主线召唤战神',{0xf4f3f3,"-10|1|0xf6f6f6,5|3|0x392925,108|20|0xf7e9c7",95,749,20,934,63}},
	['除魔刷新']={'除魔刷新',{0xdcd5c8,"-12|-3|0xb4873c,-1|-3|0xc9c1b3",95,150,400,208,435}},
	['除魔接任务']={'除魔接任务',{0xdad3c1,"-6|2|0xaf8328,12|-4|0xd9d3c2",95,120,528,171,565}},
	['除魔进行中']={'除魔进行中',{0xfcca01,"-17|2|0xf4c302,26|3|0xedbb02,5|25|0xdbdba9,-12|24|0xddddaa",95,5,151,97,334}},
	['主线强化']={'主线强化',{0xe8e7e6,"-1|2|0xb5afae,-5|-7|0x3c2f2c",95,828,146,855,174}},
	['主线强化step2']={'主线强化step2',{0xecebb8,"-5|4|0xf2efbe,-9|7|0x7c4815",95,354,540,388,570}},
	['主线个人boss']={'主线个人boss',{0xf9f8c4,"8|2|0x885018,3|-2|0xc0b486",95,899,555,935,579}},
	['主线个人boss领奖']={'主线个人boss领奖',{0xfaf6c3,"-3|-2|0xfdfcca,8|2|0x663510",95,76,288,103,339}},
	['主线个人boss退出']={'主线个人boss退出',{0xfefecb,"-5|-3|0xcdcd9a,1|-8|0x976419",95,100,298,119,331}},
	['主线等级限制']={'主线等级限制',{0xecbb03,"2|6|0xeebc02,10|5|0xc50705,33|3|0xcb0907,68|8|0xeb0101",95,106,157,185,175}},
	['主线称号']={'主线称号',{0x501b0d,"-10|-3|0x52250b,-4|18|0x892610",100,534,257,631,358}},
	['主线未知暗殿']={'主线未知暗殿',{0xf3f1ed,"25|0|0xe8e4db,44|1|0xfdfdfc,62|1|0xfbf9f5",95,110,529,229,569}}
}

data['挂机']={
	["未知暗殿boss刷新1"]={"未知暗殿boss刷新1",{0x64da00,"9|-4|0x64da00,25|0|0x64da00,36|2|0x64da00",95,806,37,908,67}},
	['未知暗殿boss刷新2']={"未知暗殿boss刷新2",{0x64da00,"9|-4|0x64da00,25|0|0x64da00,36|2|0x64da00",95,799,68,901,90}},
	['召唤战神']={'挂机召唤战神',{0xf4e2bb,"3|7|0xdda63f,6|-8|0xbea828,11|1|0xbb4a11,15|5|0xd1c373",95,812,6,1073,151}}
}

data["回收装备"]={
	["全部回收"]={'全部回收',{0x78613d,"-12|0|0xf4f2c0",95,911,510,966,536}},
	['关闭回收']={'关闭回收',{0xffb102,"-5|1|0x6d3b10",95,621,27,650,54}}
}

data['召唤战神']={
	['点击召唤战神']={'点击召唤战神',{0xeeeeee,"23|-6|0xfefefd,34|-2|0xfffefe,43|-11|0xbc882a",95,528,519,613,559}},
	['关闭召唤战神']={'关闭召唤战神',{0xf6e32b,"2|10|0xdabb2d,-14|9|0x3b0908",95,348,156,405,542}}
}

data['升级内功']={
	['打开底部菜单']={'打开底部菜单',{0xc6bb96,"-6|6|0xa09d84,-556|50|0x745a2e",95,6,537,591,604}},
	['打开角色']={'打开角色',{0xab8a42,"9|5|0xe4cd9a",95,208,557,255,610}},
	['内功']={'内功',{0x2e2518,"5|2|0xf2f1c2",95,72,278,107,341}},
	['一键提升']={'一键提升',{0x8b5418,"8|2|0xfffecb",95,832,322,900,354}},
	['关闭角色']={'关闭角色',{0xffb103,"-5|1|0x6d3a10",95,986,21,1022,56}}
}


data['称号']={
	['装备菜单']={'装备菜单',{0x874b0b,"1|-9|0xdbaf4f,-6|-6|0x5e2403",95,364,563,397,594}},
	['称号']={'称号',{0x6e1509,"3|8|0x993311,-1|-5|0x893009",95,280,466,308,501}},
	['提升称号']={'提升称号',{0xcec390,"1|1|0xe0daaa,13|3|0x935c1b",95,542,539,592,570}}
}

data['合成']={
	['合成']={}
}

data['离线奖励']={
	['离线奖励'] ={'离线奖励',{0xf3f1bd,"0|6|0xf4f2c0,8|-4|0x8d5e15,31|13|0xe9e5b3",95,517,544,570,579}},
	['关闭提示']={'关闭提示',{0x755b2d,"6|2|0xece7b1,18|-1|0x915a1a,11|7|0xf7f3bd",95,521,417,583,464}}
}

data['除魔12']={
	['除魔可接']={'除魔可接',{0xffcc00,"5|0|0xfac802,22|-8|0xfac802,43|0|0xf2bf02,57|-3|0xf9c802,102|-1|0xf4c206",95,9,147,184,334}},
	['除魔滑动']={'除魔滑动',{0xcfcb9e,"10|3|0xfaf8c3,27|5|0xffffcc,17|-2|0xb37112",95,3,113,74,146}}
}

data['通天塔']={
	['通天塔可接']={'通天塔可接',{0xf1bf06,"13|-2|0xfcca00,39|-3|0xfcca01,59|-5|0xfecc00,76|-1|0xfbc901,14|21|0xdcdca8",95,3,150,137,335}},
	['通天塔界面']={'通天塔界面',{0xa6a67e,"12|9|0x897e67,29|10|0x65654e,48|6|0x868664,55|11|0xc8c89c,28|-4|0x4e2504",95,1027,8,1110,39}},
	['进入通天塔']={'进入通天塔',{0xddd4a3,"-3|11|0xc6b580,27|4|0xd9d09c,30|10|0x281b03,56|13|0xbfae79,44|7|0xc08210",95,124,9,257,48}},
	['通天塔领取经验']={'通天塔领取经验',{0xeedd88,"10|-5|0xe8d685,19|-11|0xd4c073,42|4|0xccbd70,27|-13|0x936625",95,338,230,541,276}},
	['不在左边了']={'不在左边了',{0x12140d,"9|1|0x535a49,13|-4|0x0e1104,16|-3|0x4a4c3d,-4|10|0x15190c,6|15|0x343925",100,883,206,1134,406}},
	['自动战斗']={'自动战斗',{0xcfc093,"-22|-23|0xcac78d,0|-15|0x977f55,9|-13|0x302518,-10|-15|0xa2875f",95,1049,241,1131,395}}
	
}

data['膜拜城主']={
	['膜拜城主']={'膜拜城主',{0xdbd5c7,"-1|3|0xe4dfd5,24|-5|0xe3dfd3,39|-1|0xd7d0c1,49|-4|0xd2cbba,31|-10|0xc09d2c",95,109,487,262,534}}
}











return data