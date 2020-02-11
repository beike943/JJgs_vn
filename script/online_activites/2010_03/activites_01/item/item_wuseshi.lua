--=============================================
--create by baiyun 2010.2.24
--describe:越南版2010年3月活动1 五色石脚本文件
--=============================================

Include("\\script\\online_activites\\2010_03\\activites_01\\head.lua");--活动头文件

function OnUse(nItemIdx)
    if gf_CheckEventDateEx2(0, 2010041200) == 0 then
        Talk(1, "", VET_201003_01_TB_STRING[5]);
        return 0;
    end

    local nUseCount = GetTask(VET_201003_01_TASK_USE_WUSESHI_COUNT);
    if nUseCount >= VET_201003_01_NUM_USE_WUSESHI_MAX_COUNT then --使用个数达到上限
        Talk(1, "", VET_201003_01_TB_STRING[6]);
        return 0;
    end
    if gf_Judge_Room_Weight(2, 50, " ") ~= 1 then return end
    if DelItemByIndex(nItemIdx, 1) == 1 then
        SetTask(VET_201003_01_TASK_USE_WUSESHI_COUNT, GetTask(VET_201003_01_TASK_USE_WUSESHI_COUNT) + 1);
        --给经验奖励
        gf_EventGiveCustomAward(1, 150000, 1, VET_201003_01_STR_LOG_TITLE, VET_201003_01_TB_ITEM_LIST[8][1]);
        --给固定使用次数奖励，第50, 100, 150, 200..次使用
        if mod(GetTask(VET_201003_01_TASK_USE_WUSESHI_COUNT), 50) == 0 then
            gf_EventGiveRandAward(VET_201003_01_WUSESHI_FIXED_AWARD_LIST, 10000, 4, VET_201003_01_STR_LOG_TITLE, VET_201003_01_TB_ITEM_LIST[8][1]);
            return
        end
        --基本奖励
        gf_EventGiveRandAward(VET_201003_01_WUSESHI_BASE_AWARD_LIST, 10000, 16, VET_201003_01_STR_LOG_TITLE, VET_201003_01_TB_ITEM_LIST[8][1]);          
    end
end
