Include("\\script\\lib\\globalfunctions.lua")

function OnUse(nItem)
	local tAward = {
		{1, 50, "Huy Ch≠¨ng ßÂng Ch’", {0, 153, 1, 1}, 0},
		{1, 30, "Huy Ch≠¨ng Thi’t Ch’", {0, 153, 2, 1}, 0},
		{1, 14, "Huy Ch≠¨ng Ng‰c Ch’", {0, 153, 3, 1}, 0},
		{1, 1, "Huy Ch≠¨ng Kim Ch’ ngÚ hµnh", {0, 153, 4, 1}, 0, 0, 0, 1},
		{1, 1, "Huy Ch≠¨ng MÈc Ch’ ngÚ hµnh", {0, 153, 5, 1}, 0, 0, 0, 1},
		{1, 1, "Huy Ch≠¨ng ThÒy Ch’ ngÚ hµnh", {0, 153, 6, 1}, 0, 0, 0, 1},
		{1, 1, "Huy Ch≠¨ng H·a Ch’ ngÚ hµnh", {0, 153, 7, 1}, 0, 0, 0, 1},
		{1, 1, "Huy Ch≠¨ng ThÊ Ch’ ngÚ hµnh", {0, 153, 8, 1}, 0, 0, 0, 1},
		{1, 1, "Huy Ch≠¨ng ¢m Ch’ ngÚ hµnh", {0, 153, 9, 1}, 0, 0, 0, 1},
	}
	if GetFreeItemRoom() < 1 then
		Talk(1,"","Kh´ng gian hµnh trang kh´ng ÆÒ");
		return 0;
	end
	if DelItemByIndex(nItem, 1) == 1 then
		gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "TÛi Huy Ch≠¨ng Anh HÔng", "TÛi Huy Ch≠¨ng Anh HÔng");
	end
end