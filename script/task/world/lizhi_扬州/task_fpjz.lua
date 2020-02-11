--飞瀑金针
--created by lizhi
--2005-9-1 16:39

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");

function OnUse()
    local szMsg = {
        "这是在雷胜尸体身上发现的飞瀑金针，看样子是出自唐门，追查一下，或许能够找到凶手!"
    };
    if GetTask(TASK_YZ_TWO) == 0 then
        TalkEx("task_00_01", szMsg);
    end;
end;

function task_00_01()
    SetTask(TASK_YZ_TWO, 1);
    Msg2Player("去唐门找唐春帮忙追查暗器的使用者");
    TaskTip("去唐门找唐春帮忙追查暗器的使用者");
end;
