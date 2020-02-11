-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ´óÀíÈÎÎñNPC¶Î³Ð¶÷Script
-- By StarryNight
-- 2006/01/13 PM 20:37

--°®ÇéÔÚËêÔÂÁ÷×ªÖÐÖð½¥ÍÈÉ«£¬Ê£ÏÂµÄ»áÊÇÊ²Ã´¡­¡­

-- ======================================================

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\´óÀí\\task_head.lua")

function OnDeath(index)
    local nPreservedPlayerIndex = PlayerIndex;
    local nMemCount = GetTeamSize();
    local nMapId, nX, nY = GetWorldPos();

    if nMemCount == 0 then -- Íæ¼ÒÎ´×é¶Ó
        if GetTask(TASK_DL_LV80_ID) == 1 then
        	SetTask(TASK_DL_LV80_ID, 2);
        	Msg2Player("§· ®¸nh b¹i §oµn Thõa ¢n, ch¾c ch¾n NhÞ Hoµng Tö ë gÇn ®©y th«i.");
        	TaskTip("§· ®¸nh b¹i §oµn Thõa ¢n, ch¾c ch¾n NhÞ Hoµng Tö ë gÇn ®©y th«i.");
        end;
    else
        for i=1,nMemCount do
           PlayerIndex = GetTeamMember(i);
           local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
           local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
           if GetTask(TASK_DL_LV80_ID) == 1 and nDist >= 0 and nDist <= 50 then
           	SetTask(TASK_DL_LV80_ID, 2);
           	Msg2Player("§· ®¸nh b¹i §oµn Thõa ¢n, ch¾c ch¾n NhÞ Hoµng Tö ë gÇn ®©y th«i.");
           	TaskTip("§· ®¸nh b¹i §oµn Thõa ¢n, ch¾c ch¾n NhÞ Hoµng Tö ë gÇn ®©y th«i.");
           end;
				end;
		PlayerIndex = nPreservedPlayerIndex; -- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
    end;
end
