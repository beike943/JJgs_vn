-- name: mouse_litter_gift.lua
-- desc: ÐÂÄêÐ¡ºì°ü(Ô½ÄÏ°æ)
-- auth: windle
-- date: 2008-1-4

Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\´º½Ú»î¶¯\\newyear_head.lua");

function OnUse(nIdx)
	Say("B¹n cã muèn sö dông kh«ng?",
		2,
		"Muèn/#use_gift("..nIdx..")",
		"Ta ch­a muèn sö dông./end_dialog")
end

-- 5.000 ¾­Ñé	
-- 10.000 ¾­Ñé	
-- 15.000 ¾­Ñé	
-- 1 ½ð	
-- 2µãÉùÍû	
-- 4µãÉùÍû	
-- 6µãÉùÍû	
-- 8µãÉùÍû	
function use_gift(nIdx)
	local nDate = tonumber(date("%Y%m%d"))
	if nDate > 20080229 then
		Msg2Player("VËt phÈm ®· qu¸ h¹n, kh«ng thÓ sö dông.");
		return
	end
	if GetTask(TASKID_OPEN_LITTER_GIFT) >= nDate then
		Msg2Player("Mçi ngµy mçi nh©n vËt chØ cã thÓ sö dông 1 lÇn!");
		return
	end
	if DelItemByIndex(nIdx, 1) ~= 1 then
		return
	end

	SetTask(TASKID_OPEN_LITTER_GIFT, nDate);

	gf_SetLogCaption("[viet_newyear][mouse_litter_gift]");
	local nGiftType = random(1,8);
	if nGiftType == 1 then
		gf_Modify("Exp", 5000);
	elseif nGiftType == 2 then
		gf_Modify("Exp", 10000);
	elseif nGiftType == 3 then
		gf_Modify("Exp", 15000);
	elseif nGiftType == 4 then
		gf_Modify("Money", 10000);
	elseif nGiftType == 5 then
		gf_Modify("Rep", 2);
	elseif nGiftType == 6 then
		gf_Modify("Rep", 4);
	elseif nGiftType == 7 then
		gf_Modify("Rep", 6);
	elseif nGiftType == 8 then
		gf_Modify("Rep", 8);
	else
		print("[mouse_litter_gift]Kh«ng thÓ ®Õn ®©y nhÐ.!!!");
	end		
	gf_SetLogCaption("");
end

function end_dialog()
end

