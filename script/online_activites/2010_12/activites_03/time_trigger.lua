--=============================================
--create by xiongyizhi
--describe:越南版火堆时间触发器脚本
--===========================================
--Include("\\script\\online_activites\\2010_12\\activites_03\\head.lua");
--
--function OnTimer()
--    local nTime = tonumber(GetTime())
--    if nTime >= GetTask(VET_201012_03_TASK_TIME_END_HUOCHAI) then
--        RemoveTrigger(GetTrigger(VET_201012_03_TIME_USER_DEFINE))
--        SetTask(VET_201012_03_TASK_TIME_END_HUOCHAI, 0)
--        return 0
--    end
--    --local nHuaDengIndex = GetGlbValue(VET_201012_03_GLBVALUE_ENDTIME)
--    local nHuochaiIndex = GetTask(VET_201012_03_NPCIDX)
--    local nNpcMapId, nNpcMapX, nNpcMapY = GetNpcWorldPos(nHuochaiIndex)
--    local nPlayerMapId, nPlayerMapX, nPlayerMapY = GetWorldPos()
--    local nDist = DistanceBetweenPoints(nNpcMapId, nNpcMapX, nNpcMapY, nPlayerMapId, nPlayerMapX, nPlayerMapY)
--    if nDist >= 0 and nDist <= 6 then
--        ModifyExp(VET_201012_03_TB_NPCS[1][4]);
--        SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0 , 0);  --查了很久的播放特效接口，关键是PIdx2NpcIdx()
--    end
--end

Include("\\script\\lib\\globalfunctions.lua");

function OnTimer()
	local nPlayerMapId, nPlayerMapX, nPlayerMapY = GetWorldPos()
	local nTimes = floor(mod(GetTask(TSK_VALENTINE_USE_FLAG_2011), 100) / 10)
	if nTimes > 3 or (nPlayerMapId ~= 100 and nPlayerMapId ~= 150 and nPlayerMapId ~= 200 and nPlayerMapId ~= 300 and nPlayerMapId ~= 350 and nPlayerMapId ~= 400 and nPlayerMapId ~= 500) or GetTeamSize() ~= 2 then
        RemoveTrigger(GetTrigger(TRIGGER_USER_DEFINE_VALENTINE_2011))
        return 0
    end
    ModifyExp(250000)
    Msg2Player("B筺 nh薾 頲 250000 甶觤 kinh nghi謒.")
    SetTask(TSK_VALENTINE_USE_FLAG_2011, GetTask(TSK_VALENTINE_USE_FLAG_2011) + 10)
    
    if nTimes == 3 then
    	   RemoveTrigger(GetTrigger(TRIGGER_USER_DEFINE_VALENTINE_2011))
        return 0
    end
end

--function DistanceBetweenPoints(MapID1, MapX1, MapY1, MapID2, MapX2, MapY2)
--    if MapID1 ~= MapID2 then
--        return -1
--    else
--	local dx = MapX2 - MapX1
--        local dy = MapY2 - MapY1
--        local nDist = (dx * dx + dy * dy)^(1/2);
--        return nDist;
--    end;
--end

