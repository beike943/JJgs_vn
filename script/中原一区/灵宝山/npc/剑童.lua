--½£Í¯Ä¬ÈÏ¶Ô»°
--created by lizhi
--2005-9-7 10:49

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_ÏåÑô\\task_main.lua");

function main()
    local nStep = GetTask(TASK_XYTY);
    if nStep == 3 then
        task_03_00();
        return
    elseif nStep == 7 then
        task_07_00();
        return
    end;
    
    Talk(1,"","S­ Phã lu«n nãi  c«ng phu cña kiÕm lµ ë bªn ngoµi kiÕm cßn bªn trong rèt cuéc lµ g× ta còng kh«ng râ n÷a.");
end;