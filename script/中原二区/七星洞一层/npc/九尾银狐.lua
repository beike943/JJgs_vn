--npc¾ÅÎ²Òøºü½Å±¾
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
        if GetTask(TASK_XYTY) == 20 then
            AddItem(2,0,59,1);  --ÉñÃØÃúÅÆ
            SetTask(TASK_XYTY, 21);
            Msg2Player("Håi b¸o Tö H¹c Ch©n Nh©n");
            TaskTip("Håi b¸o Tö H¹c Ch©n Nh©n");
        end;
    else
        for i=1,nMemCount do
            PlayerIndex = GetTeamMember(i);
            local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
            local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
            if GetTask(TASK_XYTY) == 20 and nDist >= 0 and nDist <= 50 then
                AddItem(2,0,59,1);  --ÉñÃØÃúÅÆ
                SetTask(TASK_XYTY, 21);
                Msg2Player("Håi b¸o Tö H¹c Ch©n Nh©n");
                TaskTip("Håi b¸o Tö H¹c Ch©n Nh©n");
            end;
		end;
		PlayerIndex = nPreservedPlayerIndex; -- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
    end;
end;
