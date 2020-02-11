--=============================================
--create by baiyun 2009.11.25
--describe:越南版12月份活动冰冷巫师时间触发器脚本
--===========================================
Include("\\script\\online\\viet_event\\200912\\event_head.lua");
function OnTimer()
    local nEndTime = GetTask(VIET_0912_TASK_ACTIVE_SHENGDANSHU_TRIGGER_EXIST_TIME);
    if GetTime() >= nEndTime then
        RemoveTrigger(GetTrigger(2509));
        SetTask(VIET_0912_TASK_ACTIVE_SHENGDANSHU_TRIGGER_EXIST_TIME, 0);
        return 0;
    end
    local nShengdanshuIndex = GetGlbValue(1026);
    local nNpcMapId, nNpcMapX, nNpcMapY = GetNpcWorldPos(nShengdanshuIndex);
    local nPlayerMapId, nPlayerMapX, nPlayerMapY = GetWorldPos();

    local nDist = DistanceBetweenPoints(nNpcMapId, nNpcMapX, nNpcMapY, nPlayerMapId, nPlayerMapX, nPlayerMapY);
    if nDist >= 0 and nDist <= 15 then
    	  local nRand = random(1,100)
    	  local nExp = 0;
    	  if nRand <= 35 then
    	  	nExp = 15000
    	  elseif nRand <= 95 then
    	  	nExp = 30000
    	  else
    	  	nExp = 50000
    	  end
        ModifyExp(nExp);
    end
    --if nLeftTime > 0 then
    --    SetTask(VIET_0912_TASK_ACTIVE_SHENGDANSHU_TRIGGER_EXIST_TIME, nLeftTime - 1);
    --end
end

function DistanceBetweenPoints(MapID1, MapX1, MapY1, MapID2, MapX2, MapY2)
	if MapID1 ~= MapID2 then
		return -1
	else
	    local dx = MapX2 - MapX1;
	    local dy = MapY2 - MapY1;
	    local nDist = (dx * dx + dy * dy)^(1/2);
	    return nDist;
    end;
end

