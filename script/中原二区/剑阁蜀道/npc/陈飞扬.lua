--³Â·ÉÑï
--created by lizhi
--2005-8-24 19:09
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_½­½ò´å\\task_main.lua");

function main()
    local nStep = GetTask(TASK_JJC);
    if nStep == 6 then
        task_06_00();
    elseif nStep == 7 then
        task_07_00();
    elseif nStep == 24 then
        task_24_00();
    elseif nStep == 25 then
        task_25_00();
    elseif nStep == 27 or nStep == 28 then
        task_27_00();
    elseif nStep >= 32 then
        task_32_00();
    else
        local szTalk = {
            "TrÇn Phi D­¬ng: Ng­êi H¸n……, ng­êi T©y H¹……"
        };
        TalkEx("", szTalk);
    end;
end;

function OnDeath()
    local nPreservedPlayerIndex = PlayerIndex;
    local nMemCount = GetTeamSize();
    
	local nMapId, nX, nY = GetWorldPos();
    if nMemCount == 0 then -- Íæ¼ÒÎ´×é¶Ó    
    	if GetTask(TASK_JJC) == 27 or GetTask(TASK_JJC) == 28 then
	        SetTask(TASK_JJC, 29);
	--        SetDeathScript("");
	        SetTask(TASK_JJC_TEMP, 0);
	--        RemoveTrigger(GetTrigger(LEAVE_GAME_JJC));
	--        RemoveTrigger(GetTrigger(LEAVE_RECT_JJC));
	        task_29_00();
    	end;
    else
        for i=1,nMemCount do
            PlayerIndex = GetTeamMember(i);
            local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
            local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
            if (GetTask(TASK_JJC) == 27 or GetTask(TASK_JJC) == 28) and nDist >= 0 and nDist <= 50 then
	   	        SetTask(TASK_JJC, 29);
		        SetTask(TASK_JJC_TEMP, 0);
		        task_29_00();
            end;
		end;
		PlayerIndex = nPreservedPlayerIndex; -- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
    end;
end;
