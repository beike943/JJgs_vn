--missionÄÚ°ï»á´óÊ¹npc
--·ÖÅäÉñÊŞ
--ÍË³ömission
Include("\\script\\missions\\tong_melee\\tm_head.lua")
Include("\\script\\lib\\talktmp.lua")

function main()
	local tSay = {
		"\n ph©n phèi ThÇn Thó/tm_assign_beast",
		"\n rót khái chiÕn tr­êng/tm_leave_battle",
		"\n T¹i h¹ chØ xem qua th«i/nothing",
	}
	Say(TM_TONG_AD_NPC.."Thêi gian cã h¹n, ®éi tr­ëng nhanh nhanh ph©n phèi thÇn thó, cuéc chiÕn s¾p ®­îc b¾t ®Çu!", getn(tSay), tSay);
end