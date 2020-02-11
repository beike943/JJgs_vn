--=============================================
--create by zhoulimei 2010.5.12
--describe:越南版2010年6月活动1 武林秘印，金， 木， 水， 火，土脚本文件
--=============================================
Include("\\script\\online_activites\\2010_06\\activites_01\\head.lua");

function OnUse(nItemIdx)
    if gf_CheckEventDateEx(VET_201006_01_EVENT_NUMBER) == 0 then
        Talk(1, "", VET_201006_01_TB_STRING[21]);
        return 0;
    end
    
    if vet_201006_01_limit_73() == 0 then
        Talk(1, "", VET_201006_01_TB_STRING[23]);
        return 0;
    end
    
    local nDate = tonumber(date("%Y%m%d"));
    if GetTask(VET_201006_01_TASK_DATE_MIYIN) < nDate then
        SetTask(VET_201006_01_TASK_DATE_MIYIN, nDate);
        SetTask(VET_201006_01_TASK_USEMIYIN_COUNT, 0);
    end
    
    local nCount = GetTask(VET_201006_01_TASK_USEMIYIN_COUNT);
    if nCount >= VET_201006_01_USEMIYIN_COUNT_MAX then
        Talk(1, "", VET_201006_01_TB_STRING[24]);
        return 0;
    end
    
    if DelItemByIndex(nItemIdx, 1) ~= 1 then
        return 0;
    end
    SetTask(VET_201006_01_TASK_USEMIYIN_COUNT, nCount + 1);
    vet_201006_01_get_exp(200000);
end