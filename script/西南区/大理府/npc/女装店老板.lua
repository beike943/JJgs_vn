
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ·ş×°µêÀÏ°å½Å±¾
-- Edited by Starry
-- 2006/04/12 PM 18:03

-- ======================================================
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");

function main()

 ----------------------------------76¼¶ÎäÆ÷Åä·½É½Ê¨¾«Æ¤ÈÎÎñ----------------------------------
	local nSkillGenre,nSkillDetail = GetMainLifeSkill();
	local nSkillLevel = GetLifeSkillLevel(nSkillGenre,nSkillDetail);
	local nTaskState_shanshi = GetTask(TASK_WEAVE_SHANSHI);
	if random(1,15) == 1 then
		NpcChat(GetTargetNpc(),"Kh¶m n¹m linh th¹ch dïng ®Ó lµm trang bŞ B¸t Qu¸i ®· xuÊt hiÖn trªn giang hå, ta s¾p cã mèi lµm ¨n råi ®©y!");
	end;			
		if nSkillGenre == 1 and nSkillDetail == 5 and nSkillLevel >= 79 then
			--ÓëÅ®×°µêÀÏ°å¶Ô»°
			if nTaskState_shanshi == 1 then
				weave_shanshi_003()
				return
			--ÉÏ½»ÒÂ·ş
			elseif nTaskState_shanshi == 2 then
				weave_shanshi_004()
				return
			--Î´»ØÈ¥»Ø¸´½õÄï
			elseif nTaskState_shanshi == 3 then
				weave_shanshi_006()
				return
			end 
		end
		
		Sale(34)
		
end;
