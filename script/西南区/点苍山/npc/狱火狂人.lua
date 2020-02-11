-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ´óÀíÈÎÎñNPCÓü»ð¿ñÈËScript
-- By StarryNight
-- 2006/01/11 PM 18:28

--°®ÇéÔÚËêÔÂÁ÷×ªÖÐÖð½¥ÍÈÉ«£¬Ê£ÏÂµÄ»áÊÇÊ²Ã´¡­¡­

-- ======================================================

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\´óÀí\\task_head.lua")

function OnDeath(index)
    local nPreservedPlayerIndex = PlayerIndex;
    local nMemCount = GetTeamSize();
    local nMapId, nX, nY = GetWorldPos();

    if nMemCount == 0 then -- Íæ¼ÒÎ´×é¶Ó
        if GetTask(TASK_DL_LV60_1_ID) == 2 then
        	SetTask(TASK_DL_LV60_1_ID, 3);
        	Msg2Player("VÒ Thµnh §« gÆp Vò N­¬ng th«ng b¸o ®· ®¸nh b¹i Ngôc Háa Cuång Nh©n");
        	TaskTip("VÒ Thµnh §« gÆp Vò N­¬ng th«ng b¸o ®· ®¸nh b¹i Ngôc Háa Cuång Nh©n");
        end;
    else
        for i=1,nMemCount do
           PlayerIndex = GetTeamMember(i);
           local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
           local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
           if GetTask(TASK_DL_LV60_1_ID) == 2 and nDist >= 0 and nDist <= 50 then
           	SetTask(TASK_DL_LV60_1_ID, 3);
           	Msg2Player("VÒ Thµnh §« gÆp Vò N­¬ng th«ng b¸o ®· ®¸nh b¹i Ngôc Háa Cuång Nh©n");
           	TaskTip("VÒ Thµnh §« gÆp Vò N­¬ng th«ng b¸o ®· ®¸nh b¹i Ngôc Háa Cuång Nh©n");
           end;
				end;
		PlayerIndex = nPreservedPlayerIndex; -- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
    end;
end;