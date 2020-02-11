
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

local nState = GetTask(TASKSTATE_ID);
	
local nTaskType = GetTask(TASKTYPE_ID);
local nTask     = GetTask(TASKID_ID);
local tabTask   = GetTaskTableFile(nTaskType);
local nRow      = tabTask:selectRowNum("TaskID", nTask);

local strInfo   = tabTask:getCell(nRow, "TaskText");
local strName = GetTargetNpcName();

if nState == 0 then
	WriteLog("[Lçi nhiÖm vô s­ m«n]:incept_npc.lua Lçi th«ng sè tr¹ng th¸i nh©n vËt, nState b»ng 0 Tªn nh©n vËt:"..GetName())
end;

if strName==nil or strName=="" then strName = ""; end;

	-- Èç¹ûÊÇ½øĞĞµ½ÈÎÎñµÄµÚÒ»²½£¬Ôò¸æËßÍæ¼ÒÈÎÎñµÄĞÅÏ¢
	if nState==1 then
		RemoveTrigger(GetRunningTrigger()); -- É¾³ıµ±Ç°ÕıÔÚÔËĞĞµÄ´¥·¢Æ÷
		CDebug:MessageOut("Hoµn thµnh ®èi tho¹i nh©n vËt!");
		ShowTask();
		return
	end;
	
	-- Èç¹ûÒÑ¾­½ÓÊÜÁË NPC µÄÈÎÎñ£¬Ôò¿ªÊ¼¼ì²âÈÎÎñÊÇ·ñÍê³É
	if nState==2 then
		if CheckTask()==1 then
			RemoveTrigger(GetRunningTrigger()); -- É¾³ıµ±Ç°ÕıÔÚÔËĞĞµÄ´¥·¢Æ÷
			CDebug:MessageOut("Hoµn thµnh ®èi tho¹i nh©n vËt!");
			FinishTask();
		else
			-- Ã»ÓĞÍê³ÉÈÎÎñµÄ»°Ôò¼ÌĞøÖ®Ç°µÄÈÎÎñĞÅÏ¢¶Ô»°
			Say("<color=green>"..strName.."<color>: "..strInfo, 0);
		end;
		return
	end;
	RemoveTrigger(GetRunningTrigger()); -- É¾³ıµ±Ç°ÕıÔÚÔËĞĞµÄ´¥·¢Æ÷
end;