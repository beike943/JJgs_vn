--¿ç·þ¹¦ÄÜÁì½±npc
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\missions\\kuafu_battle\\npc\\kf_jieyinren.lua")
Include("\\script\\missions\\tong_melee\\npc\\tm_main_npc.lua")

function main()
	local tSay = {
		"ChiÕn tr­êng liªn ®Êu/jyr_main_lingjiang",
		"Lo¹n chiÕn bang héi/tm_award_tong_melee",
		"\n T¹i h¹ chØ xem qua th«i/nothing",
	}
	Say("<color=green> Ng­êi NhËn Th­ëng Liªn Server:<color>"..gf_GetPlayerSexName().."Muèn nhËn th­ëng liªn server nµo?", getn(tSay), tSay);
end