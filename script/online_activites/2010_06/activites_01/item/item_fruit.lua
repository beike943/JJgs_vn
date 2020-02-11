--=============================================
--create by zhoulimei 2010.5.12
--describe:越南版2010年6月活动1 水果饼，冰， 酱， 汁脚本文件
--=============================================
Include("\\script\\online_activites\\2010_06\\activites_01\\head.lua");

function OnUse(nItemIdx)
    if gf_CheckEventDateEx(VET_201006_01_EVENT_NUMBER) == 0 then
        Talk(1, "", VET_201006_01_TB_STRING[21]);
        return 0;
    end
    
    if vet_201006_01_limit_50() == 0 then
        Talk(1, "", VET_201006_01_TB_STRING[20]);
        return 0;
    end
    
    local nCount = GetTask(VET_201006_01_TASK_USETECHAN_COUNT);
    if nCount >= VET_201006_01_USETECHAN_COUNT_MAX then
        Talk(1, "", VET_201006_01_TB_STRING[22]);
        return 0;
    end
    
    nCount = nCount + 1;
    if mod(nCount, 50) == 0 then
        --负重检测
        if gf_Judge_Room_Weight(1, 2, "") == 0 then
            return 0;
        end
    else
        --负重检测
        if gf_Judge_Room_Weight(1, 1, "") == 0 then
            return 0;
        end
    end
    
    if DelItemByIndex(nItemIdx, 1) ~= 1 then
        return 0;
    end
    
    SetTask(VET_201006_01_TASK_USETECHAN_COUNT, nCount);
    if mod(nCount, 50) == 0 then
        vet_201006_01_get_exp(200000);
        gf_EventGiveRandAward(VET_201006_01_USETECHAN_AWARD_LIST_50, 10000, 1, 
                        VET_201006_01_STR_LOG_TITLE, format(VET_201006_01_TB_LOG_ACTION[7], nCount));
    else
        vet_201006_01_get_exp(200000);
        gf_EventGiveRandAward(VET_201006_01_USETECHAN_AWARD_LIST, 1000, 1, 
                        VET_201006_01_STR_LOG_TITLE, VET_201006_01_TB_LOG_ACTION[6]);
    end
end