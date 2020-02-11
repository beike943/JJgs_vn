Include("\\script\\ks2vng\\global\\playerlogout.lua")
-- 跨服时执行的脚本
Include("\\settings\\static_script\\exchg_server\\exchange_server_func.lua")
Include("\\script\\online\\tong_feast\\tf_head.lua")
Include("\\settings\\static_script\\global\\tonginfo_task.lua")
Include("\\script\\misc\\observer\\observer_head.lua")

-- 以下几个任务变量在\script\global\offlinelive_action.lua中定义！！
TASKVAL_BAIJU_LASTACTIVE_TIME = 2292		-- 记录最近一次获得白驹经验的时间
TASKVAL_LIUSHEN_LASTACTIVE_TIME = 2293		-- 记录最近一次获得六神经验的时间
TASKVAL_SANQING_LASTACTIVE_TIME = 2294		-- 记录最近一次获得三清经验的时间

function main()
	viet_playerlogout_main()

	if IsOfflineLive() == 0 then	-- 正常下线，更新最后一次获得白驹，三清，六神的时间
		local TimeNow = GetTime()
		SetTask(TASKVAL_BAIJU_LASTACTIVE_TIME, TimeNow)
		SetTask(TASKVAL_LIUSHEN_LASTACTIVE_TIME, TimeNow)
		SetTask(TASKVAL_SANQING_LASTACTIVE_TIME, TimeNow)
	end
	
	exgsvr_func_on_player_logout()
	
	--帮派宴会
	tf_PlayerLogout();
	
	--更新帮会信息到任务变量上
	_UpdateTongInfoToTask()
	Observer:onEvent(SYSEVENT_PLAYER_LOGOUT, 0)
end
