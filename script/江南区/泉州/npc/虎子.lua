-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ¶ëÃ¼ÃÅÅÉÈÎÎñ³É¶¼ÎŞÀµ½Å±¾ÎÄ¼ş
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================

Include("\\script\\task\\faction\\faction_main_em.lua");


function main()

local nTaskValue = FN_GetTaskState(FN_EM);
local strMain = {

		"Muéi muéi ®¸ng yªu qu¸….Nµo! Tíi ®©y ca ca h«n c¸i coi!",
		"Qu¶ nhiªn lµ ¸c ®å! §Ó ta cho ng­¬i biÕt lÔ ®é!"

	}
	if (nTaskValue==3) then
		TE_Talk(getn(strMain), "task_010", strMain);
		return
	else
		Say("Kh«ng cã g× th× biÕn ®i!",0);
	end

end