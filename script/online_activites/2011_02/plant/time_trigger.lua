Include("\\script\\online_activites\\2011_02\\plant\\head.lua");

function OnTimer()
	local nTime = tonumber(GetTime())
	local nEndTime = 	VET_201102_PLANT_TaskGroup:GetTask(VET_201102_PLANT_TaskGroup.TSK_ACTIVE_END_TIME);
	
	if nTime >= nEndTime or GetTeamSize() < 2 then
		local nTriggerId = VET_201102_PLANT_TaskGroup:GetTask(VET_201102_PLANT_TaskGroup.TSK_TRIGGER_ID);
		RemoveTrigger(GetTrigger(nTriggerId))
		VET_201102_PLANT_TaskGroup:SetTask(VET_201102_PLANT_TaskGroup.TSK_ACTIVE_END_TIME, 0);
		return 0
	end
	local nNpcIndex = VET_201102_PLANT_TaskGroup:GetTask(VET_201102_PLANT_TaskGroup.TSK_ACTIVE_NPC_IDX);
	local nNpcMapId, nNpcMapX, nNpcMapY = GetNpcWorldPos(nNpcIndex)
	local nPlayerMapId, nPlayerMapX, nPlayerMapY = GetWorldPos();
	local nDist = DistanceBetweenPoints(nNpcMapId, nNpcMapX, nNpcMapY, nPlayerMapId, nPlayerMapX, nPlayerMapY)
	if nDist >= 0 and nDist <= 27 then
		ModifyExp(87719);
		Msg2Player("B筺 nh薾 頲 87719 甶觤 kinh nghi謒.")
		SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0 , 0);  --查了很久的播放特效接口，关键是PIdx2NpcIdx()
	end
end

function DistanceBetweenPoints(MapID1, MapX1, MapY1, MapID2, MapX2, MapY2)
	if MapID1 ~= MapID2 then
		return -1
	else
	local dx = MapX2 - MapX1
	local dy = MapY2 - MapY1
	local nDist = (dx * dx + dy * dy)^(1/2);
		return nDist;
	end;
end

