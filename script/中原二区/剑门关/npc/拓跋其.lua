--ÍØ°ÏÆä
--created by lizhi
--2005-9-7 11:05

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_ÏåÑô\\task_main.lua");

function main()
    local nStep = GetTask(TASK_XYTY);
    if nStep == 25 then
        task_25_00();
        return
    elseif nStep == 26 or nStep == 27 then
        task_26_00();
        return
    elseif nStep == 35 then
        task_35_00();
        return
    end;
    Talk(1,"","§Şa thÕ cña KiÕm M«n vµ T­¬ng D­¬ng sao hiÓm yÕu thÕ!");
end;