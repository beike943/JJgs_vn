
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 饰品店老板脚本
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\teach_main.lua");

function main()

	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	
	if (nState==3) then
	
		task_003_00();
		return
	
	else
	
		Sale(39);
	
	end;
	
end;
