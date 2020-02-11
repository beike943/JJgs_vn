-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ´óÀíÈÎÎñNPCÔ¦¶¾Òõ¼§Script
-- By StarryNight
-- 2006/01/04 PM 16:26

--ÒÒÓÏÄê Îì×ÓÔÂ ¹ïÒÑÈÕ 
--ÒË: ¼Àìë ËÜ»æ ¿ª¹â ²ÃÒÂ ¹ÚóÇ ¼ÞÈ¢ ÄÉ²É ²ðÐ¶ ÐÞÔì ¶¯ÍÁ ÊúÖù ÉÏÁº °²´² ÒÆáã ÈëÕ¬ °²Ïã ½áÍø ²¶×½ î±ÁÔ ·¥Ä¾ ½øÈË¿Ú ·ÅË® 
--¼É: ³öÐÐ °²Ôá ÐÞ·Ø ¿ªÊÐ 
--¼ªÉñÒËÇ÷: Îå¸» Òæáá  
--Ð×ÉñÒË¼É: ½ÙÉ· Ð¡ºÄ ¸´ÈÕ ÖØÈÕ ÔªÎä  
--Ã¿ÈÕÌ¥ÉñÕ¼·½: Õ¼·¿´²·¿ÄÚ±± 
--ÎåÐÐ: ³¤Á÷Ë® Ö´Ö´Î» 
--³å: ³åÖí(¶¡º¥)É·¶« 
--Åí×æ°Ù¼É: ¹ï²»´ÊËÏÀíÈõµÐÇ¿ ÒÑ²»Ô¶ÐÐ²ÆÎï·ü²Ø 

-- ======================================================

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\´óÀí\\task_head.lua")

function OnDeath()
    local nPreservedPlayerIndex = PlayerIndex;
    local nMemCount = GetTeamSize();
    local nMapId, nX, nY = GetWorldPos();

    if nMemCount == 0 then -- Íæ¼ÒÎ´×é¶Ó
        if GetTask(TASK_DL_LV30_ID) == 3 then
        	SetTask(TASK_DL_LV30_ID, 4);
        	Msg2Player("§· thu phôc Ngù §éc ¢m C¬, trë vÒ håi b¸o B¹ch Doanh Doanh!");
        	TaskTip("§· thu phôc Ngù §éc ¢m C¬, trë vÒ håi b¸o B¹ch Doanh Doanh!");
        end;
    else
        for i=1,nMemCount do
            PlayerIndex = GetTeamMember(i);
            local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
            local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
            if GetTask(TASK_DL_LV30_ID) == 3 and nDist >= 0 and nDist <= 50 then
            	SetTask(TASK_DL_LV30_ID, 4);
        			Msg2Player("§· thu phôc Ngù §éc ¢m C¬, trë vÒ håi b¸o B¹ch Doanh Doanh!");
        			TaskTip("§· thu phôc Ngù §éc ¢m C¬, trë vÒ håi b¸o B¹ch Doanh Doanh!");
            end;
		end;
		PlayerIndex = nPreservedPlayerIndex; -- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
    end;
end;