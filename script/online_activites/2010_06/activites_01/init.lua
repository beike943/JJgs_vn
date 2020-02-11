--=============================================
--create by zhoulimei 2010.5.11
--describe:越南版2010年6月活动1 初始化文件
--=============================================

Include("\\script\\online_activites\\2010_06\\activites_01\\head.lua");        --活动头文件

function ServerStartUp(nStartTime, nEndTime)
    if gf_CheckEventDateEx(VET_201006_01_EVENT_NUMBER) == 1 then
        local nNpcIndex = 0;
        --汴京
        nNpcIndex = CreateNpc(VET_201006_01_NPCINDEX[1],VET_201006_01_NPCINDEX[2], VET_201006_01_NPCINDEX[3], VET_201006_01_NPCINDEX[4], VET_201006_01_NPCINDEX[5]);
        SetNpcScript(nNpcIndex, "\\script\\online_activites\\2010_06\\activites_01\\npc\\npc_ltjrz.lua");
    end
end

function PlayerLogin(ExchangeComing, nStartTime, nEndTime)
end