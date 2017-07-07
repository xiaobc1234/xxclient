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
    {data["登录"]["登录账号"],{451,390}},
		{data['登录']['登录公告'],{569,505}},
		{data['登录']['登录游戏'],{570,486}},
		{data['登录']['选择角色'],{962,128},s="login"},--选择角色1
		{data['登录']['选择角色'],{978,575},so="login"}--进入游戏
		
  }
  mapping({
		["pages"]=pages
	})
end










return Dao:new()

