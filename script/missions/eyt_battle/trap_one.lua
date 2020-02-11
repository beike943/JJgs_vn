Include("\\script\\missions\\eyt_battle\\eyt_head.lua")

function main()
	--µÈ´ý½×¶Î
	if GetMissionV(EYT_MISSION.battleState) == EYT_STATE_FIGHT then
		return 0;
	end
	SetFightState(0);
end