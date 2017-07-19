
local dao = require "data/DataCqws"


--------------------功能函数------------------------------

function 登录()
	dao:登录()
end

function 除魔5次()
	dao:降妖除魔5()
end

function 通天塔2次()
	dao:通天塔2次()
	--通天塔完后 喝酒
	sleep('马上喝酒',2000)
	dao:每日必做_喝酒()
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


