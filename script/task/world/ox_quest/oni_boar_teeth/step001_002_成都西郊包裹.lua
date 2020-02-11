-- 世界任务
-- 成都-峨嵋 主线任务
-- 任务起始

-- wq : World Quest
-- id : 0, 51, 61

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

function wq_ox_obt_001_002()
	-- 以下是触发控制部分
	RemoveTrigger(GetRunningTrigger())		-- 删除当前触发器
	CreateTrigger(4, 52, 61)
	--SetTask(111, 3)

	-- 以下是任务奖励部分
	AddItem(2, 0, 13, 1)					-- 得到任务道具 丢失的包裹
	
	-- 以下是文字显示部分
	TaskTip("Лa g鉯 h祅g cho th玭 d﹏.")
end