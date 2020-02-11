Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\function\\zq_battles\\zq_head.lua")
Include("\\script\\global\\action_bar_callback.lua")

function OnUse(nItem)
	local nMapID = GetMapTemplate(SubWorld);
	if nMapID == 6026 then
		if gf_GetTaskBit(ZQ_BATTLE_TASK11, 17) == 1 then
			return 0;
		end
		if ZQ_GetCamp() ~= SONG_ID then
			return 0;
		end
		if ZQ_IsAllowMap() ~= 1 then
			return 0;
		end
		SetItemUseLapse(nItem, 18 * 15);
		DoWait(111, 112, 10);
	end
	if nMapID == 6027 then
		SetItemUseLapse(nItem, 18 * 15);
		DoWait(111, 112, 10);
	end
end

function exec_transmit()
	local tPos = {
		[6026] = {1582, 3792},
		[6027] = {1582, 3792},
	}
	local nMapID = GetMapTemplate(SubWorld);
	if not tPos[nMapID] then  return 0;  end
	SetPos(tPos[nMapID][1], tPos[nMapID][2]);
	SetFightState(0);
end