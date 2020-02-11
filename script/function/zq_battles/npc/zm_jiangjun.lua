Include("\\script\\function\\zq_battles\\zq_define.lua")
Include("\\script\\function\\zq_battles\\zq_head.lua")

--ËÎÁÉ½«¾ü
function main()
	local tSay = {};
	local nCamp = ZQ_GetCamp();
	local tName = {
		[SONG_ID] = "Tèng T­íng Qu©n",
		[LIAO_ID] = "Liªu T­íng Qu©n",
	}
	if tName[nCamp] ~= GetNpcName(GetTargetNpc()) then
		return 0;
	end
	if nCamp == SONG_ID then
		tSay = ZQ_TaskDialog(1, 3);
	elseif nCamp == LIAO_ID then
		tSay = ZQ_TaskDialog(2, 3);
	end
	tinsert(tSay, "\nTa muèn rêi khái ®©y/leave_zq_battle");
	tinsert(tSay,	"T¹i h¹ chØ xem qua th«i/do_nothing");
	Say(format("<color=green>%s:<color>",GetNpcName(GetTargetNpc())).."ThiÕu hiÖp cÇn gióp ®ì g× kh«ng?", getn(tSay), tSay);
end

function leave_zq_battle()
	Say(format("<color=green>%s:<color>",GetNpcName(GetTargetNpc())).."X¸c ®Þnh rêi khái n¬i nµy?", 2, "\nX¸c nhËn/leave_ensure", "\n rót lui/do_nothing");
end

function leave_ensure()
	if ZQ_IsAllowMap() ~= 1 then
		return 0;
	end
	local nCamp = ZQ_GetCamp();
	if nCamp == LIAO_ID or nCamp == SONG_ID then
		DelItem(ZQ_ITEM_FLAG[nCamp][1], ZQ_ITEM_FLAG[nCamp][2], ZQ_ITEM_FLAG[nCamp][3], 1);
	end
	if 1 == NewWorld(ZQ_EXIT_POS[1], ZQ_EXIT_POS[2], ZQ_EXIT_POS[3]) then
		ZQ_ResetPlayerState();
	end
end

function do_nothing()
	--do nothing
end