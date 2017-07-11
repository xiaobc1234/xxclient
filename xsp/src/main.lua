--  入口
require "init"
require "utils/HttpUtil"
require "service/MainService"
local bb = require("badboy")
local strUtils = bb.getStrUtils()



showTip("当前分辨率：".._fsw.."*".._fsh)

deviceId= string.format('%s', getDeviceUUID())

--dialog("欢迎使用冰城脚本！您的设备号: "..deviceId)

mSleep(1000)



-- 网络版
local function serverMain()
	--先发送请求,记录该设备
	synPost(httpHost.."/client/devices/"..appAlias.."/"..deviceId,"",defaultSuccess,defaultError);

	-- 下面进入主循环
	while(true) do
		
		if not taskLock then
			--没有任务在执行  发送请求获取任务
			function success(res)
				sysLog(res)
				if res then
				--执行任务方法
					res()
					--执行完任务之后，将全局锁解开
					taskLock=false;
				end
			end
			function _error(msg)
				taskLock=false
				defaultError(msg)
			end
			taskLock =true;--发送前锁住全局锁
			synGet(httpHost.."/client/tasksQueue/"..deviceId,success,_error)
		else
			mSleep(500)
		end
		
	end
end

-- 脱机版
local function clientOnlyMain()
	
	--首先移动浮层
	移动浮层()
--	print("main="..config['main'])
	if config['main']=='0' then
		主线任务()
	end
	if config['未知暗殿']=="0" then
		刷未知暗殿boss(1)-- 刷排序中的第一个boss
	end
	
	print('config["每日必做"]='..config['每日必做'])
	
	local 每日必做 = config['每日必做'];
	local must={}
	if string.find(每日必做,"@") then
		must= strUtils.seperate(每日必做,"@")
	else
		must = {每日必做}
	end

	print(must)
	for i,v in ipairs(must) do
		if "0"==v then
			--除魔12
			除魔12()
		elseif "1"==v then
			--个人BOSS
		
		elseif "2"==v then
			--通天塔
		
		elseif "3"==v then
			--膜拜城主
		
		end
  end
	
	

end


-- 执行网络方法
-- serverMain()

-- 执行脱机版方法
clientOnlyMain()





