
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 镖师脚本
-- Edited by peres
-- 2005/02/22 PM 18:03
--Changed by joker(zhaoguichun)
--2006/09/04
--Changed point: add random boss

-- ======================================================

Include("\\script\\task\\teach\\teach_main.lua")

function main()

	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	
	if (nState==13) then
		task_013_00()
		return
	else
		Say("大家去 <color=yellow>成都<color>找镖师吧!",
			1,	
			"我知道了/Zgc_end_dialog"
		)
	end
	
end
