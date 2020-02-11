Include("\\script\\lib\\globalfunctions.lua")

function OnUse(nItem)
	local tAward = {
		{1, 50, "CÊp 1 TÈy T©m Th¹ch", {2, 1, 30521, 1}, 0},
		{1, 30, "CÊp 2 TÈy T©m Th¹ch", {2, 1, 30522, 1}, 0},
		{1, 15, "CÊp 3 TÈy T©m Th¹ch", {2, 1, 30523, 1}, 0},
		{1, 5, "TÈy T©m Th¹ch cÊp 4", {2, 1, 30524, 1}, 0},
	}
	if GetFreeItemRoom() < 1 then
		Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ");
		return 0;
	end
	if GetItemCount(2,1,30538) < 1 then
		Talk(1,"",format("Trong hµnh trang kh«ng cã <color=red>%s<color>, kh«ng thÓ më %s", "BÝ Ng©n To¶n", "TÈy T©m Th¹ch Kho¸ng"));
		return 0;
	end
	if DelItemByIndex(nItem, 1) == 1 and DelItem(2, 1, 30538, 1) ==  1 then
		gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "TÈy T©m Th¹ch Kho¸ng", "TÈy T©m Th¹ch Kho¸ng");
	end
end