
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII Ëæ»úÈÎÎñÍ·ÎÄ¼ş
-- Edited by peres
-- 2005/08/08 PM 13:45

-- Ö»ÓĞÍíÉÏËûÃÇÊÇÔÚÒ»ÆğµÄ
-- Ëû¿¿½üËı£¬Óµ±§Ëı
-- ËûµÄÊÖÖ¸ºÍÆ¤·ô
-- Ëı¿´×ÅËû£¬ĞÄÀïÈáÈí¶øÌÛÍ´
-- ËıÏë£¬Ëı»¹ÊÇ°®Ëû
-- Ëı²»Ïë±§Ô¹Ê²Ã´
-- Ã¿ÌìÍíÉÏËûÃÇ¶¼ÔÚ×ö°®
-- Ëı²»ÖªµÀ£¬³ıÁËÕâÖÖ½Ó´¥£¬ËıµÄ°²È«¸ĞºÍÎÂÅ¯£¬»¹ÄÜ´ÓÄÄÀïÈ¡µÃ
-- ËıÏ²»¶ÄÇÒ»Ë²¼ä¡£·Â·ğÔÚºÚ°µµÄ´óº£ÉÏ£¬Æ¯ÏòÊÀ½çµÄ¾¡Í·

-- ======================================================

-- ¶ÁÈëËæ»úÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\random\\task_head.lua");

function main()

	-- Îå·ÖÖ®Ò»µÄ¸ÅÂÊ´¥·¢Ëæ»úÊÂ¼ş
--	if random(1,5)~=1 then
--		return	
--	end;
	
	ShowTaskNpc();   -- ÏÔÊ¾ÈÎÎñĞÅÏ¢
	
end;


-- É±¹Ö½áÊøÊ±µÄ»Øµ÷
function finish_kill()

local nNpcID         = GetTask(TASKNPC_ID);
local nRow           = tabNpcName:selectRowNum("NpcID", nNpcID);

local nNpcMapID      = tonumber(tabNpcName:getCell(nRow, "MapID")); -- µÃµ½ÈÎÎñ NPC ËùÔÚµØÍ¼ID

local strNpcName     = tabNpcName:getCell(nRow, "NpcName"); -- µÃµ½ÈÎÎñ NPC µÄÃû×Ö
local strNpcMap      = tabNpcName:getCell(nRow, "NpcMap");  -- µÃµ½ÈÎÎñ NPC ËùÔÚµØÍ¼ÖĞÎÄÃû

local nKillIndex = GetTask(TASKKILL_ID); -- »ñÈ¡É±¹Ö´¥·¢Æ÷µÄË÷Òı

	Msg2Player("Ng­¬i ®· hoµn thµnh nhiÖm vô, mau vÒ"..strNpcMap.."t×m"..strNpcName.."NhËn phÇn th­ëng!");
	
	RemoveTrigger(GetRunningTrigger()); -- É¾³ıµ±Ç°ÕıÔÚÔËĞĞµÄ´¥·¢Æ÷
	RemoveTrigger(nKillIndex); -- Îª·ÀÖ¹Ã»ÓĞÒÆ³ı³É¹¦ÔÙÉ¾Ò»´Î
	
	CreateTrigger(4, nNpcID, EVENT_NPC_ID); -- ´´½¨ĞÂ´¥·¢Æ÷ÈÃÍæ¼ÒÈ¥ÕÒÔ­À´µÄ NPC
		
	Say("Ng­¬i ®· hoµn thµnh nhiÖm vô, mau vÒ"..strNpcMap.."t×m"..strNpcName.."NhËn phÇn th­ëng!",
		2,
		"Mau ®­a ta vÒ!/#AcceptTask("..nNpcMapID..")",
		"§Ó ta tù ®i!/Main_Exit");

end;


-- µ½ÁË 15 ·ÖÖÓµÄÊ±¼äºó´¥·¢Õâ¸ö¼ì²éº¯Êı
function timercheck()

local nTimerIndex = GetTask(TASKTIMER_ID);
local nLost = GetTask(TASKCANCEL_ID);

	if GetTask(TASKSTATE_ID)==0 then return end;

	PauseTimer(nTimerIndex);
	RemoveTrigger(nTimerIndex); -- É¾³ıµ±Ç°ÕıÔÚÔËĞĞµÄ´¥·¢Æ÷


	-- Èç¹ûÈÎÎñ»¹Ã»ÓĞÍê³É
	if GetTask(TASKSTATE_ID)~=3 then
		nLost = nLost + 1;
		Say("Qu¸ thêi gian lµm nhiÖm vô s­ m«n, hiÖn ch­a lµm xong",0);
		if nLost>=2 then
			nLost = 0;
			SetTask(TASKCANCEL_ID, nLost); -- ½«ÀÛ»ıÊ§°Ü´ÎÊıÇå¿Õ
			SetTask(TASKSTATE_ID, 0); -- ½«ÈÎÎñ×´Ì¬±äÎª»¹Î´¿ªÊ¼			
			-- ÈÎÎñ´¦·£
			TaskPunish();
			return
		end;
		SetTask(TASKCANCEL_ID, nLost);
		SetTask(TASKSTATE_ID, 0); -- ½«ÈÎÎñ×´Ì¬±äÎª»¹Î´¿ªÊ¼
	end;

end;