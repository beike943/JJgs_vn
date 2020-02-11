-- IBÎïÆ·

Include("\\script\\lib\\globalfunctions.lua")

tIBItems = {
--	{{"Ğ¡°ü¾ÛÒåÁî",2,95,210},{"¾ÛÒåÁî",{2	,95,208,10}}},
--	{{"´ó°ü¾ÛÒåÁî",2,95,211},{"¾ÛÒåÁî",{2	,95,208,50}}},
--	{{"½ğµ°±¦Ïä",2,95,213},{"½ğµ°",{2,95,189,10}}},
--	{{"Ò»´üĞ¡½ğ´¸",2,95,215},{"Ğ¡½ğ´¸",{2,95,187,1}}},
--	{{"Ò»ºĞĞ¡½ğ´¸",2,95,216},{"Ğ¡½ğ´¸",{2,95,187,10}}},
--	{{"Ò»ÏäĞ¡½ğ´¸",2,95,217},{"Ğ¡½ğ´¸",{2,95,187,100}}},
--	{{"Ò»ºĞ·Å´ó¾µ",2,95,218},{"·Å´ó¾µ",{2,95,195,3}}},
--	{{"Ğ¡°üĞÂÄêĞíÔ¸É°",2,95,232},{"ĞÂÄêĞíÔ¸É°",{2,95,231,50}}},
--	{{"´ó°üĞÂÄêĞíÔ¸É°",2,95,233},{"ĞÂÄêĞíÔ¸É°",{2,95,231,250}}},
--	{{"Ğ¡ºĞÂéÉñ±ÊÂ¼",2,95,614},{"ÂéÉñ±ÊÂ¼",{2,95,613,10}}},
--	{{"´óºĞÂéÉñ±ÊÂ¼",2,95,615},{"ÂéÉñ±ÊÂ¼",{2,95,613,50}}},	
--	{{"Ğ¡°üÍ¨ÌìÁîÅÆ",2,95,660},{"Í¨ÌìÁîÅÆ",{2,95,621,10}}},
--	{{"´ó°üÍ¨ÌìÁîÅÆ",2,95,661},{"Í¨ÌìÁîÅÆ",{2,95,621,50}}},	
--	{{"ÌìÒõÒø·ûÓ¡°ü¹ü",2,95,670},{"ÌìÒõÒø·ûÓ¡",{2,95,619,10}}},
--	{{"ÌìÒõ½ğ·ûÓ¡°ü¹ü",2,95,671},{"ÌìÒõ½ğ·ûÓ¡",{2,95,620,10}}},	
--	{{"Ğ¡°üÕòÔ¶»»ïÚÁî",2,95,882},{"ÕòÔ¶»»ïÚÁî",{2,95,918,10}}},	
--	{{"´ó°üÕòÔ¶»»ïÚÁî",2,95,883},{"ÕòÔ¶»»ïÚÁî",{2,95,918,100}}},	
--	{{"Ğ¡°ü¶·ÆÇÁî",2,95,1516},{"¶·ÆÇÁî",{2,95,1511,50}}},	
--	{{"´ó°ü¶·ÆÇÁî",2,95,1517},{"¶·ÆÇÁî",{2,95,1511,250}}},
	{{"Bao Thiªn Kiªu LÖnh Nhá",2,95,2086},{"Thiªn Kiªu LÖnh",{2,97,236,10}}},	
	{{"Bao Thiªn Kiªu LÖnh Lín",2,95,2087},{"Thiªn Kiªu LÖnh",{2,97,236,50}}},	
}

function OnUse(nItemIdx)
	local nID1,nID2,nID3 = GetItemInfoByIndex(nItemIdx);
	local nType = 0;
	for i = 1,getn(tIBItems) do
		if nID1 == tIBItems[i][1][2] and nID2 == tIBItems[i][1][3] and nID3 == tIBItems[i][1][4] then
			nType = i;
			break;
		end
	end
	if nType == 0 then
		return 0;
	end
	local tSel = {
		format("HiÖn t¹i dïng/#onOpen(%d,%d)", nItemIdx,nType),
		"§ãng/nothing",
	}
	Say(format("Dïng %s sÏ nhËn ®­îc <color=yellow>%d c¸i %s<color>, muèn dïng ngay kh«ng??",tIBItems[nType][1][1],tIBItems[nType][2][2][4],tIBItems[nType][2][1]),
		getn(tSel), tSel);
end

function onOpen(nItemIdx,nType)
	if gf_JudgeRoomWeight(1, 100, "") ~= 1 then
		return 0;
	end
	if DelItemByIndex(nItemIdx, 1) == 1 then
		gf_SetLogCaption("open packed ib item:"..tIBItems[nType][1][1]);
		gf_AddItemEx(tIBItems[nType][2][2], tIBItems[nType][2][1]);
		gf_SetLogCaption("");
	end
end

