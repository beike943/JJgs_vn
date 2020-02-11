-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ´óÀíÈÎÎñNPCÃçÁë×å³¤Script
-- By StarryNight
-- 2006/01/06 PM 17:29

--ÒÒÓÏÄê Îì×ÓÔÂ Îì×ÓÈÕ 
--ÒË: ºÏÕÊ ²ÃÒÂ ½ÌÅ£Âí âÅÊÂÎğÈ¡ 
--¼É: ÈëÕ¬ ¶¯ÍÁ ÆÆÍÁ ¼ŞÈ¢ ×÷Ôî Ôì´¬ 
--¼ªÉñÒËÇ÷: ¹ÙÈÕ ¾´°² ½ğØÑ  
--Ğ×ÉñÒË¼É: ÔÂ½¨ Ğ¡Ê± ÍÁ¸® ÔÂÑá µØ»ğ  
--ÎåĞĞ: Åùö¨»ğ  ½¨Ö´Î»  
--Åí×æ°Ù¼É: Îì²»ÊÜÌïÌïÖ÷²»Ïé ×Ó²»ÎÊ²·×ÔÈÇ»öÑê 

-- ======================================================

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\´óÀí\\task_head.lua")
Include("\\script\\task\\world\\´óÀí\\lv40\\task_main.lua");

function main()
local nTask_DL_State_40 = GetTask(TASK_DL_LV40_ID);
local nTask_DL_State_50 = GetTask(TASK_DL_LV50_ID);
--print("nTask_DL_State_40:"..nTask_DL_State_40);
--print("nTask_DL_State_50:"..nTask_DL_State_50);
	--Î´Óë×å³¤¶Ô»°
	if nTask_DL_State_40 == 2 then
		task_000_00();
		return
	end
	--Î´´òµ¹ÃçÁëÓÂÊ¿
	if nTask_DL_State_40 == 3 then
		task_001_00();
		return
	end
	--ÒÑ¾­´òµ¹ÃçÁëÓÂÊ¿
	if nTask_DL_State_40 == 4 then
		task_002_00();
		return
	end
	--ÉĞÎ´ÏòÕÔÑÓÄê»ã±¨
	if nTask_DL_State_40 == 5 then
		task_003_00();
		return
	end
	
	--ÒÑ¾­ºÍ³ÂÁ¢ºâ¶Ô»°
	if nTask_DL_State_50 == 3 then
		task_004_00();
		return
	end
	
	--Î´´òµ¹ÃçÁëÊ×ÁìºÍÃçÁë×å³¤¶Ô»°
	if nTask_DL_State_50 == 4 then
		task_005_00();
		return
	end
	
	--´òµ¹ÃçÁëÊ×Áì
	if nTask_DL_State_50 == 5 then
		task_006_00();
		return
	end
	
	--Î´ÓëÖ£¹áÖ®¶Ô»°
	if nTask_DL_State_50 == 6 then
		task_007_00();
		return
	end

	--Ò»°ãÇé¿öÏÂ¶Ô»°
	local strTalk = {
		"Téc tr­ëng Miªu LÜnh: <sex> muèn thê Si Háa Ch©n ThÇn kh«ng?"
	}
	
	TalkEx("",strTalk);
	return
end