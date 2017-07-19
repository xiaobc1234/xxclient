--  入口
require "init"
require "utils/HttpUtil"
require "service/MainService"
local bb = require("badboy")
local strUtils = bb.getStrUtils()


showTip("当前分辨率：".._fsw.."*".._fsh)


-- 网络版
local function serverMain()

	deviceId= string.format('%s', getDeviceUUID())

	dialog("欢迎使用冰城脚本！您的设备号: "..deviceId)

	--先发送请求,记录该设备
	synPost(httpHost.."/client/devices/"..appAlias.."/"..deviceId,"",defaultSuccess,defaultError);
	
	sleep("记录设备号信息",1000)
	
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
	
	登录()
	
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
			除魔5次()
		elseif "1"==v then
			通天塔2次()
		elseif "2"==v then
--		TODO
--			膜拜城主()
		elseif "3"==v then
			每日必做副本()
		end
  end
	
	-- 领取每日必做奖励
	每日必做领奖()
	
	--下面是打经验的脚本
	local 个人BOSS = config['个人BOSS'];
	local boss={}
	if string.find(个人BOSS,"@") then
		boss= strUtils.seperate(个人BOSS,"@")
	else
		boss = {个人BOSS}
	end
	print(boss)
	for i,v in ipairs(boss) do
		if "0"==v then
			个人BOSS沃玛()
		elseif "1"==v then
			个人BOSS祖玛()
		elseif "2"==v then
			个人BOSS赤月()
		elseif "3"==v then
			个人BOSS魔龙()
		end
  end
	
-- 领取每日必做奖励
		每日必做领奖()
		
		
	切换角色()
	if role<=4 then
	--	如果不是第四个角色执行完，就切换角色重新执行
		clientOnlyMain()
	end
	
end

if _online then
	-- 执行网络方法
	 serverMain()
else
	-- 执行脱机版方法
	clientOnlyMain()
end




