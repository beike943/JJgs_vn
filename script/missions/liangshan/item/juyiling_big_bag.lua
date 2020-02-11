--½Å±¾¹¦ÄÜ£º´ó°ü¾ÛÒåÁîÊ¹ÓÃ½Å±¾£¨»ñµÃ50¸ö¾ÛÒåÁî£©
--¹¦ÄÜÉè¼Æ£º´óĞÜ
--¹¦ÄÜ¿ª·¢£º´å³¤
--¿ª·¢Ê±¼ä£º2011-6-10
--ĞŞ¸Ä¼ÇÂ¼£º
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\missions\\liangshan\\head.lua")
tbItemString = {
	[1] = "Bao Tô NghÜa LÖnh lín",
	[2] = {TJYLInfo[1],TJYLInfo[2],TJYLInfo[3],50,TJYLInfo[4]},
	[4] = "<color=green>Th«ng b¸o<color>: më %s cã thÓ nhËn ®­îc<color=green>%d<color> <color=green>%s<color> <color=red>%s<color>, x¸c ®Şnh muèn më?",
	[5] = "(Khãa)",
	[6] = "X¸c nhËn më",
	[7] = "Tho¸t",
}
function OnUse(nItemIndex)
	Say(format(tbItemString[4],tbItemString[1],tbItemString[2][4],tbItemString[2][5],tbItemString[5]),
		2,
		tbItemString[6].."/#use_deal("..nItemIndex..")",
		tbItemString[7].."/nothing"
	)
end
--ÊÔÓÃ´¦Àí
function use_deal(nItemIndex)
	if gf_JudgeRoomWeight(1,0,"") ~= 1 then
		return
	end
	
	if DelItemByIndex(nItemIndex,1) == 1 then
		gf_AddItemEx2({tbItemString[2][1],tbItemString[2][2],tbItemString[2][3],tbItemString[2][4]}, "Tô NghÜa LÖnh", LUONGSON_LOG_TITLE, "nhËn")
		
--		local bAddFlag = AddItem(tbItemString[2][1],tbItemString[2][2],tbItemString[2][3],tbItemString[2][4])
--		local szquantity = "chg_suc"
--		if bAddFlag ~= 1 then
--			szquantity = "chg_fail:"..bAddFlag
--		end
--		gf_WriteLogEx("LS_mission","item_chg(2,95,210->2,95,208,50)",szquantity,tbItemString[1])
	end
end
function nothing()
end