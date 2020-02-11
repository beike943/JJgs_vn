--被九头金凤杀死以后执行的脚本
--created by lizhi
--2005-9-7 11:45

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");

function OnDeath()
    if GetTask(TASK_XYTY) == 24 then
        SetTask(TASK_XYTY, 23);
        SetNpcLifeTime(GetTask(TASK_XY_TEMP), 0);
        local npcIndex = CreateNpc("Kim Ph鬾g", "Kim Ph鬾g", 326, 1496, 2945);
        SetNpcScript(npcIndex, "\\script\\中原二区\\暮雪山庄\\npc\\九头金凤.lua");
        SetDeathScript("");
        SetTask(TASK_XY_TEMP, 0);
        RemoveTrigger(GetTrigger(LEAVE_GAME_XY));
        RemoveTrigger(GetTrigger(LEAVE_RECT_XY));
    end;
    return 0
end;