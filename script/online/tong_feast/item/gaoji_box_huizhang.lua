Include("\\script\\lib\\globalfunctions.lua")

function OnUse(nItem)
	if GetFreeItemRoom() < 1 then
		Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ");
		return 0;
	end
	local tAward = {
		{1, 10, "Huy Ch­¬ng §ång ChÕ",     {0, 153, 1, 1}, 0},	
		{1, 20, "Huy Ch­¬ng ThiÕt ChÕ",     {0, 153, 2, 1}, 0},
		{1, 35, "Huy Ch­¬ng Ngäc ChÕ",     {0, 153, 3, 1}, 0},
		{1,  4, "Huy Ch­¬ng Kim ChÕ ngò hµnh", {0, 153, 4, 1}, 0},
		{1,  4, "Huy Ch­¬ng Méc ChÕ ngò hµnh", {0, 153, 5, 1}, 0},
		{1,  4, "Huy Ch­¬ng Thñy ChÕ ngò hµnh", {0, 153, 6, 1}, 0},
		{1,  4, "Huy Ch­¬ng Háa ChÕ ngò hµnh", {0, 153, 7, 1}, 0},
		{1,  4, "Huy Ch­¬ng Thæ ChÕ ngò hµnh", {0, 153, 8, 1}, 0},
		{1, 15, "Huy Ch­¬ng ¢m ChÕ ngò hµnh", {0, 153, 9, 1}, 0},
	}
	if DelItemByIndex(nItem, 1) == 1 then
		gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "R­¬ng Huy Ch­¬ng Cao CÊp", "D­ìng thµnh trang bÞ");
	end
end