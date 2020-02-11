-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ´óÀíÈÎÎñNPCÄ¦ºôÂÞåÈScript
-- By StarryNight
-- 2006/01/13 PM 13:20

--°®ÇéÔÚËêÔÂÁ÷×ªÖÐÖð½¥ÍÈÉ«£¬Ê£ÏÂµÄ»áÊÇÊ²Ã´¡­¡­

-- ======================================================

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\´óÀí\\task_head.lua")

function OnDeath(index)
    local nPreservedPlayerIndex = PlayerIndex;
    local nMemCount = GetTeamSize();
    local nMapId, nX, nY = GetWorldPos(); 

    if nMemCount == 0 then -- Íæ¼ÒÎ´×é¶Ó
        if GetTask(TASK_DL_LV75_ID) == 7 then
        	SetTask(TASK_DL_LV75_ID, 8);
        	Msg2Player("VÒ th«ng b¸o cho TrÞnh Qu¸n Chi ®· ®¸nh b¹i Ma H« La Giµ");
        	TaskTip("VÒ th«ng b¸o cho TrÞnh Qu¸n Chi ®· ®¸nh b¹i Ma H« La Giµ");
        end;
    else
        for i=1,nMemCount do
           PlayerIndex = GetTeamMember(i);
           local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
           local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
           if GetTask(TASK_DL_LV75_ID) == 7 and nDist >= 0 and nDist <= 50 then
           	SetTask(TASK_DL_LV75_ID, 8);
           	Msg2Player("VÒ th«ng b¸o cho TrÞnh Qu¸n Chi ®· ®¸nh b¹i Ma H« La Giµ");
           	TaskTip("VÒ th«ng b¸o cho TrÞnh Qu¸n Chi ®· ®¸nh b¹i Ma H« La Giµ");
           end;
				end;
		PlayerIndex = nPreservedPlayerIndex; -- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
    end;
end
