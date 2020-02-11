--npcÎ÷ÏÄ½«Áì
--created by lizhi
--2005-8-24 15:25

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnDeath()
    local nPreservedPlayerIndex = PlayerIndex;
    local nMemCount = GetTeamSize();
    local nMapId, nX, nY = GetWorldPos();

    if nMemCount == 0 then -- Íæ¼ÒÎ´×é¶Ó
        if GetTask(TASK_XYTY) == 31 then
            AddItem(2,0,62,1);
            SetTask(TASK_XY_TEMP, GetTask(TASK_XY_TEMP) + 1);
            if GetTask(TASK_XY_TEMP) == 3 then
                SetTask(TASK_XYTY, 32);
                SetTask(TASK_XY_TEMP, 0);
                Msg2Player("VÒ bÈm b¸o C«ng T«n Th­");
                TaskTip("VÒ bÈm b¸o C«ng T«n Th­");
            end;
        end;
    else
        for i=1,nMemCount do
            PlayerIndex = GetTeamMember(i);
            local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
            local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
            if GetTask(TASK_XYTY) == 31 and nDist >= 0 and nDist <= 50 then
                AddItem(2,0,62,1);
                SetTask(TASK_XY_TEMP, GetTask(TASK_XY_TEMP) + 1);
                if GetTask(TASK_XY_TEMP) == 3 then
                    SetTask(TASK_XYTY, 32);
                    SetTask(TASK_XY_TEMP, 0);
                    Msg2Player("VÒ bÈm b¸o C«ng T«n Th­");
                    TaskTip("VÒ bÈm b¸o C«ng T«n Th­");
                end;
            end;
		end;
		PlayerIndex = nPreservedPlayerIndex; -- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
    end;
end;
