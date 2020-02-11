-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 五毒教NPC尤榕Script
-- By StarryNight
-- 2006/02/09 PM 15:03

-- 这几天的心情充满阴霾

-- ======================================================

-- 入门门任务头文件
Include("\\script\\task\\faction\\faction_main_wp.lua"); 

function main()

local nTaskValue = GetTask(FN_WP);

	if nTaskValue == 4 then
		task_005();
		return
	end
	
	if nTaskValue == 5 then
		task_007();
		return
	else
		Say("T鑙 nay nh蕋 nh ph秈 th緉g h緉 1 l莕!",0);
	end
end;
