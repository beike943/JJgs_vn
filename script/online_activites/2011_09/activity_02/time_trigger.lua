--=============================================
--create by xiongyizhi
--describe:越南版火堆时间触发器脚本
--modify by liubo
--===========================================
Include("\\script\\online_activites\\2011_09\\activity_02\\head.lua")

function OnTimer()
    local nTime = tonumber(GetTime())
    if nTime >= (VET_201110_ROSE_TaskGroup:GetTask(VET_201110_ROSE_TaskGroup.Time_End)) then
        RemoveTrigger(GetTrigger(VET_201110_TIME_USER_DEFINE))
        return 0
    end
    local nRoseIndex = VET_201110_ROSE_TaskGroup:GetTask(VET_201110_ROSE_TaskGroup.Npc_Index)
    local nNpcMapId, nNpcMapX, nNpcMapY = GetNpcWorldPos(nRoseIndex)
	local nExpNum = VET_201110_TB_NPCS[1][4]
	if GetNpcName(nRoseIndex) == VET_201110_TB_NPCS[2][2] then
		nExpNum = VET_201110_TB_NPCS[2][4]
	end
    local nPlayerMapId, nPlayerMapX, nPlayerMapY = GetWorldPos()
    local nDist = DistanceBetweenPoints(nNpcMapId, nNpcMapX, nNpcMapY, nPlayerMapId, nPlayerMapX, nPlayerMapY)
    if nDist >= 0 and nDist <= 24 then
		ModifyExp(nExpNum)
		Msg2Player("B筺 nh薾 頲 "..nExpNum.." 甶觤 kinh nghi謒")
        SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
    end
end


