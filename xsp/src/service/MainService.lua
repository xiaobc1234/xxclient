
local dao
if _device==1 then
	dao=require "data/DataCqws"
elseif _device==2 then
	dao=require "data/iphone6/Data_ws_dao"
end


--------------------功能函数------------------------------

function 登录()
	dao:登录()
end

function 滑动浮层()
	dao:移动浮层()
end

function 移动左侧浮层()
	dao:移动左侧浮层()
end

function 主线()
	dao:主线()
end

function 除魔5次()
	dao:降妖除魔5()
end

function 通天塔2次()
	dao:通天塔2次()
end

function 膜拜城主()
	dao:每日必做_膜拜城主()
end

-- 必须在通天塔做完之后才可以做
function 快捷喝酒5次()
	dao:每日必做_喝酒()
end

function 个人BOSS沃玛()
	for tmpi=1,3 do
		dao:个人BOSS_沃玛()        
		sleep('个人BOSS结束',3000)
  end
end

function 个人BOSS祖玛()
	for tmpi=1,3 do
		dao:个人BOSS_祖玛()       
		sleep('个人BOSS结束',3000)
  end
end
function 个人BOSS赤月()
	for tmpi=1,2 do
		dao:个人BOSS_赤月()       
		sleep('个人BOSS结束',3000)
  end
end

function 个人BOSS魔龙()
	dao:个人BOSS_魔龙()
end

function 个人BOSS牛魔()
	dao:个人BOSS_牛魔()
end


function 每日必做领奖()
	dao:每日必做_领取奖励()
end

function 每日必做副本()
	dao:每日必做_副本(1)
	sleep('副本sleep',500)
	dao:每日必做_副本(1)
	sleep('副本sleep',500)
	dao:每日必做_副本(2)
	sleep('副本sleep',500)
	dao:每日必做_副本(2)
	sleep('副本sleep',500)
	dao:每日必做_副本(3)
	sleep('副本sleep',500)
	dao:每日必做_副本(3)
	sleep('副本sleep',500)
	dao:每日必做_副本(4)
	sleep('副本sleep',500)
	dao:每日必做_副本(4)
end

function 切换角色()
	dao:切换角色()
end

function 未知暗殿挂机(num)
	设置()
	dao:未知暗殿刷怪(num)
	未知暗殿设置回滚()
end

function 主动回收装备()
	dao:主动回收装备()
	sleep('刚回收完装备',1000)
	dao:左侧任务栏恢复()
end

function 领取回收奖励()
	dao:_70_80级开启回收奖励()--如果70级以上  自动领取回收奖励，70级以下，直接结束
end

function 升级设置()
	dao:升级内功()
	sleep('升级内功',500)
	dao:升级翅膀()
	sleep('升级翅膀',500)
	dao:升级成就()
	sleep('升级成就',500)
	dao:设置保护()
	dao:设置拾取()
	dao:设置屏蔽()
	dao:关闭设置()
end

function 设置()
	dao:设置保护()
	dao:设置拾取()
	dao:设置屏蔽()
	dao:关闭设置()
end

function 未知暗殿设置回滚()
		dao:设置保护()
		dao:未知暗殿设置回滚()
		dao:关闭设置()
end

function 设置快捷酒()
	dao:设置快捷酒()
end

function 左侧任务栏恢复()
		dao:左侧任务栏恢复()
end

function 经验商主线()
	主线()
	sleep('主线到达65级',500)
	
	升级设置()
	设置()

	dao:赤月挂酒(g_打酒时长)--测试用1.2分钟，正式挂机1.5小时
	-- 刷酒2小时 升级内功
	dao:升级内功()
	sleep('设置快捷喝酒',500)	
	dao:设置快捷酒()
	
	主动回收装备()
	sleep('左侧栏回复',1000)
	dao:主线未知暗殿()  -- 正式挂机5个小时
	未知暗殿设置回滚()	--勾选装备拾取
	主线()	--5小时过后接着主线 到70级 
end

function 领取全民礼包()
	dao:领取全民礼包()
end

function 升级转生()
	dao:_80级转生()
end









