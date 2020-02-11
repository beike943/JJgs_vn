
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ÎäÊ¦½Å±¾
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\teach_main.lua");


function main()
	 if GetAntiEnthrallmentStatus() > 1 then
	 	Talk(1,"","§· qu¸ 5 giê ch¬i, kh«ng thÓ häc vâ c«ng n÷a, h·y nghØ ng¬i ®Ó gi÷ g×n søc kháe!")
	 	return
	 end
	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	
	if (nState==9) then
		task_009_00();
		return
		
	elseif (nState>9) then
	
		if GetSkillLevel(20) ==0 then
		
			Say("Ta ®©y lµ tæng gi¸o ®Çu cña 80 v¹n cÊm qu©n, giang hå ®Ønh ®Ønh ®¹i danh lµ t©n thñ vâ s­. ChØ cÇn cã 5 l­îng b¹c, ta sÏ d¹y ng­¬i thuËt khinh c«ng. Ch¼ng hay ng­¬i cã høng thó kh«ng?",
				2,
				"Ta muèn häc khinh c«ng./yes_skill",
				"Ta kh«ng cã høng thó!/no_skill");
				return
				
		
		else
		
			Talk(1,"","KÎ ®Õn b¸i s­ häc nghÖ kh¸ nhiÒu, giang hå ngµy sau sÏ rÊt n¸o nhiÖt!");
			return
			
		end;
	
	elseif (nState<9) then
	
		Talk(1,"","KÎ ®Õn b¸i s­ häc nghÖ kh¸ nhiÒu, giang hå ngµy sau sÏ rÊt n¸o nhiÖt!");
		return		
		
	end;

end


function yes_skill()

	if GetCash()<500 then 
		Talk(1,"","Mang tiÒn ®ñ míi cã thÓ häc vâ c«ng!");
		return
	else
		Pay(500);
		Talk(1,"","ThÊy ch­a? Cã tiÒn th× chuyÖn g× còng lµm ®­îc!");
		LearnSkill(20);
		TaskTip("B¹n häc ®­îc kü n¨ng Khinh c«ng!");
		return
	end;
	
end;

function no_skill()

end;
