--ÂäÆÇµÄÉ½ÔôÄ¬ÈÏ¶Ô»°

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_ÏåÑô\\task_main.lua");

function main()
    local nStep = GetTask(TASK_XYTY);
    
    if nStep == 45 then
        task_45_00();
        return
    elseif nStep == 46 or nStep == 47 or nStep == 48 then
        task_46_00()
        return
    elseif nStep == 49 then
        task_49_00();
        return
    elseif nStep == 53 then
        task_53_00();
        return
    elseif nStep == 57 then
        task_57_00();
        return
    end;
    Talk(1,"","Sao sè ta khæ thÕ nµy!");
end;