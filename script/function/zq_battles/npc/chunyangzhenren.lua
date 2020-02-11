Include("\\script\\function\\zq_battles\\zq_head.lua")

function main()
	if ZQ_JugdeCamp(LIAO_ID) == 1 then
		return 0;
	end
	local tSay = {};
	tSay = ZQ_TaskDialog(3, 2);
	tinsert(tSay, "\n T¹i h¹ chØ xem qua th«i/do_nothing");
	Say("<color=green>ThuÇn D­¬ng Ch©n Nh©n: <color>chiÕn tr­êng Thiªn M«n TrËn ®· bÞ ma hãa, bÇn ®¹o ph¶i hãa gi¶i nguy c¬ nµy nh­ thÕ nµo ®©y.", getn(tSay), tSay);
end

function do_nothing()
	--do nothing
end