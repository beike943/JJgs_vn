-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 峨眉门派任务成都无赖脚本文件
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================

Include("\\script\\task\\faction\\faction_main_em.lua");


function main()

local nTaskValue = FN_GetTaskState(FN_EM);
local strMain = {

		"我好可爱...嘿！ 来这里!",
		"好啊!"

	}
	if (nTaskValue==3) then
		TE_Talk(getn(strMain), "task_010", strMain);
		return
	else
		Say("没事走开...!",0);
	end

end