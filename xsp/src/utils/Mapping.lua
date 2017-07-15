--映入Page模块,作为页面自身的动作,不在重复逻辑的使用base,不好界定base到底是什么
local Public=require "utils/Public"
local CommonCode = require "utils/CommonCode"
require "init"--只用它的showTip方法


--建立游戏逻辑的索引模块 
Mapping = {}
--以下是索引模块的各项参数的默认值,每个新建的索引可以单独设置
Mapping.timeout = 20        --出错超时时间
Mapping.repeattimes = 20    --判断出错重复页面的次数
Mapping.snapshot = true     --出错后截图
Mapping.errorrepeat = 1     --出错后运行程序的次数
Mapping.defaultfuzzy = 95   --默认检查函数的相似度
Mapping.defaultoffset = 5   --默认随机点击的偏移量为5个像素点
--Mapping.errorlog = true   --错误日志是否开启,等写完save模块,有了存储的功能,再写进去,现在不单独写了
Mapping.checkout = false    --出错后运行程序


-- 下面被用到
Mapping.invalidCheckTimes = 5    --配置page的checkout 后才能使用 多少次没有检测到，走下一个索引
Mapping.validCheckTimes = 5    --配置page的checkin 后才能使用，多少次检测到，仍在当前索引上，就做其他操作
Mapping.delay = 300					--每个索引循环停留时间，避免cpu占用太高

--建立参数的简写方法,也可全拼写入
Mapping.parcase = {
  [1]    = "pagename",    --页面名字
  [2]    = "check_par",   --检查函数的参数
  [3]    = "action_par",  --动作函数的参数
  [4]    = "ending",       --动作结束后运行的函数
  [5]    = "ending_par",   --动作结束后运行的参数
  ["c"]  = "check",       --检查函数
  ["cp"] = "check_par",    --检查函数的参数
  ["co"] = "checkout",     --检查是否存在的的参数,默认是检查到点后执行动作,这个参数改成true后,是检查不到点才执行动作
  ["a"]  = "action",      --动作函数
  ["ap"] = "action_par",   --动作函数的参数
  ["e"]  = "ending",       --动作结束后函数
  ["ep"] = "ending_par",   --动作结束后函数的参数
	["ci"] = "checkin",				-- ci=true  和co对应，设置后检测到多少次后，还在这个页面,执行cifunc方法，如果不配置cifunc，结束索引
	["cifunc"] = "checkin_function",	--检测到很多次后，还在这个页面就执行后面的方法  不能是索引，只能是自定义判断执行方法，否则会出现资源浪费的问题
	["one"] = "check_only_one",	--只执行一遍这个page  默认为false，设置为true后表示只执行一次
	["onec"] = "check_only_one_clear",	--如onec={"页面1"}   当有这个配置时，执行时将页面1的一次校验去除（使原本只执行一次的page，可以再次执行一次）
	["s"] = "sort",	--为了让一个索引里面存在先后顺序 sort='tmp' 表示在 zIndex[tmp] = zIndex[tmp]+1  默认zIndex={}
	["so"] = "sort_out",	--和上面sort对应，表示谁执行后才能执行他，sort_out='tmp'
	["son"] = "sort_out_num",	--和so配合使用，当前面page被执行多少次之后，执行当前page。默认为1 if zIndex[tmp]>=1 then  执行  end
	["sc"]	=	"sort_clear",	--和sort对应使用 sc={"tmp"}  如果配置sc则执行完后将sc配置的sort设置为0次，sc可以配置多个
	['sr']	=	 "sort_reverse",	--和s,so,son配合使用，sr=false时，s执行son次后so可以执行；当sr=true时,s执行son后so不再执行  默认为 false
	["p"] = "pagename",
	["bas"] = "before_action_sleep",	--检测到页面后，sleep多久再执行action操作 bas=1000,  1s的捡东西时间
	["bac"] = "before_action_check",	--执行action前检查，如果检测出来就不执行，用于中间部分页面不需要执行的情况  bac={{0xf72e2e,"10|0|0xf72e2e",95,754,22,794,68}}
	['dao'] = "dao_self"	--ending配置的是dao方法的时候，需要dao对象，否则获取不到dao的方法
}
--新建一个索引,name为可选参数,为上级索引的名字
function Mapping:new(name)
  local index  = {}
  index.pages   = {}
  index.runCount=nil--只有设置了才有作用，运行多少次后还在循环这个索引，就结束
	index.errorNextMethod=nil--出现异常后执行的方法,就是上面执行多少次后都没有找到，结束索引后执行的操作
	index.repeatTimes=nil	--这个索引执行多少遍
	index.repeatDelay=nil	--重复执行这个索引间隔
	index.indexDelay=nil--单独使用，表示索引执行结束后延迟多久   具体请看util.lua的说明
	
  --索引函数的默认方法
  index.basefn = Public
  --索引列表的上级
  index.prev   = name or false
  setmetatable(index,{__index = self})
  return index
end
--增加索引的页面方法如下 x指x坐标,y指y坐标,c指颜色
--xxx:AddPages{
--         检查x,y点坐标是否为c的颜色,是的话,点击x,y
--         {"页面名字",{x,y,c}},
--         检查x1,y1点坐标是否为c的颜色,是的话,点击x2,y2               
--         {"页面名字",{x1,y1,c},{x2,y2}}
--         检查x1,y1点坐标是否为c的颜色,是的话,点击x2,y2,并在点击后结束这个索引      
--         {"页面名字",{x1,y1,c},{x2,y2},"finish"}
--         同上,最后的save为save模块,让存档中某个值+1
--         {"页面名字",{x1,y1,c},{x2,y2},"save",{"测试","add",1}}
--         检查x1,y1点坐标是否为不是c的颜色,然后点击x2,y2,并在点击后结束这个索引 
--         {"页面名字",{x1,y1,c},{x2,y3},e = "finish" , checkout = true}
--         使用Base模块中的other方法检查页面,是的话,使用Base模块中的move方法,移动页面 
--         {"页面名字",{x1,y1,c},{x2,y2,x3,y3},c = Base.other , a = Base.move}
--         ......
--          }
function Mapping:AddPages( ... )
  for i , page in ipairs( ... ) do
    if type(self.pages[i])=="nil" then
      self.pages[i]={}
    end
    for key,value in pairs(page) do
			
			local n = tonumber(key);--转换成数字，如果不是就说明只手动设置
			if n then
				if n==1 then--参数1 直接可以获取pagename 和 check_par
--					sysLog("values[1]="..value[1])
					self.pages[i]["pagename"]   = value[1] or ""
					self.pages[i]["check_par"]  = value[2] or false
--					self.pages[i]["action_par"]  = value[3] or false
				else
					key = key+1
				end
			end
--			sysLog("key="..key)
			if not n or n~=1 then
				if self.parcase[key] == "ending" then
				
					if value=="finish" then
						self.pages[i][self.parcase[key]] = value
					elseif type(value) == "string" then
						self.pages[i][self.parcase[key]] = self.basefn[value]
					else
						self.pages[i][self.parcase[key]] = value
					end
				else
					self.pages[i][self.parcase[key]] = value
				end
			end
    end
		
    self.pages[i]["pagename"]   = self.pages[i]["pagename"] or ""
    self.pages[i]["check"]      = self.pages[i]["check"] or self.basefn.check
    self.pages[i]["checkout"]   = self.pages[i]["checkout"] or false
    self.pages[i]["check_par"]  = self.pages[i]["check_par"] or false
    self.pages[i]["action_par"] = self.pages[i]["action_par"] or false
    self.pages[i]["ending_par"] = self.pages[i]["ending_par"] or false
    if self.pages[i]["action_par"] then
      self.pages[i]["action"] = self.pages[i]["action"] or self.basefn.click
    end
    self.pages[i]["defaultfuzzy"] = self.defaultfuzzy
    self.pages[i]["defaultoffset"] = self.defaultoffset
		self.pages[i]["checkin"]   = self.pages[i]["checkin"] or false
		self.pages[i]["checkin_function"]   = self.pages[i]["checkin_function"] or false
		
		self.pages[i]["check_only_one"]   = self.pages[i]["check_only_one"] or false
		self.pages[i]["check_only_one_clear"]   = self.pages[i]["check_only_one_clear"] or false
		
		self.pages[i]["sort"]   = self.pages[i]["sort"] or false
		self.pages[i]["sort_out"]   = self.pages[i]["sort_out"] or false
		self.pages[i]["sort_out_num"]   = self.pages[i]["sort_out_num"] or 1
		self.pages[i]["sort_clear"]   = self.pages[i]["sort_clear"] or false
		self.pages[i]["sort_reverse"]   = self.pages[i]["sort_reverse"] or false
		
		self.pages[i]["before_action_sleep"]   = self.pages[i]["before_action_sleep"] or false
		self.pages[i]["before_action_check"]   = self.pages[i]["before_action_check"] or false
		self.pages[i]["dao_self"]   = self.pages[i]["dao_self"] or false
		
		
		
  end
end
   

-- 简单纠错方法，需要自行在CommonCode.lua文件中添加错误界面  
function Mapping:CommonCode()
  for i,v in ipairs(CommonCode) do
    if Public:check(v[2]) then
--      print("每个索引都要检查的错误页面："..v[1])
      if v[3] and type(v[3])=="table" then
        Public:click(v[3])
				if v[4] and type(v[4])=="function" then
					v[4]()--调用第四个参数的方法
				end
      end
			break--错误页面检测到后 就直接结束循环提高效率
    end
  end
end

--运行这个索引的内容
function Mapping:Run()
  self.finished = false
  local runCountLocal =0--记录重复执行的次数
  local checkoutCount =0--记录多少次没有检测到这个页面，只有配置里的checkout属性才有效
	local checkinCount =0--记录多少次检测到这个页面，只有配置里的checkin属性才有效
	local nextMethod =nil--针对循环里面的循环，当父循环需要结束，进入子循环的时候使用
	
	local repeatTimesLocal = 0	--重复执行了多少次
	local checkOnlyOne = {} --只检测一次的临时参数
	
	local zIndex={}	--索引中page排序用
	
  while not self.finished do
    runCountLocal= runCountLocal+1
--    mSleep(1000-delay)--以免占用cpu过高
		sleep("mapping self.delay",self.delay);
    keepScreen(true)
    for i,page in ipairs(self.pages) do

			local isContinue = true	--解决没有continue的问题
			
      if _debug then
        sysLog("pre操作："..page.pagename)
--				print(page)
      end
      if page:check(page.check_par) then
					keepScreen(false)
					
--					print(zIndex)
--					if zIndex['flush'] then
--						print(page)
--					end
					
					if page.sort_reverse then
						if page.sort_out and zIndex[page.sort_out] and page.sort_out_num and zIndex[page.sort_out]>=page.sort_out_num then
						-- 当s执行sort_out_num次之后，so不再执行
							isContinue=false;
						end
					else 
						
						if page.sort_out and not zIndex[page.sort_out] then
--							print(page.sort_out.."-"..zIndex[page.sort_out])
							isContinue=false;
						elseif page.sort_out and zIndex[page.sort_out] and page.sort_out_num and zIndex[page.sort_out]<page.sort_out_num then
							-- 已可以执行该page  如果这个page配置了sort_out，并且没有轮到他执行时，直接不执行  当s执行sort_out_num次之前，so不执行 
							isContinue=false;
--							print(page.sort_out.."=-="..zIndex[page.sort_out])
						end
					end
					
--					print(page.before_action_check or "---")
					-- 如果页面中出现了before_action_check 配置的页面，就不执行action
					if page.before_action_check then
						for j,c in ipairs(page.before_action_check) do
							if page:check(c) then
								isContinue=false;
								break;
							end
            end
					end
					
					if isContinue then
--						print(checkOnlyOne)
						
						--没有continue 关键字，所以只能加一层if判断
						if not checkOnlyOne[page.pagename] or (checkOnlyOne[page.pagename] and checkOnlyOne[page.pagename]~=1) then
						--	只检查一次设置：
							if page.check_only_one== true then
								if checkOnlyOne[page.pagename]~=1 then
									checkOnlyOne[page.pagename]=1	
								end
							end
							--	清除one 一次限制,使之能再执行一次
							if page.check_only_one_clear and type(page.check_only_one_clear)=='table' then
								for i,v in ipairs(page.check_only_one_clear) do
									if checkOnlyOne[v] then
										checkOnlyOne[v]=nil
									end
								end
							end
							
							--配置了action前的sleep参数
							if page.before_action_sleep then
								sleep("mapping page.before_action_sleep",page.before_action_sleep)
							end
							
							--索引中所有page先后顺序逻辑
							if page.sort then
								if zIndex[page.sort] then
									zIndex[page.sort] = zIndex[page.sort]+1
								else
										zIndex[page.sort] = 1
								end
							end
							
							-- 清零sort参数
							if page.sort_clear and type(page.sort_clear)=='table' then
								for i,v in ipairs(page.sort_clear) do
									if zIndex[v] then
										zIndex[v]=false
									end
								end
							end
						
							if page.action then 
								if _debug then
									sysLog("当前操作："..page.pagename)
								end
								--显示当前操作
								showTip("当前操作："..page.pagename)
								
	--							调试关键输出
	--							print(page)
								
								if page.action_par then									
									if type(page.action)=="string" then
										if page.action=="searchTap"  then
											page.action=self.basefn[page.action]
											page:action(page.check_par,page.action_par)--和下面 执行参数不一样,针对searchTap 点击偏移问题
											page.action ="searchTap"
										else
											page.action=self.basefn[page.action]
											page:action(page.action_par)
										end
									else
										page:action(page.action_par) 
									end
								elseif page.action=="searchTap" then
									page.action=self.basefn[page.action]
									page:action(page.check_par)--和上面 执行参数不一样
									page.action ="searchTap"
								else 
									page:action() 
								end
							end
							if page.ending then 
								if page.ending=="finish" then
									self.finished =true--这个索引结束
									break
								elseif page.ending_par then
	--								sysLog("page.dao_self="..type(page.dao_self))
									if page.dao_self then
										page:ending(page.dao_self,page.ending_par)
									else
										page:ending(page.ending_par)
									end
								else
									if page.dao_self then
										page:ending(page.dao_self)
									else
										page:ending()
									end
								end
								if type(page.ending_par)=="string" and page.ending_par=="finish" then
									self.finished =true--这个索引结束
									break
								end
							end
							if page.checkin then
								checkinCount=checkinCount+1
								if checkinCount>=self.validCheckTimes then
									--如果遍历10次都找到这个界面，就做另一个处理
									if page.checkin_function then
										page:checkin_function()--如果有处理方法，就走处理方法，没有就直接结束索引
									else
										self.finished =true--这个索引结束
										break
									end
								end
							end
							repeatTimesLocal = repeatTimesLocal+1	--检测到了页面说明执行了一次
							if self.repeatDelay then
								--索引配置了重复执行延迟时间
								sleep("self.repeatDelay",self.repeatDelay)
							end
						end
					end
				
        --        break
      else  --没有检测到页面 page.checkout 只能配置在标志性界面上，即打开后的下个索引出现的界面
        if page.checkout==true then
					checkoutCount=checkoutCount+1
          if checkoutCount>=self.invalidCheckTimes then
            --如果遍历10次都没有找到这个界面，就finish
            self.finished =true--这个索引结束
						break
          end
        end
      end
      --检查不到任何页面,则向上级索引，或者说 之前已经走过这个流程，就走下面的一个索引  目前这个逻辑不用
      if i == #self.pages and self.prev then
        self.prev:Run()
      end
			
    end
    keepScreen(false)
		if not  self.finished then
			-- 检查是否有错误页面出现
			Mapping:CommonCode()
			--如果当前执行次数超过设置的超时次数，就结束当前这个索引
			if self.runCount and self.runCount>0 and runCountLocal>self.runCount then
				if _debug then
					sysLog("self.runCount="..self.runCount)
				end
				self.finished =true
				if self.errorNextMethod then
					nextMethod=self.errorNextMethod
				end
			end
		end
		
		-- 如果设置了重复执行索引，并且执行次数没有超过设置的次数
		if self.repeatTimes and self.repeatTimes<repeatTimesLocal then
			-- 有重复执行的设置，将索引结束标识符置为 未结束
			self.finished =false
		end
		
  end
	-- 如果设置了索引延迟，则执行完索引之后做延迟操作
	if self.indexDelay and tonumber(self.indexDelay) then
		sleep("mapping self.indexDelay",self.indexDelay)
	end
	if nextMethod then
		nextMethod()--如果在这个索引上执行了超过self.runCount次，就结束当前节点并进入下一个循环
	end
  return true
end



