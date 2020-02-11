Include("\\script\\lib\\globalfunctions.lua")

function OnUse(nItem)
	local tAward = {
		{1, 70, "Huy Ch≠¨ng ßÂng Ch’", {0, 153, 1, 1}, 0},
		{1, 25, "Huy Ch≠¨ng Thi’t Ch’", {0, 153, 2, 1}, 0},
		{1, 5, "Huy Ch≠¨ng Ng‰c Ch’", {0, 153, 3, 1}, 0},
	}
	if GetFreeItemRoom() < 1 then
		Talk(1,"","Kh´ng gian hµnh trang kh´ng ÆÒ");
		return 0;
	end
	if DelItemByIndex(nItem, 1) == 1 then
		gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "TÛi Huy Ch≠¨ng DÚng S‹", "TÛi Huy Ch≠¨ng DÚng S‹");
	end
end