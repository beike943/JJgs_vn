--”„π÷Õ∑ƒø
--created by lizhi
--2005-8-24 15:25
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnDeath()
    if GetTask(TASK_YZ_FOUR) == 1 then
        SetTask(TASK_YZ_FOUR, 2);
        AddItem(2,0,304,1);       --¿≈´e”Ò≈Â
        Msg2Player("Quay v“ g∆p Vi‘n Tinh");
        TaskTip("Quay v“ g∆p Vi‘n Tinh");
    end;
end;
