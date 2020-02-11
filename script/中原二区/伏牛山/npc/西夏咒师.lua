--npcÎ÷ÏÄÖäÊ¦
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
        if GetTask(TASK_XY_TWO) == 3 then
            if GetItemCount(2,0,210) >= 1 then
                DelItem(2,0,210,1);
                Msg2Player("R¾c Ph¸ Chó Thñy lªn thi thÓ Ph¸p S­ T©y H¹");
                local nStep = GetTask(TASK_XY_TWO_ONE);
                SetTask(TASK_XY_TWO_ONE, nStep + 1);
            else
                Talk(1,"","ChÕt råi! Kh«ng cã <color=yellow>Ph¸ Chó Thñy<color> hay lµ quay vÒ Vâ §ang nhê Tö H¹c Ch©n Nh©n lËp trËn ph¸p.");
            end;
            
            if GetTask(TASK_XY_TWO_ONE) >= 3 then
                SetTask(TASK_XY_TWO, 5);
                AddItem(2,0,72,1);
                if GetTask(TASK_XY_ONE) == 5 and GetTask(TASK_XY_TWO) == 5 then  --Èç¹ûÏåÑôÖ§ÏßÈÎÎñ¶¼Íê³ÉÁË£¬Ôò¼û¹«ËïÊé
                    SetTask(TASK_XYTY, 56);
                    Msg2Player("VÒ bÈm b¸o C«ng T«n Th­");
                    TaskTip("VÒ bÈm b¸o C«ng T«n Th­");
                end;
            end;
        end;
    else
        for i=1,nMemCount do
            PlayerIndex = GetTeamMember(i);
            local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
            local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
            if GetTask(TASK_XY_TWO) == 3 and nDist >= 0 and nDist <= 50 then
                if GetItemCount(2,0,210) >= 1 then
                    DelItem(2,0,210,1);
                    Msg2Player("R¾c Ph¸ Chó Thñy lªn thi thÓ Ph¸p S­ T©y H¹");
                    local nStep = GetTask(TASK_XY_TWO_ONE);
                    SetTask(TASK_XY_TWO_ONE, nStep + 1);
                else
                    Talk(1,"","ChÕt råi! Kh«ng cã <color=yellow>Ph¸ Chó Thñy<color> hay lµ quay vÒ Vâ §ang nhê Tö H¹c Ch©n Nh©n lËp trËn ph¸p.");
                end;
                
                if GetTask(TASK_XY_TWO_ONE) >= 3 then
                    SetTask(TASK_XY_TWO, 5);
                    AddItem(2,0,72,1);
                    if GetTask(TASK_XY_ONE) == 5 and GetTask(TASK_XY_TWO) == 5 then  --Èç¹ûÏåÑôÖ§ÏßÈÎÎñ¶¼Íê³ÉÁË£¬Ôò¼û¹«ËïÊé
                        SetTask(TASK_XYTY, 56);
                        Msg2Player("VÒ bÈm b¸o C«ng T«n Th­");
                        TaskTip("VÒ bÈm b¸o C«ng T«n Th­");
                    end;
                end;
            end;
		end;
		PlayerIndex = nPreservedPlayerIndex; -- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
    end;
end;
