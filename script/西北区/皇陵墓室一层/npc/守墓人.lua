-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII »ÊÁêÄ¹Ò»²ãNPCÊØÄ¹ÈËScript
-- By StarryNight
-- 2007/08/03 PM 2:54

-- ÊØ×ÅÒ»ã×¹ÅÄ¹£¬×³À½±¯¸è¡£

-- ======================================================

-- ÒýÓÃ¾çÇéÈÎÎñÍ·ÎÄ¼þ
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);
	
	---------------------------------- Î÷±±Çø15·ÖÖ§1_6¹ÅÄ¹·çÔÆ----------------------------------
	--ÁìÈ¡ÈÎÎñµ«ÉÐÎ´ÆÆ»µ·çË®Ñ¨Ç°ÌáÊ¾
	if nStep_XBTask_01 >= 21 and nStep_XBTask_01 <= 24 then
		task_015_02_1();
		return
	end
	
	--ÒÑ¾­ÆÆ»µ·çË®Ñ¨µ«Î´´òµ¹ÕòÄ¹ÊÞ
	if nStep_XBTask_01 == 25 then
		task_015_02_0();
		return
	end
	
	--ÒÑ¾­Íê³ÉÈÎÎñ ¹Ø¿¨¿ªÆô½Ó¿Ú
	if nStep_XBTask_01 == 26 then
		task_015_02_2();
		return
	end
	
	--Ò»°ãÇé¿öÏÂµÄ¶Ô»°
	local strTalk = {
		"Thñ Mé Nh©n:? (¢m thanh qu¸i dÞ) ...%##@!#!? ()!*&)@#",
		"Con ng­êi khã hiÓu…"
		}
	
	TalkEx("",strTalk);
	return
	
end;
