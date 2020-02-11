-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ´óÀíÈÎÎñNPCò¿»ð´ó³¤ÀÏScript
-- By StarryNight
-- 2006/01/13 PM 10:15

--°®ÇéÔÚËêÔÂÁ÷×ªÖÐÖð½¥ÍÈÉ«£¬Ê£ÏÂµÄ»áÊÇÊ²Ã´¡­¡­

-- ======================================================

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\´óÀí\\task_head.lua")

function OnDeath(index)
    local nPreservedPlayerIndex = PlayerIndex;
    local nMemCount = GetTeamSize();
    local nMapId, nX, nY = GetWorldPos();

    if nMemCount == 0 then -- Íæ¼ÒÎ´×é¶Ó
        if GetTask(TASK_DL_LV75_ID) == 1 then
        	SetTask(TASK_DL_LV75_ID, 2);
        	Msg2Player("Håi b¸o Ngò §éc gi¸o chñ ®· ®¸nh b¹i Xi Háa ®¹i tr­ëng l·o");
        	TaskTip("Håi b¸o Ngò §éc gi¸o chñ ®· ®¸nh b¹i Xi Háa ®¹i tr­ëng l·o");
        end;
    else
        for i=1,nMemCount do
           PlayerIndex = GetTeamMember(i);
           local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
           local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
           if GetTask(TASK_DL_LV75_ID) == 1 and nDist >= 0 and nDist <= 50 then
           	SetTask(TASK_DL_LV75_ID, 2);
           	Msg2Player("Håi b¸o Ngò §éc gi¸o chñ ®· ®¸nh b¹i Xi Háa ®¹i tr­ëng l·o");
           	TaskTip("Håi b¸o Ngò §éc gi¸o chñ ®· ®¸nh b¹i Xi Háa ®¹i tr­ëng l·o");
           end;
				end;
		PlayerIndex = nPreservedPlayerIndex; -- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
    end;
end;