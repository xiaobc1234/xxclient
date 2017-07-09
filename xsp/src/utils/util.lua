


--生成随机函数，需要放大后处理  
function random(n,m)  
  math.randomseed(os.clock()*math.random(100000,9000000)*math.random(100000,900000))  
  return math.random(n,m)  
end  

--生成指定长度的随机字符串  
function random_str(len)  
  local str = ""  
  for i=1,len,1 do  
    str = str .. string.char(random(97,122))  
  end  
  return str  
end 

---- mapping的通用方法
--function mapping(pages)
--  local map = Mapping:new()
--  --添加页面
--  map:AddPages(pages)
--  --执行
--  return map:Run()
--end


-- mapping的通用方法
function mapping(pages,runCount)
  local map = Mapping:new()
  map.runCount=runCount
  --添加页面
  map:AddPages(pages)
  --执行
  return map:Run()
end

-- mapping的通用方法
function mapping(pages,runCount,errorNextMethod)
  local map = Mapping:new()
  map.runCount=runCount
  map.errorNextMethod=errorNextMethod
  --添加页面
  map:AddPages(pages)
  --执行
  return map:Run()
end

--	a是Public类里面的方法
--  {pagename,check_par,nil,护盾任务,"finish"}
--  {pagename,check_par,nil,关闭包裹,"finish",a="searchTap"}
-- 	{pagename,check_par,nil,a="searchTap"}
--	{pagename,check_par,{718,46},"finish"}
--	{pagename,check_par,{875,41},领取BOSS牌}
--	{pagename,check_par,{427,539,427,90},a="swip","sleep",1500}


-- mapping({
--	["pages"]=pages,--page
--	["runCount"]=10,--循环多少次（不管是否检测到）结束索引，结束索引之后，执行errorNextMethod方法，如果有配置
--	["errorNextMethod"]=nextMethod,--和runCount对应使用，可以不设置
--	["repeatTimes"]=5,--	表示这个索引要重复执行成功5次
--	["repeatDelay"]=500--	和repeatTimes对应使用，可以不设置，表示重复执行的中间间隔
--	["indexDelay"]=500--	单独使用，表示索引执行结束后延迟多久
--})

-- mapping的通用方法
function mapping(opt)
  local map = Mapping:new()
	
  if opt["pages"] then
    map:AddPages(opt["pages"])
  end
  if opt["runCount"] then
    map.runCount=opt["runCount"]
  end
  if opt["errorNextMethod"] then
    map.errorNextMethod=opt["errorNextMethod"]
  end
	if opt["repeatTimes"] then
    map.repeatTimes=opt["repeatTimes"]
  end
	if opt["repeatDelay"] then
    map.repeatDelay=opt["repeatDelay"]
  end
	if opt["indexDelay"] then
    map.indexDelay=opt["indexDelay"]
  end
  
  --执行
  return map:Run()
end

function checkOnly(v)
  x, y = findMultiColorInRegionFuzzy(v[1],v[2],v[3],v[4],v[5],v[6],v[7])
  if x > -1 then
    return 1
  else 
    return nil
  end
end

function searchTap(v)
  if v then
    x, y = findMultiColorInRegionFuzzy(v[1],v[2],v[3],v[4],v[5],v[6],v[7])
    if x>-1 then
      tap(x,y)
    end
  end
end


--点击
function tap(x, y)
  math.randomseed(tostring(os.time()):reverse():sub(1, 6))  --设置随机数种子
  local index = math.random(1,5)
  x = x+math.random(-2,2)
  y = y+math.random(-2,2)
  touchDown(index,x, y)
  mSleep(math.random(60,80))                                --某些情况可能要增大延迟
  touchUp(index, x, y)
	if _debug==true then
		--显示点击view
		showClickView(x,y)
	end
  mSleep(20)
end


--全能打印函数
local function pr()
	local function TableToString(tab)  
		local get_str,get_t
		get_t = function(L)
			return string.rep("\t", L)
		end
		get_str = function(tab,L)
			L = L+1
			local tmp = {}  
			tmp[#tmp + 1] = "{"
			for k, v in pairs(tab) do
				local k_type = type(k) 
				local v_type = type(v) 
				local key = (k_type == "string" and "[\"".. k .. "\"] = ") or (k_type == "number" and "[".. k .. "] = ") or "[" .. tostring(k) .. "] = "
				local value = (v_type == "table" and get_str(v,L))  
				or (v_type == "boolean" and tostring(v))  
				or (v_type == "string" and "\"" .. v .. "\"")  
				or (v_type == "number" and v)
				or (v_type == "string" and "\"" .. v .. "\"")
				or tostring(v)
				tmp[#tmp + 1] = key and value and get_t(L)..tostring(key) .. tostring(value).."," or nil  
			end
			tmp[#tmp + 1] = get_t(L-1).."}"
			return table.concat(tmp, "\n")
		end
		return get_str(tab,0)
	end
	local print = sysLog or print
	return function( ... )
		if type(...) == "table" then
			print(TableToString(...))
		else
			print(...)
		end
	end
end
print = pr()




