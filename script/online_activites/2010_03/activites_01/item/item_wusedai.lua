--=============================================
--create by baiyun 2010.2.24
--describe:越南版2010年3月活动1 五色袋脚本文件
--=============================================

Include("\\script\\online_activites\\2010_03\\activites_01\\head.lua");--活动头文件

function OnUse(nItemIdx)
    --无时间限制
    if gf_CheckEventDateEx(VET_201003_01_EVENT_NUMBER) == 0 then
        return 0;
    end
    if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then return end
    if DelItemByIndex(nItemIdx, 1) == 1 then
        gf_EventGiveRandAward(VET_201003_01_WUSEDAI_AWARD_LIST, 100, 1, VET_201003_01_STR_LOG_TITLE, VET_201003_01_TB_LOG_ACTION[2]);
    end
end
