--=============================================
--create by zhangming 2010.3.15
--describe:越南版转生任务 初始化文件
--=============================================

Include("\\script\\online_activites\\reborn\\task\\head.lua");--活动头文件

function ServerStartUp(nStartTime, nEndTime)
--    if gf_CheckEventDateEx2(0,0) == 1 then
--        local nNpcIndex = 0
--        nNpcIndex = CreateNpc(VET_201003_STR_NPC_NAME[1][1],VET_201003_STR_NPC_NAME[1][2],500,1754,3156)
--        SetNpcScript(nNpcIndex, "\\script\\online_activites\\reborn\\task\\npc\\npc_huzishi.lua")
--        nNpcIndex = CreateNpc(VET_201003_STR_NPC_NAME[2][1],VET_201003_STR_NPC_NAME[2][2],500,1777,3133)
--        SetNpcScript(nNpcIndex, "\\script\\online_activites\\reborn\\task\\npc\\npc_longzishi.lua")
--        nNpcIndex = CreateNpc(VET_201003_STR_NPC_NAME[3][1],VET_201003_STR_NPC_NAME[3][2],500,1754,3112)
--        SetNpcScript(nNpcIndex, "\\script\\online_activites\\reborn\\task\\npc\\npc_fengzishi.lua")
--        nNpcIndex = CreateNpc(VET_201003_STR_NPC_NAME[4][1],VET_201003_STR_NPC_NAME[4][2],500,1730,3138)
--        SetNpcScript(nNpcIndex, "\\script\\online_activites\\reborn\\task\\npc\\npc_yingzishi.lua") 
--    end
end

function PlayerLogin(ExchangeComing, nStartTime, nEndTime)
--	if GetTask(VET_200912_TASK_ZS_STATE) == 6 then
--		SetTask(VET_200912_TASK_ZS_STATE,0)
--	end
end


