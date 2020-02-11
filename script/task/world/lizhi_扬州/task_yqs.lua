--使用与妻书以后执行的脚本
--created by lizhi
--2005-9-1 16:14

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnUse()
    local szMsg = {
        "这是雷胜最后的绝笔信，去交给扬州的冯彤儿!"
    }
    if GetTask(TASK_YZ_ONE) == 0 then
        TalkEx("task_00_01", szMsg);
    end;
end;

function task_00_01()
    SetTask(TASK_YZ_ONE, 1);
    Msg2Player("将书信交给扬州的冯彤儿﹗");
    TaskTip("将书信交给扬州的冯彤儿﹗");
end;