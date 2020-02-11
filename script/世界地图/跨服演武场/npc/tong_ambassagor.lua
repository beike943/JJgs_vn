--¿ç·þ°ï»á´óÊ¹
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\missions\\tong_melee\\npc\\tm_main_npc.lua")

function main()
	local tSay = {
		"Lo¹n ChiÕn Bang Héi/tm_join_tong_melee",
		"\n T¹i h¹ chØ xem qua th«i/nothing",
	}
	Say("<color=green> §¹i Sø Bang Héi:<color>"..gf_GetPlayerSexName().."Mèn tham gia ho¹t ®éng nµo d­íi ®©y kh«ng?", getn(tSay), tSay);
end