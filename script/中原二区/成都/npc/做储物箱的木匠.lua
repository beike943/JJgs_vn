
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 教育任务木匠脚本
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\maintask.lua");


function main()

	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	
	if (nState==16) then
	
		Teach_Level06_04()
		
	elseif (nState==17) then
	
		Teach_Level06_05()
	
	else
	
		Teach_Level06_04()
	
	end
	
	return

end