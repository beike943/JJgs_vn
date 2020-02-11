--=============================================
--create by zhangming 2010.8.20
--describe:越南版2010年9月活动1 未烤熟的月饼脚本文件
--=============================================

Include("\\script\\online_activites\\2010_09\\activites_01\\head.lua");--活动头文件

g_szItemSayHead = gf_FixColor(VET_201009_01_TB_ITEM_LIST[2][1], 2, 1);

function OnUse(nItemIdx)
    if gf_CheckEventDateEx(VET_201009_01_EVENT_NUMBER) ~= 1 then
        Talk(1,"",VET_201009_01_TB_STRING_LIST[1])
        return
    end
    local nHaveAddedExp = GetTask(VET_201009_01_TASK_LIMITE_EXP_MOONCAKE_SP)
    if nHaveAddedExp >= VET_201009_01_EXP_LIMITE_SP then
        Talk(1,"",VET_201009_01_TB_STRING_LIST[14])
        return
    end
    if DelItemByIndex(nItemIdx, 1) == 1 then
        local nAddExp = 250000
        if nHaveAddedExp + nAddExp > VET_201009_01_EXP_LIMITE_SP then
            nAddExp = VET_201009_01_EXP_LIMITE_SP - nHaveAddedExp
        end
        SetTask(VET_201009_01_TASK_LIMITE_EXP_MOONCAKE_SP,nHaveAddedExp+nAddExp)
        ModifyExp(nAddExp)
        if random(1,20) == 1 then
            CastState("state_confusion",100,54,1) --3秒混乱
        end
    end
end
