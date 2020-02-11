Include("\\script\\lib\\globalfunctions.lua");

g_tbItem = 
{
	[1] = {2,1,595,"R­¬ng B¸u Tèng Nguyªn ",10},
	[2] = {2,1,596,"R­¬ng B¸u §¹i Tèng Nguyªn ",200},
}

function OnUse(nItemIdx)
	local nIdx = get_item_index(nItemIdx);
	if nIdx == 0 then
		Talk(1,"","C¸i b¹n ®ang sö dông kh«ng ph¶i bÊt kú lo¹i nµo thuéc R­¬ng B¸u Tèng Nguyªn.");
		return 0;
	end;
	local selTab = {
			format("§ång ý/#use(%d,%d)",nItemIdx,nIdx),
			"Hñy bá/nothing",
			}
	Say("B¹n muèn më <color=yellow>"..g_tbItem[nIdx][4].."<color>? B¹n sÏ nhËn ®­îc <color=yellow>"..g_tbItem[nIdx][5].." Tèng Nguyªn Th«ng B¶o<color>.",getn(selTab),selTab);
end;

function get_item_index(nItemIdx)
	local nID1,nID2,nID3 = GetItemInfoByIndex(nItemIdx);
	for i=1,getn(g_tbItem) do
		if nID1 == g_tbItem[i][1] and nID2 == g_tbItem[i][2] and nID3 == g_tbItem[i][3] then
			return i;
		end;
	end;
	return 0;
end;

function use(nItemIdx,nIdx)
	local szPacketName = g_tbItem[nIdx][4];
	if gf_JudgeRoomWeight(2,10) == 0 then
		Talk(1,"","Hµnh trang vµ søc lùc kh«ng ®ñ, ®iÒu chØnh l¹i hµnh trang råi më"..szPacketName.."!");
		return 0;
	end;	
	if DelItemByIndex(nItemIdx,1) == 1 then
		local nNum = g_tbItem[nIdx][5];
		local nRetCode = AddItem(2,1,594,nNum);
		if nRetCode == 1 then
			Msg2Player("B¹n ®· më"..szPacketName..", nhËn ®­îc "..nNum.." Tèng Nguyªn Th«ng B¶o ");
			WriteLog("[R­¬ng B¸u Tèng Nguyªn ]"..GetName().." ®· më "..szPacketName);
		else
			WriteLog("[Tèng Nguyªn R­¬ng B¸u B¸o lçi ]:"..GetName().."Më"..szPacketName.." bÞ lçi, nRetCode:"..nRetCode);
		end;
	end;
end;