require "utils/Mapping"
require "utils/util"
local data = require "data/Data"

local Dao = {}

function Dao:new()
  local index  = {}
  setmetatable(index,{__index = self})
  return index
end

function Dao:登录()
  local pages={
		{data["登录"]["移动浮层"],{775,44,775,617},a="swip","sleep",200},
    {data["登录"]["登录账号"],{451,390}},
		{data['登录']['登录公告'],{569,505}},
		{data['登录']['登录游戏'],{570,486}},
		{data['登录']['选择角色'],{978,575},p="进入游戏","finish",so="login"},--进入游戏
		{data["登录"]["已登录"],nil,"finish"}
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
    {data["主线"]["开始游戏"],{623,455}},
		{data['主线']['完成任务'],{187,548}},
		{data['主线']['任务栏完成'],nil,a="searchTap"},
		{data['主线']['装备'],nil,a="searchTap"},
		{data['主线']['任务栏未完成'],{110,170}},
		{data['主线']['冲级大礼包'],{569,404}}

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












return Dao:new()

