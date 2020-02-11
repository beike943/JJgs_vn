Include("\\script\\function\\zq_battles\\zq_head.lua")

function main()
	if ZQ_GetCamp() ~= LIAO_ID then
		return 0;
	end
	local tSay = {
		"H·y ®­a vµo Tèng doanh/slip_into_song",
		"\nL½ng lÆng rêi khái/do_nothing",
	}
	Say("<color=green>Gi¸n ®iÖp Kim §iªu: <color>CÈn thËn c¸i miÖng cña ng­êi, nÕu kh«ng th× h·y cÈn thËn sau l­ng ng­¬i.", getn(tSay), tSay);
end

function slip_into_song()
	local tJoinPos = {
		{1645, 3797},
		{1613, 3826},
		{1613, 3761},
		{1555, 3714},
		{1546, 3739},
		{1638, 3747},
	};
	if ZQ_IsAllowMap() ~= 1 then
		return 0;
	end
	if GetItemCount(ZQ_ITEM_FLAG[LIAO_ID][1], ZQ_ITEM_FLAG[LIAO_ID][2], ZQ_ITEM_FLAG[LIAO_ID][3]) ~= 1 then
		return 0;
	end
	local nRandIndex = random(getn(tJoinPos));
	SetPos(tJoinPos[nRandIndex][1], tJoinPos[nRandIndex][2]);
	RestoreAll();
	SetFightState(1);
end

function do_nothing()
	--do nothing
end