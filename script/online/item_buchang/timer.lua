Include("\\script\\online\\item_buchang\\ibc_head.lua")
Include("\\script\\online\\item_buchang\\mission.lua")

function OnTimer()
	if ibc_IsOpen() ~= 1 then
		EndMission();
		return 0;
	end
	
	local npcIndex = mf_GetMissionV(IBC_MISSION_ID, IBC_MISION_V1, IBC_MAPID);
	if IsNpcDeath(npcIndex) ~= 0 then
		EndMission();
	end
	
	local nStep = mf_GetMissionV(IBC_MISSION_ID, 99, IBC_MAPID);
	mf_SetMissionV(IBC_MISSION_ID, 99, nStep + 1, IBC_MAPID);
	local nMax, nCur = GetUnitCurStates(npcIndex, 1);	
	
	if mod(nStep, 10) == 0 and nMax > nCur then
		local tMsg = {
			[1] = "Sù viÖc hack item lÇn nµy, thËt xin lçi mäi ng­êi!",
			[2] = "Sù viÖc hack item lÇn nµy ®· g©y phiÒn phøc cho mäi ng­êi!",
			[3] = "Sù viÖc hack item lÇn nµy, chóng t«i xin nhËn lçi!",
			[4] = "Sù viÖc hack item lÇn nµy, ui da, xin nhÑ tay chót!",
			[5] = "Sau nµy chóng t«i sÏ cè g¾ng ng¨n chÆn vµ h¹n chÕ vÊn ®Ò hack item.",
			[6] = "Nhê mäi ng­êi kh«ng nªn mua item hack ®Ó cïng nhau duy tr× m«i tr­êng trß ch¬i lµnh m¹nh vµ c«ng b»ng.",
		}
		local nIndex = mod(floor(nStep/10), 6);
		if nIndex == 0 then
			nIndex = 6;
		end
		NpcChat(npcIndex, tMsg[nIndex]);
	end
	
	local nIndex = floor((nMax - nCur)/(nMax / 10));
	if nIndex >= 1 and nIndex < 10 then
		if GetNpcTempData(npcIndex, nIndex) == 0 then
			for i = 1, 30 do
				local npcIdx = CreateNpc("BC_xiaobaoxiang", "R­¬ng Nhá §Òn Bï", IBC_MAPID, IBC_MAP_X + random(-15, 15), IBC_MAP_Y + random(-15, 15));
				SetNpcScript(npcIdx, "\\script\\online\\item_buchang\\box_small.lua");
				SetNpcLifeTime(npcIdx, 5 * 60);
			end
			SetNpcTempData(npcIndex, nIndex, 1);
		end
	end
	
	if nStep > 1800 then
		EndMission();
	end
end
