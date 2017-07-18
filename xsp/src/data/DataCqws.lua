require "utils/Mapping"
require "utils/util"
local data = require "data/Data_ws"

local Dao = {}


function Dao:test()
	local pages={
	 {data['test']['test1'],{302,311},s="flush",bas=800},--左移一段距离
	 {data['test']['test2'],nil,a="searchTap",self.召唤战神,bas=800,so="flush",son=2,sc={"flush"},one=true,dao=self}	--召唤战神
  }
  mapping({
		["pages"]=pages
	})
end

function Dao:new()
  local index  = {}
  setmetatable(index,{__index = self})
  return index
end
 
 function Dao:移动浮层()
  local pages={
   {data["登录"]["移动浮层"],{775,44,775,617},a="swip","finish",co=true}
  }
  mapping({
		["pages"]=pages,
		["invalidCheckTimes"]=5	--5次没有检测到这个界面，就结束这个索引
	})
end
 
function Dao:登录()
  local pages={
    {data["登录"]["登录账号"],{451,390}},
		{data['登录']['登录公告'],{569,505}},
		{data['登录']['登录游戏'],{570,486}},
		{data['登录']['选择角色'],{978,575},p="进入游戏","finish",so="login"},--进入游戏
		{data["登录"]["已登录"],nil,"finish"},
		{data['离线奖励']['离线奖励'],nil,"finish"}
  }
	if role==1 then
		table.insert(pages,{data['登录']['选择角色'],{962,128},s="login"})--选择角色1
	elseif role==2 then
		table.insert(pages,{data['登录']['选择角色'],{962,229},s="login"})--选择角色1
	elseif role==3 then
		table.insert(pages,{data['登录']['选择角色'],{962,334},s="login"})--选择角色1
	else 
		table.insert(pages,{data['登录']['选择角色'],{962,444},s="login"})--选择角色1
	end
  mapping({
		["pages"]=pages,
		["indexDelay"]=1000
	})
end

function Dao:主线()
  local pages={
		{data['离线奖励']['离线奖励'],{1043,37}},
		{data['离线奖励']['关闭提示'],nil,a="searchTap"},
    {data["主线"]["开始游戏"],{623,455}},
		{data['主线']['完成任务'],{187,548}},
		{data['主线']['任务栏完成'],nil,a="searchTap"},
		{data['主线']['装备'],nil,a="searchTap","sleep",500},
		{data['主线']['任务栏未完成'],{110,170},"sleep",1000,bac={data["bac"]["主线石墓"],data['bac']['前往沙城']}},
		{data['主线']['冲级大礼包'],{569,404},"sleep",1000},
		{data['主线']['主线回收装备'],nil,self.回收装备全,dao=self},
		{data['主线']['主线回收装备2'],nil,self.回收装备全,dao=self},
		{data['主线']['除魔刷新'],{188,416},s="flush"},
		{data['主线']['除魔接任务'],{188,548},so="flush",son=5},	--除魔刷新5次之后执行除魔接任务
		{data['主线']['除魔完成'],nil,a="searchTap"},
		{data['主线']['除魔领奖'],nil,a="searchTap",ci=true,cifunc=self.免费除魔领奖,sc={"flush"},dao=self},
		{data['主线']['主线召唤战神'],{906,42},self.召唤战神,dao=self},
		{data['主线']['主线强化'],{964,171},"sleep",500},
		{data['主线']['主线强化step2'],nil,a="searchTap",s="up"},
		{data['主线']['主线强化step2'],{1008,41},so="up",son=3,sc={"up"},"sleep",500},
		{data['主线']['主线个人boss'],nil,a="searchTap","sleep",500},
		{data['主线']['主线个人boss领奖'],nil,a="searchTap",bas=10000},	--bas  10秒的捡东西时间
		{data['主线']['主线个人boss退出'],nil,a="searchTap"},
		{data['主线']['主线等级限制'],nil,self.降妖除魔1,dao=self},--TODO 跳转到12次降妖除魔任务
		{data['主线']['主线升级任务限制'],nil,self.降妖除魔1,dao=self},--TODO 跳转到12次降妖除魔任务
		{data['主线']['主线称号'],nil,a="searchTap",self.升级称号,dao=self},
		{data['主线']['主线未知暗殿'],{384,321},self.升级内功,"finish",dao=self},
		{data['主线']['对话'],nil,a="searchTap"},
		{data['主线']['关闭地图'],{1029,80}}
  }
  mapping({
		["pages"]=pages
	})
end
-- 在三倍领取多次还在该页面的时候 换做领取免费奖励
function Dao:免费除魔领奖()
	tap(185,574)
end



-- ------------------------除魔  start------------------------------------
function Dao:降妖除魔12()
	for tmpi=1,12 do
			self:降妖除魔1()  
	end
end
function Dao:降妖除魔1(t)
	if type(t) =='table' then
		self = t
	end
	local pages={
			{data['主线']['除魔进行中'],nil,a="searchTap",self.降妖除魔,"finish",dao=self},
			{data['离线奖励']['离线奖励'],{1043,37}},
			{data['离线奖励']['关闭提示'],nil,a="searchTap"},
			{data['主线']['除魔刷新'],nil,self.降妖除魔,"finish",dao=self},
			{data['除魔12']['左侧栏变强'],{40,130},"sleep",800},
			{data["除魔12"]["除魔可接"],nil,a="searchTap",s="kill",self.降妖除魔,"finish",dao=self},
			{data["除魔12"]["除魔滑动"],{94,320,94,163},p="除魔上滑",a="swip",so="kill",sr=true},
			{data["除魔12"]["除魔可接"],nil,a="searchTap",s="kill",self.降妖除魔,"finish",dao=self},
			{data["除魔12"]["除魔滑动"],{94,320,94,163},p="除魔上滑",a="swip",so="kill",sr=true},
			{data["除魔12"]["除魔可接"],nil,a="searchTap",s="kill",self.降妖除魔,"finish",dao=self},
			
			{data["除魔12"]["除魔可接"],nil,a="searchTap",s="kill",self.降妖除魔,"finish",dao=self},
			{data["除魔12"]["除魔滑动"],{94,163,94,320},p="除魔下滑",a="swip",so="kill",sr=true},
			{data["除魔12"]["除魔可接"],nil,a="searchTap",s="kill",self.降妖除魔,"finish",dao=self},
			{data["除魔12"]["除魔滑动"],{94,163,94,320},p="除魔下滑",a="swip",so="kill",sr=true},
			{data["除魔12"]["除魔可接"],nil,a="searchTap",s="kill",self.降妖除魔,"finish",dao=self}
			}
		mapping({
			["pages"]=pages,
			["runCount"]=5	--如果一直停留在这个界面，超过5次，就结束这个索引
		})
end
function Dao:降妖除魔(t)
	if type(t) =='table' then
		self = t
	end

  local pages={
		{data['主线']['除魔刷新'],{188,416},s="flush"},
		{data['主线']['除魔接任务'],{188,548},"sleep",5000,s="up",so="flush",sc={"flush"},son=5},	--除魔刷新5次之后执行除魔接任务
		{data['挂机']['召唤战神'],nil,a="searchTap",self.召唤战神,so="up",sc={"up"},one=true,dao=self},	--召唤战神
		{data['主线']['除魔完成'],nil,a="searchTap"},
		{data['主线']['除魔领奖'],nil,a="searchTap",ci=true,cifunc=self.免费除魔领奖,sc={"flush"},"finish",dao=self},
		{data['主线']['除魔进行中'],nil,a="searchTap","sleep",3000}	--3s点击一次
		}
  mapping({
		["pages"]=pages
	})
end
-- ------------------------除魔  end------------------------------------

-- ------------------------通天塔  start------------------------------------
function Dao:通天塔2次()
	for tmpi=1,2 do
			self:通天塔1次()
			sleep("通天塔两次间隔",3500)--领奖这里总是很卡
	end
end
function Dao:通天塔1次(t)
	if type(t) =='table' then
		self = t
	end
	local pages={
			{data['通天塔']['通天塔界面'],nil,self.通天塔,"finish",dao=self},
			{data['离线奖励']['离线奖励'],{1043,37}},
			{data['离线奖励']['关闭提示'],nil,a="searchTap"},
			{data['通天塔']['进入通天塔'],nil,self.通天塔,"finish",dao=self},
			{data['除魔12']['左侧栏变强'],{40,130},"sleep",800},
			{data["通天塔"]["通天塔可接"],nil,a="searchTap",s="kill",self.通天塔,bas=500,"finish",dao=self},
			{data["除魔12"]["除魔滑动"],{94,320,94,163},p="除魔上滑",a="swip",so="kill",sr=true},
			{data["通天塔"]["通天塔可接"],nil,a="searchTap",s="kill",self.通天塔,bas=500,"finish",dao=self},
			{data["除魔12"]["除魔滑动"],{94,320,94,163},p="除魔上滑",a="swip",so="kill",sr=true},
			{data["通天塔"]["通天塔可接"],nil,a="searchTap",s="kill",self.通天塔,bas=500,"finish",dao=self},
			{data["除魔12"]["除魔滑动"],{94,163,94,320},p="除魔下滑",a="swip",so="kill",sr=true},
			{data["通天塔"]["通天塔可接"],nil,a="searchTap",s="kill",self.通天塔,bas=500,"finish",dao=self},
			{data["除魔12"]["除魔滑动"],{94,163,94,320},p="除魔下滑",a="swip",so="kill",sr=true},
			{data["通天塔"]["通天塔可接"],nil,a="searchTap",s="kill",self.通天塔,bas=500,"finish",dao=self}
			}
		mapping({
			["pages"]=pages,
			["runCount"]=5	--如果一直停留在这个界面，超过5次，就结束这个索引
		})
end
function Dao:通天塔(t)
	if type(t) =='table' then
		self = t
	end
  local pages={
		{data['通天塔']['进入通天塔'],{190,548},"sleep",1000},
		{data['通天塔']['通天塔界面'],{302,311},s="flush",bas=800,one=true},--左移一段距离
		{data['挂机']['召唤战神'],nil,a="searchTap",self.召唤战神,bas=800,so="flush",sc={"flush"},one=true,dao=self},	--召唤战神
		{data['通天塔']['通天塔领取经验'],nil,a="searchTap","finish"},
		{data['通天塔']['不在左边了'],{442,312},s="left"},
		{data['通天塔']['自动战斗'],nil,a="searchTap",so="left",sc={"left"}},
		{data['通天塔']['没血了'],nil,a="searchTap",self.买血,dao=self}
		}
  mapping({
		["pages"]=pages
	})
end

--配置 data['通天塔']['没血了'] 进行操作
function Dao:买血(t)
		if type(t) =='table' then
		self = t
	end
	local pages={
			{data['通天塔']['包裹商店随机石'],{0,-93},a="searchTap",s="up","sleep",200},	--买随机石上面的药
			{data['通天塔']['包裹关闭按钮'],nil,a="searchTap",so="up",son=3,"finish"}	--买3瓶药关闭包裹
			}
		mapping({
			["pages"]=pages,
			["indexDelay"]=5000	--买血后5秒的回血时间
		})
end

-- ------------------------通天塔  end------------------------------------

-- ------------------------主动回收装备  start------------------------------------

function Dao:主动回收装备(t)
	if type(t) =='table' then
		self = t
	end
	local pages={
			{data["回收装备"]["全部回收"],nil,self.回收装备全,"finish",dao=self},
			{data['离线奖励']['离线奖励'],{1043,37}},
			{data['离线奖励']['关闭提示'],nil,a="searchTap"},
			{data["除魔12"]["除魔滑动"],{117,130},"sleep",800},
			{data["除魔12"]["左侧回收装备"],nil,a="searchTap",s="kill",self.回收装备全,"finish",dao=self},
			{data['除魔12']['左侧栏变强'],{94,320,94,163},p="回收上滑",a="swip",so="kill",sr=true},
			{data["除魔12"]["左侧回收装备"],nil,a="searchTap",s="kill",self.回收装备全,"finish",dao=self},
			{data['除魔12']['左侧栏变强'],{94,320,94,163},p="回收上滑",a="swip",so="kill",sr=true},
			{data["除魔12"]["左侧回收装备"],nil,a="searchTap",s="kill",self.回收装备全,"finish",dao=self},
			{data['主线']['关闭地图'],{1029,80}}
			}
		mapping({
			["pages"]=pages
		})
end


function Dao:领取回收奖励(t)
	if type(t) =='table' then
		self = t
	end
	local pages={
				{data['每日必做']['每日必做'],nil,a="searchTap","sleep",500},
				{data['每日必做']['每日回收'],nil,a="searchTap"},
				{data['每日必做']['每日回收经验丹'],nil,self.领取回收经验丹,dao=self,"finish"}
			}
		mapping({
			["pages"]=pages
		})
end
--领取必做奖励
function Dao:领取回收经验丹(t)
		tap(691,484)
		sleep('领取经验丹',300)
		tap(570,484)
		sleep('领取经验丹',300)
		tap(448,484)
		sleep('领取经验丹',300)
		tap(324,484)
		sleep('领取经验丹',300)
		tap(813,484)
		sleep('领取经验丹',300)
		tap(813,484)
		sleep('领取经验丹',300)
		tap(1010,42)--关闭菜单
end
-- ------------------------主动回收装备  end------------------------------------


-- ------------------------膜拜城主  start------------------------------------

function Dao:每日必做_膜拜城主(t)
		if type(t) =='table' then
		self = t
	end
	local pages={
			{data['每日必做']['每日必做'],nil,a="searchTap","sleep",500},
--			{data['每日必做']['膜拜城主已完成'],{1010,41},"finish"},
			{data['每日必做']['膜拜城主'],nil,a="searchTap",self.膜拜城主,dao=self,"finish"}
			}
		mapping({
			["pages"]=pages
		})
end

function Dao:膜拜城主(t)
if type(t) =='table' then
		self = t
	end
	local pages={
			{data['膜拜城主']['膜拜城主'],nil,a="searchTap",s="up"},
			{data['膜拜城主']['膜拜城主'],{389,322},so="up","finish"}
			}
		mapping({
			["pages"]=pages
		})
end
-- ------------------------膜拜城主  end------------------------------------


-- ------------------------个人BOSS  start------------------------------------
function Dao:个人BOSS_赤月(t)
	if type(t) =='table' then
		self = t
	end
	local pages={
			{data['个人BOSS']['个人BOSS'],nil,a="searchTap","sleep",1500},
			{data['个人BOSS']['个人BOSS左菜单'],nil,a="searchTap","sleep",500},
			{data['个人BOSS']['赤月恶魔'],nil,a="searchTap",s="up","sleep",1000},
			{data['个人BOSS']['挑战条件不足'],{1010,42},"finish"},
			{data['个人BOSS']['挑战BOSS'],nil,a="searchTap",self.挑战BOSS,"finish",dao=self,so="up",sc={"up"}}
			}
		mapping({
			["pages"]=pages
		})
end

function Dao:个人BOSS_祖玛(t)
	if type(t) =='table' then
		self = t
	end
	local pages={
			{data['个人BOSS']['个人BOSS'],nil,a="searchTap","sleep",1500},
			{data['个人BOSS']['个人BOSS左菜单'],nil,a="searchTap","sleep",500},
			{data['个人BOSS']['祖玛教主'],nil,a="searchTap",s="up","sleep",1000},
			{data['个人BOSS']['挑战条件不足'],{1010,42},"finish"},
			{data['个人BOSS']['挑战BOSS'],nil,a="searchTap",self.挑战BOSS,"finish",dao=self,so="up",sc={"up"}}
			}
		mapping({
			["pages"]=pages
		})
end
function Dao:个人BOSS_牛魔(t)
	if type(t) =='table' then
		self = t
	end
	local pages={
			{data['个人BOSS']['个人BOSS'],nil,a="searchTap","sleep",1500},
			{data['个人BOSS']['个人BOSS左菜单'],nil,a="searchTap","sleep",500},
			{data['个人BOSS']['牛魔王'],nil,a="searchTap",s="up","sleep",1000},
			{data['个人BOSS']['挑战条件不足'],{1010,42},"finish"},
			{data['个人BOSS']['挑战BOSS'],nil,a="searchTap",self.挑战BOSS,"finish",dao=self,so="up",sc={"up"}}
			}
		mapping({
			["pages"]=pages
		})
end
function Dao:个人BOSS_魔龙(t)
	if type(t) =='table' then
		self = t
	end
	local pages={
			{data['个人BOSS']['个人BOSS'],nil,a="searchTap","sleep",1500},
			{data['个人BOSS']['个人BOSS左菜单'],nil,a="searchTap","sleep",500},
			{data['个人BOSS']['魔龙教主'],nil,a="searchTap",s="up","sleep",1000},
			{data['个人BOSS']['挑战条件不足'],{1010,42},"finish"},
			{data['个人BOSS']['挑战BOSS'],nil,a="searchTap",self.挑战BOSS,"finish",dao=self,so="up",sc={"up"}}
			}
		mapping({
			["pages"]=pages
		})
end
function Dao:个人BOSS_火龙(t)
	if type(t) =='table' then
		self = t
	end
	local pages={
			{data['个人BOSS']['个人BOSS'],nil,a="searchTap","sleep",1500},
			{data['个人BOSS']['个人BOSS左菜单'],nil,a="searchTap","sleep",500},
			{data['个人BOSS']['火龙'],nil,a="searchTap",s="up","sleep",1000},
			{data['个人BOSS']['挑战条件不足'],{1010,42},"finish"},
			{data['个人BOSS']['挑战BOSS'],nil,a="searchTap",self.挑战BOSS,"finish",dao=self,so="up",sc={"up"}}
			}
		mapping({
			["pages"]=pages
		})
end

function Dao:挑战BOSS(t)
	if type(t) =='table' then
		self = t
	end
	local pages={
			{data['通天塔']['自动战斗'],nil,a="searchTap","sleep",1500,s="click"},
			{data['个人BOSS']['召唤战神'],nil,a="searchTap",self.召唤战神,bas=1800,one=true,so="click",sc={"click"},dao=self},	--召唤战神
			{data['主线']['主线个人boss领奖'],nil,a="searchTap",bas=14000,s="up"},	--bas  10秒的捡东西时间
			{data['主线']['主线个人boss退出'],nil,a="searchTap","finish",so="up",sc={'up'}},
			{data['通天塔']['没血了'],nil,a="searchTap",self.买血}
			}
		mapping({
			["pages"]=pages
		})
end
-- ------------------------个人BOSS  end------------------------------------


-- ------------------------领取日常奖励  start------------------------------------
function Dao:每日必做_领取奖励(t)
		if type(t) =='table' then
		self = t
	end
	local pages={
			{data['每日必做']['每日必做'],nil,a="searchTap","sleep",500},
			{data['每日必做']['领取必做奖励'],nil,self.领取必做奖励,dao=self,"finish"}
			}
		mapping({
			["pages"]=pages,
			["runCount"]=5	--如果一直停留在这个界面，超过3次，就结束这个索引
		})
end
--领取必做奖励
function Dao:领取必做奖励(t)
		tap(716,484)
		sleep('领取奖励',300)
		tap(570,484)
		sleep('领取奖励',300)
		tap(423,484)
		sleep('领取奖励',300)
		tap(279,484)
		sleep('领取奖励',300)
		tap(864,484)
		sleep('领取奖励',300)
		tap(864,484)
		sleep('领取奖励',300)
		tap(1010,42)--关闭菜单
end
-- ------------------------领取日常奖励  end------------------------------------

-- ------------------------未知暗殿刷怪  end------------------------------------

function Dao:进入未知暗殿(t)
	if type(t) =='table' then
		self = t
	end
  local pages={
		{data["挂机"]["未知暗殿召唤战神"],nil,"finish"},	--说明已经在未知暗殿了
    {data['每日必做']['每日必做'],nil,a="searchTap","sleep",500},
		{data['每日必做']['每日回收'],nil,a="searchTap"},
		{data['挂机']['经验回收进入未知暗殿'],nil,a="searchTap"},
		{data['主线']['主线未知暗殿'],nil,a="searchTap","finish"}
  }
  mapping({
		["pages"]=pages
	})
end

function Dao:未知暗殿召唤战神(t)
	if type(t) =='table' then
		self = t
	end
  local pages={
    {data["挂机"]["未知暗殿召唤战神"],nil,a="searchTap",self.召唤战神,dao=self,"finish"}
  }
  mapping({
		["pages"]=pages,
		["runCount"]=5	--如果一直停留在这个界面，超过3次，就结束这个索引
	})
end

function Dao:未知暗殿刷怪(num)
  local pages={
		--合成装备
		{data["升级内功"]["打开底部菜单"],{567,567},"sleep",500},
		{data['合成']['底部装备菜单'],nil,a="searchTap",so="menu",sr=true,"sleep",500},
		{data['合成']['底部合成菜单'],nil,a="searchTap",s="menu","sleep",1500},
		{data['合成']['合成装备手镯'],nil,a="searchTap"},
		{data['合成']['合成按钮'],nil,a="searchTap",one=true,s="btn","sleep",1000},
		{data['合成']['合成70级装备'],nil,a="searchTap",one=true,so="btn",onec={"合成按钮"}},
		{data['合成']['合成关闭'],nil,a="searchTap",so="btn",son=2,onec={"合成70级装备","合成按钮"},"sleep",2000},
		{data['通天塔']['没血了'],nil,a="searchTap",self.买血},
		{data['通天塔']['自动战斗'],nil,a="searchTap"},
	}
	if num==1 then
		table.insert(pages,{data["挂机"]["未知暗殿boss刷新1"],nil,"sleep",40000,a="searchTap",sc={"btn","menu"}})
	elseif num==2 then
		table.insert(pages,{data["挂机"]["未知暗殿boss刷新2"],nil,"sleep",40000,a="searchTap",sc={"btn","menu"}})
	end
  mapping({
		["pages"]=pages
	})
end
-- ------------------------未知暗殿刷怪  end------------------------------------


function Dao:召唤战神(t)
	if type(t) =='table' then
		self = t
	end
  local pages={
    {data["召唤战神"]["点击召唤战神"],{587,541},"sleep",200},
		{data["召唤战神"]['关闭召唤战神'],{1019,82},"finish"}
  }
  mapping({
		["pages"]=pages
	})
end

function Dao:回收装备全()
  local pages={
    {data["回收装备"]["全部回收"],{935,527},s="back","sleep",800},
		{data["回收装备"]['关闭回收'],nil,a="searchTap",so="back","finish"}
  }
  mapping({
		["pages"]=pages
	})
end

function Dao:升级内功()
  local pages={
    {data["升级内功"]["打开底部菜单"],{567,567},"sleep",500,one=true},
		{data["升级内功"]["打开角色"],{229,582},"sleep",500},
		{data['升级内功']['内功'],{89,311}},
		{data['升级内功']['一键提升'],{857,339},s="up",one=true},
		{data['升级内功']['关闭角色'],nil,a="searchTap",so="up","finish"}
  }
  mapping({
		["pages"]=pages
	})
end

function Dao:升级称号()
  local pages={
    {data["升级内功"]["打开底部菜单"],{567,567},"sleep",500,one=true},
		{data["称号"]["称号"],nil,a="searchTap","sleep",500,one=true},
		{data['称号']['装备菜单'],nil,a="searchTap",one=true},
		{data['称号']['提升称号'],nil,"sleep",500,a="searchTap",s="up"},
		{data['称号']['提升称号'],{827,40},so="up","finish"}
		}
  mapping({
		["pages"]=pages
	})
end






return Dao:new()

