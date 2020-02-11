Include("\\script\\online_activites\\201409\\2\\mission.lua")

function OnTimer()
	if hd_IsActivityOpen() ~= 1 then
		EndMission();
		return 0;
	end
	local nMMap = GetGlbValue(HD_GV_ID[2]);
	--DebugOutput("HD_MISSION_ID[2] =", mf_GetMissionV(HD_MISSION_ID[2], 1, nMMap), mf_GetMissionV(HD_MISSION_ID[2], 2, nMMap), mf_GetMissionV(HD_MISSION_ID[2], 3, nMMap));
	local nTime = mf_GetMissionV(HD_MISSION_ID[2], 3, nMMap);
	if GetTime() - nTime > 1800 then
		EndMission();
		return 0;
	end
	local npcIndex = mf_GetMissionV(HD_MISSION_ID[2], 2, nMMap);
	if hd_IsActivate(npcIndex) ~= 1 then
		return 0;
	end
	local nStep = mf_GetMissionV(HD_MISSION_ID[2], 99, nMMap);
	mf_SetMissionV(HD_MISSION_ID[2], 99, nStep + 1, nMMap);
	DebugOutput("nStep =", nStep, HD_MISSION_ID[2]);
	if nStep == 2 or nStep ==  602 or nStep == 1202 or nStep == 1802 then
		local nMapID, nX, nY = GetNpcWorldPos(npcIndex);
		local npcIdx = CreateNpc("wugangzuoqi", "Thó C­ng Cña Chó Cuéi", nMapID, nX + random(-2, 2), nY + random(-2, 2));
		if npcIdx > 0 then
			SetNpcDeathScript(npcIdx, "\\script\\online_activites\\201409\\wugang_death.lua");
			SetNpcLifeTime(npcIdx, 5 * 60);
			Msg2SubWorld("Xung quanh §Ìn Hoa §¨ng sÏ xuÊt hiÖn Thó C­ng Cña Chó Cuéi, mäi ng­êi h·y nhanh chãng ®i khiªu chiÕn nµo!");
		end
	end
	if nStep > 2000 then
		EndMission();
	end
end
