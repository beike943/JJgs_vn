--¾°ÃÅÕóÁé
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\function\\zq_battles\\zq_head.lua")

function main()
	if gf_GetTaskBit(ZQ_BATTLE_TASK11, 17) ~= 1 then
		return 0;
	end
	local tSay = {
		"B¾t ®Çu tu söa/begin_repair_real",
		"\nTõ bá/give_up_exit",
		"T¹i h¹ chØ xem qua th«i/do_nothing",
	}
	if GetTrigger(1523 * 2) ~= 0 then
		tremove(tSay, 1);
	end
	Say(format("<color=green>C¶nh M«n TrËn Linh: <color>Phong Ên trªn C¶nh M«n ®· v« cïng yÕu råi, nÕu kh«ng tu söa l¹i, ma khİ sÏ trµn ra ngoµi. HiÖn ta kh«ng thÓ rêi khái ®Ó thu thËp c¸c nguyªn liÖu tu söa, %s cã thÓ gióp ta t×m c¸c nguyªn liÖu kh«ng? NÕu c¸c h¹ cã mang theo Ma Th¹ch, cã thÓ dïng Ma Th¹ch kĞo dµi thêi gian t×m nguyªn liÖu. Nguyªn liÖu dïng ®Ó tu söa r¬i r¶i r¸c xung quanh trËn nh·n, tr­íc tiªn cÇn t×m hiÓu ®¹i kh¸i vÒ c¸c nguyªn liÖu ph©n bè r¶i r¸c nµy, sau ®ã h·y b¾t ®Çu hç trî tu söa, tû lÖ thµnh c«ng sÏ cao h¬n.", gf_GetPlayerSexName()), getn(tSay), tSay);
end

function begin_repair_real()
	ZQ_RepairReal();
end

function give_up_exit()
	ZQ_RepairReal_GiveUp()
end

function do_nothing()
end