
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ÃÅÅÉ½ÓÒıÈË½Å±¾
-- Edited by peres
-- 2005/02/22 PM 18:03

-- Modify by yanjun
--2008/06/02 AM 11:43

-- ======================================================

Include("\\script\\task\\teach\\teach_main.lua");
Include("\\script\\task\\faction\\faction_head.lua");

--=============================================================================
function main()
	if random(1,15) == 1 then
		NpcChat(GetTargetNpc(),"Linh Th¹ch xuÊt hiÖn trªn giang hå, kh¾p n¬i bang ph¸i tranh hïng, kh«ng biÕt ®©y lµ phóc hay lµ häa cho giíi vâ l©m!");
	end;
	list_content(1);
end;

