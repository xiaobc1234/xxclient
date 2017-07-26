
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


