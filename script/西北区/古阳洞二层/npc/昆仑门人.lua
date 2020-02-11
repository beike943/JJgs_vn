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

function main()

local nStep_XBTask_02 = GetTask(TASK_XB_ID_02);


	--------------------------------- Î÷±±Çø27·ÖÖ§2_4¹ÅÑôÒìÊŞ----------------------------------
	
	--ÒÑ¾­ÁìÈ¡ÈÎÎñµ«»¹Î´È¡µÃÌÒÄ¾½£Óë¿´ÊØÈË¶Ô»°
	if nStep_XBTask_02 == 16 then
		task_027_03_1();
		return
	end
	
	--Ë¢³ö¹ÅÑôÊŞ
	if nStep_XBTask_02 == 17 then
		task_027_03_0();
		return
	end
	
	--ÒÑ¾­É±ËÀ¹ÅÑôÊŞ£¬¹Ø¿¨½Ó¿Ú¿ªÆô
	if nStep_XBTask_02 == 18 then
		task_027_03_2();
		return
	end
	
	--Ò»°ãÇé¿öÏÂµÄ¶Ô»°
	local strTalk = {
		"Cæ D­¬ng ®éng nµy thËt nguy hiÓm.",
		}
	
	TalkEx("",strTalk);
	return

end;
