--npc¾ÅÍ·½ð·ï½Å±¾
--created by lizhi
--2005-8-24 15:25
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\lizhi_ÏåÑô\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()
    if GetTask(TASK_XYTY) == 18 then
        task_18_00();
        return
    elseif GetTask(TASK_XYTY) == 23 or GetTask(TASK_XYTY) == 24 then
        task_23_00();
        return
    else
        Talk(1,"","Ch¹y c¸i g× mµ ch¹y! Chót quy t¾c còng kh«ng cã, n¬i nµy cã thÓ ®Ó ng­¬i ch¹y lung tung sao? Cßn kh«ng mau rêi khái ®©y!");
    end;
end;

function OnDeath()
    local nPreservedPlayerIndex = PlayerIndex;
    local nMemCount = GetTeamSize();
    local nMapId, nX, nY = GetWorldPos();

    if nMemCount == 0 then -- Íæ¼ÒÎ´×é¶Ó
        if GetTask(TASK_XYTY) == 23 or GetTask(TASK_XYTY) == 24 then
            AddItem(2,0,60,1);  --¸øÍØ°ÏÆäµÄÐÅ
            SetTask(TASK_XYTY, 25);
            SetTask(TASK_XY_TEMP, 0);
--            RemoveTrigger(GetTrigger(LEAVE_GAME_XY));
--            RemoveTrigger(GetTrigger(LEAVE_RECT_XY));
            Msg2Player("T×m Th¸c B¹t Kú");
            TaskTip("T×m Th¸c B¹t Kú");
        end;
    else
        for i=1,nMemCount do
            PlayerIndex = GetTeamMember(i);
            local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
            local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
            if (GetTask(TASK_XYTY) == 23 or GetTask(TASK_XYTY) == 24) and nDist >= 0 and nDist <= 50 then
                AddItem(2,0,60,1);  --¸øÍØ°ÏÆäµÄÐÅ
                SetTask(TASK_XYTY, 25);
                SetTask(TASK_XY_TEMP, 0);
--                RemoveTrigger(GetTrigger(LEAVE_GAME_XY));
--                RemoveTrigger(GetTrigger(LEAVE_RECT_XY));
                Msg2Player("T×m Th¸c B¹t Kú");
                TaskTip("T×m Th¸c B¹t Kú");
            end;
		end;
		PlayerIndex = nPreservedPlayerIndex; -- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
    end;

end;
