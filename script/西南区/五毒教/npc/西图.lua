-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII Îå¶¾½ÌNPCÎ÷Í¼Script
-- By StarryNight
-- 2006/02/09 PM 15:19

-- Ö±Ãæ×Ô¼ºµÄÄÚĞÄ°É£¡

-- ======================================================

-- ÈëÃÅÃÅÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\faction\\faction_main_wp.lua"); 

function main()

local nTaskValue = GetTask(FN_WP);

	if nTaskValue == 5 then
		task_008();
		return
	end
	
	if nTaskValue == 6 then
		Say("Ng­¬i h·y mau t×m gÆp <color=yellow>C©u S¸ch<color>.",0);
	else
		Say("Ch÷ H¸n thËt khã hiÓu, h·y ®i hái C©u S¸ch!",0);
	end
end;
