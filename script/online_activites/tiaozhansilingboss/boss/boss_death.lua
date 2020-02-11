--=============================================
--create by zhangming 2010.7.30
--describe:越南版2010年挑战四灵boss活动 boss死亡脚本文件
--=============================================
Include ("\\script\\online_activites\\tiaozhansilingboss\\string.lua")
Include("\\script\\lib\\globalfunctions.lua");--公共函数文件

function OnDeath(nNpcIndex)
    Msg2Global(VET_201008_02_TB_STR_LIST[22])
    --DoFireworks(871, 1)
    local szPlayerName = GetName()
    local npcIndex,npcModel,szBossName = GetTriggeringUnit();
    local szNews = format(VET_201008_02_TB_STR_LIST[11],szPlayerName,szBossName)
    AddGlobalCountNews(szNews,2)
    local tbItemIds = {
        VET_201008_02_TB_ITEM_LIST[2][2],
        VET_201008_02_TB_ITEM_LIST[2][3],
        VET_201008_02_TB_ITEM_LIST[2][4],
        1,
    }
    gf_AddItemEx2(tbItemIds,VET_201008_02_TB_ITEM_LIST[2][1],VET_201008_02_STR_LOG_TITLE,VET_201008_02_TB_LOG_ACTION_LIST[5],0,1)
    
    local nMapID, nWx, nWy = GetNpcWorldPos(npcIndex)
    local nAddX = 0
    local nAddY = 0
    local nTargetNpc = 0
    for i = 1, 99 do
	nAddX = random(-60, 60)
	nAddY = random(-60, 60)
	nTargetNpc = CreateNpc(VET_201008_02_TB_NPC_LIST[3][1], VET_201008_02_TB_NPC_LIST[3][2], nMapID, nWx + nAddX, nWy + nAddY)
	SetNpcLifeTime(nTargetNpc, 180)
	SetNpcScript(nTargetNpc, VET_201008_02_TB_NPC_LIST[3][3])
    end
    SetNpcLifeTime(npcIndex, 10)
end
