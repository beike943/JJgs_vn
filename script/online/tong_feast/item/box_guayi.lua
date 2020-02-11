Include("\\script\\lib\\globalfunctions.lua")

function OnUse(nItem)
	if GetFreeItemRoom() < 1 then
		Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ");
		return 0;
	end
	local tAward = {
		{1, 30, "¸o Choµng T¹o Bè",     {0, 152, 1, 1}, 0},	
		{1, 30, "¸o Choµng CÈm §o¹n",     {0, 152, 2, 1}, 0},
		{1, 30, "¸o Choµng Háa V©n",     {0, 152, 3, 1}, 0},
		{1,  1, "¸o Choµng Ngò Hµnh Kim ChÕ", {0, 152, 4, 1}, 0},
		{1,  1, "¸o Choµng Ngò Hµnh Méc ChÕ", {0, 152, 5, 1}, 0},
		{1,  1, "¸o Choµng Ngò Hµnh Thñy ChÕ", {0, 152, 6, 1}, 0},
		{1,  1, "¸o Choµng Ngò Hµnh Háa ChÕ", {0, 152, 7, 1}, 0},
		{1,  1, "¸o Choµng Ngò Hµnh Thæ ChÕ", {0, 152, 8, 1}, 0},
		{1,  5, "¸o Choµng Ngò Hµnh ¢m ChÕ", {0, 152, 9, 1}, 0},
	}
	if DelItemByIndex(nItem, 1) == 1 then
		gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "R­¬ng ¸o Choµng", "D­ìng thµnh trang bÞ");
	end
end