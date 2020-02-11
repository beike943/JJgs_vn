--½Å±¾¹¦ÄÜ£ºÎåĞĞ±¦ÏäÊÔÓÃ½Å±¾£¨»ñµÃ9¸öÎåĞĞĞşÊ¯£©
--¹¦ÄÜÉè¼Æ£º´óĞÜ
--¹¦ÄÜ¿ª·¢£º´å³¤
--¿ª·¢Ê±¼ä£º2011-5-25
--ĞŞ¸Ä¼ÇÂ¼£º
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\missions\\liangshan\\head.lua");
tbTWLXItemString = {
	[1] = "Ngò hµnh b¶o r­¬ng ",
	[2] = {2,1,30302,9,"Ngò Hµnh HuyÒn Th¹ch"},
	[4] = "<color=green>Th«ng b¸o<color>: më %s cã thÓ nhËn ®­îc<color=green>%d<color> <color=green>%s<color> <color=red>%s<color>, x¸c ®Şnh muèn më?",
	[5] = "(Khãa)",
	[6] = "X¸c nhËn më",
	[7] = "Tho¸t",
}
function OnUse(nItemIndex)
	Say(format(tbTWLXItemString[4],tbTWLXItemString[1],tbTWLXItemString[2][4],tbTWLXItemString[2][5],tbTWLXItemString[5]),
		2,
		tbTWLXItemString[6].."/#use_deal("..nItemIndex..")",
		tbTWLXItemString[7].."/nothing"
	)
end
--ÊÔÓÃ´¦Àí
function use_deal(nItemIndex)
	if gf_JudgeRoomWeight(1,0,"") ~= 1 then
		return
	end
	
	if DelItemByIndex(nItemIndex,1) == 1 then
		gf_AddItemEx2({tbTWLXItemString[2][1],tbTWLXItemString[2][2],tbTWLXItemString[2][3],tbTWLXItemString[2][4]}, tbTWLXItemString[2][5], LUONGSON_LOG_TITLE, "nhËn")
		
--		local bAddFlag = AddItem(tbTWLXItemString[2][1],tbTWLXItemString[2][2],tbTWLXItemString[2][3],tbTWLXItemString[2][4])
--		local szquantity = "chg_suc"
--		if bAddFlag ~= 1 then
--			szquantity = "chg_fail:"..bAddFlag
--		end
--		gf_WriteLogEx("LS_mission","item_chg(2,1,30320->2,1,30308,9)",szquantity,tbTWLXItemString[1])
	end
end
function nothing()
end