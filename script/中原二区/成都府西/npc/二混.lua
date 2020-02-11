-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ¶ëÃ¼ÃÅÅÉÈÎÎñ³É¶¼ÎŞÀµ½Å±¾ÎÄ¼ş
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================

Include("\\script\\task\\faction\\faction_main_em.lua");

function OnDeath()

local nTaskValue = FN_GetTaskState(FN_EM);

	if (nTaskValue==3) then
		task_010();
		Msg2Player("Quay vÒ t×m Chu ThiÖn Nh©n!");
		Say("Quay vÒ t×m Chu ThiÖn Nh©n!",0);
	end

end;