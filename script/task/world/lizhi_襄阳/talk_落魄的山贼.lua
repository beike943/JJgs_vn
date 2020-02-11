--npc ÂäÆÇµÄÉ½Ôô½Å±¾
--created by lizhi
--2005-8-28 21:54
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_ÏåÑô\\task_main.lua");

function talk()
    local nStep = GetTask(TASK_XYTY);
    
    if nStep == 45 then
        task_45_00();
    elseif nStep == 49 then
        task_49_00();
    elseif nStep == 53 then
        task_53_00();
    elseif nStep == 57 then
        task_57_00();
    end;
end;