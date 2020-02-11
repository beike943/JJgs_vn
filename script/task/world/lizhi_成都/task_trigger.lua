--文件说明
--成都区触发器脚本
--created by lizhi
--2005-8-12 15:58

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\g_random_head.lua");

function Xtl_Killed()
    if g_probability(35, 100) then
        AddItem(2,0,74,1);
    end;
end;

function Xql_Killed()    
    if g_probability(35, 100) then
        AddItem(2,0,75,1);
    end;
end;

function Brj_Killed()
    if g_probability(20, 100) then
        AddItem(2,0,76,1);
    end;
end;

function Xt_Killed()
    if g_probability(10, 100) then
        if GetItemCount(2,0,79) < 1 then
            AddItem(2, 0, 79, 1);
            RemoveTrigger(GetTrigger(KILL_CD_XT));
            RemoveTrigger(GetTrigger(KILL_CD_FZ));
            SetTask(TASK_CD_FOUR, 4);
        end;
    end;
end;

function Fz_Killed()
    if g_probability(10, 100) then
        if GetItemCount(2,0,79) < 1 then
            AddItem(2,0,79,1);
            RemoveTrigger(GetTrigger(KILL_CD_XT));
            RemoveTrigger(GetTrigger(KILL_CD_FZ));
            SetTask(TASK_CD_FOUR, 4);
        end;
    end;
end;
