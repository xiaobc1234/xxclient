require "utils/Mapping"
require "utils/util"
local data = require "data/iphone6/Data_ws"

local Dao = {}

function Dao:new()
  local index  = {}
  setmetatable(index,{__index = self})
  return index
end


 function Dao:移动浮层()
  local pages={
   {data["登录"]["移动浮层"],{872,49,872,691},a="swip","finish",co=true}
  }
  mapping({
		["pages"]=pages,
		["invalidCheckTimes"]=5	--5次没有检测到这个界面，就结束这个索引
	})
end
 
function Dao:登录()
  local pages={
    {data["登录"]["登录账号"],nil,a="searchTap"},
--		{data['登录']['安峰公告'],nil,a="searchTap"},
--		{data['登录']['登录公告'],nil,a="searchTap"},
		{data['登录']['登录游戏'],nil,a="searchTap"},
		{data['登录']['选择角色'],nil,a="searchTap",p="进入游戏","finish",so="login"},--进入游戏
		{data["登录"]["已登录"],nil,"finish"},
		{data['离线奖励']['离线奖励'],nil,"finish"}
  }
	if role==1 then
		table.insert(pages,{data['登录']['选择角色'],{1130,151},s="login"})--选择角色1
	elseif role==2 then
		table.insert(pages,{data['登录']['选择角色'],{1130,257},s="login"})--选择角色2
	elseif role==3 then
		table.insert(pages,{data['登录']['选择角色'],{1130,388},s="login"})--选择角色3
	else 
		table.insert(pages,{data['登录']['选择角色'],{1130,526},s="login"})--选择角色4
	end
  mapping({
		["pages"]=pages,
		["indexDelay"]=1000
	})
end

function Dao:主线()
  local pages={
		{data['离线奖励']['离线奖励'],{1225,44}},
		{data['离线奖励']['关闭提示'],nil,a="searchTap"},
    {data["主线"]["开始游戏"],nil,a="searchTap"},
		{data['主线']['完成任务'],nil,a="searchTap"},
		{data['主线']['任务栏完成'],nil,a="searchTap","sleep",500},
		{data['主线']['装备'],nil,a="searchTap","sleep",500},
--		{data['主线']['任务栏未完成'],{110,170},"sleep",1000,bac={data["bac"]["主线石墓"],data['bac']['前往沙城']}},
		{data['主线']['羽翼'],{1186,44}},
		{data['主线']['PK之城'],nil,a="searchTap"},
		{data['主线']['冲级大礼包'],nil,a="searchTap","sleep",1000},
		{data['主线']['主线回收装备'],nil,self.回收装备全,dao=self},
		{data['主线']['主线回收装备2'],nil,self.回收装备全,dao=self},
		{data['主线']['除魔刷新'],nil,a="searchTap",s="flush"},
		{data['主线']['除魔接任务'],nil,a="searchTap",so="flush",son=5},	--除魔刷新5次之后执行除魔接任务
		{data['主线']['除魔完成'],nil,a="searchTap"},
		{data['主线']['除魔领奖'],nil,a="searchTap",ci=true,cifunc=self.免费除魔领奖,sc={"flush"},dao=self},
		{data['主线']['主线战神图标'],nil,a="searchTap"},
		{data['主线']['主线召唤战神'],{1068,44},self.召唤战神,dao=self},
		{data['主线']['主线强化'],{1126,198},"sleep",500},
		{data['主线']['主线强化step2'],nil,a="searchTap",s="up"},
		{data['主线']['主线强化step2'],{1185,44},so="up",son=3,sc={"up"},"sleep",500},
		{data['主线']['主线个人boss图标'],nil,a="searchTap"},
		{data['主线']['主线个人BOSS未完成'],nil,a="searchTap"},
		{data['主线']['主线个人boss'],nil,a="searchTap","sleep",500},
		{data['主线']['主线个人boss领奖'],nil,a="searchTap",bas=10000},	--bas  10秒的捡东西时间
		{data['主线']['主线个人boss退出'],nil,a="searchTap"},
		{data['主线']['主线等级限制'],nil,self.任务栏降妖除魔1,dao=self},--TODO 跳转到12次降妖除魔任务
--		{data['主线']['主线称号'],nil,a="searchTap",self.升级称号,dao=self},
		{data['主线']['主线未知暗殿'],{452,379},"finish"}
--		{data['主线']['主线未知暗殿'],{384,321},self.升级内功,"finish",dao=self}
  }
  mapping({
		["pages"]=pages
	})
end
-- 在三倍领取多次还在该页面的时候 换做领取免费奖励
function Dao:免费除魔领奖()
	tap(209,684)
end

function Dao:回收装备全()
  local pages={
    {data["回收装备"]["全部回收"],nil,a="searchTap",s="back","sleep",800},
		{data["回收装备"]['关闭回收'],nil,a="searchTap",so="back","finish"}
  }
  mapping({
		["pages"]=pages
	})
end

function Dao:召唤战神(t)
	if type(t) =='table' then
		self = t
	end
  local pages={
    {data["召唤战神"]["点击召唤战神"],nil,a="searchTap","sleep",200},
		{data["召唤战神"]['关闭召唤战神'],{1195,94},"finish"}
  }
  mapping({
		["pages"]=pages,
		["runCount"]=10	--如果一直停留在这个界面，超过10次，就结束这个索引
	})
end



-- ------------------------除魔  start------------------------------------
function Dao:降妖除魔5()
	for tmpi=1,5 do
			self:降妖除魔1()  
	end
end

function Dao:降妖除魔1(t)
	if type(t) =='table' then
		self = t
	end
	
	print('关闭每日必做='..type(关闭每日必做))
	
	local pages={
			{data['离线奖励']['离线奖励'],{1225,44}},
			{data['离线奖励']['关闭提示'],nil,a="searchTap"},
			{data['每日必做']['每日必做'],nil,a="searchTap","sleep",1000},
			{data['每日必做']['除魔'],nil,a="searchTap",self.降妖除魔,"finish",dao=self},
			{data['主线']['除魔刷新'],nil,self.降妖除魔,"finish",dao=self},
			{data['主线']['除魔进行中'],nil,self.降妖除魔,"finish",dao=self}
			}
		mapping({
			["pages"]=pages,
			["runCount"]=5,	--如果一直停留在这个界面，超过5次，就结束这个索引
			['errorNextMethod']=关闭每日必做
		})
end

function 关闭每日必做()
	tap(1187,49)
end


function Dao:任务栏降妖除魔1(t)
	if type(t) =='table' then
		self = t
	end
	local pages={
			{data['主线']['除魔进行中'],nil,a="searchTap",self.降妖除魔,"finish",dao=self},
			{data['离线奖励']['离线奖励'],{1225,44}},
			{data['离线奖励']['关闭提示'],nil,a="searchTap"},
			{data['主线']['除魔刷新'],nil,self.降妖除魔,"finish",dao=self},
--			{data['除魔12']['左侧栏变强'],{40,130},"sleep",800},
			{data["除魔"]["除魔可接"],nil,a="searchTap",s="kill",self.降妖除魔,"finish",dao=self},
			{data["除魔"]["除魔滑动"],{110,380,110,190},p="除魔上滑",a="swip",so="kill",sr=true},
			{data["除魔"]["除魔可接"],nil,a="searchTap",s="kill",self.降妖除魔,"finish",dao=self},
			{data["除魔"]["除魔滑动"],{110,380,110,190},p="除魔上滑",a="swip",so="kill",sr=true},
			{data["除魔"]["除魔可接"],nil,a="searchTap",s="kill",self.降妖除魔,"finish",dao=self},
			
			{data["除魔"]["除魔可接"],nil,a="searchTap",s="kill",self.降妖除魔,"finish",dao=self},
			{data["除魔"]["除魔滑动"],{110,190,110,380},p="除魔下滑",a="swip",so="kill",sr=true},
			{data["除魔"]["除魔可接"],nil,a="searchTap",s="kill",self.降妖除魔,"finish",dao=self},
			{data["除魔"]["除魔滑动"],{110,190,110,380},p="除魔下滑",a="swip",so="kill",sr=true},
			{data["除魔"]["除魔可接"],nil,a="searchTap",s="kill",self.降妖除魔,"finish",dao=self}
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
		{data['主线']['除魔刷新'],nil,a="searchTap",s="flush"},
		{data['主线']['除魔接任务'],nil,a="searchTap","sleep",5000,s="up",so="flush",sc={"flush"},son=5},	--除魔刷新5次之后执行除魔接任务
		{data['除魔']['召唤战神'],nil,a="searchTap",self.召唤战神,so="up",sc={"up"},one=true,dao=self},	--召唤战神
		{data['主线']['除魔完成'],nil,a="searchTap"},
		{data['主线']['除魔领奖'],nil,a="searchTap",ci=true,cifunc=self.免费除魔领奖,sc={"flush"},"finish",dao=self},
		{data['主线']['除魔进行中'],nil,a="searchTap","sleep",3000}	--3s点击一次
		}
  mapping({
		["pages"]=pages
	})
end

-- ------------------------除魔  end------------------------------------


--DONE
-- ------------------------通天塔  start------------------------------------
function Dao:通天塔2次()
	for tmpi=1,2 do
			self:通天塔1次()
			sleep("通天塔两次间隔",3000)--领奖这里总是很卡
	end
end
function Dao:通天塔1次(t)
	if type(t) =='table' then
		self = t
	end
	local pages={
			{data['离线奖励']['离线奖励'],{1225,44}},
			{data['离线奖励']['关闭提示'],nil,a="searchTap"},
			{data['通天塔']['通天塔界面'],nil,self.通天塔,"finish",dao=self},
			{data['每日必做']['每日必做'],nil,a="searchTap"},
			{data['每日必做']['通天塔'],nil,a="searchTap",self.通天塔,"finish",dao=self},
			{data['通天塔']['进入通天塔'],nil,"finish"}
			}
		mapping({
			["pages"]=pages,
			["runCount"]=5,	--如果一直停留在这个界面，超过5次，就结束这个索引
			['errorNextMethod']=关闭每日必做
		})
end
function Dao:通天塔(t)
	if type(t) =='table' then
		self = t
	end
  local pages={
--		{data['通天塔']['通天塔左侧领取奖励'],nil,a="searchTap"},
		{data['通天塔']['进入通天塔'],nil,"sleep",1000,a="searchTap",ci=true},
		{data['通天塔']['通天塔界面'],nil,a="searchTap","sleep",500},
		{data['通天塔']['通天塔领取奖励'],nil,a="searchTap","finish"}
		}
  mapping({
		["pages"]=pages
	})
end

-- ------------------------通天塔  end------------------------------------

-- ------------------------喝酒  start------------------------------------
function Dao:每日必做_喝酒(t)
		if type(t) =='table' then
		self = t
	end
	local pages={
			{data['喝酒']['喝酒'],nil,a="searchTap","finish"}
			}
		mapping({
			["pages"]=pages,
			["runCount"]=5,	--如果一直停留在这个界面，超过5次，就结束这个索引
			["repeatTimes"]=5,--索引被重复执行5次  5次喝酒
			["repeatDelay"]=500	--每次执行间隔
		})
end
-- ------------------------喝酒  end------------------------------------


-- ------------------------膜拜城主  start------------------------------------
function Dao:每日必做_膜拜城主(t)
		if type(t) =='table' then
		self = t
	end
	local pages={
			{data['每日必做']['每日必做'],nil,a="searchTap","sleep",500},
			{data['每日必做']['膜拜城主'],nil,a="searchTap",self.膜拜城主,dao=self,"finish"}
			}
		mapping({
			["pages"]=pages,
			["runCount"]=5,	--如果一直停留在这个界面，超过5次，就结束这个索引
			['errorNextMethod']=关闭每日必做
		})
end

function Dao:膜拜城主(t)
if type(t) =='table' then
		self = t
	end
	local pages={
			{data['膜拜城主']['膜拜城主'],nil,a="searchTap",s="up"},
			{data['膜拜城主']['膜拜城主'],{452,378},so="up","finish"}
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
			{data['个人BOSS']['挑战条件不足'],{1186,45},"finish"},
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
			{data['个人BOSS']['挑战条件不足'],{1186,45},"finish"},
			{data['个人BOSS']['挑战BOSS'],nil,a="searchTap",self.挑战BOSS,"finish",dao=self,so="up",sc={"up"}}
			}
		mapping({
			["pages"]=pages
		})
end


function Dao:个人BOSS_沃玛(t)
	if type(t) =='table' then
		self = t
	end
	local pages={
			{data['个人BOSS']['个人BOSS'],nil,a="searchTap","sleep",1500},
			{data['个人BOSS']['个人BOSS左菜单'],nil,a="searchTap","sleep",500},
			{data['个人BOSS']['挑战条件不足'],{1186,45},"finish"},
			{data['个人BOSS']['挑战BOSS'],nil,a="searchTap",self.挑战BOSS,"finish",dao=self}
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
			{data['个人BOSS']['挑战条件不足'],{1186,45},"finish"},
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
			{data['个人BOSS']['挑战条件不足'],{1186,45},"finish"},
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
			{data['挂机']['自动战斗'],nil,a="searchTap","sleep",1500,s="click"},
			{data['个人BOSS']['召唤战神'],nil,a="searchTap",self.召唤战神,bas=1800,one=true,so="click",sc={"click"},dao=self},	--召唤战神
			{data['主线']['主线个人boss领奖'],nil,a="searchTap",bas=16000,s="up"},--bas  16秒的捡东西时间
			{data['主线']['主线个人boss退出'],nil,a="searchTap","finish",so="up",sc={'up'}}
			}
		mapping({
			["pages"]=pages
		})
end
-- ------------------------个人BOSS  end------------------------------------

--DONE
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
		tap(846,573)
		sleep('领取奖励',300)
		tap(671,573)
		sleep('领取奖励',300)
		tap(493,573)
		sleep('领取奖励',300)
		tap(326,573)
		sleep('领取奖励',300)
		tap(1010,573)
		sleep('领取奖励',300)
		tap(1010,573)
		sleep('领取奖励',300)
		tap(1187,46)--关闭菜单
end
-- ------------------------领取日常奖励  end------------------------------------



-- ------------------------副本  start------------------------------------
function Dao:每日必做_副本(num)
	
	local pages={
		{data['每日必做']['每日必做'],nil,a="searchTap","sleep",500}
	}
			
	if num==1 then
		table.insert(pages,{data['每日必做']['护盾副本'],nil,a="searchTap",self.副本_祖玛寺庙,dao=self,"finish"})
	elseif num==2 then
		table.insert(pages,{data['每日必做']['护盾副本'],nil,a="searchTap",self.副本_沃玛寺庙,dao=self,"finish"})
	elseif num==3 then
		table.insert(pages,{data['每日必做']['护盾副本'],nil,a="searchTap",self.副本_封魔恶谷,dao=self,"finish"})
	else 
		table.insert(pages,{data['每日必做']['护盾副本'],nil,a="searchTap",self.副本_赤月神殿,dao=self,"finish"})
	end
	
		mapping({
			["pages"]=pages,
			["runCount"]=5,	--如果一直停留在这个界面，超过5次，就结束这个索引
			['errorNextMethod']=关闭每日必做
		})
end

function Dao:副本_沃玛寺庙(t)
		if type(t) =='table' then
		self = t
	end
	local pages={
			{data['副本']['挑战条件不足'],{1189,45},"finish"},
			{data['副本']['挑战副本'],nil,a="searchTap",self.副本秒退,"finish",dao=self},
			{data['副本']['挑战条件不足'],{1189,45},"finish"}
			}
		mapping({
			["pages"]=pages
		})
end

function Dao:副本_祖玛寺庙(t)
		if type(t) =='table' then
		self = t
	end
	local pages={
			{data['副本']['祖玛寺庙'],nil,a="searchTap","sleep",500,s="one"},
			{data['副本']['挑战条件不足'],{1189,45},"finish"},
			{data['副本']['挑战副本'],nil,a="searchTap",so="one",self.副本走完,"finish",dao=self},
			{data['副本']['挑战条件不足'],{1189,45},"finish"}
			}
		mapping({
			["pages"]=pages
		})
end
function Dao:副本_封魔恶谷(t)
		if type(t) =='table' then
		self = t
	end
	local pages={
			{data['副本']['封魔恶谷'],nil,a="searchTap","sleep",500},
			{data['副本']['挑战条件不足'],{1189,45},"finish"},
			{data['副本']['挑战副本'],nil,a="searchTap",self.副本秒退,"finish",dao=self},
			{data['副本']['挑战条件不足'],{1189,45},"finish"}
			}
		mapping({
			["pages"]=pages
		})
end
function Dao:副本_赤月神殿(t)
		if type(t) =='table' then
		self = t
	end
	local pages={
			{data['副本']['赤月神殿'],nil,a="searchTap","sleep",500},
			{data['副本']['挑战条件不足'],{1189,45},"finish"},
			{data['副本']['挑战副本'],nil,a="searchTap",self.副本秒退,"finish",dao=self},
			{data['副本']['挑战条件不足'],{1189,45},"finish"}
			}
		mapping({
			["pages"]=pages
		})
end

function Dao:副本走完(t)
		if type(t) =='table' then
		self = t
	end
	local pages={
			{data['挂机']['自动战斗'],nil,a="searchTap","sleep",1500,s="click"},
			{data['个人BOSS']['召唤战神'],nil,a="searchTap",self.召唤战神,bas=1800,one=true,so="click",sc={"click"},dao=self},	--召唤战神
			{data['副本']['副本领奖'],nil,a="searchTap",s="two",bas=5000},
			{data['副本']['副本领奖退出'],nil,a="searchTap",so="two","finish"}
			}
		mapping({
			["pages"]=pages
		})
end

function Dao:副本秒退(t)
		if type(t) =='table' then
		self = t
	end
	local pages={
			{data['副本']['副本提前退出'],nil,a="searchTap"},
			{data['副本']['副本提前退出确认'],nil,a="searchTap","finish"}
			}
		mapping({
			["pages"]=pages
		})
end

-- ------------------------副本  end------------------------------------
-- DONE
function Dao:切换角色()
	local pages={
			{data['挂机']['底部菜单'],nil,a="searchTap"},
			{data['切换角色']['底部菜单设置'],nil,a="searchTap"},
			{data['切换角色']['设置左侧菜单'],nil,a="searchTap"},
			{data['切换角色']['返回登录'],nil,a="searchTap"},
			{data['切换角色']['返回登录确认'],nil,a="searchTap",self.换角色,"finish",dao=self}
			}
		mapping({
			["pages"]=pages
		})
end

function Dao:换角色()
	print(role)
	role = role +1
end


-- DONE
-- ------------------------未知暗殿刷怪  start------------------------------------
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
		{data['挂机']['底部菜单'],nil,a="searchTap","sleep",500},
		{data['挂机']['底部装备菜单'],nil,a="searchTap",so="menu",sr=true,"sleep",500},
		{data['挂机']['底部合成菜单'],nil,a="searchTap",s="menu","sleep",1500},
		{data['挂机']['合成装备手镯'],nil,a="searchTap"},
		{data['挂机']['合成按钮'],nil,a="searchTap",one=true,s="btn","sleep",1000},
		{data['挂机']['合成70级装备'],nil,a="searchTap",one=true,so="btn",onec={"合成按钮"}},
		{data['挂机']['合成关闭'],nil,a="searchTap",so="btn",son=2,onec={"合成70级装备","合成按钮"},"sleep",2000},
		{data['挂机']['自动战斗'],nil,a="searchTap","sleep",500},
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




return Dao:new()

