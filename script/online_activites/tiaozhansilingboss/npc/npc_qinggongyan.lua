--=============================================
--create by zhangming 2010.7.29
--describe:越南版2010年挑战四灵boss活动 庆功宴脚本文件
--=============================================

--GetUnitCurStates

Include ("\\script\\online_activites\\tiaozhansilingboss\\string.lua")
Include ("\\script\\online_activites\\task_values.lua")
Include("\\script\\lib\\globalfunctions.lua");--公共函数文件

function main()
    if GetLevel() < 77 or GetPlayerFaction() == 0 then
        Talk(1,"",VET_201008_02_TB_STR_LIST[12])
        return
    end
    local nDate = tonumber(date("%y%m%d"))
    local nDateLast = GetTask(VET_201008_02_TASK_DATE_QINGGONGYAN)
    if nDateLast == nil or nDateLast < nDate then
        SetTask(VET_201008_02_TASK_DATE_QINGGONGYAN,nDate)
        SetTask(VET_201008_02_TASK_NUM_QINGGONGYAN,0)
    end
    if GetTask(VET_201008_02_TASK_NUM_QINGGONGYAN) >= 9 then
        Talk(1,"",VET_201008_02_TB_STR_LIST[13])
        return
    end
    local nDifTime = GetTime()-GetTask(VET_201008_02_TASK_TIME_QINGGONGYAN)
    if nDifTime < 30 then
        Talk(1,"",format(VET_201008_02_TB_STR_LIST[14],30-nDifTime))
        return
    end
    SetTask(VET_201008_02_TASK_NUM_QINGGONGYAN,GetTask(VET_201008_02_TASK_NUM_QINGGONGYAN)+1)
    SetTask(VET_201008_02_TASK_TIME_QINGGONGYAN,GetTime())
    local nNpcIndex = GetTargetNpc()
    SetNpcLifeTime(nNpcIndex,0)
    ModifyExp(200000)
    gf_EventGiveRandAward(VET_201008_02_TB_GIVE_QINGGONGYAN_AWARD,10000,1,VET_201008_02_STR_LOG_TITLE,VET_201008_02_TB_LOG_ACTION_LIST[3])
end
