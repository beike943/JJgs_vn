
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 丐帮门派任务尤知味脚本文件
-- Edited by peres
-- 2005/02/17 PM 18:03
-- 村长：2011-4-2将师门售卖NPC功能整理
-- ======================================================

Include("\\script\\task\\faction\\faction_main_gb.lua");
Include("\\script\\faction\\npc\\buy_sell_main.lua")

function main()
	local nTaskValue = FN_GetTaskState(FN_GB);
	if (nTaskValue==1) and (GetItemCount(2,1,12)>=1) then
		task_004();
		return
	else
		local sDiaHead,tDiaSel = faction_buysell_main(4)
		Say(sDiaHead,getn(tDiaSel),tDiaSel)
	end
end
