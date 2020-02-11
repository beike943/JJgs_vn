-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII Îå¶¾½ÌNPC·½Ô³Script
-- By StarryNight
-- 2006/02/09 PM 14:19

-- µ±°®ÇéÓöÉÏÏÖÊµ¡­¡­

-- ======================================================

-- ÈëÃÅÃÅÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\faction\\faction_main_wp.lua"); 

function main()

local nTaskValue = GetTask(FN_WP);

	if nTaskValue == 2 then
		task_002();
		return
	end
	
	if nTaskValue == 3 then
		task_004();
		return
	end
	
	if nTaskValue == 4 then
		Say("Ng­¬i h·y ®i vÒ <color=yellow>phİa ®«ng<color> tiÓu lé sÏ gÆp ®­îc <color=yellow>V­u Dung<color>.",0);
		return
	end
	
	if GetPlayerFaction == 7 then
		Say("Nh×n g× thÕ! Mau tr¸nh ra!",0);
	else
		Say("Ch¼ng biÕt V­u Dung ®ang lo l¾ng chuyÖn g× n÷a, tèt nhÊt chí nªn ®Õn lµm phiÒn!",0);
	end
end;
