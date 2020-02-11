--文件说明
--与唐忌对话的脚本
--created by lizhi
--2005-8-12 15:11

Include("\\script\\task\\world\\lizhi_成都\\task_main.lua");

function talk_two()
    local nStep = GetTask(TASK_TWO);
    if nStep == 101 then
        task_two_01();
    elseif nStep == 102 then
        task_two_02();
    elseif nStep == 103 then
        task_two_03();
    end;
end;