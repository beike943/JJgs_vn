--npc¹Ë´óÉ©
--created by lizhi
--2005-8-24 15:25

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnDeath()
    local nPreservedPlayerIndex = PlayerIndex;
    local nMemCount = GetTeamSize();
    local nMapId, nX, nY = GetWorldPos();

    if nMemCount == 0 then -- Íæ¼ÒÎ´×é¶Ó
        if GetTask(TASK_JJC) == 18 then
            SetTask(TASK_JJC_BEAT_G, 2);
			Msg2Player("§¸nh b¹i Cè §¹i TÈu");
           	TaskTip("§¸nh b¹i Cè §¹i TÈu");
	    	if GetTask(TASK_JJC_BEAT_SW) == 2 and GetTask(TASK_JJC_BEAT_LL) == 2 and GetTask(TASK_JJC_BEAT_G) == 2 then
		        SetTask(TASK_JJC, 19);
		        SetTask(TASK_JJC_BEAT_SW, 0);
		        SetTask(TASK_JJC_BEAT_LL, 0);
		        SetTask(TASK_JJC_BEAT_G, 0);
		        Msg2Player("Quay l¹i gÆp Tèng Giang");
		        TaskTip("Quay l¹i gÆp Tèng Giang");
    		end;
        end;
    else
        for i=1,nMemCount do
            PlayerIndex = GetTeamMember(i);
            local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
            local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
            if GetTask(TASK_JJC) == 18 and nDist >= 0 and nDist <= 50 then
	            SetTask(TASK_JJC_BEAT_G, 2);
				Msg2Player("§¸nh b¹i Cè §¹i TÈu");
           		TaskTip("§¸nh b¹i Cè §¹i TÈu");
		    	if GetTask(TASK_JJC_BEAT_SW) == 2 and GetTask(TASK_JJC_BEAT_LL) == 2 and GetTask(TASK_JJC_BEAT_G) == 2 then
			        SetTask(TASK_JJC, 19);
			        SetTask(TASK_JJC_BEAT_SW, 0);
			        SetTask(TASK_JJC_BEAT_LL, 0);
			        SetTask(TASK_JJC_BEAT_G, 0);
			        Msg2Player("Quay l¹i gÆp Tèng Giang");
			        TaskTip("Quay l¹i gÆp Tèng Giang");
	    		end;
	        end;
		end;
		PlayerIndex = nPreservedPlayerIndex; -- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
    end;
end;
