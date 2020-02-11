
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII Ò©µêÀÏ°å½Å±¾
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\teach_main.lua");


function main()

	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
--	Restore()    --»Ö¸´Íæ¼ÒµÄÉúÃü
--	RestoreNeili()   --»Ö¸´Íæ¼ÒµÄÄÚÁ¦£¨È«Âú£©
--	RestoreStamina()    --»Ö¸´Íæ¼ÒµÄÌåÁ¦£¨È«Âú£©
	if random(1,15) == 1 then
		NpcChat(GetTargetNpc(),"Giang hå hçn lo¹n, nghe nãi T©y B¾c l¹i b¾t ®Çu lén xén, ta s¾p cã mèi lµm ¨n míi ®©y!");
	end;		
	if (nState==4) then
	
		task_004_00();
		return

	else
		
		Sale(30);

	end;
	
	return

end;

