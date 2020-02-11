--=============================================
--create by zhangming 2010.7.29
--describe:越南版2010年挑战四灵boss活动 四灵鼎脚本文件
--=============================================

--GetUnitCurStates

Include ("\\script\\online_activites\\tiaozhansilingboss\\string.lua")
Include ("\\script\\online_activites\\task_values.lua")
Include("\\script\\lib\\globalfunctions.lua");--公共函数文件
Include("\\script\\online_activites\\tiaozhansilingboss\\mission_head.lua");

function main()
    if GetLevel() < 77 or GetPlayerFaction() == 0 then
        Talk(1,"",VET_201008_02_TB_STR_LIST[18])
        return
    end
    local tbSel = {
        VET_201008_02_TB_STR_LIST[4].."/get_tanxiangmu",
        VET_201008_02_TB_STR_LIST[5].."/gf_DoNothing",
    }
    local nNpcIndex = GetGlbValue(1032)
    local nNpcState = GetUnitCurStates(nNpcIndex,1)-1
    Say(format(VET_201008_02_TB_STR_LIST[6],nNpcState),getn(tbSel),tbSel)
end

function get_tanxiangmu()
    local nDate = tonumber(date("%y%m%d"))
    if GetTask(VET_201008_02_TASK_DATE_TANXIANGMU) == nil or GetTask(VET_201008_02_TASK_DATE_TANXIANGMU) < nDate then
        SetTask(VET_201008_02_TASK_DATE_TANXIANGMU,nDate)
        SetTask(VET_201008_02_TASK_NUM_TANXIANGMU,0)
    end
    if GetTask(VET_201008_02_TASK_NUM_TANXIANGMU) >= 80 then
        Talk(1,"",VET_201008_02_TB_STR_LIST[7])
        return
    end
    local nNpcIndex = GetGlbValue(1032)
    local nNpcState = GetUnitCurStates(nNpcIndex,1)-1
    if nNpcState >= MS_MAX_NUM_TANXIANGMU then
        Talk(1,"",VET_201008_02_TB_STR_LIST[8])
        return
    end
    if DelItem(VET_201008_02_TB_ITEM_LIST[1][2],VET_201008_02_TB_ITEM_LIST[1][3],VET_201008_02_TB_ITEM_LIST[1][4],1) ~= 1 then
        Talk(1,"",VET_201008_02_TB_STR_LIST[17])
        return
    end
    AddUnitStates(nNpcIndex,1,1)
    SetTask(VET_201008_02_TASK_NUM_TANXIANGMU,GetTask(VET_201008_02_TASK_NUM_TANXIANGMU)+1)
    give_award()
    nNpcState = nNpcState + 1
    if nNpcState >= MS_MAX_NUM_TANXIANGMU then
        SetMissionV(MV_TIMER_LOOP,0)
        --MS_ProcessStartedTimer()
        SetMissionV(MV_MISSION_STATE,MS_STATE_ENDING)
    end
    if nNpcState == 10 or nNpcState == 50 or nNpcState == 100 or nNpcState == 150 or nNpcState == 190 then
        Msg2Global(format(VET_201008_02_TB_STR_LIST[20],nNpcState))
    end
end

function give_award()
    gf_EventGiveRandAward(VET_201008_02_TB_GIVE_TANXIANGMU_AWARD,100,1,VET_201008_02_STR_LOG_TITLE,VET_201008_02_TB_LOG_ACTION_LIST[1])
end
