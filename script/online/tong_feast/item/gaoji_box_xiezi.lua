Include("\\script\\lib\\globalfunctions.lua")

function OnUse(nItem)
	if GetFreeItemRoom() < 1 then
		Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ");
		return 0;
	end
	local tAward = {
		{1, 10, "Giµy V¶i Th«",       {0, 154, 1, 1}, 0},	
		{1, 20, "Tinh TrÝ Bè Hµi",     {0, 154, 2, 1}, 0},
		{1, 35, "Bè ChÕ Cao §ång Ngoa",   {0, 154, 3, 1}, 0},
		{1,  4, "ChiÕn Hµi Kim ChÕ ngò hµnh", {0, 154, 4, 1}, 0},
		{1,  4, "ChiÕn Hµi Méc ChÕ ngò hµnh", {0, 154, 5, 1}, 0},
		{1,  4, "ChiÕn Hµi Thñy ChÕ ngò hµnh", {0, 154, 6, 1}, 0},
		{1,  4, "ChiÕn Hµi Háa ChÕ ngò hµnh", {0, 154, 7, 1}, 0},
		{1,  4, "ChiÕn Hµi Thæ ChÕ ngò hµnh", {0, 154, 8, 1}, 0},
		{1, 15, "ChiÕn Hµi ¢m ChÕ ngò hµnh", {0, 154, 9, 1}, 0},
	}
	if DelItemByIndex(nItem, 1) == 1 then
		gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "R­¬ng Giµy Cao CÊp", "D­ìng thµnh trang bÞ");
	end
end