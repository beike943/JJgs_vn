-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ´óÀíÈÎÎñNPCÃçÁëÓÂÊ¿Script
-- By StarryNight
-- 2006/01/04 PM 17:46

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
        if GetTask(TASK_DL_LV40_ID) == 3 then
        	SetTask(TASK_DL_LV40_ID, 4);
        	Msg2Player("§· ®¸nh b¹i Miªu LÜnh Dòng SÜ, quay vÒ gÆp Téc tr­ëng Miªu LÜnh");
        	TaskTip("§· ®¸nh b¹i Miªu LÜnh Dòng SÜ, quay vÒ gÆp Téc tr­ëng Miªu LÜnh");
        end;
    else
        for i=1,nMemCount do
            PlayerIndex = GetTeamMember(i);
            local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
            local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
            if GetTask(TASK_DL_LV40_ID) == 3 and nDist >= 0 and nDist <= 50 then
            	SetTask(TASK_DL_LV40_ID, 4);
        			Msg2Player("§· ®¸nh b¹i Miªu LÜnh Dòng SÜ, quay vÒ gÆp Téc tr­ëng Miªu LÜnh");
        			TaskTip("§· ®¸nh b¹i Miªu LÜnh Dòng SÜ, quay vÒ gÆp Téc tr­ëng Miªu LÜnh");
            end;
		end;
		PlayerIndex = nPreservedPlayerIndex; -- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
    end;
end;