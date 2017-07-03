require "utils/Mapping"
require "utils/util"
local data = require "data/Data"

local Dao = {}

function Dao:new()
  local index  = {}
  setmetatable(index,{__index = self})
  return index
end

function Dao:data_登录()
  sysLog("data -login...")
  local pages={
    {data["登录"]["登录主界面"],{638,550},"sleep",200},
    {data["登录"]["选择角色界面"],nil,"finish"},
    {data["登录"]["已登录"],nil,"finish"}
  }
  mapping({
		["pages"]=pages
	})
end


return Dao:new()

