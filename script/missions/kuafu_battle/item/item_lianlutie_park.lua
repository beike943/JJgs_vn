Include("\\script\\lib\\globalfunctions.lua")

function OnUse(nItem)
	local tAward = {
		{1, 50, "CÊp 1 LuyÖn L« ThiÕt", {2, 1, 30527, 1}, 0},
		{1, 30, "CÊp 2 LuyÖn L« ThiÕt", {2, 1, 30528, 1}, 0},
		{1, 15, "CÊp 3 LuyÖn L« ThiÕt", {2, 1, 30529, 1}, 0},
		{1, 5, "LuyÖn L« ThiÕt cÊp 4", {2, 1, 30530, 1}, 0},
	}
	if GetFreeItemRoom() < 1 then
		Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ");
		return 0;
	end
	if GetItemCount(2,1,30539) < 1 then
		Talk(1,"",format("Trong hµnh trang kh«ng cã <color=red>%s<color>, kh«ng thÓ më %s", "Bİ Ng©n Chïy", "LuyÖn L« ThiÕt Kho¸ng"));
		return 0;
	end
	if DelItemByIndex(nItem, 1) == 1 and DelItem(2, 1, 30539, 1) ==  1 then
		gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "LuyÖn L« ThiÕt Kho¸ng", "LuyÖn L« ThiÕt Kho¸ng");
	end
end