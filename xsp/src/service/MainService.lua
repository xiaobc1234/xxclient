
require "service/ModuleService"


--------------------功能函数------------------------------
function 主线任务()
	登录()
	主线()
end

function 每日必做_个人BOSS()
	for tmpi=1,2 do
		个人BOSS赤月()
		sleep('个人BOSS赤月结束',500)
  end
	个人BOSS祖玛()
end

function 未知暗殿挂机(num)
		进入未知暗殿()
		sleep("进入未知暗殿sleep",2000)
		未知暗殿召唤战神()
		刷未知暗殿boss(num)-- 刷排序中的第一个boss
end

