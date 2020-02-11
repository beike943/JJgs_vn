--=============================================
--create by liubo 2011.8
--describe:越南版8月份活动 触发器脚本
--related files: baked_cakes_main.lua
--=============================================

Include ("\\script\\online_activites\\2011_08\\activity_02\\baked_cakes_main.lua")
--活动字符串
Include("\\script\\online_activites\\2011_08\\string.lua")

function OnTimer()
	local nTime = tonumber(GetTime())
    if nTime >= (VET_201108_MIDAUTUMN_TaskGroup:GetTask(VET_201108_MIDAUTUMN_TaskGroup.Time_End)) then
        RemoveTrigger(GetTrigger(VET_201108_TIME_USER_DEFINE))
		--设置tag任务变量
		VET_201108_MIDAUTUMN_TaskGroup:SetTask(VET_201108_MIDAUTUMN_TaskGroup.Tag_CCake,1)
        return 0
    end
    local nRoseIndex = VET_201108_MIDAUTUMN_TaskGroup:GetTask(VET_201108_MIDAUTUMN_TaskGroup.Npc_Index)
    local nNpcMapId, nNpcMapX, nNpcMapY = GetNpcWorldPos(nRoseIndex)
	local nExpNum = VET_201108_TB_NPCS[1][3]
	if GetNpcName(nRoseIndex) == VET_201108_TB_NPCS[2][2] then
		nExpNum = VET_201108_TB_NPCS[2][3]
	end
    local nPlayerMapId, nPlayerMapX, nPlayerMapY = GetWorldPos()
    local nDist = DistanceBetweenPoints(nNpcMapId, nNpcMapX, nNpcMapY, nPlayerMapId, nPlayerMapX, nPlayerMapY)
    if nDist >= 0 and nDist <= 18 then
		ModifyExp(nExpNum)
		Msg2Player("B筺 nh薾 dc "..nExpNum.." 甶觤 kinh nghi謒")
        	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
    end
end