require "utils/Mapping"
require "utils/util"
local data = require "data/Data"

local Dao = {}

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
		{data['主线']['任务栏未完成'],{110,170},"sleep",300,bac={data["bac"]["主线石墓"],data['bac']['前往沙城']}},
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
		{data['主线']['主线称号'],nil,a="searchTap",self.升级称号,dao=self},
		{data['主线']['主线未知暗殿'],{384,321},self.升级内功,"finish",dao=self}
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
		{data['主线']['除魔接任务'],{188,548},"sleep",1000,so="flush",son=5},	--除魔刷新5次之后执行除魔接任务
		{data['挂机']['召唤战神'],nil,a="searchTap",self.召唤战神,so="flush",son=5,one=true,dao=self},	--召唤战神
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
			sleep("通天塔两次间隔",1000)
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
			{data["通天塔"]["通天塔可接"],nil,a="searchTap",s="kill",self.通天塔,"finish",dao=self},
			{data["除魔12"]["除魔滑动"],{94,320,94,163},p="除魔上滑",a="swip",so="kill",sr=true},
			{data["通天塔"]["通天塔可接"],nil,a="searchTap",s="kill",self.通天塔,"finish",dao=self},
			{data["除魔12"]["除魔滑动"],{94,320,94,163},p="除魔上滑",a="swip",so="kill",sr=true},
			{data["通天塔"]["通天塔可接"],nil,a="searchTap",s="kill",self.通天塔,"finish",dao=self},
			{data["通天塔"]["通天塔可接"],nil,a="searchTap",s="kill",self.通天塔,"finish",dao=self},
			{data["除魔12"]["除魔滑动"],{94,163,94,320},p="除魔下滑",a="swip",so="kill",sr=true},
			{data["通天塔"]["通天塔可接"],nil,a="searchTap",s="kill",self.通天塔,"finish",dao=self},
			{data["除魔12"]["除魔滑动"],{94,163,94,320},p="除魔下滑",a="swip",so="kill",sr=true},
			{data["通天塔"]["通天塔可接"],nil,a="searchTap",s="kill",self.通天塔,"finish",dao=self}
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
		{data['通天塔']['通天塔界面'],{302,311},s="flush",bas=500,one=true},--左移一段距离
		{data['挂机']['召唤战神'],nil,a="searchTap",self.召唤战神,so="flush",sc={"flush"},one=true,dao=self},	--召唤战神
		{data['通天塔']['通天塔领取经验'],nil,a="searchTap","finish"},
		{data['通天塔']['不在左边了'],{442,312},s="left"},
		{data['通天塔']['自动战斗'],nil,a="searchTap",so="left",sc={"left"}}
		--TODO 死亡后 结束
		
		}
  mapping({
		["pages"]=pages
	})
end
-- ------------------------通天塔  end------------------------------------

-- ------------------------膜拜城主  start------------------------------------
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

function Dao:未知暗殿刷怪(num)
  local pages=nil
	if num==1 then
		pages={
			{data["挂机"]["未知暗殿boss刷新1"],nil,"sleep",30000,a="searchTap"}
		}
	elseif num==2 then
		pages={
			{data["挂机"]["未知暗殿boss刷新2"],nil,"sleep",30000,a="searchTap"}
		}
	end
  mapping({
		["pages"]=pages
	})
end

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

