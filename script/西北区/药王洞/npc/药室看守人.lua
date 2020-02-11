-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII Ò©Íõ¶´NPCÒ©ÊÒ¿´ÊØÈËScript
-- By StarryNight
-- 2007/08/06 PM 9:00

-- Éú²¡ÕæÄÑÊÜ£¬ÓÈÆä¼ÓÉÏ¼Ó°à~~~~

-- ======================================================

-- ÒıÓÃ¾çÇéÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\online_activites\\2014_02\\shazhongjin.lua")

function main()
	if VET_201402_TASK:GetTask(VET_201402_TASK.TASK) == 4 then
		VET_201402_TASK:SetTask(VET_201402_TASK.TASK, 5);
		Say("Bän ng­êi c©y lµm ta ngøa m¾t, h·y tiªu diÖt chóng, ta c¶m thÊy vui ta sÏ truyÒn bİ thuËt. \n<color=gold>tiªu diÖt 99 ng­êi c©y<color>", 0);
		TaskTip("Tiªu diÖt 99 ng­êi c©y");
		return 
	end

	local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);


	---------------------------------- Î÷±±Çø19·ÖÖ§1_10¸¶Öî¶«Á÷----------------------------------
	
	----ÒÑ¾­ÁìÈ¡ÈÎÎñµ«»¹Î´È¡µÃÒ×Èİ×°Óë¿´ÊØÈË¶Ô»°
	if nStep_XBTask_01 == 46 then
		task_019_06_1();
		return
	end
	
	--ÒÑ¾­È¡µÃÒ×Èİ×°£¬Ë¢³öÒ©Íõ
	if nStep_XBTask_01 == 47 then
		task_019_06_0();
		return
	end
	
	--ÒÑ¾­É±ËÀÒ©Íõ£¬¹Ø¿¨½Ó¿Ú¿ªÆô
	if nStep_XBTask_01 == 48 then
		task_019_06_2();
		return
	end
	
	--Ò»°ãÇé¿öÏÂµÄ¶Ô»°
	local strTalk = {
		"D­îc thÊt thñ vÖ:? (¢m thanh qu¸i dŞ) ...%##@!#!? ()!*&)@#",
		"Con ng­êi khã hiÓu…"
		}
	
	TalkEx("",strTalk);
	return

end;
