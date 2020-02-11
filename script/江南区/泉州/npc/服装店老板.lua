
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ·ş×°µêÀÏ°å½Å±¾
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\teach_main.lua");


function main()

	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	if random(1,15) == 1 then
		NpcChat(GetTargetNpc(),"Kh¶m n¹m linh th¹ch dïng ®Ó lµm trang bŞ B¸t Qu¸i ®· xuÊt hiÖn trªn giang hå, ta s¾p cã mèi lµm ¨n råi ®©y!");
	end;	
	
	if (nState==2) and (GetSex()== 2) then
	
		task_002_00_female();
		return
	
	else
		i=random(1,3)
		if (i == 1) then
			Sale(34)
		elseif (i == 2) then
			Sale(34)
		else
			Sale(34)
		end
	end
	return
end;
