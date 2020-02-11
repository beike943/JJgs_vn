-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ·ïÏè¸®NPCÕÔ×ÓÆ½Script
-- By StarryNight
-- 2007/06/13 PM 3:01

-- Ì«¶àÌ«¶àµÄ»°£¬¶¼À´²»¼°Ëµ£¬»¹ÊÇÉÏ¸ö²ŞËùºÃÁË¡£

-- ======================================================

-- ÒıÓÃ¾çÇéÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

	local nStep_XBTask = GetTask(TASK_XB_ID);
	
	---------------------------------- Î÷±±ÈÎÎñ06²»ËÀ½ğµ¤----------------------------------
	
	--ÁìÈ¡ÊÕ¼¯Áò»ÇÈÎÎñ
	if nStep_XBTask == 27 then
		task_006_03_0();
		return
	end
	
	--ÒÑ¾­ÊÕ¼¯£¨»òÎ´ÊÕ¼¯£©ÁË10¸öÁò»Ç£¬ÁìÈ¡ÊÕ¼¯ÏõÊ¯ÈÎÎñ
	if nStep_XBTask == 28 then
		task_006_04_0();
		return
	end
	
	--ÒÑ¾­ÊÕ¼¯£¨»òÎ´ÊÕ¼¯£©ÁË10¸öÏõÊ¯
	if nStep_XBTask == 29 then
		task_006_05_0();
		return
	end
	
	--ÉĞÎ´»Ø³µÂÖ°ÔÍõ´¦¸´Ãü
	if nStep_XBTask == 30 then
		task_006_05_1();
		return
	end
	
	--Ò»°ãÇé¿öÏÂµÄ¶Ô»°
	Say("§¹i hiÖp muèn ®Õn TrÊn Yªu ThÊt kh«ng?", 2, "LËp tøc ®Õn ®ã/goto_zys", "T¹i h¹ chØ xem qua th«i/nothing");
	return
	
end;

function goto_zys()
	NewWorld(6073, 1586, 3222);
	SetFightState(1);
	SetCampToPlayer("camp_enemy");
end
