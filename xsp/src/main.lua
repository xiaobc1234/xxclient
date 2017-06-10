--  入口
require "init"
require "utils/HttpUtil"



showTip("当前分辨率：".._fsw.."*".._fsh)

deviceId= string.format('%s', getDeviceUUID())

dialog("欢迎使用冰城脚本！您的设备号: "..deviceId);

mSleep(1000);


--先发送请求,记录该设备
synPost(httpHost.."/client/devices/"..appAlias.."/"..deviceId,"",defaultSuccess,defaultError);

-- 下面进入主循环
while(true) do
	
	if not taskLock then
		--没有任务在执行  发送请求获取任务
		function success(res)
			if res then
			--执行任务方法
				res()
			end
		end
		function _error(msg)
			taskLock=false
			defaultError(msg)
		end
		taskLock =true;--发送前锁住全局锁
		synGet(httpHost.."/client/tasksQueue/"..deviceId,success,_error)
		
	end
	
end





