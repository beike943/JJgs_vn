
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ·ş×°µêÀÏ°å½Å±¾
-- Edited by peres
-- 2005/02/22 PM 18:03
--*****************************************¶¨Òå³£Á¿¼°Ô¤´¦Àí*********************************
Include("\\script\\task\\teach\\teach_main.lua");
Include("\\script\\task\\lifeskill\\skill_lvlup.lua")
LEVELTASKID49=518					--»¨Áı°ÙÄñÈ¹
TASK_GATHER_FLAG=1931 --ÈÎÎñÎïÆ·²É¼¯±êÊ¾

strName = "";
strTitle = "";

--*****************************************MAINº¯Êı*****************************************
function main()
		strName = GetTargetNpcName();
		if random(1,15) == 1 then
			NpcChat(GetTargetNpc(),"Kh¶m n¹m linh th¹ch dïng ®Ó lµm trang bŞ B¸t Qu¸i ®· xuÊt hiÖn trªn giang hå, ta s¾p cã mèi lµm ¨n råi ®©y!");
		end;	
		if strName=="" or strName==nil then return end;
		strTitle = "<color=green>"..strName.."<color>: ";
		
		local nState = TE_GetTeachState()
		local nLevel = GetLevel()

	----------------------------------------------Ö÷¶Ô»°-----------------------------------------------
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

