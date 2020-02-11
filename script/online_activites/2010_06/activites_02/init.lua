--=============================================
--create by zhangming 2010.5.12
--describe:越南版2010年6月活动2 初始化文件
--=============================================

Include("\\script\\online_activites\\2010_06\\activites_02\\head.lua");--活动头文件

function ServerStartUp(nStartTime, nEndTime)
    if gf_CheckEventDateEx2(0, nEndTime) == 1 then
        local nNpcIndex = 0;
        for i = 1, getn(VET_201006_02_TB_NPC_LIST) do
            nNpcIndex = CreateNpc(VET_201006_02_TB_NPC_LIST[i][1], VET_201006_02_TB_NPC_LIST[i][2], VET_201006_02_TB_NPC_LIST[i][3], VET_201006_02_TB_NPC_LIST[i][4], VET_201006_02_TB_NPC_LIST[i][5]);
            SetNpcScript(nNpcIndex, "\\script\\online_activites\\2010_06\\activites_02\\npc\\npc_shoucangmiji.lua")
        end
    end
end

function PlayerLogin(ExchangeComing, nStartTime, nEndTime)
end

