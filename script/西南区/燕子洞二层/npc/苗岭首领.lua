-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ´óÀíÈÎÎñNPCÃç×åÊ×ÁìScript
-- By StarryNight
-- 2006/01/09 PM 16:12

--°®ÇéÔÚËêÔÂÁ÷×ªÖÐÖð½¥ÍÈÉ«£¬Ê£ÏÂµÄ»áÊÇÊ²Ã´¡­¡­

-- ======================================================

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\´óÀí\\task_head.lua")

function OnDeath(index)
    local nPreservedPlayerIndex = PlayerIndex;
    local nMemCount = GetTeamSize();
    local nMapId, nX, nY = GetWorldPos();

    if nMemCount == 0 then -- Íæ¼ÒÎ´×é¶Ó
        if GetTask(TASK_DL_LV50_ID) == 4 then
        	SetTask(TASK_DL_LV50_ID, 5);
        	AddItem(2,0,370,1);
        	Msg2Player("§· lÊy ®­îc Miªu LÜnh lÖnh bµi, vÒ gÆp Téc tr­ëng Miªu LÜnh");
        	TaskTip("§· lÊy ®­îc Miªu LÜnh lÖnh bµi, vÒ gÆp Téc tr­ëng Miªu LÜnh");
        end;
    else
        for i=1,nMemCount do
           PlayerIndex = GetTeamMember(i);
           local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
           local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
           if GetTask(TASK_DL_LV50_ID) == 4 and nDist >= 0 and nDist <= 50 then
           	SetTask(TASK_DL_LV50_ID, 5);
           	AddItem(2,0,370,1);
           	Msg2Player("§· lÊy ®­îc Miªu LÜnh lÖnh bµi, vÒ gÆp Téc tr­ëng Miªu LÜnh");
           	TaskTip("§· lÊy ®­îc Miªu LÜnh lÖnh bµi, vÒ gÆp Téc tr­ëng Miªu LÜnh");
           end;
				end;
		PlayerIndex = nPreservedPlayerIndex; -- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
    end;
end;