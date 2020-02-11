--公孙书对话
--created by lizhi
--2005-8-18 17:31
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_襄阳\\task_main.lua");

function talk_one()
    local nStep = GetTask(TASK_XYTY);
    
    if nStep == 1 then
        task_01_00();
    elseif nStep == 9 then
        task_09_00();
    elseif nStep == 11 then
        task_11_00();
    elseif nStep == 13 then
        task_13_00();
    elseif nStep == 22 then
        task_22_00();
    elseif nStep == 28 then
        task_28_00();
    elseif nStep == 30 then
        task_30_00();
    elseif nStep == 32 then
        task_32_00();
    elseif nStep == 34 then
        task_34_00();
    elseif nStep == 37 then
        task_37_00();
    elseif nStep == 42 then
        task_42_00();
    elseif nStep == 44 then
        task_44_00();
    elseif nStep == 54 then
        task_54_00();
    elseif nStep == 56 then
        task_56_00();
    elseif nStep == 59 then
        task_59_00();
    end;
end;