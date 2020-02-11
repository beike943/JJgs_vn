--扬州任务触发器处理函数
--created by lizhi
--2005-9-1 11:20
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\g_random_head.lua");

function LaoHu_Killed()
    if g_probability(50, 1000) then
        AddItem(2,0,44,1);
    end;
    SetTask(TASK_FIVE, 9);
end;

function Ck_Killed()
    if g_probability(333, 1000) then
        AddItem(2,0,98,1);
    end;
end;

function Dcc_Killed()
    if g_probability(100, 1000) then
        AddItem(2,0,99,1);
    end;
end;

function Tx_Killed()
    if g_probability(333, 1000) then
        AddItem(2,0,102,1);
    end;
    if GetItemCount(2,0,102) >= 20 then
        CreateTrigger(4,223,TALK_YZ_TC);    --TALK TO 唐春
    end;
end;

function Ws_Killed()
    if g_probability(50, 1000) then
        AddItem(2,0,104,1);
    end;
end;

function Bg_Killed()
    if GetItemCount(2,0,144) >= 1 then
        return
    end;
    AddItem(2,0,144,1);
end;

function Cy_Killed()
    if g_probability(50, 1000) then
        AddItem(2,0,145,1);
    end;
end;

function Yh_Killed()
    if g_probability(50, 1000) then
        AddItem(2,0,146,1);
    end;
end;

function Qs_Killed()
    RemoveTrigger(GetRunningTrigger());
    SetTask(TASK_YZ_THREE, 8);
end;

function Jt_Killed()
    if g_probability(50, 1000) then
        AddItem(2,0,303,1);   --紫凤金钗
    end;
end;

function Sz_Killed()
    if g_probability(100, 1000) then
        AddItem(2,0,305,1);   --村民上衣
    end;
end;

function Szsb_Killed()
    if g_probability(100, 1000) then
        AddItem(2,0,306,1);   --村民裤子
    end;
end;