-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII Ò©Íõ¶´NPCÒ©ÈË²İScript
-- By StarryNight
-- 2007/08/04 AM 11:23

-- ÎÒÊÇÒ»¿Å²İ~(*^__^*) ÎûÎû¡­¡­

-- ======================================================

-- ÒıÓÃ¾çÇéÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);


	---------------------------------- Î÷±±Çø17·ÖÖ§1_8ÆæÒìÖ®²İ----------------------------------
	
	
	--°ÎÈ¥Ò©ÈË²İÑ¡Ïî
	if nStep_XBTask_01 == 36 then
		task_017_03_0();
		return
	end
	
	--»¹Î´½«Ò©ÈË²İ´ø¸øÅ·ÑôÇ°±²
	if nStep_XBTask_01 == 37 then
		task_017_03_2();
		return
	end
	
	--´ø×ÅÁÒÑôË®À´ÏûÃğÒ©ÈË²İ
	if nStep_XBTask_01 == 41 then
		task_018_07_0();
		return
	end
	
	--Ò»°ãÇé¿öÏÂµÄ¶Ô»°
	local strTalk = {
		"Ta lµ mét cäng cá.",
		"H×nh nh­ cã tiÕng ng­êi, thËt kú l¹ ©m thanh nµy ph¸t ra tõ ®©u?",
		"(*^__^*) Hihi…",
		}
	
	TalkEx("",strTalk);
	return
	
end;
