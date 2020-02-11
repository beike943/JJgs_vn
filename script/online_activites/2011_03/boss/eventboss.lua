Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\misc\\taskmanager.lua");
Include("\\script\\online_activites\\2011_03\\boss\\string.lua");

VET_201103_EVENTBOSS_ACTIVITY_ID = 32;
VET_201103_EVENTBOSS_TaskGroup = TaskManager:Create(2, 2);
VET_201103_EVENTBOSS_TaskGroup.TSK_LAST_AWARD_TIME = 1;

VET_201103_EVENTBOSS_SMALLAWARD_LEVEL_LIMIT = 77;

function VET_201103_EventBoss_SpawnBoss(nMapId,nX,nY)
	local nDate = tonumber(date("%y%m%d"))
	if nDate < 110412 or nDate > 110429 then
		return 0;
	end
	
	local nNpcIndex = CreateNpc(VET_TB_201103_EVENTBOSS_NPC_TEMPLATE[1], "§¹i Niªn Thó",nMapId,nX,nY);
	if (nNpcIndex > 0) then
		SetNpcScript(nNpcIndex,"\\script\\online_activites\\2011_03\\boss\\npc\\bigboss.lua")
		SetNpcLifeTime(nNpcIndex, 3600);
	end
end

function VET_201103_EventBoss_CheckSmallAward()
	local tbRouteInfo = {0, 1, 1, 1, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1};
	tbRouteInfo[0] = 0;
	local nPlayerRoute = GetPlayerRoute();
	local nLevel = GetLevel();
	
	if (nLevel < VET_201103_EVENTBOSS_SMALLAWARD_LEVEL_LIMIT) then
		Talk(1, "", format(VET_TB_201103_EVENTBOSS_DLG[2],VET_201103_EVENTBOSS_SMALLAWARD_LEVEL_LIMIT))
		return 0;
	end
	
	if (tbRouteInfo[nPlayerRoute] == 0) then
		Talk(1, "", VET_TB_201103_EVENTBOSS_DLG[3])
		return 0;
	end
	
	local nTimeNow = GetTime();
	local nLastTime = VET_201103_EVENTBOSS_TaskGroup:GetTask(VET_201103_EVENTBOSS_TaskGroup.TSK_LAST_AWARD_TIME)

	if nTimeNow - nLastTime >= 5 then
		return 1;
	else
		Talk(1, "", format(VET_TB_201103_EVENTBOSS_DLG[1],5))
		return 0;
	end
	
	return 1;
end