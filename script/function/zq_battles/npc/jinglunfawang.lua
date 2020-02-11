Include("\\script\\function\\zq_battles\\zq_head.lua")

function main()
	if ZQ_JugdeCamp(SONG_ID) == 1 then
		return 0;
	end
	local tSay = {};
	tSay = ZQ_TaskDialog(4, 2);
	tinsert(tSay, "\n T¹i h¹ chØ xem qua th«i/do_nothing");
	Say("<color=green>Kim Lu©n Ph¸p V­¬ng: <color>Kim cang né môc, phËt ph¸p ®é ma.", getn(tSay), tSay);
end

function do_nothing()
	--do nothing
end