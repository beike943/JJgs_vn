--µ¹¼ÆÊ±¸´»î
--Ö±½Ó¸´»î»Øµ÷½Å±¾
--nReviveID¶¨ÒåÁËÔ­µØ¸´»îÀàĞÍ

--×Ô¶¨Òåº¯ÊıÊµÏÖ---------------------
function dr_revive_deal_1()
	RevivePlayer(0, PlayerIndex, 1); --ÂúÑª¸´»î
end

function dr_revive_deal_2()
	SendScript2VM("\\script\\missions\\eyt_battle\\eyt_head.lua", "eyt_Revive()");
end

--------------------------------------------
--nReviveIDÇø·Ö²»Í¬µÄ¸´»îÀàĞÍ£¨×ÔĞĞ¶¨Òå£©
--Ìõ¼ş¼ì²éºÍÏûºÄ£¬×´Ì¬µÈ¶¼ÔÚ_g_table_revive¶¨ÒåµÄº¯ÊıÄÚÍê³É
--³É¹¦·µ»Ø1£¬·ñÔòÊ§°Ü
_g_table_revive = {
	--[nReviveID] = {count, function}
	[1] = {dr_revive_deal_1, {2, 97, 236, 1, "Thiªn Kiªu LÖnh"}},  --ËÄÁéÊÔÁ¶¹Ø¿¨
	[2] = {dr_revive_deal_2, {2, 97, 236, 1, "Thiªn Kiªu LÖnh"}},  --¶÷Ô¹Ì¨
}

function OnRevive(nReviveID)
	--print(nReviveID);
	if not _g_table_revive[nReviveID] or getn(_g_table_revive[nReviveID]) ~= 2 then
		Say("Tr¹ng th¸i hiÖn t¹i kh«ng thÓ håi sinh!", 0);
		return 0;
	end
	
	local func = _g_table_revive[nReviveID][1];
	if type(func) ~= "function" then
		Say("Tr¹ng th¸i hiÖn t¹i kh«ng thÓ håi sinh!", 0);
		return 0;
	end	
	
	local tItem = _g_table_revive[nReviveID][2];
	if not tItem or type(tItem) ~= "table" or getn(tItem) ~= 5 then
		Say("Tr¹ng th¸i hiÖn t¹i kh«ng thÓ håi sinh!", 0);
		return 0;
	end

	local tSay = {
		format("\nX¸c nhËn/#dr_item_tjl_do(%d)", nReviveID),
		"\n hñy bá/nothing",
	}
	Say(format("§ång ı tiªu hao <color=gold>%s<color>*%d lËp tøc håi sinh kh«ng?", tItem[5], tItem[4]), getn(tSay), tSay);
end

function dr_item_tjl_do(nReviveID)
	local tItem = _g_table_revive[nReviveID][2];
	if GetItemCount(tItem[1], tItem[2], tItem[3]) < tItem[4] then
		Say(format("§¹o cô %s trong tói kh«ng ®ñ %d", tItem[5], tItem[4]), 0);
		return 0;
	end
	if DelItem(tItem[1], tItem[2], tItem[3], tItem[4]) ~= 1 then
		return 0;
	end
	Msg2Player(format("§· tiªu hao %s*%d", tItem[5], tItem[4]));
	
	--ÍêÁËÖ®ºó
	_g_table_revive[nReviveID][1]();

	return 1;
end

function nothing()
	--do nothing()
end
