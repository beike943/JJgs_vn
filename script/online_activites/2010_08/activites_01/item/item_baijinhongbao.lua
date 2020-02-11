--=============================================
--create by zhangming 2010.7.15
--describe:越南版2010年8月活动1 白金红包( 空)脚本文件
--=============================================

Include("\\script\\online_activites\\2010_08\\activites_01\\head.lua");--活动头文件

g_szItemSayHead = gf_FixColor(VET_201008_01_TB_ITEM_LIST[4][1], 2, 1);

function OnUse(nItemIdx)
    if GetCash() < 40000000 then
        Talk(1,"",VET_201008_01_TB_STRING_LIST[12])
        return
    end
    if DelItemByIndex(nItemIdx, 1) == 1 then
        if Pay(40000000) == 1 then
            local tbItemIds = {VET_201008_01_TB_ITEM_LIST[5][2],VET_201008_01_TB_ITEM_LIST[5][3],VET_201008_01_TB_ITEM_LIST[5][4],1}
            gf_AddItemEx2(tbItemIds,VET_201008_01_TB_ITEM_LIST[5][1],VET_201008_01_STR_LOG_TITLE,VET_201008_01_TB_LOG_ACTION_LIST[5],0,1)
        end
    end
end
