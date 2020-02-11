--npcÉ½´óÍõ
--created by lizhi
--2005-8-24 15:25

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

function OnDeath()
    local nPreservedPlayerIndex = PlayerIndex;
    local nMemCount = GetTeamSize();
    local nMapId, nX, nY = GetWorldPos();

    if nMemCount == 0 then -- Íæ¼ÒÎ´×é¶Ó
        if GetTask(TASK_XYTY) == 58 then
            AddItem(2,0,73,1);  --Á¼É½ÃÜÐÅ
            SetTask(TASK_XYTY, 59);
            Msg2Player("VÒ bÈm b¸o C«ng T«n Th­");
            TaskTip("VÒ bÈm b¸o C«ng T«n Th­");
        end;
    else
        for i=1,nMemCount do
            PlayerIndex = GetTeamMember(i);
            local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
            local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
            if GetTask(TASK_XYTY) == 58 and nDist >= 0 and nDist <= 50 then
                AddItem(2,0,73,1);  --Á¼É½ÃÜÐÅ
                SetTask(TASK_XYTY, 59);
                Msg2Player("VÒ bÈm b¸o C«ng T«n Th­");
                TaskTip("VÒ bÈm b¸o C«ng T«n Th­");
            end;
		end;
		PlayerIndex = nPreservedPlayerIndex; -- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
    end;
end;
