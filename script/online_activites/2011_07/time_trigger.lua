--=============================================
--create by xiongyizhi
--describe:越南版火堆时间触发器脚本
--===========================================
Include("\\script\\online_activites\\2011_07\\\head.lua")

function OnTimer()
    local nTime = tonumber(GetTime())
    local nTeamSize = GetTeamSize()
    if nTime >= (VET_201107_SUMMER_ROSE_TaskGroup:GetTask(VET_201107_SUMMER_ROSE_TaskGroup.Time_End)) or nTeamSize < 2  then
        RemoveTrigger(GetTrigger(VET_201107_TIME_USER_DEFINE))
        return 0
    end
    local nRoseIndex = VET_201107_SUMMER_ROSE_TaskGroup:GetTask(VET_201107_SUMMER_ROSE_TaskGroup.Npc_Index )
    local nNpcMapId, nNpcMapX, nNpcMapY = GetNpcWorldPos(nRoseIndex)
	local nExpNum = VET_201107_TB_NPCS[1][4]
	if GetNpcName(nRoseIndex) == VET_201107_TB_NPCS[2][2] then
		nExpNum = VET_201107_TB_NPCS[2][4]
	end
    local nPlayerMapId, nPlayerMapX, nPlayerMapY = GetWorldPos()
    local nDist = DistanceBetweenPoints(nNpcMapId, nNpcMapX, nNpcMapY, nPlayerMapId, nPlayerMapX, nPlayerMapY)
    if nDist >= 0 and nDist <= 12 then
		ModifyExp(nExpNum);
		Msg2Player("B筺 nh薾 頲 "..nExpNum.." kinh nghi謒")
           SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
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

