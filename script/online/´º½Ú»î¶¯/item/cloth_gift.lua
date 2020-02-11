-- name: cloth_gift.lua
-- desc: ĞÂÄê×°ÀñºĞ(Ô½ÄÏ°æ)
-- auth: windle
-- date: 2008-1-4

Include("\\script\\lib\\globalfunctions.lua");

function OnUse(nIdx)
	Say("B¹n cã muèn sö dông kh«ng?",
		2,
		"Muèn/#use_gift("..nIdx..")",
		"Ta ch­a muèn sö dông./end_dialog")
end

-- ±ê×¼ÄĞĞÂÄêÃ±	
-- ±ê×¼ÄĞĞÂÄêÉÏ×°	
-- ±ê×¼ÄĞĞÂÄêÏÂ×°	
-- ¿ıÎàÄĞĞÂÄêÃ±	
-- ¿ıÎàÄĞĞÂÄêÉÏ×°	
-- ¿ıÎàÄĞĞÂÄêÏÂ×°	
-- ĞÔ¸ĞÅ®ĞÂÄêÃ±	
-- ĞÔ¸ĞÅ®ĞÂÄêÉÏ×°	
-- ĞÔ¸ĞÅ®ĞÂÄêÏÂ×°	
-- ½¿Ğ¡Å®ĞÂÄêÃ±	
-- ½¿Ğ¡Å®ĞÂÄêÉÏ×°	
-- ½¿Ğ¡Å®ĞÂÄêÏÂ×°	
tCloth = 
{
	{{0, 109, 114, 1, 1}, "Trang phôc xu©n kh«i ng«"},
	{{0, 109, 115, 1, 1}, "Trang phôc xu©n KiÒu n÷"},
	{{0, 109, 113, 1, 1}, "Trang phôc xu©n chuÈn"},
	{{0, 109, 116, 1, 1}, "Trang phôc xu©n gîi c¶m"},

};
function use_gift(nIdx)
	if gf_JudgeRoomWeight(2,10) ~= 1 then
		Msg2Player(STR_OVERWEIGHT);
		return
	end
	if DelItemByIndex(nIdx, 1) ~= 1 then
		return
	end
	local nItem = 0;
	gf_SetLogCaption("[viet_newyear][cloth_gift]");
	local nGiftType = random(1,getn(tCloth));
	local nRet, nItem = gf_AddItemEx(tCloth[nGiftType][1], tCloth[nGiftType][2]);
	if nRet ~= 0 and nItem ~= nil then
		nRet = gf_setItemExpireDate(nItem, 2008, 2, 29, 24);
		if nRet ~= 1 then
			WriteLog("[viet_newyear] limit date error: date = 2008, 2, 29, 24");
		end
	end

	gf_SetLogCaption("");
end

function end_dialog()
end

