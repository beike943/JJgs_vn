--=============================================
--create by zhangming 2010.6.18
--describe:越南版2010年7月活动1 四灵宝石脚本文件
--=============================================

Include("\\script\\online_activites\\2010_07\\activites_01\\head.lua");--活动头文件

g_szItemSayHead = gf_FixColor(VET_201007_01_TB_ITEM_LIST[6][1], 2, 1);

function OnUse(nItemIdx)
    if tonumber(date("%y%m%d%H")) >= 10081224 then
        Talk(1,"",VET_201007_01_TB_STRING_LIST[18])
        return
    end
    if GetTask(VET_201007_01_TASK_SILINGBAOSHI_NUM) >= 1000 then
        Talk(1,"",format(VET_201007_01_TB_STRING_LIST[9],1000))
        return
    end
    if GetLevel() < 10 then
        Talk(1,"",VET_201007_01_TB_STRING_LIST[10])
        return
    end
     if gf_Judge_Room_Weight(2,400," ") ~= 1 then
        return
    end
    if DelItemByIndex(nItemIdx, 1) == 1 then
        if GetTask(VET_201007_01_TASK_SILINGBAOSHI_NUM) == nil then
            SetTask(VET_201007_01_TASK_SILINGBAOSHI_NUM,0)
        end
        SetTask(VET_201007_01_TASK_SILINGBAOSHI_NUM,GetTask(VET_201007_01_TASK_SILINGBAOSHI_NUM)+1)
        VET_201007_01_get_exp(200000)
        gf_EventGiveRandAward(VET_201007_01_SILINGBAOSHI_AWARD,1000,1,VET_201007_01_STR_LOG_TITLE,VET_201007_01_TB_LOG_ACTION_LIST[5])
        if mod(GetTask(VET_201007_01_TASK_SILINGBAOSHI_NUM),20) == 0 then
            VET_201007_01_get_exp(200000)
            gf_EventGiveRandAward(VET_201007_01_SILINGBAOSHI_SPECIAL_AWARD,1000,1,VET_201007_01_STR_LOG_TITLE,VET_201007_01_TB_LOG_ACTION_LIST[8])
        end
    end
end
