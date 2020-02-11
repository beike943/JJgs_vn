
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
Include("\\script\\item\\item_billing\\shimenqingyuanshu.lua");

function main()

local nMap, nX, nY = GetWorldPos();
local nRandom = 1;

	if GetTime() - GetTask(USE_TIME) < 86400 then
		nRandom = ADD_RATE;
	end
	
	-- Èı·ÖÖ®Ò»µÄ¸ÅÂÊ´¥·¢Ëæ»úÊÂ¼ş
	if random(1,3) >= nRandom then
		return	
	end;

	-- Èç¹û»¹Ã»ÓĞÈëÃÅÅÉ¾Í²»´¥·¢ÁË
	if GetPlayerFaction()==0 then return end;
	
	-- Èç¹û»ñÈ¡Õ½¶·×´Ì¬Îª 0 ÄÇÒ²²»´¥·¢
	if GetFightState()==0 then return end;
	
	-- Èç¹ûµØÍ¼ID´óÓÚ£·£°£°¾Í²»´¥·¢£¨´óÓÚ£·£°£°µÄµØÍ¼ÎªÌØÊâµØÍ¼£©
	if nMap > 700 then
		return
	end
	if CreateTask() == 1 then	--´´½¨³É¹¦ºó²Å·¢Í¨Öª¡¡edited by yanjun 06-11-15
		RandomTaskTip("B¹n nhËn ®­îc nhiÖm vô s­ ®å!");
		Msg2Player("NÕu liªn tôc 2 lÇn kh«ng thÓ hoµn thµnh nhiÖm vô s­ phô giao sÏ bŞ mÊt 1 ®iÓm danh väng!");
	end;
end;


function GetRandomTimer()
	return 3600;
end;