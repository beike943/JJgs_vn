--被陈飞扬杀死以后执行的脚本
--created by lizhi
--2005-9-7 11:45

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");

function OnDeath()
    if GetTask(TASK_JJC) == 28 then
        SetTask(TASK_JJC, 27);
        SetNpcLifeTime(GetTask(TASK_JJC_TEMP), 0);
        local npcIndex = CreateNpc("西夏将领3", "陈飞扬", 309,1284,2951);
        SetNpcScript(npcIndex, "\\script\\中原二区\\剑阁蜀道\\npc\\陈飞扬.lua");
        SetDeathScript("");
        SetTask(TASK_JJC_TEMP, 0);
        RemoveTrigger(GetTrigger(LEAVE_GAME_JJC));
        RemoveTrigger(GetTrigger(LEAVE_RECT_JJC));
    end;
    return 0
end;