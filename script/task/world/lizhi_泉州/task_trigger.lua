--  文件说明
--  泉州的所有触发器事件
--  Created by lizhi
--  2005-8-3 15:05

Include("\\script\\task\\world\\lizhi_泉州\\task_head.lua");
Include("\\script\\task\\world\\lizhi_长歌门\\task_head.lua");
Include("\\script\\task\\world\\g_random_head.lua");

function Wl_Killed()    --杀死无赖

    local nStep = 0;

    RemoveTrigger(GetRunningTrigger());
    
    nStep = GetTask(TASK_LEV_12_ID);
    SetTask(TASK_LEV_12_ID, nStep + 1);
    
    if (nStep == 2) then
        TaskTip("杀死10个无赖已完成");
    end;
end;

function Lm_Killed_1()
    local nItemCount = GetItemCount(2, 1, 154); 
    if nItemCount >= 20 then
        TaskTip("收集20个玉器商货已完成");
    end;
    
    if g_probability(40, 100) then
        AddItem(2,1,154,1);
    end;
end;

function Lm_Killed_10()    --杀死流氓

    local nStep = 0;
    
    RemoveTrigger(GetRunningTrigger());

    nStep = GetTask(TASK_LEV_12_ID);
    SetTask(TASK_LEV_12_ID, nStep + 1);
    
    if (nStep == 2) then
        TaskTip("击杀10名流氓已完成");
    end;
end;

function Yc_Killed()    --杀死草药

    local nType = 0;
    local nTrigger = 0;
    local nQingCount = 0;
    local nGeCount = 0;
    local nPeiCount = 0;
    local nLianCount = 0;
    local nJinCount = 0;
    
    nQingCount = GetItemCount(2, 0, 33);    --青蒿
    nGeCount = GetItemCount(2, 0, 34);      --葛根
    nPeiCount = GetItemCount(2, 0, 35);     --佩兰
    nLianCount = GetItemCount(2, 0, 36);    --连翘
    nJinCount = GetItemCount(2, 0, 37);     --金银花
    
    if ((nQingCount >= 3) and (nGeCount >= 3) and (nPeiCount >= 3) and (nLianCount >= 3) and (nJinCount >= 3)) then
        Msg2Player("已经收集足够的材料了");
    end;
    
    nType = random(0, 4);

    if (nType == 0) then
        AddItem(2, 0, 33, 1);   --青蒿
    elseif (nType == 1) then
        AddItem(2, 0, 34, 1);   --葛根
    elseif (nType == 2) then
        AddItem(2, 0, 35, 1);   --佩兰
    elseif (nType == 3) then
        AddItem(2, 0, 36, 1);   --连翘
    elseif (nType == 4) then
        AddItem(2, 0, 37, 1);   --金银花
    end;
end;

function Yz_Killed()    --杀死野猪
    
    if g_probability(5, 100) then
        AddItem(2, 0, 39, 1);
    end;
end;

function Leave_Game()
    RemoveTrigger(GetRunningTrigger());
    --RemoveTrigger(GetTrigger(88));
    RemoveTrigger(GetTrigger(86));
    if GetTask(TASK_LEV_18_ID) == 2 then
        KillFollower();
        SetTask(TASK_LEV_18_ID, 1);
    end;
end;

function Zs_OnTimer()
    
    local nStep = 0;
    
    RemoveTrigger(GetRunningTrigger());
    RemoveTrigger(GetTrigger(87));
    --RemoveTrigger(GetTrigger(88));
    KillFollower();
    nStep = GetTask(TASK_LEV_18_ID);
    
    if (nStep == 2) then
        SetTask(TASK_LEV_18_ID, 1);
        Msg2Player("请在90秒内将钟氏送达");
        TaskTip("时间已到，任务失败");
        --CreateTrigger(0, 195, 85); --再杀一次章伟刚
    end;
end;

--function Enter_Map()
--    RemoveTrigger(GetTrigger(86));
--    RemoveTrigger(GetTrigger(87));
--    RemoveTrigger(GetRunningTrigger());
--    
--    Talk(2,"","<color=green>钟氏<color>：多谢<sex>相救，现在已经到泉州城了，就不劳烦<sex>了。<sex>如果有时间来家里看看啊。");
--end;