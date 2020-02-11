-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII É³Ä®ÃÔ¹¬NPCÁÒÑô¸ùScript
-- By StarryNight
-- 2007/08/04 AM 11:59

-- ºÃÈÈ°¡ºÃÈÈ°¡¡­¡­

-- ======================================================

-- ÒıÓÃ¾çÇéÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);


	---------------------------------- Î÷±±Çø18·ÖÖ§1_9ÜÆº®ÁÒÑô----------------------------------
	
	
	--ÁìÈ¡ÁË²É¼¯ÁÒÑô¸ùÈÎÎñ
	if nStep_XBTask_01 == 40 then
		task_018_04_2();
		return
	end
	
	--Ò»°ãÇé¿öÏÂµÄ¶Ô»°
	local strTalk = {
		"Ta lµ Tİch D­¬ng c¨n.",
		"H×nh nh­ cã tiÕng ng­êi, thËt kú l¹ ©m thanh nµy ph¸t ra tõ ®©u?",
		"(*^__^*) Hihi…",
		}
	
	TalkEx("",strTalk);
	return
	
end;
