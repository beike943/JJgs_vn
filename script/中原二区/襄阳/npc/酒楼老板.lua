
-- ====================== Œƒº˛–≈œ¢ ======================

-- Ω£œ¿«È‘µonlineII æ∆¬•¿œ∞ÂΩ≈±æ
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\teach_main.lua");
Include("\\script\\task\\world\\¥Û¿Ì\\task_head.lua");
Include("\\script\\task\\world\\¥Û¿Ì\\lv58\\task_main.lua");
Include("\\script\\online_activites\\head\\acitivity_additional_head.lua")

function main()

	--ªÓ∂Øµƒ
	local tSay = {};
	local tActivityID = {132, 139};
	for k, v in tActivityID do
		tSay = aah_GetSayDialog(tonumber(v));
	end
	if getn(tSay) > 0 then
		tinsert(tSay, "Ra kh·i/nothing")
		Say("Kh∏ch quan Æ’n ti”u Æi’m t◊m r≠Óu th≠Óng hπng µ? B∂o Æ∂m sœ Æ≠Óc hµi lﬂng!", getn(tSay), tSay);
		return 
	end
	
	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	
	if (nState==12) then
		task_012_00();
		return
	end;
	
	if GetTask(TASK_DL_LV55_ID) == 7 and GetItemCount(2,0,377) < 1 then
		--∏˙œÂ—Ùæ∆¬•¿œ∞Â¬Ú”Ò¥¯∏‚              
		buy_gift_talk(4);
		return
	end;
	
	Talk(1,"","Kh∏ch quan Æ’n ti”u Æi’m t◊m r≠Óu th≠Óng hπng µ? B∂o Æ∂m sœ Æ≠Óc hµi lﬂng!");
	
end
