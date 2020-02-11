--=============================================
--create by baiyun 2010.1.7
--describe:越南版2010年1月春节活动 白先生脚本文件
--=============================================

Include("\\script\\online_activites\\2010_01\\activites_02\\head.lua");

function main()
    if gf_CheckEventDateEx(VET_201001_02_EVENT_NUMBER) == 0 then
        Talk(1, "", VET_201001_TB_STRINGS[13]..VET_201001_TB_STRINGS[20]);
        return 0;
    end
    local tbDialog = {
        VET_201001_TB_STRINGS[15].."/give_zongzi",
        VET_201001_TB_STRINGS[16].."/finish_lingshou_task",
        VET_201001_TB_STRINGS[17].."/gf_DoNothing",
    };

    Say(VET_201001_TB_STRINGS[13]..VET_201001_TB_STRINGS[14], 
        getn(tbDialog), tbDialog);
end

function finish_lingshou_task()
end

function give_zongzi()
    local nDate = tonumber(date("%y%m%d"));
    if GetTask(VET_201001_TASK_GIVE_ZONGZI_DATE) < nDate then
        SetTask(VET_201001_TASK_GIVE_ZONGZI_COUNT, 0);
    end
    if GetTask(VET_201001_TASK_GIVE_ZONGZI_COUNT) >= 3 then
        Talk(1, "", VET_201001_TB_STRINGS[13]..VET_201001_TB_STRINGS[18]);
        return 0;
    end
    if GetItemCount(VET_201001_TB_ITEMS[7][2], VET_201001_TB_ITEMS[7][3], VET_201001_TB_ITEMS[7][4]) < 10 then
        Talk(1, "", VET_201001_TB_STRINGS[13]..VET_201001_TB_STRINGS[19]);
        return 0;
    end
    if gf_JudgeRoomWeight(2, 50, VET_201001_TB_STRINGS[13]) == 0 then
        return 0;
    end
    if DelItem(VET_201001_TB_ITEMS[7][2], VET_201001_TB_ITEMS[7][3], VET_201001_TB_ITEMS[7][4], 10) == 1 then
        --给奖励
        gf_EventGiveCustomAward(1, 1500000, 1, VET_201001_STR_LOG_TITLE, VET_201001_TB_LOG_ACTIONS[16]);
        gf_EventGiveRandAward(VET_201001_TB_AWARD_ZENGSONG, 1000, 8, VET_201001_STR_LOG_TITLE, VET_201001_TB_LOG_ACTIONS[16]);
        
        SetTask(VET_201001_TASK_GIVE_ZONGZI_DATE, nDate);
        SetTask(VET_201001_TASK_GIVE_ZONGZI_COUNT, GetTask(VET_201001_TASK_GIVE_ZONGZI_COUNT) + 1);
    end
end
