
-- ====================== Œƒº˛–≈œ¢ ======================

-- Ω£œ¿«È‘µonlineII æ∆¬•¿œ∞ÂΩ≈±æ
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\teach_main.lua");
Include("\\script\\task\\world\\¥Û¿Ì\\task_head.lua");
Include("\\script\\task\\world\\¥Û¿Ì\\lv58\\task_main.lua");

function main()

	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	
	if (nState==12) then
		task_012_00();
		return
	end
	
	if GetTask(TASK_DL_LV55_ID) == 7 and GetItemCount(2,0,375) < 1 then
		--∏˙—Ô÷›æ∆¬•¿œ∞Â¬Ú»˝Ã◊—º              
		buy_gift_talk(2);
		return
	end
	
	Talk(1,"","Kh∏ch quan Æ’n ti”u Æi’m t◊m r≠Óu th≠Óng hπng µ? B∂o Æ∂m sœ Æ≠Óc hµi lﬂng!");
	
end;
