-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII »ÊÁêÄ¹¶ş²ãNPCÊØÄ¹½«¾üScript
-- By StarryNight
-- 2007/08/03 PM 08:13

-- Éíºó£¬Ö»Ê£Ò»ĞĞ½ÅÓ¡¡£

-- ======================================================

-- ÒıÓÃ¾çÇéÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);
	
	---------------------------------- Î÷±±Çø15·ÖÖ§1_6¹ÅÄ¹·çÔÆ----------------------------------
	--ÁìÈ¡ÈÎÎñµ«ÉĞÎ´´òµ¹4¸öÕòÄ¹½«¾üÇ°ÌáÊ¾
	if nStep_XBTask_01 == 26 then
		task_015_03_1();
		return
	end
	
	--ÒÑ¾­´ò°ÜÕòÄ¹½«¾üµ«Î´´òµ¹¹í½«¾ü
	if nStep_XBTask_01 == 27 then
		task_015_03_0();
		return
	end
	
	--ÒÑ¾­Íê³ÉÈÎÎñ ¹Ø¿¨¿ªÆô½Ó¿Ú
	if nStep_XBTask_01 == 28 then
		task_015_03_2();
		return
	end
	
	--Ò»°ãÇé¿öÏÂµÄ¶Ô»°
	local strTalk = {
		"Thñ Mé T­íng Qu©n:? (¢m thanh qu¸i dŞ) ...%##@!#!? ()!*&!@#",
		"Con ng­êi khã hiÓu…"
		}
	
	TalkEx("",strTalk);
	return
	
end;
