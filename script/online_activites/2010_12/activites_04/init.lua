--=============================================
--create by xiongyizhi 2010.11.2
--describe:越南版2010年12月活动1 初始化文件
--=============================================

Include("\\script\\online_activites\\2010_12\\activites_04\\head.lua");--活动头文件

function ServerStartUp(nStartTime, nEndTime)
    if gf_CheckEventDateEx2(VET_4_SOUL_TREE_BEGIN_TIME, VET_4_SOUL_TREE_END_TIME) == 1 then
        local nNpcIndex = CreateNpc(VET_201012_04_NPC_TB[1][1], VET_201012_04_NPC_TB[1][2], 300, 1740, 3468);
        SetNpcScript(nNpcIndex, "\\script\\online_activites\\2010_12\\activites_04\\npc\\baicaoxian_npc.lua")
    end
end

function PlayerLogin(ExchangeComing, nStartTime, nEndTime)
    if gf_CheckEventDateEx(VET_201012_01_EVENT_NUMBER) == 1 then
    end
end

