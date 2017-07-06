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
    {data["登录"]["登录账号"]},
		{data['登录']['登录公告']}
		
  }
  mapping({
		["pages"]=pages
	})
end










return Dao:new()

