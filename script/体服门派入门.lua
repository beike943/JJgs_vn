--
Include("\\script\\task\\world\\task_head.lua")

function main()
	local szNot = {
		"<sex> ®· gia nhËp m«n ph¸i."
	};
	if GetPlayerFaction() == 0 then
		Select_mp();
	else
		TalkEx("", szNot);
	end;
end;

function Select_mp()
	local szSay = {
		"<sex> muèn gia nhËp m«n ph¸i nµo?",
		"ThiÕu L©m./join_sl",
		"Vâ §ang./join_wd",
		"Nga My./join_em",
		"C¸i Bang./join_gb",
		"§­êng M«n./join_tm",
		"Ta ch­a muèn gia nhËp m«n ph¸i!/end_say"
	};
	
	SelectSay(szSay);
end;

function join_sl()
	local szNot = {
		"ThiÕu L©m kh«ng nhËn n÷ ®Ö tö. <sex> xin chän m«n ph¸i kh¸c!"
	};
	if GetSex()==2 then
		TalkEx("Select_mp", szNot);
		return
	end;
	
	if GetPlayerFaction() ~= 0 then
		return
	end;
	
	local szSay = {
		"<sex> muèn gia nhËp hÖ ph¸i nµo cña ThiÕu L©m?",
		"ThiÕu L©m vâ t¨ng/enter_mp(4)",
		"ThiÕu L©m thiÒn t¨ng/enter_mp(3)",
		"ThiÕu L©m tôc gia/enter_mp(2)",
		"Ta kh«ng muèn gia nhËp ThiÕu L©m./end_say"
	};
	
	SelectSay(szSay);
end;

function join_wd()
	if GetPlayerFaction() ~= 0 then
		return
	end;
	
	local szSay = {
		"<sex> muèn gia nhËp hÖ ph¸i nµo cña Vâ §ang?",
		"Vâ §ang ®¹o gia/enter_mp(14)",
		"Vâ §ang tôc gia/enter_mp(15)",
		"Ta kh«ng muèn gia nhËp Vâ §ang./end_say"
	};
	
	SelectSay(szSay);
end;

function join_em()
	local szNot = {
		"Nga My kh«ng nhËn nam ®Ö tö. <sex> xin chän m«n ph¸i kh¸c!"
	};
	if GetSex() == 1 then
		TalkEx("Select_mp", szNot);
		return
	end;
	
	if GetPlayerFaction() ~= 0 then
		return
	end;
	
	local szSay = {
		"<sex> muèn gia nhËp hÖ ph¸i nµo cña Nga My?",
		"Nga My phËt gia/enter_mp(8)",
		"Nga My tôc gia/enter_mp(9)",
		"Ta kh«ng muèn gia nhËp Nga My./end_say"
	};
	
	SelectSay(szSay);
end;

function join_gb()
	if GetPlayerFaction() ~= 0 then
		return
	end;
	
	local szSay = {
		"<sex> muèn gia nhËp hÖ ph¸i nµo cña C¸i Bang?",
		"C¸i Bang TÜnh y/enter_mp(11)",
		"C¸i Bang ¤ Y/enter_mp(12)",
		"Ta kh«ng muèn gia nhËp C¸i Bang./end_say"
	};
	SelectSay(szSay);
end;

function join_tm()
	if GetPlayerFaction() ~= 0 then
		return
	end;
	
	local szSay = {
		"<sex> muèn gia nhËp §­êng M«n kh«ng?",
		"Ta muèn gia nhËp./enter_mp(6)",
		"Ta kh«ng muèn gia nhËp./end_say"
	};
	SelectSay(szSay);
end;

function enter_mp(nRoute)
	local nBegin = 0;
	local nEnd = 0;
	local szTable = {};
	
	szTable[2] = "ThiÕu L©m tôc gia";
	szTable[3] = "ThiÕu L©m thiÒn t¨ng";
	szTable[4] = "ThiÕu L©m vâ t¨ng";

	szTable[14] = "Vâ §ang ®¹o gia";
	szTable[15] = "Vâ §ang tôc gia";
	
	szTable[8] = "Nga My phËt gia";
	szTable[9] = "Nga My tôc gia";
	
	szTable[11] = "C¸i Bang TÜnh y";
	szTable[12] = "C¸i Bang ¤ Y";
	
	szTable[6] = "§­êng M«n";
	
	if nRoute == 2 then
		nBegin = 21;
		nEnd = 32;
	elseif nRoute == 3 then
		nBegin = 45;
		nEnd = 57;
	elseif nRoute == 4 then
		nBegin = 33;
		nEnd = 44;
	elseif nRoute == 14 then
		nBegin = 125;
		nEnd = 146;
	elseif nRoute == 15 then
		nBegin = 147;
		nEnd = 159;
	elseif nRoute == 8 then
		nBegin = 75
		nEnd = 89;
	elseif nRoute == 9 then
		nBegin = 90
		nEnd = 102;
	elseif nRoute == 11 then
		nBegin = 103
		nEnd = 113;
	elseif nRoute == 12 then
		nBegin = 114
		nEnd = 124;
	elseif nRoute == 6 then
		nBegin = 58
		nEnd = 74;
	else
		print("Gia nhËp "..szTable[nRoute].."XuÊt hiÖn nRoute phi ph¸p : "..nRoute);
		return
	end;

	SetPlayerRoute(nRoute);
	for i = nBegin, nEnd do
		LearnSkill(i);
		for j = 1, 10 do
			LevelUpSkill(i);
		end;
	end;
	Msg2Player("TÊt c¶ kü n¨ng cña"..szTable[nRoute].." ®· häc hÕt");
end;

function end_say()

end;
