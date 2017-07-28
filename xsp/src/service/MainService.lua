
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
	dao:未知暗殿刷怪(num)
end

function 领取回收奖励()
	dao:领取回收奖励()
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

function 经验商主线()
	主线()
	sleep('主线到达65级',500)
	
	dao:赤月挂酒(60*2)	--2分钟挂酒 60*2  主要是换地图后设置召唤神兽
	升级设置()
	-- 在考虑是先刷酒增加以下内功还是先未知暗殿
	dao:赤月挂酒(60*60*1.5)	--1.5小时挂酒 60*60*1.5
	-- 刷酒2小时 升级内功
	dao:升级内功()
	
	dao:主动回收装备()
	sleep('刚回收完装备',1000)
	dao:左侧任务栏恢复()
	dao:主线未知暗殿()
	sleep('进入未知暗殿',1000)
	dao:未知暗殿召唤战神()
	dao:未知暗殿刷怪(1,60*60*5)	--刷未知暗殿5小时
	主线()	--5小时过后接着主线 到70级 
	
end








