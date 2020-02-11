Include("\\script\\system_switch_config.lua")

--event ids see \script\misc\observer\observer_head.lua
-- 事件定义 --------------------------------------------------
-- 基础系统
--SYSEVENT_GAMESERVER_START           = 1	--gs启动事件
--SYSEVENT_PLAYER_LOGIN               = 2	--login事件
--SYSEVENT_PLAYER_LOGOUT              = 3	--logout事件
--SYSEVENT_DAILY_CLEAR                = 4	--每日清理事件
--SYSEVENT_WEEKLY_CLEAR               = 5	--每周清理事件
--SYSEVENT_MONTHLY_CLEAR              = 6	--每月清理事件
--关卡事件
--SYSEVENT_LIANGSHAN_STAGE_FINISH     = 101	--梁山
--SYSEVENT_LIANGSHAN_TASK_AWARD       = 102
--SYSEVENT_DIXUANGONG_STAGE_FINISH    = 101	--地玄宫
--SYSEVENT_DIXUANGONG_TASK_AWARD      = 102
--SYSEVENT_WANJIANZHONG_STAGE_FINISH  = 301	--万剑冢
--SYSEVENT_WANJIANZHONG_TASK_AWARD    = 302
--SYSEVENT_CANGJIAN_STAGE_FINISH      = 401	--藏剑山庄
--SYSEVENT_TAIYI_NOR_STAGE_FINISH     = 501	--太一塔
--SYSEVENT_TAIYI_HARD_STAGE_FINISH    = 502
----SYSEVENT_TAIYI_TASK_AWARD           = 503
--SYSEVENT_TAIXU_STAGE_FINISH         = 601	--太虚幻境

--SYSEVENT_GLOBAL_COST_IB         	= 10001	--消耗IB

--data maybe table/number
--function example_event_handler_gs_start1(id, data)
--end
--function example_event_handler_gs_start2(id, data)
--end

function ObserverImpt:ksg_reg()
	if OBSERVER_DEGUG == 1 then
		print(format("ObserverImpt:ksg_reg()"))
	end
	--self:register(OE_GameSvr_Startup, "vng_onstart1", example_event_handler_gs_start);
	--self:register(OE_GameSvr_Startup,	"vng_onstart2","\\script\\ks2vng\\misc\\observer\\observer_vng_reg.lua", "example_event_handler_gs_start2");

	self:register(SYSEVENT_PLAYER_LOGIN, "add_tifyzhiyin", add_tifyzhiyin)
	self:register(SYSEVENT_GLOBAL_COST_IB, "_on_cost_ib_item", _on_cost_ib_item)
end

function add_tifyzhiyin(id, data)
	if IsExpSvrSystemOpen() == 1 then
		--体服指引（正式版本要删除）---------------------------
    	if GetItemCount(2,1,30644) < 1 and GetFreeItemRoom() > 0 then
    		AddItem(2,1,30644,1)
    	end
	end
end

--消耗IB Item
function _on_cost_ib_item(id, data)
	local nG, nD, nP, nNum = data[1],data[2],data[3],data[4]
	nNum = nNum or 1
	if nG==2 and nD == 97 and nP == 236 then --天骄令
		--CDKey消耗的天骄令计数
		SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", format("_ck_SetCostIB(%d)", nNum))
	end
end
