-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ´óÀíÈÎÎñNPCò¿»ðÒ¹²æScript
-- By StarryNight
-- 2006/01/11 PM 15:44

--°®ÇéÔÚËêÔÂÁ÷×ªÖÐÖð½¥ÍÈÉ«£¬Ê£ÏÂµÄ»áÊÇÊ²Ã´¡­¡­

-- ======================================================

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\´óÀí\\task_head.lua")

function OnDeath(index)
    local nPreservedPlayerIndex = PlayerIndex;
    local nMemCount = GetTeamSize();
    local nMapId, nX, nY = GetWorldPos();

    if nMemCount == 0 then -- Íæ¼ÒÎ´×é¶Ó
        if GetTask(TASK_DL_LV60_ID) == 6 then
        	SetTask(TASK_DL_LV60_ID, 7);
        	Msg2Player("§¸nh b¹i D¹ Xoa, trë vÒ gÆp §æng Giµ La!");
        	TaskTip("§¸nh b¹i D¹ Xoa, trë vÒ gÆp §æng Giµ La!");
        end;
    else
        for i=1,nMemCount do
           PlayerIndex = GetTeamMember(i);
           local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
           local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
           if GetTask(TASK_DL_LV60_ID) == 6 and nDist >= 0 and nDist <= 50 then
           	SetTask(TASK_DL_LV60_ID, 7);
           	Msg2Player("§¸nh b¹i D¹ Xoa, trë vÒ gÆp §æng Giµ La!");
           	TaskTip("§¸nh b¹i D¹ Xoa, trë vÒ gÆp §æng Giµ La!");
           end;
				end;
		PlayerIndex = nPreservedPlayerIndex; -- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
    end;
end;