Include("\\script\\function\\zq_battles\\zq_head.lua")

function main()
	if ZQ_GetCamp() ~= SONG_ID then
		return 0;
	end
	local tSay = {
		"H·y ®­a ta vµo Liªu doanh/slip_into_liao",
		"\nTa ch­a tõng gÆp ng­¬i/do_nothing",
	}
	Say("<color=green>Gi¸n ®iÖp ¶nh Phong: <color>ng­¬i ch­a gÆp ta, ch­a tõng. NÕu kh«ng ng­¬i nhÊt ®Þnh sÏ hèi hËn.", getn(tSay), tSay);
end

function slip_into_liao()
	local tJoinPos = {
		{1871, 3253},
		{1919, 3378},
		{1882, 3351},
		{1840, 3316},
		{1818, 3297},
		{1844, 3280},
	};
	if ZQ_IsAllowMap() ~= 1 then
		return 0;
	end
	if GetItemCount(ZQ_ITEM_FLAG[SONG_ID][1], ZQ_ITEM_FLAG[SONG_ID][2], ZQ_ITEM_FLAG[SONG_ID][3]) ~= 1 then
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