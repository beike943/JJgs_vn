Include("\\script\\function\\zq_battles\\zq_head.lua")

function main()
	local tSay = {};
	local nCamp = ZQ_GetCamp();
	local tName = {
		[SONG_ID] = "Tèng Qu©n Nhu Quan",
		[LIAO_ID] = "Liªu Qu©n Nhu Quan",
	}
	if tName[nCamp] ~= GetNpcName(GetTargetNpc()) then
		return 0;
	end
	tSay = ZQ_TaskDialog(5, 3);
	tinsert(tSay, "\n T¹i h¹ chØ xem qua th«i/do_nothing");
	Say("<color=green>Qu©n Nhu Quan: <color>Mçi cø ®iÓm tµi nguyªn chØ cã thÓ thu thËp 1 ng­êi trong cïng mét thêi gian. Thu thËp thµnh c«ng cã thÓ nhËn ®­îc tµi nguyªn cïng ®iÓm kinh nghiÖm.", getn(tSay), tSay);
end

function do_nothing()
	--do nothing
end