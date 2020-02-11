-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ´óÀíÈÎÎñNPCÇ¬´ïÆÅScript
-- By StarryNight
-- 2006/01/13 PM 20:37

--°®ÇéÔÚËêÔÂÁ÷×ªÖÐÖð½¥ÍÈÉ«£¬Ê£ÏÂµÄ»áÊÇÊ²Ã´¡­¡­

-- ======================================================

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\´óÀí\\task_head.lua")

function OnDeath()
    local nPreservedPlayerIndex = PlayerIndex;
    local nMemCount = GetTeamSize();
    local nMapId, nX, nY = GetWorldPos();

    if nMemCount == 0 then -- Íæ¼ÒÎ´×é¶Ó
        if GetTask(TASK_DL_LV80_ID) == 4 then
        	SetTask(TASK_DL_LV80_ID, 5);
        	SetTask(TASK_DL_LV80_TIME_ID,2);--¸Ä±äÈÎÎñÃæ°å
        	AddItem(2,0,382,1);--µÃµ½ÈÎÎñÎïÆ·ºÅÅÚ
        	Msg2Player("§· ®¸nh b¹i Cµn §¹t Bµ, h·y mau vÒ §¹i Lý giao ph¸o hiÖu cho quèc s­!");
        	TaskTip("§· ®¸nh b¹i Cµn §¹t Bµ, h·y mau vÒ §¹i Lý giao ph¸o hiÖu cho quèc s­!");
        end;
    else
        for i=1,nMemCount do
           PlayerIndex = GetTeamMember(i);
           local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
           local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
           if GetTask(TASK_DL_LV80_ID) == 4 and nDist >= 0 and nDist <= 50 then
           	SetTask(TASK_DL_LV80_TIME_ID,2);--¸Ä±äÈÎÎñÃæ°å
           	SetTask(TASK_DL_LV80_ID, 5);
           	AddItem(2,0,382,1);--µÃµ½ÈÎÎñÎïÆ·ºÅÅÚ
           	Msg2Player("§· ®¸nh b¹i Cµn §¹t Bµ, h·y mau vÒ §¹i Lý giao ph¸o hiÖu cho quèc s­!");
           	TaskTip("§· ®¸nh b¹i Cµn §¹t Bµ, h·y mau vÒ §¹i Lý giao ph¸o hiÖu cho quèc s­!");
           end;
				end;
		PlayerIndex = nPreservedPlayerIndex; -- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
    end;
end
