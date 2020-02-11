--npcÕÂÎ°¸Õ½Å±¾
--created by lizhi
--2005-8-24 15:25

Include("\\script\\task\\world\\lizhi_ÈªÖÝ\\task_head.lua")
--Include("\\script\\task\\world\\lizhi_ÈªÖÝ\\18¼¶\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\lizhi_³¤¸èÃÅ\\task_head.lua");

function OnDeath()
    local nPreservedPlayerIndex = PlayerIndex;
    local nMemCount = GetTeamSize();
    local nMapId, nX, nY = GetWorldPos();

    if nMemCount == 0 then -- Íæ¼ÒÎ´×é¶Ó
        if GetTask(TASK_LEV_18_ID) == 1 then
            local nItemCount = 0;
        	
        	--ÕÙ»½ÖÓÊÏNPC
        	if GetTask(TASK_LEV_18_ID) == 1 then
        	    SummonNpc("B¸t Phô Hµ §«ng S­","Chung ThÞ");
        	    CreateTrigger(1, 195, 86);
                ContinueTimer(GetTrigger(86));
                
                CreateTrigger(3, 202, 87);
                SetLogType(GetTrigger(87), 1);
                
                CreateTrigger(2, 1303, 88); --·ÀÖ¹¿ç·þ¼ÆÊ±Æ÷Í£Ö¹¼ÆÊ±ÎÊÌâ

                SetTask(TASK_LEV_18_ID, 2);
        	
            	Msg2Player("Trong 90 gi©y, ®­a Chung ThÞ vÒ c¹nh Chung Phãng.");
            	TaskTip("Trong 90 gi©y, ®­a Chung ThÞ vÒ c¹nh Chung Phãng.");
            end;
        end;
        -- »ñÈ¡ÕÂÎ°¸ÕµÄÃØº¯
        if GetTask(TASK_THREE) == 0 then
            nItemCount = GetItemCount(2, 0, 40);
            if (nItemCount == 0) then
                AddItem(2, 0, 40, 1);
            end;
        end;
    else
        for i=1,nMemCount do
            PlayerIndex = GetTeamMember(i);
            local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
            local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
            if GetTask(TASK_LEV_18_ID) == 1 and nDist >= 0 and nDist <= 50 then
            	--ÕÙ»½ÖÓÊÏNPC
            	if GetTask(TASK_LEV_18_ID) == 1 then
            	    SummonNpc("B¸t Phô Hµ §«ng S­","Chung ThÞ");
            	    CreateTrigger(1, 195, 86);
                    ContinueTimer(GetTrigger(86));
                    
                    CreateTrigger(3, 202, 87);
                    SetLogType(GetTrigger(87), 1);
                    
                    --CreateTrigger(2, 1303, 88); --·ÀÖ¹¿ç·þ¼ÆÊ±Æ÷Í£Ö¹¼ÆÊ±ÎÊÌâ
                    
                    SetTask(TASK_LEV_18_ID, 2);
            	
                	Msg2Player("Trong 90 gi©y, ®­a Chung ThÞ vÒ c¹nh Chung Phãng.");
                	TaskTip("Trong 90 gi©y, ®­a Chung ThÞ vÒ c¹nh Chung Phãng.");
                end;
            end;
            -- »ñÈ¡ÕÂÎ°¸ÕµÄÃØº¯
            if GetTask(TASK_THREE) == 0 then
                if GetItemCount(2, 0, 40) ==0 then
                    AddItem(2, 0, 40, 1);
                end;
            end;
		end;
		PlayerIndex = nPreservedPlayerIndex; -- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
    end;
end;
