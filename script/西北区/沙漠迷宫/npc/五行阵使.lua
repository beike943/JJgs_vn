-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII É³Ä®ÃÔ¹¬NPCÎåĞĞÕóÊ¹Script
-- By StarryNight
-- 2007/08/07 PM 4:30

-- Éú²¡ÕæÄÑÊÜ£¬ÓÈÆä¼ÓÉÏ¼Ó°à~~~~

-- ======================================================

-- ÒıÓÃ¾çÇéÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);


---------------------------------- Î÷±±Çø21·ÖÖ§1_12½£°ÎåóÕÅ----------------------------------
	
	--ÒÑ¾­ÁìÈ¡ÈÎÎñµ«»¹Î´È¡µÃÍØ°ÎÁî¶Ô»°
	if nStep_XBTask_01 == 57 then
		task_021_03_1();
		return
	end
	
	--ÒÑ¾­È¡µÃÍØ°ÎÁî£¬Ë¢³öÎåĞĞÊ¹
	if nStep_XBTask_01 == 58 then
		task_021_03_0();
		return
	end
	
	--ÒÑ¾­É±ËÀÎåĞĞÊ¹£¬¹Ø¿¨½Ó¿Ú¿ªÆô
	if nStep_XBTask_01 == 59 then
		task_021_03_2();
		return
	end
	
	--Ò»°ãÇé¿öÏÂµÄ¶Ô»°
	local strTalk = {
		"Lµ Ngò Hµnh TrËn do NhÊt PhÈm ®­êng lËp ra, ng­êi kh¸c kh«ng thÓ vµo.",
		"Nãi chuyÖn sao khã nghe thÕ."
		}
	
	TalkEx("",strTalk);
	return

end;
