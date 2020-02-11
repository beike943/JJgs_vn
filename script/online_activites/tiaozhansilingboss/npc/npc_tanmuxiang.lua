--=============================================
--create by zhangming 2010.7.29
--describe:越南版2010年挑战四灵boss活动 檀木箱脚本文件
--=============================================

Include ("\\script\\online_activites\\tiaozhansilingboss\\string.lua")
Include("\\script\\lib\\globalfunctions.lua");--公共函数文件

function main()
    if GetLevel() < 77 or GetPlayerFaction() == 0 then
        Talk(1,"",VET_201008_02_TB_STR_LIST[10])
        return
    end
    if gf_Judge_Room_Weight(1,0," ") ~= 1 then
        return
    end
    if GetItemCount(VET_201008_02_TB_ITEM_LIST[1][2],VET_201008_02_TB_ITEM_LIST[1][3],VET_201008_02_TB_ITEM_LIST[1][4]) >= 1 then
        Talk(1,"",VET_201008_02_TB_STR_LIST[9])
        return
    end
    local tbItemIds = {VET_201008_02_TB_ITEM_LIST[1][2],VET_201008_02_TB_ITEM_LIST[1][3],VET_201008_02_TB_ITEM_LIST[1][4],1}
    gf_AddItemEx2(tbItemIds,VET_201008_02_TB_ITEM_LIST[1][1],VET_201008_02_STR_LOG_TITLE,VET_201008_02_TB_LOG_ACTION_LIST[2],120,1)
    local nNpcIndex = GetTargetNpc()
    SetNpcLifeTime(nNpcIndex,0)
end
