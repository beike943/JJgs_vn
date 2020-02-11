--ÎÄ¼þËµÃ÷
--created by lizhi
--2005-8-17 14:53

Include("\\script\\task\\teach\\teach_main.lua");

function talk_new()
    local nStep = GetTask(1);
    if nStep == 21 then
        task_021_00();
    elseif nStep == 22 then
        task_022_00();
    elseif nStep == 23 then
        if GetLevel() >= 10 then
            RemoveTrigger(GetRunningTrigger());
            task_023_00();
        else
            Talk(1,"","§îi ng­¬i ®¹t cÊp 10 chøng minh ®­îc t­ chÊt cña m×nh míi ®Õn t×m ta.");
        end;
    end;
end;