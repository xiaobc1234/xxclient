require "utils/Mapping"
require "utils/util"
local data = require "data/Data_ws"

local Dao = {}

function Dao:new()
  local index  = {}
  setmetatable(index,{__index = self})
  return index
end
 
function Dao:登录()
  local pages={
    {data["登录"]["登录账号"],nil,a="searchTap"},
		{data['登录']['登录公告'],nil,a="searchTap"},
		{data['登录']['登录游戏'],nil,a="searchTap"},
		{data['登录']['选择角色'],nil,a="searchTap",p="进入游戏","finish",so="login"},--进入游戏
		{data["登录"]["已登录"],nil,"finish"},
		{data['离线奖励']['离线奖励'],nil,"finish"}
  }
	if role==1 then
		table.insert(pages,{data['登录']['选择角色'],{1650,196},s="login"})--选择角色1
	elseif role==2 then
		table.insert(pages,{data['登录']['选择角色'],{1650,380},s="login"})--选择角色1
	elseif role==3 then
		table.insert(pages,{data['登录']['选择角色'],{1650,553},s="login"})--选择角色1
	else 
		table.insert(pages,{data['登录']['选择角色'],{1650,752},s="login"})--选择角色1
	end
  mapping({
		["pages"]=pages,
		["indexDelay"]=1000
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
	local pages={
			{data['离线奖励']['离线奖励'],{1766,66}},
			{data['离线奖励']['关闭提示'],nil,a="searchTap"},
			{data['每日必做']['每日必做'],nil,a="searchTap"},
			{data['每日必做']['除魔'],nil,a="searchTap",self.降妖除魔,"finish",dao=self},
			{data['除魔']['除魔刷新'],nil,self.降妖除魔,"finish",dao=self},
			{data['除魔']['除魔进行中'],nil,self.降妖除魔,"finish",dao=self},
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
		{data['除魔']['除魔刷新'],{320,931},p="接取除魔任务","sleep",5000},
		{data['除魔']['除魔进行中'],nil,a="searchTap","sleep",4000},	--4s点击一次
		{data['除魔']['除魔完成'],nil,a="searchTap"},
		{data['除魔']['除魔三倍领奖'],nil,a="searchTap","finish"}
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
			sleep("通天塔两次间隔",3000)--领奖这里总是很卡
	end
end
function Dao:通天塔1次(t)
	if type(t) =='table' then
		self = t
	end
	local pages={
			{data['离线奖励']['离线奖励'],{1766,66}},
			{data['离线奖励']['关闭提示'],nil,a="searchTap"},
			{data['通天塔']['通天塔界面'],nil,self.通天塔,"finish",dao=self},
			{data['每日必做']['每日必做'],nil,a="searchTap"},
			{data['每日必做']['通天塔'],nil,a="searchTap",self.通天塔,"finish",dao=self},
			{data['通天塔']['进入通天塔'],nil,"finish"}
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
		{data['通天塔']['进入通天塔'],nil,"sleep",1000,a="searchTap",ci=true},
		{data['通天塔']['通天塔界面'],{191,576},"sleep",500},
		{data['通天塔']['通天塔领取奖励'],nil,a="searrchTap"}
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
			{data['喝酒']['喝酒'],nil,a="searchTap"}
			}
		mapping({
			["pages"]=pages,
			["repeatTimes"]=5,--索引被重复执行5次  5次喝酒
			["repeatDelay"]=500	--每次执行间隔
		})
end
-- ------------------------喝酒  end------------------------------------


-- ------------------------膜拜城主  start------------------------------------
-- TODO
function Dao:每日必做_膜拜城主(t)
		if type(t) =='table' then
		self = t
	end
	local pages={
			{data['每日必做']['每日必做'],nil,a="searchTap","sleep",500},
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
			{data['个人BOSS']['挑战条件不足'],{1709,66},"finish"},
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
			{data['个人BOSS']['挑战条件不足'],{1709,66},"finish"},
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
			{data['个人BOSS']['沃玛教主'],nil,a="searchTap","sleep",1000},
			{data['个人BOSS']['挑战条件不足'],{1709,66},"finish"},
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
			{data['个人BOSS']['挑战条件不足'],{1709,66},"finish"},
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
			{data['个人BOSS']['自动战斗'],nil,a="searchTap","sleep",1500,s="click"},
			{data['个人BOSS']['召唤战神'],nil,a="searchTap",self.召唤战神,bas=1800,one=true,so="click",sc={"click"},dao=self},	--召唤战神
			{data['个人BOSS']['个人BOSS领奖'],nil,a="searchTap",bas=14000,s="up"},--bas  14秒的捡东西时间
			{data['个人BOSS']['个人BOSS领奖退出'],nil,a="searchTap","finish",so="up",sc={'up'}}
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
		tap(1203,821)
		sleep('领取奖励',300)
		tap(965,821)
		sleep('领取奖励',300)
		tap(712,821)
		sleep('领取奖励',300)
		tap(457,821)
		sleep('领取奖励',300)
		tap(1463,821)
		sleep('领取奖励',300)
		tap(1463,821)
		sleep('领取奖励',300)
		tap(1710,65)--关闭菜单
end
-- ------------------------领取日常奖励  end------------------------------------


function Dao:召唤战神(t)
	if type(t) =='table' then
		self = t
	end
  local pages={
    {data["召唤战神"]["点击召唤战神"],nil,a="searchTap","sleep",200},
		{data["召唤战神"]['关闭召唤战神'],{1721,136},"finish"}
  }
  mapping({
		["pages"]=pages
	})
end

-- ------------------------副本  start------------------------------------
function Dao:每日必做_副本(num)
		
	local pages={
			{data['每日必做']['每日必做'],nil,a="searchTap","sleep",500}
			}
			
	if num==1 then
		table.insert(pages,{data['每日必做']['护盾副本'],nil,a="searchTap",slef.副本_祖玛寺庙,dao=self,"finish"})
	elseif num==2 then
		table.insert(pages,{data['每日必做']['护盾副本'],nil,a="searchTap",slef.副本_沃玛寺庙,dao=self,"finish"})
	elseif num==3 then
		table.insert(pages,{data['每日必做']['护盾副本'],nil,a="searchTap",slef.副本_封魔恶谷,dao=self,"finish"})
	else 
		table.insert(pages,{data['每日必做']['护盾副本'],nil,a="searchTap",slef.副本_赤月神殿,dao=self,"finish"})
	end
	
		mapping({
			["pages"]=pages,
			["runCount"]=5	--如果一直停留在这个界面，超过5次，就结束这个索引
		})
end

function Dao:副本_沃玛寺庙(t)
		if type(t) =='table' then
		self = t
	end
	local pages={
			{data['副本']['沃玛寺庙'],nil,a="searchTap","sleep",500},
			{data['副本']['挑战副本'],nil,a="searchTap",self.副本秒退,"finish",dao=self},
			{data['副本']['挑战条件不足'],{1709,63},"finish"}
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
			{data['副本']['挑战副本'],nil,a="searchTap",so="one",self.副本走完,"finish",dao=self},
			{data['副本']['挑战条件不足'],{1709,63},"finish"}
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
			{data['副本']['挑战副本'],nil,a="searchTap",self.副本秒退,"finish",dao=self},
			{data['副本']['挑战条件不足'],{1709,63},"finish"}
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
			{data['副本']['挑战副本'],nil,a="searchTap",self.副本秒退,"finish",dao=self},
			{data['副本']['挑战条件不足'],{1709,63},"finish"}
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
			{data['个人BOSS']['自动战斗'],nil,a="searchTap","sleep",1500,s="click"},
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


function Dao:切换角色()
	local pages={
			{data['切换角色']['底部菜单'],nil,a="searchTap"},
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
	role = role +1
	if role>4 then
		return false
	else 
		return true
	end
end



return Dao:new()

