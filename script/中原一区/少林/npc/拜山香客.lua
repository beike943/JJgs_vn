
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ÉÙÁÖÃÅÅÉÈÎÎñÏã¿Í½Å±¾ÎÄ¼ş
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================

Include("\\script\\task\\faction\\faction_main_sl.lua");

function main()

local nTaskValue = FN_GetTaskState(FN_SL);

	if (nTaskValue==4) then
		task_008();
		return
	elseif (nTaskValue==5) then
		task_010();
		return
	else
		Say("Kİnh phËt lµ ph¶i thµnh t©m, chĞn ch¸o l¹p b¸t nµy ta ph¶i ¨n th«i.",0);
	end
	
end;
