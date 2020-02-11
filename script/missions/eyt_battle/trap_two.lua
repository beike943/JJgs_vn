Include("\\script\\missions\\eyt_battle\\eyt_head.lua")

function main()
	--µÈ´ý½×¶Î
	if GetMissionV(EYT_MISSION.battleState) == EYT_STATE_PEACE then
		local nCamp = eyt_GetCamp()
		local tPos = EYT_REV_POS[nCamp]
		if not tPos then
			return 0;
		end
		local tPoint = tPos[random(getn(tPos))];
		SetPos(tPoint[1], tPoint[2]);
		SetFightState(0);
		return 0;
	end
	SetFightState(1);
end