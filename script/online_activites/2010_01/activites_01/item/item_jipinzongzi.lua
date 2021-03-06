--=============================================
--create by baiyun 2010.1.11
--describe:越南版2010年1月春节活动 极品粽子脚本
--=============================================
Include("\\script\\online_activites\\2010_01\\activites_01\\head.lua");--活动字符串

function OnUse(nItemIdx)
    if gf_CheckEventDateEx2(0, 2010030800) == 0 then
        Talk(1, "", VET_201001_TB_STRINGS[10]..VET_201001_TB_STRINGS[8]);
        return 0;
    end
    if gf_JudgeRoomWeight(2, 50, VET_201001_TB_STRINGS[10]) == 0 then
        return 0;
    end
    
    local nCount = GetTask(VET_201001_TASK_USE_ZONGZI_COUNT);
    
    if nCount >= VET_201001_NUM_USE_JIPINZONGZI_MAX_COUNT then
        Talk(1, "", VET_201001_TB_STRINGS[10]..VET_201001_TB_STRINGS[11]);
        return 0;
    end
    
    if DelItemByIndex(nItemIdx, 1) == 1 then
    	   SetTask(VET_201001_TASK_USE_ZONGZI_COUNT, GetTask(VET_201001_TASK_USE_ZONGZI_COUNT) + 1);
    	   nCount = GetTask(VET_201001_TASK_USE_ZONGZI_COUNT);
        local tbAwardList = VET_201001_TB_AWARD_LIST1;
        local nDefault = 6;
        if mod(nCount, 50) == 0 then
            tbAwardList = VET_201001_TB_AWARD_LIST2;
            nDefault = 3;
        end
        --记数加1        
        if GetTask(VET_201001_TASK_USE_ZONGZI_COUNT) == VET_201001_NUM_USE_JIPINZONGZI_MAX_COUNT then
            SetTask(VET_201001_TASK_HAS_GET_LIMIT_AWARD, 1);--有资格领取经验上限奖励
        end
        --给物品
        gf_EventGiveRandAward(tbAwardList, 10000, nDefault, VET_201001_STR_LOG_TITLE, VET_201001_TB_LOG_ACTIONS[14]);
        --给经验
        gf_EventGiveCustomAward(1, VET_201001_NUM_USE_JIPINZONGZI_EXP, 1, VET_201001_STR_LOG_TITLE, VET_201001_TB_LOG_ACTIONS[14]);
    end
end
