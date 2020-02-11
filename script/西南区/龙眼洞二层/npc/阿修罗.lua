-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ´óÀíÈÎÎñNPC°¢ÐÞÂÞScript
-- By StarryNight
-- 2006/01/13 PM 16:22

--°®ÇéÔÚËêÔÂÁ÷×ªÖÐÖð½¥ÍÈÉ«£¬Ê£ÏÂµÄ»áÊÇÊ²Ã´¡­¡­

-- ======================================================

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\´óÀí\\task_head.lua")

function OnDeath(index)
    local nPreservedPlayerIndex = PlayerIndex;
    local nMemCount = GetTeamSize();
    local nMapId, nX, nY = GetWorldPos();

    if nMemCount == 0 then -- Íæ¼ÒÎ´×é¶Ó
        if GetTask(TASK_DL_LV70_ID) == 1 or GetTask(TASK_DL_LV70_ID) == 2 then
        	SetTask(TASK_DL_LV70_ID, 2);
        	AddItem(2,0,380,1);--µÃµ½ò¿»ð½ÌÃÜº¯
        	Msg2Player("NhËn ®­îc Si Háa Gi¸o mËt hµm, h·y mau më ra xem cã manh mèi g× ch¨ng!");
        	TaskTip("NhËn ®­îc Si Háa Gi¸o mËt hµm, h·y mau më ra xem cã manh mèi g× ch¨ng!");
        end;
    else
        for i=1,nMemCount do
           PlayerIndex = GetTeamMember(i);
           local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
           local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
           if GetTask(TASK_DL_LV70_ID) == 1 or GetTask(TASK_DL_LV70_ID) == 2 and nDist >= 0 and nDist <= 50 then
           	SetTask(TASK_DL_LV70_ID, 2);
           	AddItem(2,0,380,1);--µÃµ½ò¿»ð½ÌÃÜº¯
           	Msg2Player("NhËn ®­îc Si Háa Gi¸o mËt hµm, h·y mau më ra xem cã manh mèi g× ch¨ng!");
           	TaskTip("NhËn ®­îc Si Háa Gi¸o mËt hµm, h·y mau më ra xem cã manh mèi g× ch¨ng!");
           end;
				end;
		PlayerIndex = nPreservedPlayerIndex; -- ÖØÖÃÖ®Ç°´¢´æµÄÍæ¼Ò±àºÅ
    end;
end