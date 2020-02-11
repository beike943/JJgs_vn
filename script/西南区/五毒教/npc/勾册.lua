-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII Îå¶¾½ÌNPC¹´²áScript
-- By StarryNight
-- 2006/02/09 PM 14:12

-- °®Çé×ÔÓÉÈô¿É½ÔµÃ¸Ê¾ÍºÃÁË

-- ======================================================

-- ÈëÃÅÃÅÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\faction\\faction_main_wp.lua"); 
Include("\\script\\task\\faction_back_room\\npc_master.lua");
g_szThisFile = "\\script\\Î÷ÄÏÇø\\Îå¶¾½Ì\\npc\\¹´²á.lua";	--Ä¬ÈÏÖµ
g_szInforHeader = "<color=green>C©u S¸ch<color>:";	--Ä¬ÈÏÖµ
g_nBackRoomEntryType = 1;	--Èë¿ÚÀàĞÍ£¬·ÖÁ½ÖÖ¡£1±íÊ¾´ÓÊ¦¸µ´¦½øÈë£¬2±íÊ¾´ÓµÀ¾ß´¦½øÈë

function main()

local nTaskValue = GetTask(FN_WP);

	if nTaskValue == 1 then
		task_001();
		return
	end
	
	if nTaskValue == 2 then
		Say("<color=yellow>Ph­¬ng Viªn<color> ë <color=yellow>phßng bªn<color> ®ã!",0);
		return
	end
	
	if nTaskValue == 6 then
		task_010();
		return
	end
	
	if nTaskValue == 7 then
		Say("Ng­¬i cã thÓ ®Õn gÆp <color=yellow>B¹ch gi¸o chñ<color>.",0);
		return
	else
		backroom_main();
	end
end;
