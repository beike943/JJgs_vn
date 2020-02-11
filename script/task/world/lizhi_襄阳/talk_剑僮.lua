--ºÍ½£Ù×Ëµ»°
--created by lizhi
--2005-8-19 11:20
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_ÏåÑô\\task_main.lua");

function talk_three()
    local nStep = GetTask(TASK_XYTY);
    if nStep == 3 then
        task_03_00();
    elseif nStep == 7 then
        task_07_00();
    end;
end;