--和拓跋其对话
--created by lizhi
--2005-8-19 10:59
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_襄阳\\task_main.lua");

function talk()
    local nStep = GetTask(TASK_XYTY);
    if nStep == 25 then
        task_25_00();
    elseif nStep == 35 then
        task_35_00();
    end;
end;