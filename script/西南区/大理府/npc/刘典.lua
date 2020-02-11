-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ´óÀíNPCÁõµäScript
-- By StarryNight
-- 2006/01/13 PM 10:09

--Ê®Ò»ÔÂØ¥¾Å ¶¡º¥ÍÁ¾®±ÕÈÕ  
--ÒË£º  ²ÃÒÂ¡¢ÖşµÌ¡¢ĞŞ²Ö¡¢ĞŞÔì¡¢¶¯ÍÁ¡¢ÉÏÁº¡¢²¹Èû¡¢×÷Ôî  
--¼É£º  Àí·¢¡¢¼ŞÈ¢  

-- ×òÍíĞ¡Íµ½øÎİ£¬ÊÒÓÑÉÔÓĞËğÊ§£¬Äê¹ØÄÑ¹ı°¡¡­¡­

-- ======================================================

-- ÒıÓÃ¾çÇéÈÎÎñÎÄ¼ş
Include("\\script\\task\\world\\´óÀí\\task_head.lua");
Include("\\script\\task\\world\\´óÀí\\lv75\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nTask_DL_State_75 = GetTask(TASK_DL_LV75_ID);
--print("nTask_DL_State_75:"..nTask_DL_State_75)

	--Î´´¥·¢75¼¶ÈÎÎñÖ®Ç°
	if nTask_DL_State_75 < 4 then
		local strTalk = {
			"Sao phiÒn phøc thÕ! Chi b»ng quay vÒ giao phã cho TriÖu ®¹i nh©n xem!",
			}
		TalkEx("",strTalk);
		return
	end

	--Î´ÓëÁõµä¶Ô»°
	if nTask_DL_State_75 == 4 then
		task_000_00()
		return
	end
	
	--Î´/ÒÑÊÕ¼¯Íê10ÕÅ´óÀí¾ÉÖ¾
	if nTask_DL_State_75 == 5 then
		task_001_00()
		return
	end
	
	--Î´ÓëÖ£¹áÖ®¶Ô»°
	if nTask_DL_State_75 == 6 then
		task_002_00()
		return
	end
	
	--Íê³ÉºÚĞÉĞÉÈÎÎñºó
	if nTask_DL_State_75 > 6 then
		local strTalk = {
			"LÊy ®­îc §¹i Lı cùu chİ vÒ, TriÖu ®¹i nh©n nhÊt ®Şnh sÏ rÊt vui!",
			}
		TalkEx("",strTalk);
		RemoveTrigger(GetTrigger(KILL_DL_JOCKO));
		return
	end
end
