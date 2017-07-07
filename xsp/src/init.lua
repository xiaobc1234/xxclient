-- 初始化 所有全局变量
require "utils/DeviceCheck"


--截图全局变量---
--publicPath="/data/data/com.xxscript.idehelper/tengine/public/"--截图保存路径
httpHost = "http://10.1.1.105:8888"--设置请求接口host

--框架全局变量---------
appAlias="cqtx"--应用别名用于请求服务端任务
taskLock=false--任务锁，false表示没有任务正在进行，true表示任务正在执行中

_debug = true--定义全局debug模式





--定义一些全局的变量
--_isPhone=true--是否手机，false为模拟器  会出现部分共能出不来的情况，做兼容
--通天塔是否左移了一段距离=false--是否已经左移一段距离
--delay=0
--重复超时次数=10
--个人火龙=1--个人火龙一次
--个人魔龙=1--个人魔龙一次
--个人牛魔=1--个人牛魔一次




local w_,h_ = getScreenSize() --w < h
local h = w_
local w = h_

_device = getCurrentDevice()

local supportSize = (_device > 0) --检测是否支持该分辨率
if not supportSize then
  
  dialog("不支持当前分辨率".."宽:"..w..",高:"..h, 8)
  lua_exit()
end

if _device == 5 then
  sysLog("宽:"..w..",高:"..h)
--  setScreenScale(720,1280)  640*1136->5c
end


init("",1);

yes,config=showUI("ui.json");
if yes==0 then 
    toast("您选择了取消，停止脚本运行")
    lua_exit()
end




tip =  createHUD() --定义一个全局的hud
--黑底 绿字
function showTip(title)
  showHUD(tip,title,12,"0xff00ff00","0xb3000000",2,0,(w_-22),h_/2,22)
  --		hideHUD(hud)
end

--黑底
function showClickView(x,y)
	local clickView =  createHUD()
  showHUD(clickView,"",12,"0xff00ff00","0xb3000000",0,x,y,20,20)
	mSleep(200)
  hideHUD(clickView)
end





