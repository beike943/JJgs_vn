--=============================================
--create by zhangming 2010.6.18
--describe:越南版2010年7月活动1 矿石包脚本文件
--=============================================

Include("\\script\\online_activites\\2010_07\\activites_01\\head.lua");--活动头文件

g_szItemSayHead = gf_FixColor(VET_201007_01_TB_ITEM_LIST[1][1], 2, 1);

function OnUse(nItemIdx)
    if DelItemByIndex(nItemIdx, 1) == 1 then
        if gf_Judge_Room_Weight(1,0," ") ~= 1 then
            return
        end
        gf_EventGiveRandAward(VET_201007_01_KUANGSHIBAG_AWARD,100,1,VET_201007_01_STR_LOG_TITLE,VET_201007_01_TB_LOG_ACTION_LIST[2])
    end
end
